module View.Layout exposing (Config, view)

{-| ページの外枠。見出し、操作列、導入文、カード領域、注記の並びを決める。

@docs Config, view

-}

import Html exposing (Html, div, footer, h1, header, main_, p, text)
import Html.Attributes exposing (class)


{-| 差し込む中身。
-}
type alias Config msg =
    { lead : String
    , controls : List (Html msg)
    , intro : String
    , cards : List (Html msg)
    }


{-| ページ全体を描画する。カードが0件なら空状態を出す。
-}
view : Config msg -> Html msg
view config =
    div [ class "page" ]
        [ header [ class "page__header" ]
            [ h1 [] [ text title ]
            , p [ class "lead" ] [ text config.lead ]
            ]
        , div [ class "controls" ] config.controls
        , p [ class "intro" ] [ text config.intro ]
        , main_ [ class "cards" ] (cardsOrEmpty config.cards)
        , footer [ class "note" ] [ text disclaimer ]
        ]


cardsOrEmpty : List (Html msg) -> List (Html msg)
cardsOrEmpty cards =
    if List.isEmpty cards then
        [ p [ class "empty" ] [ text "該当する項目がありません。キーワードを変えてみてください。" ] ]

    else
        cards


title : String
title =
    "コーヒー豆まとめ"


disclaimer : String
disclaimer =
    "※ 標高やレシピの数値は一般的な目安です。農園やロット、焙煎度によって最適値は変わるので、出発点として使ってください。"
