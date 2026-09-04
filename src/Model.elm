module Model exposing (Model, Msg(..), init, stepCount)

import Steps


type alias Model =
    { current : Int }


type Msg
    = Next
    | Previous
    | Reset


stepCount : Int
stepCount =
    List.length Steps.steps


init : Model
init =
    { current = 0 }
