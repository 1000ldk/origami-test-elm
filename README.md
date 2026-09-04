# origami-test-elm

コーヒー豆の基礎知識(品種・産地・精製方法・焙煎度・抽出方法・豆別の淹れ方)をまとめた Elm 製のウェブサイトです。

## セットアップ

```sh
npm install -g elm@0.19.1-6 elm-test@0.19.2-1 elm-format@0.8.8
```

バージョンは CI (`.github/workflows/deploy.yml`) と揃えています。

## ローカルで動かす

```sh
elm make src/Main.elm --output=main.js
python3 -m http.server 8000
```

`http://localhost:8000/` を開きます。`index.html` が `main.js` と `style.css` を読み込む構成なので、公開時と同じ見た目になります。`main.js` は `.gitignore` 済みです。

外部リソースを読み込まないため、`index.html` をブラウザで直接開く(`file://`)方法でも動きます。

> **`elm reactor` を使う場合の注意**
> `elm reactor` は `index.html` ではなく Elm が生成する素の HTML でアプリを描画するため、`style.css` が読み込まれません。ロジックの確認には使えますが、レイアウトの確認には上の手順を使ってください。

## 検査

```sh
elm-format --validate src/ tests/
elm-test
```

## 構成

データ・状態・表示を分けています。各モジュールは1つの役割だけを持ちます。

```
src/
  Main.elm                    エントリポイント。配線のみ
  App/
    State.elm                 Model / Msg / update と、そこから引ける値
  Coffee/                     ドメイン(表示方法を知らない)
    Range.elm                 単位付き数値レンジ(不透明型)
    Slug.elm                  id・アンカー用の識別子(不透明型)
    Fact.elm                  カードの補足情報。ラベルと整形を集約
    Item.elm                  カード1件。id の正規化と検索対象の定義
    Category.elm              章の一覧・見出し・導入文
    Catalog.elm               データモジュールを束ねる唯一の入口
    Validation.elm            カタログの不変条件の検査
    Data/                     データ本体(章ごとに1ファイル)
      Varieties.elm
      Origins.elm
      Processing.elm
      Roasts.elm
      BrewMethods.elm
      Pairings.elm
  View/                       表示(アプリの Msg を知らない)
    Layout.elm                ページの外枠
    Tabs.elm                  章の切り替え
    SearchBox.elm             絞り込み入力
    Card.elm                  カード1枚
    Problems.elm              データ検証の警告バナー
tests/
  RangeTest.elm
  SlugTest.elm
  ItemTest.elm
  CatalogTest.elm
```

### 設計の意図

**補足情報を型にしている。** カードの「標高」「湯温」などの行は、以前 `( String, String )` のタプルでラベルを毎回手書きしていました。現在は `Coffee.Fact` の構築子(`Fact.altitude 1800 2200` など)で書き、ラベルの文言と整形は `Fact.toRow` の1箇所で決まります。表記揺れが起きず、単位の付け忘れも型で防げます。

**識別子は不透明型。** `Coffee.Slug` の構築子は全域関数で、入力を正規化して返します。「不正な slug」という状態が作れないため、カードの要素 id はそのままアンカー(`#kona`)として使えます。

**型で防げない範囲は検証で見る。** id の重複や本文の空欄は型では防げないので、`Coffee.Validation` が実行時に一度検査します。同じ関数を `CatalogTest` が表明に、`View.Problems` が画面上の警告バナーに使うため、データが壊れたまま静かに公開されることがありません。

**依存の向きを一方向に保つ。** `View/*` は `msg` を型変数のままにしてあり、アプリの `Msg` を知りません。`Coffee/*` は `Html` を一切 import しません。

### 章を追加するとき

1. `Coffee/Data/` にデータモジュールを追加
2. `Coffee.Category` に構築子を足す — `label` / `intro` / `slug` の分岐漏れはコンパイラが指摘します
3. `Coffee.Category.all` と `Coffee.Catalog.itemsFor` に繋ぐ

## デプロイ

`main` ブランチへの push で GitHub Actions がフォーマット検査・テスト・ビルドを実行し、すべて通れば GitHub Pages に公開します(Pages の Source が「GitHub Actions」である必要があります)。

## 出典・注意

産地の標高やレシピの数値は一般に紹介されている目安で、農園やロット、焙煎度によって最適値は変わります。出発点として扱ってください。
