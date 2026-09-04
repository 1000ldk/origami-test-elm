module View.Tabs exposing (Config, view)

{-| 章の切り替えタブ。

@docs Config, view

-}

import Coffee.Category as Category exposing (Category)
import Coffee.Slug as Slug
import Html exposing (Html, button, nav, span, text)
import Html.Attributes exposing (class, classList, id)
import Html.Events exposing (onClick)


{-| 表示に必要なもの。`count` が `Nothing` を返す章にはバッジを出さない。
-}
type alias Config msg =
    { active : Category
    , count : Category -> Maybe Int
    , onSelect : Category -> msg
    }


{-| タブ列を描画する。
-}
view : Config msg -> Html msg
view config =
    nav [ class "tabs" ] (List.map (tab config) Category.all)


tab : Config msg -> Category -> Html msg
tab config category =
    let
        count =
            config.count category
    in
    button
        [ id ("tab-" ++ Slug.toString (Category.slug category))
        , classList
            [ ( "tab", True )
            , ( "tab--active", category == config.active )
            , ( "tab--empty", count == Just 0 )
            ]
        , onClick (config.onSelect category)
        ]
        (text (Category.label category) :: badge count)


badge : Maybe Int -> List (Html msg)
badge count =
    case count of
        Nothing ->
            []

        Just value ->
            [ span [ class "tab__badge" ] [ text (String.fromInt value) ] ]
