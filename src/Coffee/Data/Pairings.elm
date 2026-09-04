module Coffee.Data.Pairings exposing (items)

{-| 豆の性格と抽出器具の相性。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| どの豆をどう淹れるか。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "light-african"
        , name = "浅煎りのアフリカ系"
        , subtitle = "エチオピア・ケニア・ルワンダ"
        , description = "花や果実の香りが主役。油分でこもらせず、高温で手早く抽出して香りを立たせたい。紙フィルターのクリアさが最も活きる組み合わせで、フレンチプレスに入れると濁って印象がぼやけやすい。"
        , facts =
            [ Fact.recommended "ペーパードリップ(V60)"
            , Fact.waterTemp 93 96
            , Fact.alternative "エアロプレス(短時間)"
            , Fact.avoid "低い湯温・深煎り前提の器具"
            ]
        }
    , Item.fromFields
        { id = "premium-light"
        , name = "ゲイシャなど高価な浅煎り"
        , subtitle = "パナマ・エチオピア原種系"
        , description = "香りが飛びやすいので、飲む直前に挽き、湯温は高めで短時間。粉量を欲張らず薄めに取ると、かえって香りの層がよく見える。まずはブラックで、温度が下がる過程の変化も楽しみたい。"
        , facts =
            [ Fact.recommended "ペーパードリップ"
            , Fact.waterTemp 93 95
            , Fact.ratio "1:16(やや薄め)"
            , Fact.tip "淹れる直前に挽く / 温め直さない"
            ]
        }
    , Item.fromFields
        { id = "medium-latin"
        , name = "中煎りの中南米系"
        , subtitle = "コロンビア・グアテマラ・コスタリカ"
        , description = "酸・甘み・コクのバランス型で、器具を選ばず失敗しにくい。毎日飲む1杯としてドリップが基本だが、エアロプレスにすると甘さが凝縮して別の顔を見せる。ミルクを少量足しても輪郭が残る。"
        , facts =
            [ Fact.recommended "ペーパードリップ"
            , Fact.waterTemp 90 93
            , Fact.ratio "1:15"
            , Fact.alternative "エアロプレス / サイフォン"
            ]
        }
    , Item.fromFields
        { id = "dark-body"
        , name = "深煎りのブラジル・マンデリン"
        , subtitle = "コクと苦みを楽しむ豆"
        , description = "成分が溶け出しやすいので、湯温を下げて粗めに挽かないと焦げた苦みが立つ。オイルごと味わうフレンチプレスやネルドリップが向く。アイスコーヒーやカフェオレのベースにも強い。"
        , facts =
            [ Fact.recommended "フレンチプレス"
            , Fact.waterTemp 88 92
            , Fact.alternative "ネルドリップ / 水出し"
            , Fact.tip "湯温を下げる / 粗めに挽く"
            ]
        }
    , Item.fromFields
        { id = "espresso-blend"
        , name = "エスプレッソ用ブレンド"
        , subtitle = "深煎り + 少量のロブスタ"
        , description = "高圧で短時間に抽出するため、単一の浅煎りだとチャンネリング(湯道)や強い酸が出やすい。深煎りをベースにブラジルの甘さやロブスタのクレマを足す構成が安定する。"
        , facts =
            [ Fact.recommended "エスプレッソマシン(1:2 / 25〜30秒)"
            , Fact.alternative "モカポット"
            , Fact.tip "焙煎後7〜14日ほど寝かせてガスを抜く"
            ]
        }
    , Item.fromFields
        { id = "iced"
        , name = "アイス・作り置き"
        , subtitle = "夏場の定番"
        , description = "氷で薄まる分、通常より濃く取るのが基本。急冷なら深煎りをドリップし、湯量の一部を氷に置き換えて一気に冷やすと香りが残る。時間があるなら水出しで、苦みの少ないまろやかな液体にする。"
        , facts =
            [ Fact.recommended "急冷式(深煎り・粉量1.5倍・氷に直接落とす)"
            , Fact.alternative "水出し(粗挽き 1:8〜1:10 / 冷蔵8〜16時間)"
            , Fact.note "保存" "冷蔵で2〜3日以内に飲み切る"
            ]
        }
    ]
