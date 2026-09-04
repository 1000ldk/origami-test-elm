module Coffee.Data.Processing exposing (items)

{-| 精製方法のデータ。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| 収穫した実から生豆を取り出す方法。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "washed"
        , name = "ウォッシュド(水洗式)"
        , subtitle = "果肉を除いてから発酵・水洗"
        , description = "果肉除去後に発酵槽でミューシレージ(粘液質)を分解し、洗い流してから乾燥させる。豆本来の質と産地の個性がそのまま出るため、クリーンで輪郭のはっきりした味になる。"
        , facts =
            [ Fact.cup [ "クリーン", "酸が明瞭" ]
            , Fact.producers [ "コロンビア", "ケニア", "中米" ]
            ]
        }
    , Item.fromFields
        { id = "natural"
        , name = "ナチュラル(非水洗式)"
        , subtitle = "実のまま乾燥させる最古の方法"
        , description = "収穫した実を果肉ごと天日乾燥させてから脱穀する。果肉の糖が種子に移り、ベリーや熟した果実、発酵香のある甘い風味になる。"
        , facts =
            [ Fact.cup [ "果実感が強い", "甘い", "ボディ厚め" ]
            , Fact.producers [ "エチオピア", "イエメン", "ブラジル" ]
            ]
        }
    , Item.fromFields
        { id = "honey"
        , name = "ハニープロセス(パルプドナチュラル)"
        , subtitle = "粘液質を残して乾燥"
        , description = "果肉だけ取り除き、ぬめり(ミューシレージ)を残したまま乾燥させる中間的な方法。残す量でイエロー/レッド/ブラックと呼び分ける。ウォッシュドのクリアさとナチュラルの甘さの中間に着地する。"
        , facts =
            [ Fact.cup [ "甘みが強い", "バランス型" ]
            , Fact.producers [ "コスタリカ", "エルサルバドル" ]
            ]
        }
    , Item.fromFields
        { id = "giling-basah"
        , name = "スマトラ式(ギリン・バサ)"
        , subtitle = "半乾きで脱穀する独自製法"
        , description = "水分値が高い(30〜50%)段階で脱殻し、その後さらに乾燥させる。豆が青緑色になり、酸味が落ちて土っぽさと強いボディが出る。マンデリンの個性はこの精製方法によるところが大きい。"
        , facts =
            [ Fact.cup [ "低い酸", "重いボディ", "アーシー" ]
            , Fact.producers [ "インドネシア(スマトラ島)" ]
            ]
        }
    , Item.fromFields
        { id = "anaerobic"
        , name = "アナエロビック(嫌気性発酵)"
        , subtitle = "密閉タンクで酸素を断って発酵"
        , description = "実や豆を密閉容器に入れ、酸素のない状態で発酵させてから乾燥させる新しい手法。シナモンやラム酒、トロピカルフルーツのような独特で強い香りが生まれ、品評会や競技会で使われることが多い。"
        , facts =
            [ Fact.cup [ "強い発酵香", "個性的" ]
            , Fact.tip "浅めに焙煎しないと香りが潰れる"
            ]
        }
    ]
