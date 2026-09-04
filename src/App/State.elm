module App.State exposing (Model, Msg(..), init, update, visibleItems, matchCount)

{-| アプリの状態と、そこから引ける値。

ビューは `Model` のフィールドを直接読まず、[`visibleItems`](#visibleItems) と
[`matchCount`](#matchCount) を通す。絞り込みの定義が1箇所に留まる。

@docs Model, Msg, init, update, visibleItems, matchCount

-}

import Coffee.Catalog as Catalog
import Coffee.Category as Category exposing (Category)
import Coffee.Item exposing (Item)


{-| 開いている章と、絞り込みのクエリ。
-}
type alias Model =
    { active : Category
    , query : String
    }


{-| 利用者の操作。
-}
type Msg
    = SelectCategory Category
    | SetQuery String
    | ClearQuery


{-| 初期状態。
-}
init : Model
init =
    { active = Category.Varieties
    , query = ""
    }


{-| 状態遷移。
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectCategory category ->
            { model | active = category }

        SetQuery query ->
            { model | query = query }

        ClearQuery ->
            { model | query = "" }


{-| いま表示すべき項目。
-}
visibleItems : Model -> List Item
visibleItems model =
    Catalog.matching model.query model.active


{-| 章ごとの該当件数。絞り込んでいないときは `Nothing`(タブに数字を出さない)。
-}
matchCount : Model -> Category -> Maybe Int
matchCount model category =
    if String.isEmpty (String.trim model.query) then
        Nothing

    else
        Just (List.length (Catalog.matching model.query category))
