# origami-test-elm

コーヒー豆(品種・産地・焙煎度・抽出方法)の基礎知識をまとめた、簡単な Elm 製ウェブサイトです。

## セットアップ

```sh
npm install -g elm
```

## 開発サーバーで実行

```sh
elm reactor
```

起動後 `http://localhost:8000/src/Main.elm` を開いてください。

## ビルド

```sh
elm make src/Main.elm --output=main.js
```

生成された `main.js` を `index.html` / `style.css` と同じディレクトリに置き、`index.html` をブラウザで開くと動作します。

`main` ブランチへの push では GitHub Actions (`.github/workflows/deploy.yml`) が自動でビルドし、GitHub Pages が有効(Source: GitHub Actions)であれば自動で公開されます。

## 構成

- `src/Data.elm` — コーヒー豆に関するデータ(品種・産地・焙煎度・抽出方法)
- `src/Main.elm` — タブ切り替えで各カテゴリを表示するアプリ本体(`Browser.sandbox`)
- `style.css` — 見た目のスタイル
- `index.html` — エントリポイント
