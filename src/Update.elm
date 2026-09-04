module Update exposing (update)

import Model exposing (Model, Msg(..), stepCount)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Next ->
            { model | current = min (stepCount - 1) (model.current + 1) }

        Previous ->
            { model | current = max 0 (model.current - 1) }

        Reset ->
            { model | current = 0 }
