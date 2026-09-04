module View.SearchBox exposing (Config, view)

{-| 絞り込み用の入力欄。

本文だけでなく事実の値も検索対象なので、`火山` や `1:15` のような語で引ける。

@docs Config, view

-}

import Html exposing (Html, button, div, input, p, text)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)


{-| 表示に必要なもの。
-}
type alias Config msg =
    { query : String
    , resultCount : Int
    , onChange : String -> msg
    , onClear : msg
    }


{-| 入力欄と件数表示を描画する。
-}
view : Config msg -> Html msg
view config =
    div [ class "search" ]
        [ input
            [ class "search__input"
            , type_ "search"
            , placeholder "キーワードで絞り込む(例: 火山、浅煎り、1:15)"
            , value config.query
            , onInput config.onChange
            ]
            []
        , clearButton config
        , p [ class "search__status" ] [ text (status config) ]
        ]


clearButton : Config msg -> Html msg
clearButton config =
    if String.isEmpty config.query then
        text ""

    else
        button [ class "search__clear", onClick config.onClear ] [ text "クリア" ]


status : Config msg -> String
status config =
    if String.isEmpty (String.trim config.query) then
        ""

    else
        "このカテゴリの該当: " ++ String.fromInt config.resultCount ++ "件"
