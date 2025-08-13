+++markdown

# Manual de Arquitetura: Padrão para Injeção de Dependência com GetIt

*(v1.0)*

---

## Prefácio: A Missão da Injeção de Dependência

O objetivo da **Injeção de Dependência (DI)** é **remover a responsabilidade** de uma classe de criar os objetos dos quais ela depende.
Em vez de uma classe `A` criar uma instância de `B` dentro de si mesma, nós **injetamos** a instância de `B` já pronta para a classe `A`.

No nosso projeto, usamos o **padrão Service Locator** através do pacote **`get_it`**.
O nosso *locator* funciona como um **"contentor" central** que sabe como **construir e fornecer** todas as nossas dependências (**Services**, **Repositories**, **UseCases**) sempre que alguma parte da aplicação precisar delas.

---

## Benefícios Principais

* **Desacoplamento:** Classes como os nossos *Providers* não precisam saber como construir um `LoginUseCase`; elas simplesmente pedem um ao *locator*.
* **Testabilidade:** Durante os testes, podemos facilmente registar "versões falsas" (*mocks*) das nossas dependências no *locator*, permitindo testar cada classe de forma isolada.
* **Gestão Centralizada:** A criação de todos os nossos objetos de serviço acontece num único local:
  `lib/core/di/locator.dart`.

---

## 1. Estrutura Fundamental *(locator.dart)*

A configuração de **DI** no projeto tem três partes principais:

1. **Instância Global**

   ```dart
   final locator = GetIt.instance;
   ```

   Cria a instância única do nosso Service Locator.

2. **Função de Configuração**

   ```dart
   void setupLocator() { ... }
   ```

   É onde "ensinamos" ao *locator* como construir cada dependência.

3. **Chamada de Inicialização**
   A função `setupLocator()` é chamada **uma única vez** no início da aplicação, no `main.dart`, antes de `runApp()`.

---

## 2. Tipos de Registo *(Singleton vs. Factory)*

O **GetIt** oferece diferentes formas de gerir o ciclo de vida dos objetos.
No nosso projeto, usamos principalmente:

---

### `registerLazySingleton<T>(...)` *(Padrão Principal)*

* **O que faz:** Regista um tipo. A instância só é criada **na primeira vez que é solicitada** (`locator<T>()`). Depois disso, o *locator* retorna sempre a **mesma instância**.
* **Por que usamos:** É a escolha mais eficiente para a maioria dos casos (Services, Repositories, UseCases).
  O *lazy* garante um **arranque mais rápido**, pois os objetos só são criados quando realmente necessários.

---

### `registerSingleton<T>(...)`

* **O que faz:** Cria a instância imediatamente no momento do registo. Também retorna sempre a mesma instância.
* **Quando usamos:** Para objetos que precisam estar prontos desde o início ou que têm configuração complexa, como a instância do **Dio** pré-configurada pelo `DioClient`.

---

### `registerFactory<T>(...)`

* **O que faz:** Cria **uma nova instância** sempre que for solicitado.
* **Quando usamos:** Útil para objetos que precisam ter **estado limpo** a cada uso (ex.: ViewModel de tela específica).
  No nosso projeto, o Riverpod já lida com esta gestão para a UI, então usamos menos.

---

## 3. A Ordem Correta de Registo *(A "Cadeia de Dependências")*

**Regra de Ouro:**
Você deve **registar uma dependência antes** de registar uma classe que depende dela.

A ordem segue a **Clean Architecture**, das camadas mais externas para as mais internas:

1. **Dependências Base:** Ferramentas sem dependências internas (ex.: `FlutterSecureStorage`).
2. **Clientes de Rede:** `Dio` configurado, que depende do `FlutterSecureStorage`.
3. **Fontes de Dados (Datasources):** `PlayifsApiService`, que depende do `Dio`.
4. **Repositórios:** Implementações como `AuthRepositoryImpl`, que dependem do ApiService.
5. **Casos de Uso (UseCases):** Lógica de negócio como `LoginUseCase`, que depende dos Repositórios.

---

## 4. O Exemplo Canónico *(locator.dart)*

Ficheiro: `lib/core/di/locator.dart`

```dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
// ... outros imports

final locator = GetIt.instance;

void setupLocator() {
  // --- CAMADA DE REDE E SERVIÇOS DE BASE ---
  // Ordem 1: Dependências base
  locator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // Ordem 2: Cliente de rede, que depende do FlutterSecureStorage
  final configuredDio = DioClient(Dio(), locator<FlutterSecureStorage>()).dio;
  // Usamos registerSingleton porque o 'configuredDio' já foi criado.
  locator.registerSingleton<Dio>(configuredDio);

  // Ordem 3: Fonte de dados, que depende do Dio
  locator.registerLazySingleton<PlayifsApiService>(
    () => PlayifsApiService(locator<Dio>()),
  );
  locator.registerLazySingleton<TokenStorageService>(
    () => SecureTokenStorageService(),
  );

  // --- CAMADA DE DADOS: REPOSITÓRIOS ---
  // Ordem 4: Repositórios, que dependem do ApiService.
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(locator()),
  );

  // --- CAMADA DE DOMÍNIO: CASOS DE USO ---
  // Ordem 5: Casos de uso, que dependem dos Repositórios.
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => RefreshTokenUseCase(locator()));
  locator.registerLazySingleton(() => GetProfileUseCase(locator()));
}
```

---

O manual está **alinhado com a arquitetura** e garante um fluxo de dependências claro, eficiente e fácil de manter.
+++
