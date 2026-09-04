module Coffee.Validation exposing (Problem, describe, problems)

{-| カタログの不変条件。

型で防げるのは「単位を忘れる」までで、「id が重複している」「本文が空のまま
コミットされた」までは防げない。そこを実行時に一度だけ走る検査として持つ。

同じ関数をテストが表明に使い、ビューが警告バナーに使う。データの壊れ方が
静かに画面へ出ていくのを防ぐのが目的。

@docs Problem, describe, problems

-}

import Coffee.Catalog as Catalog
import Coffee.Category as Category exposing (Category)
import Coffee.Item exposing (Item)
import Coffee.Slug as Slug


{-| 見つかった問題。不透明にしてあるので、説明は [`describe`](#describe) 経由。
-}
type Problem
    = DuplicateId String
    | BlankField String String
    | NoFacts String
    | EmptyCategory Category


{-| カタログ全体の検査結果。健全なら空リスト。
-}
problems : List Problem
problems =
    List.concat
        [ duplicateIds
        , List.concatMap itemProblems Catalog.allItems
        , List.filterMap emptyCategory Category.all
        ]


{-| 人が読める説明。
-}
describe : Problem -> String
describe problem =
    case problem of
        DuplicateId key ->
            "id が重複しています: " ++ key

        BlankField key field ->
            "項目 " ++ key ++ " の " ++ field ++ " が空です"

        NoFacts key ->
            "項目 " ++ key ++ " に facts がありません"

        EmptyCategory category ->
            "カテゴリ " ++ Category.label category ++ " に項目がありません"


duplicateIds : List Problem
duplicateIds =
    Catalog.allItems
        |> List.map (.id >> Slug.toString)
        |> List.sort
        |> repeatedValues
        |> List.map DuplicateId


{-| ソート済みリストから、2回以上現れた値を1つずつ取り出す。
-}
repeatedValues : List String -> List String
repeatedValues sorted =
    case sorted of
        first :: second :: rest ->
            if first == second then
                first :: repeatedValues (dropWhile ((==) first) rest)

            else
                repeatedValues (second :: rest)

        _ ->
            []


dropWhile : (a -> Bool) -> List a -> List a
dropWhile predicate list =
    case list of
        first :: rest ->
            if predicate first then
                dropWhile predicate rest

            else
                list

        [] ->
            []


itemProblems : Item -> List Problem
itemProblems item =
    let
        key =
            Slug.toString item.id
    in
    List.filterMap identity
        [ blankField key "name" item.name
        , blankField key "subtitle" item.subtitle
        , blankField key "description" item.description
        , if List.isEmpty item.facts then
            Just (NoFacts key)

          else
            Nothing
        ]


blankField : String -> String -> String -> Maybe Problem
blankField key field value =
    if String.isEmpty (String.trim value) then
        Just (BlankField key field)

    else
        Nothing


emptyCategory : Category -> Maybe Problem
emptyCategory category =
    if List.isEmpty (Catalog.itemsFor category) then
        Just (EmptyCategory category)

    else
        Nothing
