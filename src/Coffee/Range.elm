module Coffee.Range exposing (Range, Unit(..), at, between, format, high, low)

{-| 単位付きの数値レンジ。

標高や湯温のような「下限〜上限 + 単位」を、表示のたびに文字列で組み立てると
単位の付け忘れや桁区切りの揺れが起きる。ここで不透明型として持ち、
生成時に下限・上限を正規化し、表示は `format` に一本化する。

@docs Range, Unit, at, between, format, high, low

-}


{-| 不透明型。構築は [`at`](#at) と [`between`](#between) 経由のみ。
-}
type Range
    = Range
        { low : Int
        , high : Int
        , unit : Unit
        }


{-| 扱う単位。ここに無い単位は数値レンジとして持たない。
-}
type Unit
    = Meters
    | Celsius
    | Minutes
    | Seconds


{-| 幅のあるレンジ。引数の順序が逆でも小さい方が下限になる。
-}
between : Unit -> Int -> Int -> Range
between unit a b =
    Range { low = min a b, high = max a b, unit = unit }


{-| 単一の値。表示では幅のあるレンジと区別される。
-}
at : Unit -> Int -> Range
at unit value =
    Range { low = value, high = value, unit = unit }


{-| 下限。
-}
low : Range -> Int
low (Range range) =
    range.low


{-| 上限。
-}
high : Range -> Int
high (Range range) =
    range.high


{-| 表示用文字列。単位は末尾に一度だけ付く(例: `1,800〜2,200m`)。
-}
format : Range -> String
format (Range range) =
    if range.low == range.high then
        formatInt range.low ++ suffix range.unit

    else
        formatInt range.low ++ "〜" ++ formatInt range.high ++ suffix range.unit


suffix : Unit -> String
suffix unit =
    case unit of
        Meters ->
            "m"

        Celsius ->
            "℃"

        Minutes ->
            "分"

        Seconds ->
            "秒"


formatInt : Int -> String
formatInt value =
    let
        grouped =
            groupDigits (String.fromInt (abs value))
    in
    if value < 0 then
        "-" ++ grouped

    else
        grouped


groupDigits : String -> String
groupDigits digits =
    digits
        |> String.reverse
        |> chunksOfThree
        |> String.join ","
        |> String.reverse


chunksOfThree : String -> List String
chunksOfThree text =
    if String.length text <= 3 then
        [ text ]

    else
        String.left 3 text :: chunksOfThree (String.dropLeft 3 text)
