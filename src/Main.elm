module Main exposing (main)

import Browser
import Data exposing (Category, Item)
import Html exposing (Html, article, button, dd, div, dl, dt, footer, h1, h2, h3, main_, nav, p, text)
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
        , p [ class "lead" ]
            [ text "品種・産地の山・精製方法・焙煎度・抽出方法まで、コーヒー豆の基礎知識をまとめました。産地カードには山と標高を、抽出カードには挽き目・湯温・比率の目安を載せています。" ]
        , nav [ class "tabs" ] (List.map (tabButton model.active) Data.categories)
        , p [ class "intro" ] [ text (Data.categoryIntro model.active) ]
        , main_ [ class "cards" ] (List.map itemCard (Data.itemsFor model.active))
        , footer [ class "note" ]
            [ text "※ 標高やレシピの数値は一般的な目安です。農園やロット、焙煎度によって最適値は変わるので、出発点として使ってください。" ]
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
        , factList item.facts
        ]


factList : List ( String, String ) -> Html Msg
factList facts =
    if List.isEmpty facts then
        text ""

    else
        dl [ class "facts" ] (List.concatMap factRow facts)


factRow : ( String, String ) -> List (Html Msg)
factRow ( label, value ) =
    [ dt [] [ text label ], dd [] [ text value ] ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
