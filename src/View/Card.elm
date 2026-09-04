module View.Card exposing (view)

{-| 項目1件のカード。

`msg` を固定しないので、このモジュールはアプリの Msg を知らない。

@docs view

-}

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)
import Coffee.Slug as Slug
import Html exposing (Html, article, dd, dl, dt, h2, h3, p, text)
import Html.Attributes exposing (class, id)


{-| カードを描画する。要素 id は項目の slug なので `#kona` で直接飛べる。
-}
view : Item -> Html msg
view item =
    article [ class "card", id (Slug.toString item.id) ]
        [ h2 [ class "card__name" ] [ text item.name ]
        , h3 [ class "card__subtitle" ] [ text item.subtitle ]
        , p [ class "card__body" ] [ text item.description ]
        , factList (Item.rows item)
        ]


factList : List Fact.Row -> Html msg
factList factRows =
    if List.isEmpty factRows then
        text ""

    else
        dl [ class "facts" ] (List.concatMap factRow factRows)


factRow : Fact.Row -> List (Html msg)
factRow row =
    [ dt [ class "facts__label" ] [ text row.label ]
    , dd [ class "facts__value" ] [ text row.value ]
    ]
