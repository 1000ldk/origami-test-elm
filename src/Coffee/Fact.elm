module Coffee.Fact exposing
    ( Fact, Row
    , altitude, mountain, summit, terrain
    , aroma, cup, flavor, producers
    , brewTime, grind, ratio, waterTemp
    , alternative, avoid, pairing, recommended, tip
    , note
    , searchText, toRow
    )

{-| カードに並ぶ補足情報の一項目。

以前は `( String, String )` のタプルで、項目ごとに「フレーバー」「標高」といった
ラベルを手書きしていた。表記揺れがそのまま画面に出るうえ、標高の単位を書き忘れても
コンパイラは何も言わない。

そこで「どんな種類の事実か」を型にし、ラベルと整形は [`toRow`](#toRow) に集約した。
ラベルを変えたいときの変更箇所は常に一箇所になる。

@docs Fact, Row


# 産地

@docs altitude, mountain, summit, terrain


# 風味

@docs aroma, cup, flavor, producers


# 抽出パラメータ

@docs brewTime, grind, ratio, waterTemp


# おすすめ

@docs alternative, avoid, pairing, recommended, tip


# その他

@docs note


# 取り出し

@docs searchText, toRow

-}

import Coffee.Range as Range exposing (Range)


{-| 不透明型。構築はこのモジュールの構築子経由のみ。
-}
type Fact
    = Altitude Range
    | Mountain { name : String, summit : Maybe Int }
    | Terrain String
    | Flavor (List String)
    | Aroma (List String)
    | Cup (List String)
    | Producers (List String)
    | Pairing { roast : String, brew : String }
    | Grind String
    | WaterTemp Range
    | Ratio String
    | BrewTime String
    | Recommended String
    | Alternative String
    | Avoid String
    | Tip String
    | Note { label : String, value : String }


{-| 表示用に展開した「ラベル / 値」。ビューはこれだけを見る。
-}
type alias Row =
    { label : String
    , value : String
    }



-- 産地


{-| 栽培標高(メートル)。
-}
altitude : Int -> Int -> Fact
altitude lower upper =
    Altitude (Range.between Range.Meters lower upper)


{-| 山や山脈の名前。
-}
mountain : String -> Fact
mountain name =
    Mountain { name = name, summit = Nothing }


{-| 山の名前と標高(メートル)。標高は括弧付きで併記される。
-}
summit : String -> Int -> Fact
summit name peak =
    Mountain { name = name, summit = Just peak }


{-| 山と呼びにくい地形(高原、台地など)。
-}
terrain : String -> Fact
terrain description =
    Terrain description



-- 風味


{-| カップに出るフレーバー。中黒で連結される。
-}
flavor : List String -> Fact
flavor notes =
    Flavor notes


{-| 香りの印象。
-}
aroma : List String -> Fact
aroma notes =
    Aroma notes


{-| カップ全体の印象(酸・ボディなど)。
-}
cup : List String -> Fact
cup notes =
    Cup notes


{-| 主な産地。
-}
producers : List String -> Fact
producers names =
    Producers names



-- 抽出パラメータ


{-| 挽き目。
-}
grind : String -> Fact
grind description =
    Grind description


{-| 湯温(摂氏)。
-}
waterTemp : Int -> Int -> Fact
waterTemp lower upper =
    WaterTemp (Range.between Range.Celsius lower upper)


{-| 粉と湯の比率。
-}
ratio : String -> Fact
ratio description =
    Ratio description


{-| 抽出時間。
-}
brewTime : String -> Fact
brewTime description =
    BrewTime description



-- おすすめ


{-| 焙煎度と抽出器具の組み合わせ。
-}
pairing : String -> String -> Fact
pairing roast brew =
    Pairing { roast = roast, brew = brew }


{-| 第一候補の淹れ方。
-}
recommended : String -> Fact
recommended description =
    Recommended description


{-| 次点の淹れ方。
-}
alternative : String -> Fact
alternative description =
    Alternative description


{-| 避けたい組み合わせ。
-}
avoid : String -> Fact
avoid description =
    Avoid description


{-| 淹れるときのコツ。
-}
tip : String -> Fact
tip description =
    Tip description



-- その他


{-| 上のどれにも当てはまらない補足。ラベルを自前で持つ逃げ道なので、
同じラベルが繰り返し現れたら専用の構築子を足すサイン。
-}
note : String -> String -> Fact
note label value =
    Note { label = label, value = value }



-- 取り出し


{-| 表示用の行に展開する。ラベルの文言はここだけで決まる。
-}
toRow : Fact -> Row
toRow fact =
    case fact of
        Altitude range ->
            Row "標高" (Range.format range)

        Mountain peak ->
            Row "山・山脈" (peak.name ++ summitSuffix peak.summit)

        Terrain description ->
            Row "地形" description

        Flavor notes ->
            Row "フレーバー" (joinNotes notes)

        Aroma notes ->
            Row "香り" (joinNotes notes)

        Cup notes ->
            Row "カップ" (joinNotes notes)

        Producers names ->
            Row "主な産地" (joinNotes names)

        Pairing choice ->
            Row "おすすめ" (choice.roast ++ " × " ++ choice.brew)

        Grind description ->
            Row "挽き目" description

        WaterTemp range ->
            Row "湯温" (Range.format range)

        Ratio description ->
            Row "比率" description

        BrewTime description ->
            Row "抽出時間" description

        Recommended description ->
            Row "第一候補" description

        Alternative description ->
            Row "次点" description

        Avoid description ->
            Row "避けたい" description

        Tip description ->
            Row "コツ" description

        Note custom ->
            Row custom.label custom.value


{-| 検索対象にする文字列。ラベルも値も引っかかる。
-}
searchText : Fact -> String
searchText fact =
    let
        row =
            toRow fact
    in
    row.label ++ " " ++ row.value


summitSuffix : Maybe Int -> String
summitSuffix peak =
    case peak of
        Nothing ->
            ""

        Just meters ->
            "(" ++ Range.format (Range.at Range.Meters meters) ++ ")"


joinNotes : List String -> String
joinNotes notes =
    String.join "・" notes
