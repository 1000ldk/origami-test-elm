module ReferenceTest exposing (suite)

import Coffee.Category as Category
import Coffee.Reference as Reference
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Coffee.Reference"
        [ test "every category cites at least one source" <|
            \_ ->
                Category.all
                    |> List.filter (Reference.forCategory >> List.isEmpty)
                    |> List.map Category.label
                    |> Expect.equal []
        , test "every source is reachable over https" <|
            \_ ->
                Reference.all
                    |> List.filter (.url >> String.startsWith "https://" >> not)
                    |> List.map .title
                    |> Expect.equal []
        , test "every source is attributed to a publisher" <|
            \_ ->
                Reference.all
                    |> List.filter (.publisher >> String.trim >> String.isEmpty)
                    |> List.map .url
                    |> Expect.equal []
        , test "no source url is listed twice" <|
            \_ ->
                let
                    urls =
                        List.map .url Reference.all
                in
                urls
                    |> List.map (\url -> ( url, List.length (List.filter ((==) url) urls) ))
                    |> List.filter (\( _, count ) -> count > 1)
                    |> List.map Tuple.first
                    |> Expect.equal []
        , test "each source is tied to at least one category" <|
            \_ ->
                Reference.all
                    |> List.filter (.topics >> List.isEmpty)
                    |> List.map .title
                    |> Expect.equal []
        ]
