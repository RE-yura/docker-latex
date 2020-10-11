# docker-latex

Tex のビルド環境を構築するのは大変だったりします．
そこで，以下のようにDocker + VSCodeを使うと，簡単にtexをビルドできます．

## docker pull

まずはtexliveの入ったdocker imageをpullします．
```
$ docker pull paperist/alpine-texlive-ja
```

## VSCode setting

最初に，拡張機能｢LaTex Workshop｣をインストールして下さい．
その後，settings.jsonに以下を追記します．

```json
  {
    "latex-workshop.view.pdf.viewer": "tab",
    "latex-workshop.view.pdf.spreadMode": 0, // 1にすれば見開き
    "latex-workshop.view.pdf.zoom": "auto", // 見開きの時は"0.5"にする

    // Dockerでtexビルド
    "latex-workshop.latex.recipes": [
      {
        "name": "compile",
        "tools": ["ptex2pdf"]
      }
    ],
    "latex-workshop.latex.tools": [
      {
        "name": "ptex2pdf",
        "command": "bash",
        "args": ["%DIR%compile.sh"]
      }
    ],
    "latex-workshop.latex.autoBuild.run": "onFileChange",
    "latex-workshop.docker.enabled": true,
  }
```

## Usage

今読んでいるREADMEと同じ階層に hogehoge.texファイルを作成します．
ctrl+sで保存する度に，同じ階層にhogehoge.pdfが自動生成されます．

手動でビルド実行したい場合は以下のコマンドを叩きます．
```
$ ./compile.sh
```
