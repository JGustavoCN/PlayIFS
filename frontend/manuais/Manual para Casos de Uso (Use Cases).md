+++markdown

# Manual de Arquitetura: Padrão para Casos de Uso (Use Cases)

*(v1.2 - Revisado)*

---

## Prefácio: A Missão de um Caso de Uso

Na nossa arquitetura, um **Caso de Uso** (ou *Interactor*) representa **uma única ação de negócio** que a aplicação pode executar.
Pense nele como um **"verbo"** da aplicação — uma funcionalidade que a UI pode invocar, como:

* Fazer login
* Buscar competições
* Atualizar perfil

Ele atua como a **ponte** entre a **Camada de Apresentação (UI)** e a **Camada de Domínio**, orquestrando o fluxo de dados e aplicando a lógica de negócio de forma **isolada** e **testável**.

---

## As 4 Regras de Ouro da Arquitetura

Estas regras garantem **robustez** e **desacoplamento** do sistema.

---

### 1. Uma Classe, Uma Ação *(Princípio da Responsabilidade Única)*

Cada ficheiro de Caso de Uso deve encapsular apenas **uma** funcionalidade:

* `LoginUseCase` → apenas login
* `ListCompetitionsUseCase` → apenas listar competições

Isso torna o sistema **organizado** e **fácil de entender**.
Para saber o que a aplicação faz, basta olhar para a pasta de casos de uso.

---

### 2. Vive na Camada de Domínio

Casos de Uso são o **coração da lógica de negócio**, livres de dependências de UI (Flutter) ou rede (`Dio`, `http`).

* **Localização:** `lib/domain/usecases/[feature]/`
* **Nome do ficheiro:** `snake_case` (ex: `login_use_case.dart`)

---

### 3. Depende de Contratos (Abstrações), Não de Implementações

Um Caso de Uso **nunca** deve saber como os dados são obtidos.
Ele depende **do contrato abstrato do repositório** (no domínio), não da implementação concreta (na camada de dados).

* ✅ **Correto:**

  ```dart
  final AuthRepository _repository;
  ```

* ❌ **Incorreto:**

  ```dart
  final AuthRepositoryImpl _repository;
  ```

---

### 4. Expõe um Único Método Público (`execute` ou `call`)

Cada Caso de Uso deve ter **apenas um método público** para executar a ação.
A assinatura deve deixar claro **o que recebe** e **o que retorna**.

---

## Refinamentos de Estilo e Boas Práticas

* **Construtores Primeiro (`sort_constructors_first`)**
  O construtor deve vir antes de variáveis e métodos.
* **Corpos de Função Expressão (`prefer_expression_function_bodies`)**
  Métodos com uma única instrução devem usar sintaxe de seta (`=>`).
* **Documentação (`Doc Comments`)**
  Todas as classes e métodos públicos devem ter comentários `///`.

---

## O Exemplo Canónico (Código PlayIFS)

Ficheiro: `lib/domain/usecases/auth/login_use_case.dart`

```dart
// Imports devem vir de 'core', 'domain' ou pacotes externos.
// Nunca de 'data' ou 'presentation'.
import '../../../core/network/result.dart';
import '../../entities/auth/auth_tokens.dart';
import '../../entities/auth/login_credentials.dart';
import '../../repositories/auth_repository.dart';

/// Caso de Uso para a funcionalidade de login.
/// Encapsula a lógica de negócio para autenticar um utilizador.
class LoginUseCase {
  /// Constrói o caso de uso com uma dependência do contrato [AuthRepository].
  LoginUseCase(this._repository);

  /// A dependência é a abstração do repositório, não a implementação.
  final AuthRepository _repository;

  /// Executa a operação de login.
  /// Recebe as credenciais e as repassa para o repositório.
  Future<Result<AuthTokens>> execute(LoginCredentials credentials) =>
      _repository.login(credentials);
}
```

---

O manual está **robusto** e o código acima está **em total conformidade** com as regras estabelecidas.
+++
