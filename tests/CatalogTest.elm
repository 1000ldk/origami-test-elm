module CatalogTest exposing (suite)

import Coffee.Catalog as Catalog
import Coffee.Category as Category
import Coffee.Validation as Validation
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Coffee.Catalog"
        [ describe "invariants"
            [ test "the catalogue reports no problems" <|
                \_ ->
                    Validation.problems
                        |> List.map Validation.describe
                        |> Expect.equal []
            , test "every category has items" <|
                \_ ->
                    Category.all
                        |> List.filter (Catalog.itemsFor >> List.isEmpty)
                        |> List.map Category.label
                        |> Expect.equal []
            , test "allItems covers every category" <|
                \_ ->
                    Category.all
                        |> List.map (Catalog.itemsFor >> List.length)
                        |> List.sum
                        |> Expect.equal Catalog.size
            ]
        , describe "matching"
            [ test "an empty query keeps every item in the category" <|
                \_ ->
                    Catalog.matching "" Category.Origins
                        |> List.length
                        |> Expect.equal (List.length (Catalog.itemsFor Category.Origins))
            , test "a query narrows the category" <|
                \_ ->
                    Catalog.matching "火山" Category.Origins
                        |> List.length
                        |> Expect.lessThan (List.length (Catalog.itemsFor Category.Origins))
            , test "a query finds the origins grown on volcanoes" <|
                \_ ->
                    Catalog.matching "火山" Category.Origins
                        |> List.isEmpty
                        |> Expect.equal False
            , test "brewing ratios are searchable even though the prose omits them" <|
                \_ ->
                    Catalog.matching "1:15" Category.BrewMethods
                        |> List.isEmpty
                        |> Expect.equal False
            , test "an unmatched query returns nothing" <|
                \_ ->
                    Catalog.matching "該当しないキーワード" Category.Origins
                        |> List.map .name
                        |> Expect.equal []
            ]
        ]
