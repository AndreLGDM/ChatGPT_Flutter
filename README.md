# ChatGPT Flutter

Aplicativo mobile em Flutter que consome a **API da OpenAI (ChatGPT)**, com tela
de chat e seleção de modelos.

## Contexto

Projeto pessoal de estudo de **Flutter/Dart** e integração com API REST.

## Tecnologias

- Flutter, Dart
- `http` (requisições), `provider` (estado) e `flutter_dotenv` (variáveis de ambiente)

## Configuração

A chave da API **não** fica no código. Crie um arquivo `.env` na raiz do projeto:

```
OPENAI_API_KEY=sua_chave_aqui
```

(O `.env` já está no `.gitignore`.)

## Como executar

```bash
flutter pub get
flutter run
```

## Estrutura

- `lib/screens/chat_screen.dart` — tela de chat
- `lib/services/api_services.dart` — chamadas à API da OpenAI
- `lib/providers/` — gerência de estado (modelos)
- `lib/constants/api_consts.dart` — base URL e leitura da chave a partir do `.env`

## Estado atual

Projeto de estudo/protótipo.
