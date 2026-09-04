module Coffee.Category exposing (Category(..), all, intro, label, slug)

{-| サイトの章立て。

タブの並び順、見出し、導入文、アンカー名をここに集約する。カテゴリを追加すると
[`all`](#all) 以外はコンパイラが網羅性で漏れを指摘してくれる。

@docs Category, all, intro, label, slug

-}

import Coffee.Slug as Slug exposing (Slug)


{-| 章。
-}
type Category
    = Varieties
    | Origins
    | Processing
    | Roasts
    | BrewMethods
    | Pairings


{-| 表示順。新しい章を足したらここにも並べる。
-}
all : List Category
all =
    [ Varieties, Origins, Processing, Roasts, BrewMethods, Pairings ]


{-| タブに出る短い名前。
-}
label : Category -> String
label category =
    case category of
        Varieties ->
            "品種"

        Origins ->
            "産地と山"

        Processing ->
            "精製方法"

        Roasts ->
            "焙煎度"

        BrewMethods ->
            "抽出方法"

        Pairings ->
            "豆別の淹れ方"


{-| カード一覧の前に置く導入文。
-}
intro : Category -> String
intro category =
    case category of
        Varieties ->
            "3大原種と、スペシャルティコーヒーでよく名前を見る栽培品種。品種は「そのカップにどんな香りが出うるか」の上限を決める。"

        Origins ->
            "スペシャルティコーヒーは、ほぼ例外なく山で採れる。火山や高地の寒暖差が実の成熟をゆっくりにし、糖と酸を凝縮させるため。産地は山の名前とセットで覚えると味の想像がつく。"

        Processing ->
            "収穫した実から種子(豆)を取り出す工程。同じ農園・同じ品種でも、精製方法が変わればカップの印象は大きく変わる。"

        Roasts ->
            "焙煎が進むほど酸味は減り、苦みとコクが増す。産地の個性を見たいなら浅く、コクや甘い余韻を見たいなら深く。"

        BrewMethods ->
            "数値は1杯分の出発点。濃すぎれば粗く挽くか湯温を下げ、薄い・酸っぱいと感じたら細かく挽くか湯温を上げる、が基本の調整方向。"

        Pairings ->
            "豆の性格と抽出器具の相性。ざっくり言えば「フレーバーを見たい豆は紙で速く、コクを見たい豆は金属で長く」。"


{-| アンカーや要素 id に使う識別子。
-}
slug : Category -> Slug
slug category =
    Slug.fromString (rawSlug category)


rawSlug : Category -> String
rawSlug category =
    case category of
        Varieties ->
            "varieties"

        Origins ->
            "origins"

        Processing ->
            "processing"

        Roasts ->
            "roasts"

        BrewMethods ->
            "brew-methods"

        Pairings ->
            "pairings"
