## Configuração do Projeto Flutter

Para iniciar o desenvolvimento neste projeto Flutter, siga as instruções abaixo para configurar seu ambiente:

### Requisitos do Flutter

* **Flutter SDK:** Versão 3.29.2.
    * Para garantir a versão correta do Flutter, você pode:
        * Executar o comando `flutter upgrade` no seu terminal para atualizar para a versão mais recente, se já tiver o Flutter instalado.
        * Usar o [Flutter Version Management (FVM)](https://fvm.app/) para gerenciar múltiplas versões do Flutter SDK.

### Banco de Dados: Isar

Este projeto utiliza o Isar como banco de dados.

* **Isar:** Isar é um banco de dados NoSQL rápido, cross-platform e open-source para Flutter. Ele foi projetado para ser fácil de usar e extremamente rápido.
    * Para mais detalhes, consulte a [documentação oficial do Isar](https://isar.dev/pt/).
* Ele tem um visualizador próprio do banco de dados, basta abrir o link depois de rodar o projeto:

    ```
    I/flutter ( 6520): ╔══════════════════════════════════════════════════════╗
    I/flutter ( 6520): ║                 ISAR CONNECT STARTED            ║
    I/flutter ( 6520): ╟──────────────────────────────────────────────────────╢
    I/flutter ( 6520): ║         Open the link to connect to the Isar    ║
    I/flutter ( 6520): ║        Inspector while this build is running.   ║
    I/flutter ( 6520): ╟──────────────────────────────────────────────────────╢
    I/flutter ( 6520): ║ [https://inspect.isar.dev/3.1.0+1/#/58145/lSbBOItV5cE](https://inspect.isar.dev/3.1.0+1/#/58145/lSbBOItV5cE) ║
    I/flutter ( 6520): ╚══════════════════════════════════════════════════════╝
    ```

### Gerenciamento de Rotas: Routefly

O projeto usa o Routefly para o gerenciamento de rotas.

* **Routefly:** Permite a criação automática de rotas organizando os arquivos de código em diretórios.

#### Adicionando Rotas

1.  **Organize seu código:**

    * Crie pastas dentro de `lib/app` para organizar suas páginas.
    * Cada pasta deve conter um arquivo `*_page.dart` para cada página.
        * Exemplo:

            ```
            .
            └── app/
                ├── product/
                │   └── product_page.dart
                └── user/
                    └── user_page.dart
            ```

2.  **Gere as rotas:**

    * Execute o seguinte comando no terminal:

        ```
        dart run routefly
        ```
    * Execute este comando sempre que criar uma nova página.
* Video sobre: https://www.youtube.com/watch?v=DmbIABioAME&t=185s
    * Para mais detalhes e exemplos, consulte a [documentação do Routefly](https://pub.dev/packages/routefly).

### Injeção de Dependências: Auto Injector

O projeto utiliza o Auto Injector para injeção de dependências.

* **Auto Injector:** Este é um pacote Dart criado para simplificar a injeção de dependências. Basta criar a classe a ser injetada e declará-la com um dos métodos "add" disponíveis.

#### Como Usar

1.  **Registre as instâncias no arquivo dependencies.dart**

    ```dart
    final injector = AutoInjector();
    
    Future<void> setupDependencies() async {
      injector.addSingleton(Database.new);
    
      // Subject dependencies
      injector.addLazySingleton<SubjectLocalService>(SubjectLocalService.new);
      injector.addLazySingleton<SubjectRepository>(SubjectRepositoryImpl.new);
    
      // User dependencies
      injector.addLazySingleton<UserLocalService>(UserLocalService.new);
      injector.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
    
      injector.addLazySingleton(LoginViewModel.new);
      injector.addLazySingleton(HomeViewModel.new);
    
      SharedPreferences prefs = await SharedPreferences.getInstance();
      injector.addInstance<SharedPreferences>(prefs);
      injector.addSingleton(LocalStoragePreferencesService.new);
      injector.addSingleton<SettingsRepository>(SettingsRepositoryImpl.new);
    
      injector.addLazySingleton(SettingsViewModel.new);
    
      injector.commit();
    }
    ```

2.  Obtenha instâncias usando `injector.get<T>()`.
* Video sobre: https://www.youtube.com/watch?v=BwrbAWlKWsQ&t=14s&pp=ygUVYXV0byBpbmplY3RvciBmbHV0dGVy
    * Para mais exemplos e detalhes, consulte a [documentação do Auto Injector](https://pub.dev/packages/auto_injector).

### Arquitetura: MVVM

O projeto segue a arquitetura MVVM (Model-View-ViewModel).

* Playlist sobre a arquitetura no Flutter: https://www.youtube.com/watch?v=uR9AgDzj1Ro&list=PLLS3ETcLxQI7C1SAJjsfChPMvbYho2UwK&pp=gAQB
