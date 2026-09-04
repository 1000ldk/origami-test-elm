module Coffee.Data.Origins exposing (items)

{-| 産地のデータ。

スペシャルティコーヒーの産地は山とほぼ一対一なので、山(または地形)と標高を
必ず持たせている。

@docs items

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)


{-| 世界の主要なスペシャルティ産地。
-}
items : List Item
items =
    [ Item.fromFields
        { id = "yirgacheffe"
        , name = "エチオピア イルガチェフェ"
        , subtitle = "コーヒー発祥の地の最高地帯"
        , description = "エチオピア高原の中でも特に標高が高い産地。ジャスミンやベルガモットを思わせる花の香り、レモンの酸味、紅茶のような軽やかなボディが特徴で、浅煎りの魅力が最も分かりやすい産地のひとつ。"
        , facts =
            [ Fact.terrain "エチオピア高原(グレートリフトバレー東縁)"
            , Fact.altitude 1800 2200
            , Fact.flavor [ "ジャスミン", "レモン", "紅茶" ]
            , Fact.pairing "浅煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "nyeri"
        , name = "ケニア ニエリ"
        , subtitle = "赤い火山性土壌の高地"
        , description = "ケニア山の南斜面に広がる産地。水洗式の丁寧な精製とSL28種により、カシスやグレープフルーツのような強い果実味とワインのような酸が生まれる。"
        , facts =
            [ Fact.summit "ケニア山南麓" 5199
            , Fact.altitude 1700 2000
            , Fact.flavor [ "カシス", "グレープフルーツ", "黒糖" ]
            , Fact.pairing "浅〜中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "kilimanjaro"
        , name = "タンザニア キリマンジャロ"
        , subtitle = "アフリカ最高峰の南斜面"
        , description = "キリマンジャロ山の麓、モシ周辺で栽培される。柑橘系の明るい酸としっかりしたコクを併せ持つ。日本では「キリマンジャロ」の名で古くから親しまれてきた。"
        , facts =
            [ Fact.summit "キリマンジャロ山" 5895
            , Fact.altitude 1400 1900
            , Fact.flavor [ "オレンジ", "黒すぐり", "ナッツ" ]
            , Fact.pairing "中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "huila"
        , name = "コロンビア ウイラ"
        , subtitle = "アンデスの峡谷に散る小農家"
        , description = "マグダレナ川上流の峡谷に小規模生産者が点在する高地産地。しっかりした酸味と甘み、コクのバランスが良く、クセが少なくどんな飲み方にも合う。年2回の収穫期があり通年で新しいロットが出回る。"
        , facts =
            [ Fact.mountain "アンデス山脈(セントラル/オリエンタル山系)"
            , Fact.altitude 1500 2000
            , Fact.flavor [ "赤リンゴ", "キャラメル", "柑橘" ]
            , Fact.pairing "中煎り" "ドリップ / エアロプレス"
            ]
        }
    , Item.fromFields
        { id = "antigua"
        , name = "グアテマラ アンティグア"
        , subtitle = "3つの火山に囲まれた盆地"
        , description = "アグア・フエゴ・アカテナンゴの3火山に囲まれた盆地。火山灰土壌とシェードツリー(日陰樹)栽培により、スモーキーな香りとチョコレートのような甘い余韻が生まれる。"
        , facts =
            [ Fact.mountain "アグア火山・フエゴ火山・アカテナンゴ火山"
            , Fact.altitude 1500 1700
            , Fact.flavor [ "ダークチョコ", "オレンジピール", "スモーク" ]
            , Fact.pairing "中〜中深煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "huehuetenango"
        , name = "グアテマラ ウエウエテナンゴ"
        , subtitle = "中米で最も高い非火山性産地"
        , description = "メキシコから吹き込む乾いた熱風が霜を防ぐため、極端な高地でも栽培できる。りんごや柑橘の明るい酸が際立つ。"
        , facts =
            [ Fact.mountain "クチュマタネス山脈"
            , Fact.altitude 1500 2000
            , Fact.flavor [ "青リンゴ", "ライム", "ハチミツ" ]
            , Fact.pairing "浅〜中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "tarrazu"
        , name = "コスタリカ タラス"
        , subtitle = "マイクロミルの先進地"
        , description = "首都サンホセ南方の高地。小規模精製所(マイクロミル)が発達し、ハニープロセスの先進地として知られる。クリーンで明るく、サトウキビのような甘さが出る。"
        , facts =
            [ Fact.mountain "タラマンカ山脈"
            , Fact.altitude 1400 1900
            , Fact.flavor [ "ミルクチョコ", "柑橘", "サトウキビ" ]
            , Fact.pairing "中煎り" "ドリップ / エアロプレス"
            ]
        }
    , Item.fromFields
        { id = "boquete"
        , name = "パナマ ボケテ"
        , subtitle = "ゲイシャの名声を決めた斜面"
        , description = "パナマ最高峰バル火山の東斜面。太平洋とカリブ海の気流がぶつかって生じる霧(バハレケ)が日差しを和らげ、実の成熟を遅らせる。"
        , facts =
            [ Fact.summit "バル火山" 3475
            , Fact.altitude 1400 2000
            , Fact.flavor [ "ジャスミン", "白桃", "ベルガモット" ]
            , Fact.pairing "浅煎り" "ペーパードリップ(高温・短時間)"
            ]
        }
    , Item.fromFields
        { id = "cerrado-mineiro"
        , name = "ブラジル セラード・ミネイロ"
        , subtitle = "世界最大の生産国の中心地"
        , description = "なだらかな高原で機械収穫ができるため、安定した品質と量を供給できる。苦みと甘みが穏やかでナッツのような香ばしさがあり、ブレンドのベースに向く。"
        , facts =
            [ Fact.terrain "ブラジル高原(セラード台地)"
            , Fact.altitude 800 1300
            , Fact.flavor [ "ナッツ", "ミルクチョコ", "低い酸" ]
            , Fact.pairing "中〜深煎り" "フレンチプレス / エスプレッソ"
            ]
        }
    , Item.fromFields
        { id = "mandheling-gayo"
        , name = "インドネシア マンデリン(ガヨ高地)"
        , subtitle = "スマトラ式が生む重厚さ"
        , description = "スマトラ島北部アチェのガヨ高地が主産地。スマトラ式(ギリン・バサ)と呼ばれる独特の半水洗式により、酸味が抑えられ、土やハーブを思わせる香りと重厚なコクが生まれる。"
        , facts =
            [ Fact.mountain "バリサン山脈(トバ湖周辺・ガヨ高地)"
            , Fact.altitude 1100 1600
            , Fact.flavor [ "アーシー", "ハーブ", "ダークチョコ" ]
            , Fact.pairing "深煎り" "フレンチプレス / ネルドリップ"
            ]
        }
    , Item.fromFields
        { id = "blue-mountain"
        , name = "ジャマイカ ブルーマウンテン"
        , subtitle = "法律で守られた銘柄"
        , description = "指定地域で採れたものだけが名乗れる管理された銘柄。強い個性で押すというより、酸・苦み・甘みのどれも突出しない滑らかなバランスが評価されている。樽詰めで出荷される点でも独特。"
        , facts =
            [ Fact.summit "ブルーマウンテン山脈" 2256
            , Fact.altitude 800 1500
            , Fact.cup [ "穏やかな酸", "上品な甘み", "低い苦み" ]
            , Fact.pairing "中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "kona"
        , name = "ハワイ コナ"
        , subtitle = "午後に雲が湧く火山斜面"
        , description = "ハワイ島西岸の狭い区画のみで栽培される。午後に雲が日差しを遮る「フリーシェード」の気候が特徴で、標高が低いわりに穏やかで甘い風味に仕上がる。"
        , facts =
            [ Fact.summit "フアラライ山" 2521
            , Fact.summit "マウナロア山" 4169
            , Fact.altitude 250 800
            , Fact.flavor [ "ナッツ", "バター", "柔らかい酸" ]
            , Fact.pairing "中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "rwanda-burundi"
        , name = "ルワンダ / ブルンジ"
        , subtitle = "千の丘の国"
        , description = "赤道直下の高原に無数の丘が連なる地形。ブルボン系品種の水洗式が主流で、紅茶やオレンジ、フローラルな香りが出る。近年スペシャルティ市場での評価が急上昇している産地。"
        , facts =
            [ Fact.terrain "中央アフリカ高地(ヴィルンガ山地周辺)"
            , Fact.altitude 1600 2000
            , Fact.flavor [ "紅茶", "オレンジ", "花" ]
            , Fact.pairing "浅〜中煎り" "ペーパードリップ"
            ]
        }
    , Item.fromFields
        { id = "mokha-mattari"
        , name = "イエメン モカ・マタリ"
        , subtitle = "世界最古の商業コーヒー産地"
        , description = "灌漑のない急斜面の段々畑で栽培され、天日乾燥のナチュラル精製が伝統。チョコレートとスパイス、熟した果実が混ざる濃厚で野性的な風味を持つ。"
        , facts =
            [ Fact.mountain "ハラズ山地・バニーマタル地区"
            , Fact.altitude 1500 2400
            , Fact.flavor [ "チョコ", "ドライフルーツ", "スパイス" ]
            , Fact.pairing "中〜中深煎り" "ネルドリップ / フレンチプレス"
            ]
        }
    ]
