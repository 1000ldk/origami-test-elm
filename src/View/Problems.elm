module View.Problems exposing (view)

{-| データ検証の結果を出す警告バナー。

健全なら何も描画しない。壊れたデータが黙って公開されるより、画面に出て
気づける方がよいという判断。

@docs view

-}

import Coffee.Validation as Validation exposing (Problem)
import Html exposing (Html, div, li, strong, text, ul)
import Html.Attributes exposing (class)


{-| 問題があればバナーを描画する。
-}
view : List Problem -> Html msg
view problems =
    if List.isEmpty problems then
        text ""

    else
        div [ class "problems" ]
            [ strong [] [ text "データに問題があります" ]
            , ul [ class "problems__list" ] (List.map entry problems)
            ]


entry : Problem -> Html msg
entry problem =
    li [] [ text (Validation.describe problem) ]
