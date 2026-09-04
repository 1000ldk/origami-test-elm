module View exposing (view)

import Geometry exposing (Point)
import Html exposing (Html, button, div, h1, p, text)
import Html.Attributes exposing (disabled, style)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..), stepCount)
import Steps exposing (Step)
import Svg exposing (Svg, line, polygon, svg)
import Svg.Attributes as SA


view : Model -> Html Msg
view model =
    let
        step =
            Steps.steps
                |> List.drop model.current
                |> List.head
                |> Maybe.withDefault fallbackStep
    in
    div [ style "font-family" "sans-serif", style "text-align" "center", style "max-width" "420px", style "margin" "2rem auto" ]
        [ h1 [] [ text "origami-test-elm" ]
        , p [] [ text "折り紙の折り方ステップを SVG で表示するサンプルです。" ]
        , diagram step
        , p [ style "min-height" "1.5rem" ] [ text step.label ]
        , p [] [ text (String.fromInt (model.current + 1) ++ " / " ++ String.fromInt stepCount) ]
        , div []
            [ button [ onClick Previous, disabled (model.current == 0) ] [ text "← 前へ" ]
            , button [ onClick Reset, style "margin" "0 0.5rem" ] [ text "最初から" ]
            , button [ onClick Next, disabled (model.current == stepCount - 1) ] [ text "次へ →" ]
            ]
        ]


fallbackStep : Step
fallbackStep =
    { label = "", points = [], foldLines = [] }


diagram : Step -> Svg Msg
diagram step =
    svg
        [ SA.width "300"
        , SA.height "300"
        , SA.viewBox "0 0 300 300"
        , style "border" "1px solid #ccc"
        , style "background" "#fdfaf3"
        ]
        (polygon
            [ SA.points (pointsToString step.points)
            , SA.fill "#f7c9c9"
            , SA.stroke "#b23a3a"
            , SA.strokeWidth "2"
            ]
            []
            :: List.map foldLine step.foldLines
        )


foldLine : ( Point, Point ) -> Svg Msg
foldLine ( ( x1, y1 ), ( x2, y2 ) ) =
    line
        [ SA.x1 (String.fromFloat x1)
        , SA.y1 (String.fromFloat y1)
        , SA.x2 (String.fromFloat x2)
        , SA.y2 (String.fromFloat y2)
        , SA.stroke "#3a6bb2"
        , SA.strokeDasharray "6,4"
        , SA.strokeWidth "1.5"
        ]
        []


pointsToString : List Point -> String
pointsToString points =
    points
        |> List.map (\( x, y ) -> String.fromFloat x ++ "," ++ String.fromFloat y)
        |> String.join " "
