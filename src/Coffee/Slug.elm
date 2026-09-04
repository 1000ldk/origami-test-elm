module Coffee.Slug exposing (Slug, fromString, toString)

{-| HTML の `id` や URL フラグメントに使える識別子。

不透明型にしたうえで構築子を全域関数にしてあるので、「不正な slug」という状態は
作れない。入力は正規化され、ASCII 英数字とハイフンだけが残る。

日本語のみの文字列はすべて落ちて `item` になるため、一意性そのものは保証されない。
重複の検出は [`Coffee.Validation`](Coffee-Validation) の役目。

@docs Slug, fromString, toString

-}


{-| 不透明型。構築は [`fromString`](#fromString) 経由のみ。
-}
type Slug
    = Slug String


{-| 任意の文字列を slug に正規化する。

  - 大文字は小文字に
  - ASCII 英数字以外はハイフンに
  - 連続・前後のハイフンは畳む
  - 空になった場合は `item`

-}
fromString : String -> Slug
fromString raw =
    let
        normalized =
            raw
                |> String.toLower
                |> String.map keepOrReplace
                |> collapseSeparators
    in
    if String.isEmpty normalized then
        Slug fallback

    else
        Slug normalized


{-| 文字列として取り出す。
-}
toString : Slug -> String
toString (Slug value) =
    value


fallback : String
fallback =
    "item"


keepOrReplace : Char -> Char
keepOrReplace char =
    if Char.isAlpha char || Char.isDigit char then
        char

    else
        '-'


collapseSeparators : String -> String
collapseSeparators text =
    text
        |> String.split "-"
        |> List.filter (not << String.isEmpty)
        |> String.join "-"
