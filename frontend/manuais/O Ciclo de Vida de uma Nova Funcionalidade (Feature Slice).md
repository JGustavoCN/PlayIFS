-----

# Guia Prático: O Ciclo de Vida de uma Nova Funcionalidade (Feature Slice)

*(v1.0)*

-----

## Prefácio: A Nossa Filosofia de "Fatias Verticais"

No PlayIFS, não construímos por camadas horizontais (toda a UI primeiro, depois toda a lógica). Nós construímos por **"fatias verticais"** (`Feature Slices`).

Uma fatia vertical é uma funcionalidade completa, do banco de dados ao ecrã, que entrega valor real ao utilizador. Por exemplo, "Listar Atletas" é uma fatia. "Editar Atleta" é outra.

**Vantagens:**

* **Entrega de Valor Contínua:** Cada fatia concluída é uma funcionalidade a funcionar.
* **Risco Reduzido:** Problemas de integração entre as camadas são descobertos imediatamente, não no final do projeto.
* **Processo Repetível:** Cada nova funcionalidade segue o mesmo ciclo previsível, aumentando a velocidade e a qualidade.

Este manual é o *checklist* para construir uma fatia vertical no nosso ecossistema.

-----

## O Ciclo Mestre de Desenvolvimento (Checklist)

Para construir qualquer nova funcionalidade (ex: "Gestão de Competições"), siga rigorosamente estes quatro passos.

### **Passo 1: Definir a Camada de Domínio (O Coração)**

**Missão:** Definir a lógica de negócio e os contratos de forma pura, agnóstica a frameworks.

* `[ ]` **Analisar a Fonte da Verdade:** Inspecione o `Controller` Java correspondente (ex: `CompetitionController.java`) e os seus DTOs para entender as operações e as estruturas de dados.
* `[ ]` **Criar as Entidades de Domínio:** Para cada conceito de negócio, crie uma classe `@freezed` imutável.
  * **Local:** `lib/domain/entities/[feature]/`
  * **Consulte:** `Manual de Arquitetura e Estilo para Modelos de Dados no PlayIFS.md`
* `[ ]` **Definir o Contrato do Repositório:** Crie a `abstract class` que define *o que* a aplicação pode fazer com os dados, mas não *como*.
  * **Local:** `lib/domain/repositories/`
* `[ ]` **Criar os Casos de Uso (UseCases):** Para cada método no contrato do repositório, crie uma classe de `UseCase` simples que o invoca.
  * **Local:** `lib/domain/usecases/[feature]/`
  * **Consulte:** `Manual para Casos de Uso (Use Cases).md`

### **Passo 2: Implementar a Camada de Dados (A Conexão)**

**Missão:** Conectar o domínio puro à API REST.

* `[ ]` **Criar os DTOs (Data Transfer Objects):** Crie as classes `@freezed` que espelham **exatamente** a estrutura do JSON da API.
  * **Local:** `lib/data/models/[feature]/`
  * **Consulte:** `Manual de Arquitetura e Estilo para Modelos de Dados no PlayIFS.md`
* `[ ]` **Adicionar os Endpoints no `ApiService`:** Adicione os novos métodos de chamada à API na nossa classe `PlayifsApiService` com as anotações do `Retrofit`.
  * **Local:** `lib/data/datasources/playifs_api_service.dart`
* `[ ]` **Criar os Mapeadores:** Crie `extension methods` para converter os DTOs em Entidades de Domínio.
  * **Local:** `lib/data/mappers/`
* `[ ]` **Implementar o Repositório:** Crie a classe `...RepositoryImpl` que implementa o contrato do domínio, usando o nosso padrão `_handleApiCall` para orquestrar as chamadas à API e o tratamento de erros.
  * **Local:** `lib/data/repositories/`
  * **Consulte:** `Manual para Implementação de Repositórios.md`

### **Passo 3: Gerar o Código Automático**

**Missão:** Sincronizar todo o código que depende de geração automática.

* `[ ]` **Executar o `build_runner`:** Após criar ou modificar qualquer ficheiro com anotações (`@freezed`, `@riverpod`, `@RestApi`, etc.), execute o comando:

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

* `[ ]` **Resolver Erros de Geração:** Corrija quaisquer erros que o gerador aponte.

### **Passo 4: Construir a Camada de Apresentação (A UI)**

**Missão:** Conectar o estado à interface do utilizador.

* `[ ]` **Decidir e Criar os `Providers`:**
  * Para **listas de dados** ou estados que vêm da API, crie um `AsyncNotifier` (ex: `AthleteList`).
  * Para **ações de formulário** (criar, editar), crie um `Notifier` que gira um `AsyncValue<void>` (ex: `AthleteForm`).
  * Para **filtros simples ou estado local da UI**, use um `Notifier` ou `StateProvider` (ex: `AthleteSearchQuery`).
  * **Local:** `lib/presentation/providers/[feature]/`
  * **Consulte:** `Manual para Providers (Riverpod Notifiers).md`
* `[ ]` **Construir os Widgets e Ecrãs:**
  * Crie os seus ecrãs como `ConsumerWidget` ou `ConsumerStatefulWidget`.
  * Use `ref.watch` para observar os `providers` de dados e `ref.listen` para reagir a `providers` de ação.
  * Use o método `.when()` do `AsyncValue` para construir a UI para os estados de `data`, `loading` e `error`.
  * **Local:** `lib/presentation/pages/[feature]/`
  * **Consulte:** `Cookbook de Padrões de UI com Riverpod`
* `[ ]` **Adicionar a Navegação:** Integre o novo ecrã ao sistema de rotas da aplicação.
  * **Local:** `lib/core/routing/app_routes.dart`
  * **Consulte:** `Manual de Navegação: Estratégias e Padrões com GoRouter`

-----

## Exemplo Prático: A Funcionalidade "Atletas"

Todo o processo que seguimos para construir a Gestão de Atletas é o estudo de caso perfeito deste ciclo:

1. **Domínio:** Começámos por definir `AthleteDetails`, `AthleteSummary` e o `AthleteRepository`.
2. **Dados:** Criámos os `...DTO`s correspondentes, o `AthleteRepositoryImpl` com o `_handleApiCall`, e os mapeadores.
3. **Geração:** Executámos o `build_runner` várias vezes, depurando erros de DTOs e `providers`.
4. **Apresentação:**
      * Criámos o `AthleteList` provider para a lista e o `AthleteForm` para as ações.
      * Construímos a `AthletePage`, `EditAthletePage`, etc., usando os padrões que agora estão documentados no nosso *Cookbook de UI*.
      * Adicionámos as rotas `/athletes`, `/athletes/new` e `/athletes/:id/edit`.
      * **Depuração e Refinamento:** Iterámos sobre a camada de apresentação para resolver *race conditions* e bugs de reatividade, resultando nos nossos padrões de orquestração de estado finais.

Seguir este guia garante que cada nova funcionalidade seja construída com a mesma qualidade, robustez e consistência que a funcionalidade de "Gestão de Atletas".
