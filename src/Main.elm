module Main exposing (main)

{-| 配線だけを持つ入口。

状態は [`App.State`](App-State)、見た目は `View.*`、データは `Coffee.*` にある。
このモジュールが太り始めたら、切り出す場所を間違えているサイン。

@docs main

-}

import App.State as State exposing (Model, Msg(..))
import Browser
import Coffee.Catalog as Catalog
import Coffee.Category as Category
import Coffee.Reference as Reference
import Coffee.Validation as Validation
import Html exposing (Html)
import View.Card
import View.Layout
import View.Problems
import View.SearchBox
import View.Sources
import View.Tabs


{-| エントリポイント。
-}
main : Program () Model Msg
main =
    Browser.sandbox
        { init = State.init
        , update = State.update
        , view = view
        }


view : Model -> Html Msg
view model =
    View.Layout.view
        { lead = lead
        , controls =
            [ View.Tabs.view
                { active = model.active
                , count = State.matchCount model
                , onSelect = SelectCategory
                }
            , View.SearchBox.view
                { query = model.query
                , resultCount = List.length (State.visibleItems model)
                , onChange = SetQuery
                , onClear = ClearQuery
                }
            , View.Problems.view Validation.problems
            ]
        , intro = Category.intro model.active
        , cards = List.map View.Card.view (State.visibleItems model)
        , sources = View.Sources.view (Reference.forCategory model.active)
        }


lead : String
lead =
    "品種・産地の山・精製方法・焙煎度・抽出方法まで、全"
        ++ String.fromInt Catalog.size
        ++ "項目。産地カードには山と標高を、抽出カードには挽き目・湯温・比率の目安を載せています。"
