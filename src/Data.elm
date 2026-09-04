module Data exposing (Category(..), Item, categories, categoryLabel, itemsFor)


type Category
    = Varieties
    | Origins
    | RoastLevels
    | BrewMethods


type alias Item =
    { name : String
    , subtitle : String
    , description : String
    }


categories : List Category
categories =
    [ Varieties, Origins, RoastLevels, BrewMethods ]


categoryLabel : Category -> String
categoryLabel category =
    case category of
        Varieties ->
            "品種"

        Origins ->
            "産地"

        RoastLevels ->
            "焙煎度"

        BrewMethods ->
            "抽出方法"


itemsFor : Category -> List Item
itemsFor category =
    case category of
        Varieties ->
            varieties

        Origins ->
            origins

        RoastLevels ->
            roastLevels

        BrewMethods ->
            brewMethods


varieties : List Item
varieties =
    [ { name = "アラビカ種"
      , subtitle = "世界生産量の6割以上"
      , description = "香り高く酸味と甘みのバランスが良い。標高の高い涼しい産地で栽培され、病害に弱く手間がかかる分、ストレートコーヒーの主役になることが多い。"
      }
    , { name = "ロブスタ種"
      , subtitle = "カフェイン量はアラビカの約2倍"
      , description = "苦みが強く、低地や高温多湿でも育つ丈夫な品種。コクを出すためのブレンドやインスタントコーヒー、エスプレッソのクレマ作りに使われる。"
      }
    , { name = "リベリカ種"
      , subtitle = "流通量は全体の1%未満"
      , description = "西アフリカ原産の希少品種。実が大きく独特のスモーキーな香りを持つが、収量が少なく市場にはほとんど出回らない。"
      }
    ]


origins : List Item
origins =
    [ { name = "エチオピア"
      , subtitle = "コーヒー発祥の地"
      , description = "モカに代表される華やかな香りとフルーティな酸味。ゲイシャ種のルーツとしても知られる。"
      }
    , { name = "コロンビア"
      , subtitle = "山岳地帯で育つ丁寧な栽培"
      , description = "しっかりとした酸味と甘み、コクのバランスが良く、クセが少なくどんな飲み方にも合う。"
      }
    , { name = "ブラジル"
      , subtitle = "世界最大の生産国"
      , description = "苦みと甘みが穏やかでナッツのような香ばしさ。ブレンドのベースとして使われることが多い。"
      }
    , { name = "グアテマラ"
      , subtitle = "火山性の土壌"
      , description = "スモーキーな香りとしっかりした酸味、チョコレートのような後味が特徴。"
      }
    , { name = "インドネシア(マンデリン)"
      , subtitle = "低酸味・重厚なコク"
      , description = "酸味が少なく、土っぽさやハーブのような独特の香りと強いコクを持つ。"
      }
    , { name = "ケニア"
      , subtitle = "ワインのような酸味"
      , description = "ベリー系のフルーティな酸味と力強い風味。水洗式の丁寧な精製で知られる。"
      }
    ]


roastLevels : List Item
roastLevels =
    [ { name = "ライトロースト"
      , subtitle = "浅煎り"
      , description = "酸味が際立ち、豆本来の産地の風味が分かりやすい。香りは軽やかで紅茶のような飲み口。"
      }
    , { name = "ミディアムロースト"
      , subtitle = "中煎り"
      , description = "酸味と苦みのバランスが良く、日本で最も一般的な焙煎度。レギュラーコーヒーの定番。"
      }
    , { name = "ハイロースト〜シティロースト"
      , subtitle = "中深煎り"
      , description = "苦みとコクが増し、香ばしさが引き立つ。ブレンドやドリップに幅広く使われる。"
      }
    , { name = "フレンチ〜イタリアンロースト"
      , subtitle = "深煎り"
      , description = "強い苦みと重厚なコクが特徴。酸味はほとんど感じられず、エスプレッソやアイスコーヒー向き。"
      }
    ]


brewMethods : List Item
brewMethods =
    [ { name = "ペーパードリップ"
      , subtitle = "家庭で最も一般的"
      , description = "紙フィルターで雑味を抑え、すっきりとした後味に仕上がる。豆の個性を素直に楽しめる。"
      }
    , { name = "フレンチプレス"
      , subtitle = "金属フィルターで抽出"
      , description = "コーヒーオイルまで抽出するため、コクのある濃厚な味わいになる。豆本来の風味を丸ごと楽しみたい人向け。"
      }
    , { name = "エスプレッソ"
      , subtitle = "高圧・短時間抽出"
      , description = "深煎りの豆を細かく挽き、高圧で一気に抽出。濃厚でクレマ(泡)が特徴、ラテなどの base にもなる。"
      }
    , { name = "コールドブリュー"
      , subtitle = "水出し・低温長時間抽出"
      , description = "8時間以上かけて水でじっくり抽出するため、酸味と苦みが穏やかでまろやかな味わいになる。"
      }
    , { name = "サイフォン"
      , subtitle = "蒸気圧を利用した抽出"
      , description = "見た目も楽しい抽出方法で、香り高くクリアな味わいに仕上がる。"
      }
    ]
