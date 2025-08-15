+++markdown

# Manual de Arquitetura PlayIFS: Resolução de Problemas e Depuração

---

## 1. A Filosofia de Depuração no PlayIFS

Na nossa arquitetura, um *bug* raramente é apenas uma linha de código errada.
Quase sempre, é um **fluxo de estado** que foi quebrado: um *provider* não foi notificado, uma *race condition* foi criada ou a UI não reagiu a uma mudança de estado.

> **Depurar** aqui não é só procurar erros — é rastrear o fluxo de estado através das camadas da aplicação.

---

## 2. O Fluxo de Pensamento do Arquiteto: As 4 Perguntas

Diante de um comportamento inesperado na UI, siga este roteiro, descendo das camadas mais externas para as mais internas.

---

### **Pergunta 1 — ONDE?** *(Camada de Apresentação)*

* Onde, na UI, o problema é visível?
  Ex: *"O card de perfil na HomePage não atualiza."*
* Qual *provider* esse widget está observando (`ref.watch`) para obter dados?
  Ex: *"Ele observa o `profileNotifierProvider`."*

---

### **Pergunta 2 — O QUÊ?** *(Camada de Estado)*

* O que o *provider* identificado está a fazer?
  Use o Riverpod DevTools ou `debugPrint` no `build()` para confirmar reconstruções.
* Qual é o estado atual?
  Está em `AsyncLoading`, `AsyncError` ou `AsyncData` com dados desatualizados?

---

### **Pergunta 3 — PORQUÊ?** *(Camada de Dados/Domínio)*

* Por que o *provider* tem o estado errado?
  Se não atualiza, talvez a ação que deveria invalidá-lo não esteja sendo chamada.
* **Rastreie a ação:**

  1. Vá até o ponto na UI onde o evento ocorre (ex: `_submitForm` na `EditAthletePage`).
  2. Está chamando o **UseCase** correto?
  3. O resultado está sendo tratado corretamente (sucesso vs. falha)?
  4. O `ref.invalidate` ou `ref.refresh` está sendo aplicado no *provider* correto?

---

### **Pergunta 4 — A ORIGEM** *(Camada de Rede)*

* O que a API realmente retornou?
  Se tudo parece correto mas os dados estão errados, confira os **logs de rede**.
* Nosso `DioClient` já imprime *requests* e *responses*.
* Pergunte:

  * Foi HTTP 200?
  * O JSON bate exatamente com o DTO esperado? *(lembre do caso `coach` vs. `isCoach`)*
  * Foi erro HTTP (4xx, 5xx)? Qual mensagem veio no corpo?

---

## 3. Técnicas de Depuração Aplicadas

---

### **Técnica 1 — `debugPrint`: O Raio-X do Fluxo**

Use `debugPrint()` para acompanhar execução e valores em pontos críticos.

**Na UI (`_submitForm`):**

```dart
if (isEditingSelf && oldRegistration != newRegistration) {
  debugPrint('[EditAthletePage] Cenário: Matrícula própria alterada. A iniciar logout...');
  await ref.read(authProvider.notifier).logout();
} else {
  if (isEditingSelf) {
    debugPrint('[EditAthletePage] Cenário: Perfil próprio alterado. A atualizar a HomePage...');
    await ref.refresh(profileNotifierProvider.future);
  }
}
```

**No Provider (`build` do `ProfileNotifier`):**

```dart
@override
Future<Profile> build() async {
  debugPrint('[ProfileNotifier] A reconstruir o estado do perfil...');
  // ...
}
```

**No Repositório (`_handleApiCall`):**

```dart
Future<Result<T>> _handleApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return Result.success(await apiCall());
  } catch (e) {
    debugPrint('[Repository] Exceção original capturada: ${e.runtimeType} - ${e.toString()}');
    // ...
  }
}
```

---

### **Técnica 2 — Debugger e Breakpoints**

Para problemas complexos, use o depurador:

1. Adicione um *breakpoint* clicando na margem esquerda.
2. Rode em **modo debug** (`F5` ou "Run > Start Debugging").
3. Quando parar, inspecione variáveis e avance passo a passo.

---

### **Técnica 3 — Validar a Fonte da Verdade (API)**

Se o `DioClient` mostrar resposta inesperada:

* Teste a requisição diretamente via **Postman** ou **Swagger**.
* Compare o JSON puro com o DTO no Flutter.
* Verifique campo a campo por discrepâncias.

---

✅ Seguindo essas **4 perguntas** e aplicando essas **técnicas**, você consegue isolar a camada exata onde o fluxo de estado quebrou.
+++
