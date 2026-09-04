# origami-test-elm

コーヒー豆の基礎知識(品種・産地・精製方法・焙煎度・抽出方法・豆別の淹れ方)をまとめた Elm 製のウェブサイトです。

## セットアップ

```sh
npm install -g elm@0.19.1-6 elm-test@0.19.1-revision17 elm-format@0.8.8
```

バージョンは CI (`.github/workflows/deploy.yml`) と揃えています。`elm-test` は npm の `latest` が Elm 0.19.2 向けなので、0.19.1 系を明示的に指定する必要があります。

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
    Reference.elm             参考資料と、それが対応する章
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
    Sources.elm               その章の参考資料一覧
    Problems.elm              データ検証の警告バナー
tests/
  RangeTest.elm
  SlugTest.elm
  ItemTest.elm
  CatalogTest.elm
  ReferenceTest.elm
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
4. `Coffee.Reference` にその章の出典を足す — 忘れると `ReferenceTest` が落ちます

## デプロイ

`main` ブランチへの push で GitHub Actions がフォーマット検査・テスト・ビルドを実行し、すべて通れば GitHub Pages に公開します(Pages の Source が「GitHub Actions」である必要があります)。

## 出典と著作権

### 掲載内容について

**本サイトの文章はすべて書き下ろしで、参考資料からの転載はありません。** 産地の標高、フレーバー表現、抽出レシピの数値は複数の資料を調べたうえで、自分の言葉で記述しています。

参考にした資料は `src/Coffee/Reference.elm` に章との対応付きで持っており、サイト上でも開いている章の直下に一覧表示されます。`Coffee.Validation` と `tests/ReferenceTest.elm` が「出典の無い章」を検出するので、根拠を辿れない事実が載ることはありません。

法的な整理は次の通りです。

- **事実データに著作権は及びません。** 「キリマンジャロ山の標高は5,895m」「V60 の湯温は90〜93℃」といった事実そのものは著作物ではないため、利用に制限はありません(著作権法第10条第2項および創作性の要件)。
- **表現は転載していません。** 各資料の文章表現・構成・図表は一切利用していないため、翻案権・複製権の問題は生じません。
- **Wikipedia (CC BY-SA) について。** 出典に Wikipedia を含みますが、本文を利用していないため CC BY-SA の継承(ShareAlike)義務は発生しません。事実確認にのみ使用しています。
- **画像・ロゴは使用していません。** 外部リソースの読み込みもありません。

出典の明記は、法的な義務としてではなく、数値の根拠を読者が検証できるようにするために行っています。

### ライセンス

本リポジトリは [MIT License](LICENSE) です(コード・文章とも)。

依存パッケージのライセンスは以下の通りで、いずれも MIT と併用できます。

| パッケージ | ライセンス |
| --- | --- |
| `elm/core`, `elm/browser`, `elm/html` ほか `elm/*` | BSD-3-Clause |
| `elm-explorations/test` | BSD-3-Clause |

### 注意

産地の標高やレシピの数値は一般に紹介されている目安で、農園やロット、焙煎度によって最適値は変わります。出発点として扱ってください。
