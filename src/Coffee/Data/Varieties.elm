module Coffee.Data.Varieties exposing (items)

{-| 品種のデータ。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| 3大原種と主な栽培品種。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "arabica"
        , name = "アラビカ種"
        , subtitle = "世界生産量の6割以上"
        , description = "香り高く酸味と甘みのバランスが良い。標高の高い涼しい産地で栽培され、病害に弱く手間がかかる分、ストレートコーヒーの主役になることが多い。スペシャルティコーヒーはほぼすべてこの種。"
        , facts =
            [ Fact.altitude 800 2200
            , Fact.note "カフェイン" "生豆重量の約1.2%"
            , Fact.note "弱点" "サビ病・高温に弱い"
            ]
        }
    , Item.fromFields
        { id = "robusta"
        , name = "ロブスタ種(カネフォラ)"
        , subtitle = "カフェイン量はアラビカの約2倍"
        , description = "苦みが強く、低地や高温多湿でも育つ丈夫な品種。コクを出すためのブレンドやインスタントコーヒー、エスプレッソのクレマ作りに使われる。近年は品質の高い「ファインロブスタ」も登場している。"
        , facts =
            [ Fact.altitude 0 800
            , Fact.note "カフェイン" "生豆重量の約2.2%"
            , Fact.note "得意" "クレマ・ボディ・耐病性"
            ]
        }
    , Item.fromFields
        { id = "liberica"
        , name = "リベリカ種"
        , subtitle = "流通量は全体の1%未満"
        , description = "西アフリカ原産の希少品種。実が大きく独特のスモーキーな香りを持つが、収量が少なく市場にはほとんど出回らない。マレーシアやフィリピンで細々と飲み継がれている。"
        , facts =
            [ Fact.producers [ "フィリピン", "マレーシア" ]
            , Fact.aroma [ "ジャックフルーツ様", "スモーキー" ]
            ]
        }
    , Item.fromFields
        { id = "typica"
        , name = "ティピカ"
        , subtitle = "すべての栽培品種の祖"
        , description = "エチオピアからイエメン経由で世界に広まった最も古い系統。収量は少ないが、透明感のある甘さと繊細な香りは今も基準とされる。ブルーマウンテンやコナはこの系統。"
        , facts =
            [ Fact.cup [ "クリーン", "穏やかな甘み" ]
            , Fact.producers [ "ジャマイカ", "ハワイ" ]
            ]
        }
    , Item.fromFields
        { id = "bourbon"
        , name = "ブルボン"
        , subtitle = "ティピカの突然変異"
        , description = "レユニオン島(旧ブルボン島)由来。ティピカより収量が多く、甘みとコクが強い。中南米の名産地の多くはブルボンとその派生種で成り立っている。"
        , facts =
            [ Fact.cup [ "しっかりした甘み", "キャラメル" ]
            , Fact.producers [ "グアテマラ", "エルサルバドル", "ルワンダ" ]
            ]
        }
    , Item.fromFields
        { id = "geisha"
        , name = "ゲイシャ(ゲシャ)"
        , subtitle = "スペシャルティ相場を塗り替えた品種"
        , description = "エチオピア西部のゲシャ地方が原産。パナマの農園がボケテで栽培して国際品評会を制し、一躍有名になった。ジャスミンやベルガモットのような強い花の香りと紅茶様のボディを持つ。"
        , facts =
            [ Fact.aroma [ "ジャスミン", "ベルガモット", "白桃" ]
            , Fact.pairing "浅煎り" "ペーパードリップ(高温・短時間)"
            , Fact.tip "香りを飛ばさないよう深く煎らない"
            ]
        }
    , Item.fromFields
        { id = "sl28-sl34"
        , name = "SL28 / SL34"
        , subtitle = "ケニアを代表する選抜品種"
        , description = "ケニアの研究所(Scott Laboratories)が選抜した品種。カシスやグレープフルーツを思わせる強い果実味と、ワインのような酸が出る。ケニア産の個性の大半はこの2品種による。"
        , facts =
            [ Fact.aroma [ "カシス", "トマト様の旨み" ]
            , Fact.pairing "浅〜中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "pacamara"
        , name = "パカマラ"
        , subtitle = "パカスとマラゴジッペの交配"
        , description = "エルサルバドルで生まれた大粒の品種。ハーブや柑橘の複雑な香りと厚みのある甘さを併せ持ち、中米の品評会で常連となっている。豆が大きく焙煎ムラが出やすい。"
        , facts =
            [ Fact.note "特徴" "豆が非常に大粒"
            , Fact.producers [ "エルサルバドル", "ホンジュラス" ]
            ]
        }
    ]
