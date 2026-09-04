module Steps exposing (Step, steps)

import Geometry exposing (Point, translate)


type alias Step =
    { label : String
    , points : List Point
    , foldLines : List ( Point, Point )
    }


{-| A stylised (non-physical) fold sequence for a paper crane, centered
on a 300x300 canvas. Each step is a flat polygon approximating the
paper's outline at that stage, plus the fold line(s) that lead into it.
-}
steps : List Step
steps =
    List.map center rawSteps


center : Step -> Step
center step =
    { step
        | points = List.map (translate ( 150, 150 )) step.points
        , foldLines =
            List.map
                (\( a, b ) -> ( translate ( 150, 150 ) a, translate ( 150, 150 ) b ))
                step.foldLines
    }


rawSteps : List Step
rawSteps =
    [ { label = "1. 正方形の紙を用意する"
      , points = [ ( -100, -100 ), ( 100, -100 ), ( 100, 100 ), ( -100, 100 ) ]
      , foldLines = [ ( ( -100, -100 ), ( 100, 100 ) ) ]
      }
    , { label = "2. 対角線で半分に折る"
      , points = [ ( -100, -100 ), ( 100, 100 ), ( -100, 100 ) ]
      , foldLines = [ ( ( -100, 100 ), ( 100, -100 ) ) ]
      }
    , { label = "3. もう半分に折り、四角に開く (鶴の基本形)"
      , points = [ ( 0, -100 ), ( 90, 0 ), ( 0, 100 ), ( -90, 0 ) ]
      , foldLines =
            [ ( ( 0, -100 ), ( 0, 100 ) )
            , ( ( -90, 0 ), ( 90, 0 ) )
            ]
      }
    , { label = "4. 左右の角を中心線に合わせて折る"
      , points = [ ( 0, -100 ), ( 40, 0 ), ( 0, 100 ), ( -40, 0 ) ]
      , foldLines =
            [ ( ( 0, -100 ), ( 40, 0 ) )
            , ( ( 40, 0 ), ( 0, 100 ) )
            , ( ( 0, 100 ), ( -40, 0 ) )
            , ( ( -40, 0 ), ( 0, -100 ) )
            ]
      }
    , { label = "5. 首と尾を折り出す"
      , points = [ ( 0, -100 ), ( 20, -40 ), ( 40, 0 ), ( 0, 90 ), ( -40, 0 ), ( -20, -40 ) ]
      , foldLines = [ ( ( 20, -40 ), ( -20, -40 ) ) ]
      }
    , { label = "6. 羽を開いて完成"
      , points = [ ( 0, -100 ), ( 70, -20 ), ( 40, 0 ), ( 0, 90 ), ( -40, 0 ), ( -70, -20 ) ]
      , foldLines = []
      }
    ]
