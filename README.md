# WaterInc Mobile

App mobile do **WaterInc**, um projeto para incentivar as pessoas a beber mais água. O usuário registra cada copo que bebe e acompanha o próprio consumo; a ideia do projeto é transformar esse hábito num jogo, com rankings e medalhas.

> 🇺🇸 *Mobile app for WaterInc, a project that encourages people to drink more water. Built with Flutter, Riverpod and Appwrite. English summary at the end.*

## Funcionalidades

- **Cadastro e login** com email e senha.
- **Registro de consumo:** botões rápidos para quantidades comuns e entrada livre em **mL** ou **L**.
- **Histórico** do que foi registrado, com gráficos.
- Base para a parte social (seguidores e seguindo no perfil do usuário), pensada para os rankings.

> **Status:** protótipo acadêmico (2023). Os rankings e as medalhas estão no escopo do projeto, mas não foram implementados nesta versão do app.

## Tecnologias

| Camada | Tecnologia |
|---|---|
| App | [Flutter](https://flutter.dev) / Dart |
| Estado | [Riverpod](https://riverpod.dev) (`flutter_riverpod`) |
| Erros funcionais | [fpdart](https://pub.dev/packages/fpdart) (`Either` para falhas da API) |
| Backend | [Appwrite](https://appwrite.io) self-hosted (autenticação e banco de dados) |
| Gráficos | `syncfusion_flutter_charts`, `fl_chart` |

O backend em Java/Spring Boot do projeto está no repositório [WaterInc](https://github.com/JoaoGBarros/WaterInc).

## Estrutura

O código é organizado por funcionalidade (*feature-first*):

```
lib/
├── features/
│   ├── auth/     # login e cadastro (api, controller, views, widgets)
│   ├── agua/     # registro e listagem do consumo de água
│   ├── home/     # tela principal com navegação por abas
│   └── user/     # dados do usuário
├── core/         # providers do Appwrite, tipos, tratamento de falhas, utilitários
├── models/       # Agua e UserModel
├── commons/      # componentes reutilizáveis (botões, telas de erro e carregamento)
├── constraints/  # constantes (Appwrite, unidades, assets, UI)
└── theme/        # tema e paleta de cores
```

Cada funcionalidade segue a mesma divisão: **api** (acesso ao Appwrite) → **controller** (regras, com Riverpod) → **view** (telas).

## Como rodar

**Pré-requisitos:** Flutter 3 (Dart ≥ 2.19) e uma instância do Appwrite (o projeto usou uma instância self-hosted na rede local).

1. Suba o Appwrite e crie um projeto, um banco de dados e duas coleções: **usuários** e **água**.
2. Preencha `lib/constraints/appwrite_constants.dart` com o endpoint e os IDs do seu projeto:

   ```dart
   class AppwriteConstants {
     static const String endPoint = 'http://SEU_HOST/v1';
     static const String projectId = 'SEU_PROJECT_ID';
     static const String databaseId = 'SEU_DATABASE_ID';
     static const String usersCollection = 'ID_DA_COLECAO_DE_USUARIOS';
     static const String aguaCollection = 'ID_DA_COLECAO_DE_AGUA';
   }
   ```

   Esses valores identificam o projeto no Appwrite e não são segredos. A segurança dos dados fica nas permissões das coleções.
3. Instale as dependências e rode:

   ```bash
   flutter pub get
   flutter run
   ```

## English summary

WaterInc Mobile is the Flutter app of **WaterInc**, an academic project (2023) that encourages people to drink more water. Users sign up, log their water intake in mL or L, and see their history with charts. It uses **Riverpod** for state, **fpdart** for error handling, and a self-hosted **Appwrite** instance for authentication and data. To run it, set your Appwrite endpoint and IDs in `lib/constraints/appwrite_constants.dart`, then `flutter pub get` and `flutter run`.

## Autor

**João Gabriel de Barros Rocha** · [GitHub](https://github.com/JoaoGBarros) · [LinkedIn](https://linkedin.com/in/joaogbarros)
