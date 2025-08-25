-----

## Manual Oficial: Implementação de Endpoints Batch no PlayIFS

### 1\. Filosofia e Princípios Arquiteturais

No PlayIFS, uma operação em lote não é apenas uma chamada de API; ela é um **conceito de negócio** que representa uma ação única sobre múltiplos recursos. Por isso, a tratamos com o mesmo rigor arquitetural de qualquer outra funcionalidade, seguindo três princípios-chave:

1. **Consistência é Rei:** Todas as operações `batch` seguem exatamente o mesmo fluxo de implementação. Isso torna o código previsível e fácil de entender para qualquer desenvolvedor do projeto.
2. **O Domínio é Puro:** A camada de domínio (`lib/domain/`) nunca trabalha com primitivos soltos (como `List<int>`) ou com modelos da camada de dados (DTOs). Ela opera com suas próprias **Entidades de Domínio**, como `IdBatch`, que carregam significado de negócio.
3. **Responsabilidades Claras:** A conversão da Entidade de Domínio (`IdBatch`) para o DTO (`IdBatchDTO`) é responsabilidade exclusiva da camada de dados, especificamente dentro da implementação do repositório (`...RepositoryImpl`), através de um `mapper`.

Seguir estes princípios garante um código desacoplado, testável e robusto a futuras alterações.

### 2\. Guia de Criação: Implementando um Novo Endpoint Batch (Passo a Passo)

Vamos usar o exemplo de `batchDeleteTeams` para ilustrar o ciclo de vida completo.

#### Pré-requisito: Definir os Blocos de Construção (Shared)

Como operações em lote são comuns, usamos uma entidade e um DTO compartilhados.

* **DTO (Fonte da Verdade da API):** Você já o tem. Ele representa o JSON que a API espera.
    **`lib/data/models/shared/id_batch_dto.dart`**

    ```dart
    import 'package:freezed_annotation/freezed_annotation.dart';
    part 'id_batch_dto.freezed.dart';
    part 'id_batch_dto.g.dart';

    @freezed
    abstract class IdBatchDTO with _$IdBatchDTO {
      const factory IdBatchDTO({ required List<int> ids }) = _IdBatchDTO;
      factory IdBatchDTO.fromJson(Map<String, dynamic> json) => _$IdBatchDTOFromJson(json);
    }
    ```

* **Entidade de Domínio (O Conceito de Negócio):** A representação pura do nosso "lote de IDs".
    **`lib/domain/entities/shared/id_batch.dart`**

    ```dart
    import 'package:freezed_annotation/freezed_annotation.dart';
    part 'id_batch.freezed.dart';

    @freezed
    abstract class IdBatch with _$IdBatch {
      const factory IdBatch({ required List<int> ids }) = _IdBatch;
    }
    ```

    *(Lembre-se de rodar o `build_runner` após criar este arquivo)*

* **Mapeador (O Tradutor):** A extensão que converte a Entidade em DTO.
    **`lib/data/mappers/shared_mappers.dart`**

    ```dart
    import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
    import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';

    extension IdBatchToDTO on IdBatch {
      IdBatchDTO toDTO() => IdBatchDTO(ids: ids);
    }
    ```

#### Passo 1: Camada de Domínio (Definindo o Contrato)

1. **Adicionar ao Contrato do Repositório:** Adicione o método à `abstract class` do repositório da funcionalidade (ex: `TeamRepository`). Note que ele recebe a **Entidade de Domínio `IdBatch`**.

    **`lib/domain/repositories/team_repository.dart`**

    ```dart
    // ...
    import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';

    abstract class TeamRepository {
      // ... outros métodos
      Future<Result<void>> batchDelete(IdBatch batch);
    }
    ```

