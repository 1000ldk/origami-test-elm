module SlugTest exposing (suite)

import Coffee.Slug as Slug
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Coffee.Slug"
        [ test "lowercases and joins words with a dash" <|
            \_ ->
                Slug.fromString "Blue Mountain"
                    |> Slug.toString
                    |> Expect.equal "blue-mountain"
        , test "collapses runs of separators and trims the ends" <|
            \_ ->
                Slug.fromString "--SL28 / SL34--"
                    |> Slug.toString
                    |> Expect.equal "sl28-sl34"
        , test "leaves an already valid slug untouched" <|
            \_ ->
                Slug.fromString "cerrado-mineiro"
                    |> Slug.toString
                    |> Expect.equal "cerrado-mineiro"
        , test "falls back when nothing survives normalisation" <|
            \_ ->
                Slug.fromString "イルガチェフェ"
                    |> Slug.toString
                    |> Expect.equal "item"
        , test "falls back on an empty string" <|
            \_ ->
                Slug.fromString ""
                    |> Slug.toString
                    |> Expect.equal "item"
        ]
