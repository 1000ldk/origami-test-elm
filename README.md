# origami-test-elm

[origami-elm](https://github.com/1000ldk/origami-elm)（Elm コードの依存構造から折り紙の展開図を生成する Swift 製ツール）向けの、素材となる小さな Elm アプリケーションです。

このアプリ自体は、鶴の折り方ステップを SVG でぱらぱら表示するだけの簡易ビューアですが、モジュールを分割して意味のある依存関係ツリーを持たせてあります。

```
Main
├── Model
│   └── Steps
│       └── Geometry
├── Update
│   └── Model
│       └── ...
└── View
    ├── Model
    ├── Steps
    └── Geometry
```

## セットアップ

```sh
npm install -g elm
```

## 実行（開発サーバー）

```sh
elm reactor
```

起動後 `http://localhost:8000/src/Main.elm` を開いてください。

## ビルド

```sh
elm make src/Main.elm --output=main.js
```

生成された `main.js` を `index.html` と同じディレクトリに置いてブラウザで `index.html` を開くと動作します。

## 内容

- `src/Geometry.elm` — 2D 座標のユーティリティ（中点・拡大縮小・平行移動）
- `src/Steps.elm` — 折り方ステップ（多角形の頂点と折り線）の定義
- `src/Model.elm` — アプリの状態とメッセージ型
- `src/Update.elm` — 状態更新ロジック
- `src/View.elm` — SVG で折り紙の各ステップを描画する View
- `src/Main.elm` — エントリポイント（`Browser.sandbox`）
