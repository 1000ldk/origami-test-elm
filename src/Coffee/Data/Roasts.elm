module Coffee.Data.Roasts exposing (items)

{-| 焙煎度のデータ。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| 浅煎りから深煎りまで。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "light-roast"
        , name = "ライトロースト"
        , subtitle = "浅煎り"
        , description = "酸味が際立ち、豆本来の産地の風味が分かりやすい。香りは軽やかで紅茶のような飲み口。豆の密度が高く成分が溶け出しにくいので、細めに挽いて高めの湯温で淹れるのがコツ。"
        , facts =
            [ Fact.note "豆の色" "シナモン色・表面は乾いている"
            , Fact.note "向く豆" "エチオピア・ケニア・ゲイシャ"
            , Fact.waterTemp 93 96
            , Fact.recommended "ペーパードリップ / エアロプレス"
            ]
        }
    , Item.fromFields
        { id = "medium-roast"
        , name = "ミディアムロースト"
        , subtitle = "中煎り"
        , description = "酸味と苦みのバランスが良く、日本で最も一般的な焙煎度。産地の個性を残しつつ飲みやすく、レギュラーコーヒーの定番。最初の1袋に迷ったらここ。"
        , facts =
            [ Fact.note "豆の色" "栗色・表面は乾いている"
            , Fact.note "向く豆" "コロンビア・グアテマラ・コスタリカ"
            , Fact.waterTemp 90 93
            , Fact.recommended "ペーパードリップ全般"
            ]
        }
    , Item.fromFields
        { id = "city-roast"
        , name = "ハイロースト〜シティロースト"
        , subtitle = "中深煎り"
        , description = "苦みとコクが増し、香ばしさが引き立つ。カフェオレやミルクと合わせても負けない。ブレンドやドリップに幅広く使われる、喫茶店の王道といえる焙煎度。"
        , facts =
            [ Fact.note "豆の色" "濃い茶色・うっすら油が浮き始める"
            , Fact.note "向く豆" "ブラジル・マンデリン・グアテマラ"
            , Fact.waterTemp 88 92
            , Fact.recommended "ドリップ / フレンチプレス"
            ]
        }
    , Item.fromFields
        { id = "french-roast"
        , name = "フレンチ〜イタリアンロースト"
        , subtitle = "深煎り"
        , description = "強い苦みと重厚なコクが特徴。酸味はほとんど感じられず、エスプレッソやアイスコーヒー向き。成分が溶け出しやすいので、湯温を下げないと焦げた苦みだけが出やすい。"
        , facts =
            [ Fact.note "豆の色" "黒褐色・表面に油が浮く"
            , Fact.note "向く豆" "ブラジル・マンデリン・ブレンド"
            , Fact.waterTemp 83 88
            , Fact.recommended "エスプレッソ / フレンチプレス / 水出し"
            ]
        }
    ]
