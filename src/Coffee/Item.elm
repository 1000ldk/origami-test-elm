module Coffee.Item exposing (Item, Fields, fromFields, matches, rows, searchText)

{-| カード1枚分のデータ。

`id` は生成時に [`Coffee.Slug`](Coffee-Slug) へ通されるので、アンカーとして
そのまま使える形であることが型で保証される。

@docs Item, Fields, fromFields, matches, rows, searchText

-}

import Coffee.Fact as Fact exposing (Fact)
import Coffee.Slug as Slug exposing (Slug)


{-| 正規化済みの項目。
-}
type alias Item =
    { id : Slug
    , name : String
    , subtitle : String
    , description : String
    , facts : List Fact
    }


{-| データモジュールが書く生の形。`id` は素の文字列で渡す。
-}
type alias Fields =
    { id : String
    , name : String
    , subtitle : String
    , description : String
    , facts : List Fact
    }


{-| 生の形から項目を作る。ここが唯一の入口。
-}
fromFields : Fields -> Item
fromFields fields =
    { id = Slug.fromString fields.id
    , name = fields.name
    , subtitle = fields.subtitle
    , description = fields.description
    , facts = fields.facts
    }


{-| 表示用の行。
-}
rows : Item -> List Fact.Row
rows item =
    List.map Fact.toRow item.facts


{-| 検索対象の文字列。名前・副題・本文に加えて、事実のラベルと値も含む。
`1:15` や `火山` のような、本文には出てこない語で引けるようにするため。
-}
searchText : Item -> String
searchText item =
    String.join " "
        (item.name
            :: item.subtitle
            :: item.description
            :: List.map Fact.searchText item.facts
        )


{-| クエリに一致するか。空のクエリはすべてに一致する。
-}
matches : String -> Item -> Bool
matches query item =
    let
        needle =
            String.toLower (String.trim query)
    in
    if String.isEmpty needle then
        True

    else
        String.contains needle (String.toLower (searchText item))
