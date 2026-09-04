module RangeTest exposing (suite)

import Coffee.Range as Range
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Coffee.Range"
        [ describe "between"
            [ test "keeps ordered bounds" <|
                \_ ->
                    Range.between Range.Meters 1800 2200
                        |> Range.low
                        |> Expect.equal 1800
            , test "normalises reversed bounds" <|
                \_ ->
                    Range.between Range.Meters 2200 1800
                        |> Range.low
                        |> Expect.equal 1800
            , test "normalises the upper bound too" <|
                \_ ->
                    Range.between Range.Meters 2200 1800
                        |> Range.high
                        |> Expect.equal 2200
            ]
        , describe "format"
            [ test "groups thousands and appends the unit once" <|
                \_ ->
                    Range.between Range.Meters 1800 2200
                        |> Range.format
                        |> Expect.equal "1,800〜2,200m"
            , test "leaves values below a thousand ungrouped" <|
                \_ ->
                    Range.between Range.Meters 250 800
                        |> Range.format
                        |> Expect.equal "250〜800m"
            , test "collapses a single value" <|
                \_ ->
                    Range.at Range.Meters 5895
                        |> Range.format
                        |> Expect.equal "5,895m"
            , test "collapses a range whose bounds are equal" <|
                \_ ->
                    Range.between Range.Celsius 93 93
                        |> Range.format
                        |> Expect.equal "93℃"
            , test "uses the celsius suffix" <|
                \_ ->
                    Range.between Range.Celsius 90 93
                        |> Range.format
                        |> Expect.equal "90〜93℃"
            ]
        ]
