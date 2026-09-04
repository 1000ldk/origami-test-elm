module View.Sources exposing (view)

{-| 開いている章が参照した資料の一覧。

事実を載せている以上、根拠は同じ画面から辿れる方がよい、という判断で
フッターではなく本文の直後に置いている。

@docs view

-}

import Coffee.Reference exposing (Reference)
import Html exposing (Html, a, h2, li, p, section, text, ul)
import Html.Attributes exposing (class, href, rel, target)


{-| 資料一覧を描画する。空なら何も描画しない。
-}
view : List Reference -> Html msg
view references =
    if List.isEmpty references then
        text ""

    else
        section [ class "sources" ]
            [ h2 [ class "sources__heading" ] [ text "この章の参考資料" ]
            , p [ class "sources__note" ]
                [ text "掲載している文章は下記を参考に書き下ろしたもので、転載ではありません。数値は各資料に基づく一般的な目安です。" ]
            , ul [ class "sources__list" ] (List.map entry references)
            ]


entry : Reference -> Html msg
entry reference =
    li []
        [ a
            [ href reference.url
            , target "_blank"
            , rel "noopener noreferrer"
            ]
            [ text reference.title ]
        , text ("(" ++ reference.publisher ++ ")")
        ]