2. **Criar o Caso de Uso:** Crie uma classe de caso de uso específica para esta ação.

    **`lib/domain/usecases/team/batch_delete_teams_use_case.dart`**

    ```dart
    import 'package:playifs_frontend/core/network/result.dart';
    import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
    import 'package:playifs_frontend/domain/repositories/team_repository.dart';

    class BatchDeleteTeamsUseCase {
      final TeamRepository _repository;
      BatchDeleteTeamsUseCase(this._repository);

      Future<Result<void>> call(IdBatch batch) => _repository.batchDelete(batch);
    }
    ```

#### Passo 2: Camada de Dados (Implementando a Conexão)

1. **Adicionar ao Serviço de API:** Defina o endpoint no `PlayifsApiService`, usando o **`IdBatchDTO`**.

    **`lib/data/datasources/playifs_api_service.dart`**

    ```dart
    // ...
    import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';

    @RestApi()
    abstract class PlayifsApiService {
      // ... outros endpoints
      @POST('${ApiConstants.teams}/batch-delete')
      Future<ApiResponseBody<void>> batchDeleteTeams(@Body() IdBatchDTO batchDto);
    }
    ```

2. **Implementar no Repositório:** Implemente o método na classe `...RepositoryImpl`. Este é o passo crucial onde o padrão se materializa.

    **`lib/data/repositories/team_repository_impl.dart`**

    ```dart
    // ...
    import 'package:playifs_frontend/data/mappers/shared_mappers.dart';
    import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';


    class TeamRepositoryImpl extends BaseRepository implements TeamRepository {
      // ...
      @override
      Future<Result<void>> batchDelete(IdBatch batch) =>
          handleApiCall(
            // 1. O mapper é usado para traduzir a Entidade para DTO.
            // 2. O método correto do serviço de API é chamado.
            () => _apiService.batchDeleteTeams(batch.toDTO())
          );
    }
    ```

Com estes passos, a funcionalidade está implementada de forma robusta e alinhada à arquitetura.

### 3\. Guia de Refatoração e Correção de Erros

Se você encontrar uma implementação de `batch` que não segue este padrão, utilize o checklist abaixo para corrigi-la.

#### Sintoma 1: O método no Repositório (abstrato e/ou concreto) recebe `List<int>`

* **Diagnóstico:** Violação do princípio "O Domínio é Puro".
* **Correção:**
    1. Altere a assinatura do método na `abstract class` (`...Repository`) para receber a entidade `IdBatch`.
    2. Altere a assinatura do método na classe de implementação (`...RepositoryImpl`) para corresponder.
    3. Dentro da implementação, use o mapper `batch.toDTO()` antes de passar o objeto para o `_apiService`, como mostrado no Passo 2.2 acima.
    4. Ajuste o Caso de Uso correspondente para que ele também receba e passe a entidade `IdBatch`.

#### Sintoma 2: Uma classe da camada de Apresentação (Provider, Widget) está a criar um `IdBatchDTO`

* **Diagnóstico:** Grave vazamento de abstração. A camada de apresentação NUNCA deve conhecer DTOs.
* **Correção:**
    1. A camada de apresentação deve criar a **Entidade de Domínio**: `final idBatch = IdBatch(ids: [1, 2, 3]);`
    2. Passe esta entidade `idBatch` para o método do seu `Provider` ou `Notifier`.
    3. O `Provider`/`Notifier` então chamará o Caso de Uso, passando a entidade `idBatch` para a frente: `await batchDeleteTeamsUseCase(idBatch);`.
    4. A criação do DTO ocorrerá apenas dentro do `...RepositoryImpl`, onde ela pertence.

#### Sintoma 3: A implementação chama um endpoint incorreto (ex: `batchDeleteAthletes` em vez de `batchDeleteTeams`)

* **Diagnóstico:** Bug de lógica.
* **Correção:**
    1. Revise a chamada ao `_apiService` dentro do método no `...RepositoryImpl`.
    2. Consulte o `TeamController.java` ou o `openapi-spec.json` para confirmar o nome e a rota corretos do endpoint.
    3. Garanta que o método chamado no `_apiService` corresponde exatamente ao endpoint desejado. `_apiService.batchDeleteTeams(...)` é a chamada correta para o nosso exemplo.
