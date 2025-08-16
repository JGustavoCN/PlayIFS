+++markdown
# Manual de Arquitetura — Padrão para Implementação de Repositórios  
**v2.0 - Revisado**

---

## 📜 Prefácio — A Missão do Repositório
Enquanto o **Contrato do Repositório** (a *abstract class* no domínio) define **o que** a aplicação precisa fazer, a **Implementação do Repositório** (`class ...Impl`) define **como** isso é feito.

Essa classe atua como um **"escudo protetor"** da aplicação. É responsabilidade dela:

- Orquestrar a chamada à fonte de dados (**PlayifsApiService**).  
- Traduzir **dados brutos (DTOs)** em **Entidades de Domínio**.  
- Capturar exceções de rede (`DioException`) e traduzi-las em exceções de domínio previsíveis (`ApiException`, `ValidationException`) envolvidas em um `Result.failure`.

---

## 1️⃣ Estrutura e Nomenclatura
- **Localização:** `lib/data/repositories/`  
- **Nome do ficheiro:** *snake_case*, seguindo o padrão  
  ```
  [feature]_repository_impl.dart
  ```
- **Estrutura da Classe:**
  - Deve usar `implements` para aderir ao contrato do domínio.  
  - Fonte de dados (`ApiService`) recebida via **injeção de dependência** no construtor.  
  - Construtor deve ser o **primeiro membro** declarado.

---

## 2️⃣ O Padrão Arquitetural — O Helper `_handleApiCall`
Para garantir **tratamento de erros consistente, centralizado e robusto**, todas as implementações de repositório devem usar um método helper privado chamado `_handleApiCall`.

**🎯 Justificativa Arquitetural:**
- **Centralização:** evita repetição de blocos `try-catch` em todos os métodos.  
- **Consistência:** todas as falhas seguem a *Jornada de um Erro*.  
- **Clareza:** métodos públicos se tornam *one-liners* focados apenas na lógica de negócio.

---

### 2.1. Template Padrão do `_handleApiCall`
Este método deve ser **copiado** para cada nova classe `RepositoryImpl`.  
Ele é a implementação **canónica** da "tradução" de erros.

```dart
// Template do método helper a ser incluído no repositório
Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return Result.success(await apiCall());
  } on DioException catch (e) {
    // Verifica se o DioClient enriqueceu o erro com a nossa ValidationException.
    if (e.error is ValidationException) {
      return Result.failure(e.error as ValidationException);
    }
    // Para outros erros do Dio, cria um ApiException genérico.
    final message = e.response?.data?['error'] ?? e.message ?? 'Erro desconhecido';
    return Result.failure(ApiException(
      message,
      statusCode: e.response?.statusCode,
    ));
  } catch (e) {
    // Para erros inesperados (ex: erro de parsing no mapper).
    return Result.failure(ApiException(e.toString()));
  }
}
```

---

## 3️⃣ A Anatomia de um Método de Repositório
Com o `_handleApiCall`, os métodos públicos tornam-se **simples e declarativos**, usando **corpos de expressão** (`=>`).

---

### **Cenário A — Resposta com Dados a Mapear**
Usado na maioria dos endpoints `GET`, `POST` e `PUT` que retornam dados.

```dart
// Exemplo do AthleteRepositoryImpl
@override
Future<Result<Page<AthleteSummary>>> findAll({int page = 0, int size = 10, String? name}) =>
    _handleApiCall<Page<AthleteSummary>>(() async {
      // 1. Prepara a chamada à API.
      final queries = {'page': page, 'size': size, if (name != null) 'name': name};
      final response = await _apiService.findAllAthletes(queries);
      
      // 2. Mapeia o DTO para a Entidade de Domínio.
      final pageDto = response.data;
      final content = pageDto.content.map((dto) => dto.toEntity()).toList();
      return Page(
        content: content,
        totalElements: pageDto.totalElements,
        totalPages: pageDto.totalPages,
        number: pageDto.pageNumber,
      );
    });
```

---

### **Cenário B — Resposta sem Dados (`void`)**
Usado em endpoints `DELETE` que retornam **204 No Content**.

```dart
// Exemplo do AthleteRepositoryImpl
@override
Future<Result<void>> delete(int id) =>
    _handleApiCall<void>(() => _apiService.deleteAthlete(id));
```

---

## 4️⃣ O Exemplo Canónico
O ficheiro que **melhor representa** a implementação final e robusta deste padrão é:

```
athlete_repository_impl.dart
```

Ele contém exemplos de todos os cenários:
- Listagem com mapeamento  
- Busca por ID  
- Criação  
- Atualização  
- Exclusão `void`  
- Operações em massa  

Todos utilizando o `_handleApiCall` de forma **limpa e consistente**.

---

## ✅ Benefícios de Seguir Este Manual
- **Resiliência:** erros tratados de forma centralizada e previsível.  
- **Legibilidade:** intenção de cada método é clara.  
- **Desacoplamento:** lógica de negócio e UI isoladas da camada de dados.
+++