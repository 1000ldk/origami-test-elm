module ItemTest exposing (suite)

import Coffee.Fact as Fact
import Coffee.Item as Item exposing (Item)
import Coffee.Slug as Slug
import Expect
import Test exposing (Test, describe, test)


sample : Item
sample =
    Item.fromFields
        { id = "Sample Origin"
        , name = "サンプル産地"
        , subtitle = "テスト用"
        , description = "説明文"
        , facts =
            [ Fact.summit "テスト山" 3475
            , Fact.altitude 1400 2000
            , Fact.flavor [ "ジャスミン", "白桃" ]
            ]
        }


suite : Test
suite =
    describe "Coffee.Item"
        [ test "normalises the id on construction" <|
            \_ ->
                Slug.toString sample.id
                    |> Expect.equal "sample-origin"
        , describe "rows"
            [ test "renders one row per fact" <|
                \_ ->
                    Item.rows sample
                        |> List.length
                        |> Expect.equal 3
            , test "labels come from the fact type, not the data" <|
                \_ ->
                    Item.rows sample
                        |> List.map .label
                        |> Expect.equal [ "山・山脈", "標高", "フレーバー" ]
            , test "formats a summit with its height" <|
                \_ ->
                    Item.rows sample
                        |> List.map .value
                        |> List.head
                        |> Expect.equal (Just "テスト山(3,475m)")
            ]
        , describe "matches"
            [ test "an empty query matches everything" <|
                \_ ->
                    Item.matches "" sample
                        |> Expect.equal True
            , test "a whitespace-only query matches everything" <|
                \_ ->
                    Item.matches "   " sample
                        |> Expect.equal True
            , test "matches on the name" <|
                \_ ->
                    Item.matches "サンプル" sample
                        |> Expect.equal True
            , test "matches on a formatted fact value the prose never mentions" <|
                \_ ->
                    Item.matches "1,400" sample
                        |> Expect.equal True
            , test "matches on a fact label" <|
                \_ ->
                    Item.matches "標高" sample
                        |> Expect.equal True
            , test "rejects a query that appears nowhere" <|
                \_ ->
                    Item.matches "エスプレッソ" sample
                        |> Expect.equal False
            ]
        ]
