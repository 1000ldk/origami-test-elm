module Coffee.Catalog exposing (allItems, itemsFor, matching, size)

{-| データモジュールを束ねる唯一の入口。

ビューも検証もここを通すので、章を増やしたときの配線は
[`itemsFor`](#itemsFor) の1箇所だけで済む。

@docs allItems, itemsFor, matching, size

-}

import Coffee.Category as Category exposing (Category(..))
import Coffee.Data.BrewMethods
import Coffee.Data.Origins
import Coffee.Data.Pairings
import Coffee.Data.Processing
import Coffee.Data.Roasts
import Coffee.Data.Varieties
import Coffee.Item as Item exposing (Item)


{-| 章に属する項目。
-}
itemsFor : Category -> List Item
itemsFor category =
    case category of
        Varieties ->
            Coffee.Data.Varieties.items

        Origins ->
            Coffee.Data.Origins.items

        Processing ->
            Coffee.Data.Processing.items

        Roasts ->
            Coffee.Data.Roasts.items

        BrewMethods ->
            Coffee.Data.BrewMethods.items

        Pairings ->
            Coffee.Data.Pairings.items


{-| 全章の項目を表示順に並べたもの。
-}
allItems : List Item
allItems =
    List.concatMap itemsFor Category.all


{-| 章の中をクエリで絞り込む。空のクエリでは何も落とさない。
-}
matching : String -> Category -> List Item
matching query category =
    List.filter (Item.matches query) (itemsFor category)


{-| 全項目数。
-}
size : Int
size =
    List.length allItems
