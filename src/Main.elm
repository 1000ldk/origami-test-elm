module Main exposing (main)

import Browser
import Data exposing (Category, Item)
import Html exposing (Html, article, button, div, h1, h2, h3, main_, nav, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)


type alias Model =
    { active : Category }


type Msg
    = SetCategory Category


init : Model
init =
    { active = Data.Varieties }


update : Msg -> Model -> Model
update msg _ =
    case msg of
        SetCategory category ->
            { active = category }


view : Model -> Html Msg
view model =
    div [ class "page" ]
        [ h1 [] [ text "コーヒー豆まとめ" ]
        , p [ class "lead" ] [ text "品種・産地・焙煎度・抽出方法別に、コーヒー豆の基礎知識をまとめました。" ]
        , nav [ class "tabs" ] (List.map (tabButton model.active) Data.categories)
        , main_ [ class "cards" ] (List.map itemCard (Data.itemsFor model.active))
        ]


tabButton : Category -> Category -> Html Msg
tabButton active category =
    button
        [ classList [ ( "tab", True ), ( "tab--active", category == active ) ]
        , onClick (SetCategory category)
        ]
        [ text (Data.categoryLabel category) ]


itemCard : Item -> Html Msg
itemCard item =
    article [ class "card" ]
        [ h2 [] [ text item.name ]
        , h3 [] [ text item.subtitle ]
        , p [] [ text item.description ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
