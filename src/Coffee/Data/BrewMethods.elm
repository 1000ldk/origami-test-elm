module Coffee.Data.BrewMethods exposing (items)

{-| 抽出方法のデータ。

挽き目・湯温・比率・抽出時間の4点を必ず持たせている。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| 器具ごとの抽出レシピ。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "paper-drip"
        , name = "ペーパードリップ"
        , subtitle = "家庭で最も一般的"
        , description = "紙フィルターが油分と微粉を吸うため、すっきりとクリアな後味に仕上がる。豆の個性を素直に映すので、産地ごとの違いを比べたいときの基準になる器具。円錐型(V60)は注ぎ方で味を変えやすく、台形型は安定しやすい。"
        , facts =
            [ Fact.grind "中細挽き(グラニュー糖くらい)"
            , Fact.waterTemp 90 93
            , Fact.ratio "1:15〜1:16(豆15g / 湯225〜240ml)"
            , Fact.brewTime "2分30秒〜3分30秒"
            , Fact.tip "浅煎りなら湯温を93〜96℃まで上げる"
            ]
        }
    , Item.fromFields
        { id = "french-press"
        , name = "フレンチプレス"
        , subtitle = "金属フィルターで浸漬抽出"
        , description = "粉を湯に漬け込み、金属メッシュで濾す。コーヒーオイルまで抽出するのでコクのある濃厚な味わいになる。淹れ手の技術による差が小さく、豆本来の風味を丸ごと確かめたいときに最適。"
        , facts =
            [ Fact.grind "粗挽き(ザラメくらい)"
            , Fact.waterTemp 92 96
            , Fact.ratio "1:15(豆30g / 湯450ml)"
            , Fact.brewTime "4分(その後プランジ)"
            ]
        }
    , Item.fromFields
        { id = "aeropress"
        , name = "エアロプレス"
        , subtitle = "空気圧で押し出す短時間抽出"
        , description = "注射器状の器具で、浸漬させた後に手圧で押し出す。1〜2分で濃くクリアな1杯ができ、湯量や時間の自由度が高い。パーツが少なく丈夫なので旅行や出張にも向く。"
        , facts =
            [ Fact.grind "中細挽き〜細挽き"
            , Fact.waterTemp 80 92
            , Fact.ratio "1:12〜1:15(豆15g / 湯200ml)"
            , Fact.brewTime "1分〜2分"
            , Fact.tip "浅煎りほど高温、深煎りほど低温にする"
            ]
        }
    , Item.fromFields
        { id = "espresso"
        , name = "エスプレッソ"
        , subtitle = "高圧・短時間抽出"
        , description = "極細挽きの粉に約9気圧をかけて一気に抽出する。濃厚な液体とクレマ(泡)が特徴で、ラテやカプチーノのベースになる。粉量・挽き目・抽出時間の3点で味を追い込む。"
        , facts =
            [ Fact.grind "極細挽き(小麦粉に近い)"
            , Fact.waterTemp 90 94
            , Fact.ratio "1:2(粉18g / 液体36g)"
            , Fact.brewTime "25〜30秒"
            ]
        }
    , Item.fromFields
        { id = "cold-brew"
        , name = "コールドブリュー(水出し)"
        , subtitle = "低温・長時間抽出"
        , description = "常温または冷水で8時間以上かけて抽出する。高温で出る苦み成分や酸が出にくく、まろやかで甘い液体になる。冷蔵庫で2〜3日保存でき、まとめて作り置きしやすい。"
        , facts =
            [ Fact.grind "粗挽き"
            , Fact.note "水温" "常温〜冷水"
            , Fact.ratio "1:8〜1:10(豆60g / 水500ml)"
            , Fact.brewTime "8〜16時間(冷蔵)"
            ]
        }
    , Item.fromFields
        { id = "siphon"
        , name = "サイフォン"
        , subtitle = "蒸気圧を利用した抽出"
        , description = "下部フラスコの湯を蒸気圧で上部に押し上げ、撹拌後に減圧で濾し戻す。高温を保ったまま短時間で抽出するため、香りが立ちクリアな味に仕上がる。見た目の楽しさも含めて喫茶店の定番。"
        , facts =
            [ Fact.grind "中細挽き"
            , Fact.note "湯温" "沸騰直下(約95℃前後を維持)"
            , Fact.ratio "1:14〜1:15"
            , Fact.brewTime "撹拌後およそ1分"
            ]
        }
    , Item.fromFields
        { id = "moka-pot"
        , name = "モカポット(直火式)"
        , subtitle = "イタリアの家庭用エスプレッソ"
        , description = "下部の水を沸かし、その蒸気圧(約1.5気圧)で粉を通して上部に押し上げる。エスプレッソほどの圧はかからないが、濃く力強い液体が取れる。"
        , facts =
            [ Fact.grind "細挽き(エスプレッソよりやや粗め)"
            , Fact.note "湯温" "沸騰(あらかじめ湯を入れると良い)"
            , Fact.ratio "バスケットに擦り切り一杯(押し固めない)"
            , Fact.brewTime "4〜5分(弱火)"
            , Fact.tip "弱火でゆっくり上げると焦げ臭が出にくい"
            ]
        }
    ]
