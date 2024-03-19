# Desafio Mobile BE

Este é um projeto desenvolvido como parte do desafio Mobile da BE. O objetivo é construir uma aplicação móvel em Flutter que exibe uma tabela com informações provenientes de uma API simulada, permitindo também a pesquisa por meio de um input.

## Sobre

A aplicação consiste em uma tabela que exibe imagens e nomes de funcionários. Ao clicar em uma linha da tabela, mais informações sobre o funcionário são expandidas, mostrando o cargo, data de admissão e telefone, formatados de acordo com as especificações fornecidas no Figma do projeto.

Ao clicar no cabeçalho da coluna "nome", os dados serão formatados em ordem alfabética. Além disso, é possível realizar um pull to refresh para atualizar os dados caso o JSON seja alterado.

## Pré-requisitos

- Flutter SDK instalado e configurado no ambiente de desenvolvimento.
- Um editor de código, como VSCode ou Android Studio.

## Rodando a Aplicação

1. Clone este repositório para o seu ambiente local:

```bash
git clone https://github.com/cesarmartins1245/desafio-mobile.git
```

2. Navegue até o diretório do projeto:

```bash
cd desafio-mobile
```

3. Execute o aplicativo em um emulador ou dispositivo físico:

```bash
flutter pub get
```
```bash
flutter run
```

Isso iniciará o aplicativo no emulador ou dispositivo conectado.

4. Você também pode baixar a APK [aqui](https://drive.google.com/drive/folders/1Y1iE31zpth6F0DXBOCbSki3aPK_amuzQ?usp=sharing).


## Notas Adicionais

- Certifique-se de ter uma conexão de internet ativa para que o aplicativo possa acessar a API simulada.
