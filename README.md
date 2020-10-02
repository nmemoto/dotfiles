# dotfiles

## 概要

本リポジトリ内の`.git/配下のファイル README.md setup.sh`を除く全てのファイルのシンボリックリンクを `$HOME` 以下の同じディレクトリ構成に張る. その際、`＄HOME` 以下に存在しないディレクトリがあった場合作成される。

## 導入手順

リポジトリに含まれている `setup.sh` を実行する.

```sh
sh ./setup.sh
```

## 導入している VSCode 拡張

| 拡張名                                                                                                                                 | Unique Identifier                      | 用途                                    | 備考                                                               |
| -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | --------------------------------------- | ------------------------------------------------------------------ |
| [Japanese Language Pack for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja) | MS-CEINTL.vscode-language-pack-ja      | 日本語表示                              |                                                                    |
| [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)                          | ms-vscode-remote.remote-containers     | コンテナ開発                            | [公式ページ](https://code.visualstudio.com/docs/remote/containers) |
| [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)                                              | ms-azuretools.vscode-docker            | Dockerfile，docker−compose.yml 開発支援 |                                                                    |
| [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)                                   | PKief.material-icon-theme              | icon 表示                               |                                                                    |
| [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)                     | CoenraadS.bracket-pair-colorizer-2     | 括弧対応付け色表示                      |                                                                    |
| [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)                                                         | eamodio.gitlens                        |                                         |                                                                    |
| [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)                                           | oderwat.indent-rainbow                 | インデントの虹色表示                    |                                                                    |
| [GitHub Theme](https://marketplace.visualstudio.com/items?itemName=GitHub.github-vscode-theme)                                         | GitHub.github-vscode-theme             | VSCode theme                            |                                                                    |
| [zenkaku](https://marketplace.visualstudio.com/items?itemName=mosapride.zenkaku)                                                       | mosapride.zenkaku                      | 全角スペース表示                        |                                                                    |
| [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)                                     | DavidAnson.vscode-markdownlint         | markdown の lint ツール                 |                                                                    |
| [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)                                             | mechatroner.rainbow-csv                |                                         |                                                                    |
| [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)                                | esbenp.prettier-vscode                 |                                         |                                                                    |
| [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)                | VisualStudioExptTeam.vscodeintellicode |
|                                                                                                                                        |                                        |
