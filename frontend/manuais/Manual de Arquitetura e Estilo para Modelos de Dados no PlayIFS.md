+++markdown

# Manual de Arquitetura e Estilo para Modelos de Dados no PlayIFS

*(v2.1 - Final)*

---

## Prefácio: A Importância do Padrão

A consistência é a chave para a produtividade.
Ao padronizar a forma como criamos as nossas **classes de modelo**, garantimos que qualquer desenvolvedor possa **entender, manter e estender** o código rapidamente.

Este padrão foi desenhado para maximizar os benefícios das nossas ferramentas (`freezed`, `json_serializable`) e da nossa arquitetura (**Clean Architecture**).

---

## 1. O Padrão Arquitetural para Criação de Modelos

Esta seção detalha o passo a passo para a criação de qualquer classe de modelo que use `@freezed`, seja uma **Entidade de Domínio** ou um **Modelo de Dados (DTO)**.

### 1.1. Localização e Nome do Ficheiro

**Localização:**

* **Entidades de Domínio:** `lib/domain/entities/[feature]/`
* **Modelos de Dados (DTOs):** `lib/data/models/[feature]/`

**Convenção de Nomenclatura:**

* **Nome do Ficheiro:** sempre em `snake_case` (letras minúsculas separadas por `_`).
* **Nome da Classe:** sempre em `PascalCase` (iniciais maiúsculas).

**Exemplos Corretos:**

* Ficheiro: `login_request_dto.dart` → Classe: `LoginRequestDTO`
* Ficheiro: `auth_tokens.dart` → Classe: `AuthTokens`

---

### 1.2. Estrutura Interna do Ficheiro *(O “Esqueleto”)*

Todo ficheiro de modelo deve ter a seguinte estrutura:

1. **Imports:** Comece com os imports necessários (no mínimo, `freezed_annotation`).
2. **Diretivas `part`:** Ligação com os ficheiros que o `build_runner` irá gerar.
3. **Anotação `@freezed`:** Gatilho para a geração de código.
4. **Declaração da Classe:** Definição da classe `abstract`.

---

### 1.3. Detalhes da Classe *(O Padrão Obrigatório)*

#### Diretivas `part` (Convenção `snake_case`)

* Deve corresponder exatamente ao nome do ficheiro.

```dart
part 'nome_do_ficheiro.freezed.dart';
part 'nome_do_ficheiro.g.dart'; // Apenas para classes com serialização JSON
```

#### Declaração da Classe

* Deve ser `abstract` (ou `sealed` para classes de estado).
* Nome em `PascalCase`.
* Uso obrigatório de `with _$NomeDaClasse`.

#### Construtor `factory .fromJson`

* **Obrigatório** para DTOs e entidades serializáveis.
* Ativa o `json_serializable`, permitindo a geração de `fromJson` e `toJson`.

---

## 2. O Exemplo Canónico — `login_request_dto.dart`

Ficheiro: `lib/data/models/auth/login_request_dto.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

// As diretivas 'part' usam snake_case, espelhando o nome do ficheiro.
part 'login_request_dto.freezed.dart';
part 'login_request_dto.g.dart';

@freezed
// A classe usa PascalCase e o mixin correspondente.
abstract class LoginRequestDTO with _$LoginRequestDTO {
  
  // O construtor factory define as propriedades.
  const factory LoginRequestDTO({
    required String registration,
    required String password,
  }) = _LoginRequestDTO;

  // O construtor fromJson ativa a geração de código para JSON.
  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDTOFromJson(json);
}
```

---

## 3. Processo de Análise: Do Backend Java para o Frontend Dart

Ao implementar uma nova funcionalidade a partir do backend:

1. **Identificar** o Controller e os DTOs Java associados.
2. **Analisar** a estrutura do DTO Java para listar os campos e tipos.
3. **Aplicar o Padrão de Criação em Dart:**

   * Para cada DTO Java, criar um novo ficheiro `.dart` na pasta correta (`lib/data/models/[feature]/`).
   * Nomear em `snake_case` (ex: `competition_summary_dto.dart`).
   * Seguir rigorosamente os passos deste manual para criar a classe Dart correspondente.

---

+++
