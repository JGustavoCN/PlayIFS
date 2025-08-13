+++markdown

# Manual de Arquitetura: Padrão para Construção de Widgets e Telas

*(v1.0)*

---

## Prefácio: A Missão da Camada de Apresentação

A **camada de apresentação** (`presentation`) é responsável por tudo o que o utilizador vê e com que interage.
Nossa filosofia: **widgets "burros" e reativos** — desenham o estado atual e notificam os providers sobre eventos, mas **nunca** contêm lógica de negócio.

---

## 1. Estrutura e Localização

### Telas (Pages)

* Representam **rotas inteiras** (ex: tela de login completa)
* **Localização:** `lib/presentation/pages/[feature]/nome_da_tela.dart`
* **Exemplos:** `login_page.dart`, `home_page.dart`

### Widgets Reutilizáveis

* Componentes menores usados em várias telas (ex: botão de tema, card de perfil)
* **Localização:** `lib/presentation/widgets/`
* **Exemplos:** `theme_toggle_button.dart`, `profile_card.dart`

---

## 2. Escolhendo o Widget Certo *(A Regra do Riverpod)*

### Para telas/widgets **sem** estado local

* **Use:** `ConsumerWidget`
* **Exemplo:** `HomePage`
* **Vantagens:** mais simples e performático

### Para telas/widgets **com** estado local

* **Use:** `ConsumerStatefulWidget` + `ConsumerState`
* **Exemplo:** `LoginPage`
* **Necessário para:** `TextEditingController`, animações, formulários, etc.

---

## 3. Interagindo com os Providers *(watch, listen, read)*

### `ref.watch(provider)`

* **Quando usar:** no `build`
* **O que faz:** observa mudanças de estado e reconstrói o widget
* **Use para:** tudo que afeta visualmente a UI (ex: spinner, textos)

### `ref.listen(provider, ...)`

* **Quando usar:** no `build`
* **O que faz:** reage a mudanças sem reconstruir a UI
* **Use para:** efeitos colaterais (ex: mostrar `SnackBar` de erro)

### `ref.read(provider.notifier)`

* **Quando usar:** dentro de callbacks (ex: `onPressed`)
* **O que faz:** obtém o *Notifier* para chamar métodos de ação
* **Não** observa mudanças

---

## 4. Consumindo Providers Assíncronos *(O Padrão `.when()`)*

Para `AsyncValue`s, use **sempre** o `.when()` para tratar **todos** os estados:

```dart
// Exemplo na HomePage
body: profileState.when(
  loading: () => const Center(child: CircularProgressIndicator()),
  error: (error, stackTrace) =>
    Center(child: Text('Erro: ${error.toString()}')),
  data: (profile) =>
    ProfileDisplayWidget(profile: profile),
),
```

* **Benefício:** nunca esquece de tratar `loading` ou `error`
* **Evita:** crashes e telas em branco

---

## 5. Estilização com o AppTheme *(Material 3)*

### Cores

**Correto:**

```dart
Theme.of(context).colorScheme.primary
```

**Errado:**

```dart
Colors.green
```

### Textos

**Correto:**

```dart
Theme.of(context).textTheme.headlineMedium
```

**Errado:**

```dart
TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
```

**Regra:** nunca usar valores hardcoded — tudo vem do `Theme`.

---

Seguindo estas práticas, garantimos **consistência visual** e **suporte total a tema claro/escuro**.
Suas telas `LoginPage` e `HomePage` já seguem este padrão de forma exemplar.
+++
