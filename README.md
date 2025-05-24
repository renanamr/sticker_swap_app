# Sticker Swap APP

Este projeto visa desenvolver um app capaz de gerenciar álbuns de figurinhas da copa. Para isso foi desenvolvido esse projeto para instalação no dispositivo e em conjunto uma API.

## Funcionalidades
- Gerenciamento de álbuns (Adição, remoção de figurinhas);
- Filtragens (Somente repetidas, somente faltantes);
- Organização de figurinhas por grupos/times;
- Chat para troca de figurinhas;
- Envio de mensagens (comuns, de troca ou localização para troca);
- Sugestão de trocas (com base nas suas figurinhas e do outro usuário);
- Compartilhamento de chat por QrCode.

## 🚀 Tecnologias

### No app:
- Flutter 3.22+
- Android Studio ou VS Code
- .env (gerenciamento de ambiente)

### Na API:
- Consulte o projeto: https://github.com/guieg/Sticker-Swap-API/
---

## ⚙️ Configuração

1. Baixe as dependências do projeto:

```
flutter pub get
```

2. Adicione a sua plataforma:

```
flutter create --platforms=ios,android . 
```
> Edite o comando acima para selecionar apenas as plataformas que você utiliza.

2. Configure as váriaveis de ambiente, para isso crie um arquivo .env com:

```
API_URI="http://localhost:8081"
```

localhost:8081 é o endereço padrão de execução do sticker_swap_api

### Execução

Após configurar o app e inicializar a api, execute:

```
# flutter run -d <plataform>
```

