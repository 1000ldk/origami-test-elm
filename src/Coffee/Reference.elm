module Coffee.Reference exposing (Reference, Fields, fromFields, all, forCategory)

{-| 参考にした資料。

掲載している文章はすべて書き下ろしで、これらの資料からの転載はない。標高や湯温
といった事実そのものに著作権は及ばないが、数値の根拠を辿れるようにするため、
どの章がどの資料を参照したのかを持っておく。

章との対応を型で持たせているので、[`Coffee.Validation`](Coffee-Validation) が
「出典の無い章」を検出できる。

@docs Reference, Fields, fromFields, all, forCategory

-}

import Coffee.Category as Category exposing (Category(..))


{-| 資料1件。
-}
type alias Reference =
    { title : String
    , publisher : String
    , url : String
    , topics : List Category
    }


{-| 生の形。現状は [`Reference`](#Reference) と同じ形だが、入口を1つに保つために分けてある。
-}
type alias Fields =
    Reference


{-| 生の形から資料を作る。
-}
fromFields : Fields -> Reference
fromFields fields =
    fields


{-| ある章が参照した資料。
-}
forCategory : Category -> List Reference
forCategory category =
    List.filter (\reference -> List.member category reference.topics) all


{-| 参照した資料の一覧。
-}
all : List Reference
all =
    List.map fromFields
        [ { title = "エチオピア産コーヒー完全ガイド|イルガチェフェ・シダモ・ハラー"
          , publisher = "Coffee Pick"
          , url = "https://coffee-pick.com/ethiopia-coffee-guide/"
          , topics = [ Origins, Varieties ]
          }
        , { title = "Coffee Growing Regions and Flavor Profiles: A World Tour"
          , publisher = "Sweeter Grind"
          , url = "https://sweetergrind.com/posts/coffee-growing-regions-flavor-profiles"
          , topics = [ Origins ]
          }
        , { title = "Why Coffee Altitude Matters"
          , publisher = "Mosey Coffee Roasters"
          , url = "https://www.moseycoffee.com/blog/altitude-why-it-matters"
          , topics = [ Origins ]
          }
        , { title = "Exploring the World's Coffee Sourcing Regions and Their Unique Flavors"
          , publisher = "The Pepper Pantry"
          , url = "https://thepepperpantry.com/blogs/the-pepper-pantry/exploring-the-world-s-coffee-sourcing-regions-and-their-unique-flavors"
          , topics = [ Origins ]
          }
        , { title = "Top 14 Single-Origin Coffees Worth Trying: A Regional Flavor Guide"
          , publisher = "Talk About Coffee"
          , url = "https://www.talkaboutcoffee.com/top-ten-single-origin-coffees.html"
          , topics = [ Origins, Pairings ]
          }
        , { title = "Understanding Kenyan Coffee Regions and their Unique Flavor Profiles"
          , publisher = "AGnimble"
          , url = "https://agnimble.com/understanding-kenyan-coffee-regions-and-their-unique-flavor-profiles/"
          , topics = [ Origins, Varieties ]
          }
        , { title = "コーヒー産地ケニアってこんなところ!"
          , publisher = "堀口珈琲"
          , url = "https://www.kohikobo.co.jp/channel/18380/"
          , topics = [ Origins ]
          }
        , { title = "火山が生んだ希少な豆。コナコーヒーとは?"
          , publisher = "UCC (So, Coffee?)"
          , url = "https://journal.ucc.co.jp/feature/3794"
          , topics = [ Origins ]
          }
        , { title = "Kona coffee"
          , publisher = "Wikipedia"
          , url = "https://en.wikipedia.org/wiki/Kona_coffee"
          , topics = [ Origins ]
          }
        , { title = "Gesha"
          , publisher = "Wikipedia"
          , url = "https://en.wikipedia.org/wiki/Gesha"
          , topics = [ Varieties, Processing ]
          }
        , { title = "浅煎りのコーヒーを美味しく淹れる3つのコツ"
          , publisher = "THE COFFEESHOP"
          , url = "https://www.thecoffeeshop.jp/magazine/brewguide/howtobrew-mediumroastedcoffee-2/"
          , topics = [ Roasts, BrewMethods, Pairings ]
          }
        , { title = "実は間違い?! 酸っぱくならない浅煎りスペシャルティコーヒーの淹れ方"
          , publisher = "ONIBUS COFFEE"
          , url = "https://onibuscoffee.com/en/blogs/news/0216"
          , topics = [ Roasts, Pairings ]
          }
        , { title = "Coffee to Water Ratio: 1:16 Drip, 1:2 Espresso, 1:8 Cold Brew"
          , publisher = "Lamose"
          , url = "https://www.lamose.com/blogs/recipes/coffee-to-water-ratio-guide-the-golden-numbers-for-every-method"
          , topics = [ BrewMethods, Pairings ]
          }
        , { title = "V60 brewing guide"
          , publisher = "Araku Coffee"
          , url = "https://www.arakucoffee.com/en/pages/guide-preparation-v60"
          , topics = [ BrewMethods, Roasts ]
          }
        , { title = "French Press Brew Guide: Ratio, Grind, Temp & Steps"
          , publisher = "Coffee Gear Hub"
          , url = "https://www.coffeegearhub.com/french-press-brew-guide/"
          , topics = [ BrewMethods ]
          }
        , { title = "AeroPress Recipe: 6 Simple Steps"
          , publisher = "Coffee Bros."
          , url = "https://coffeebros.com/pages/aeropress-brew-guide"
          , topics = [ BrewMethods ]
          }
        , { title = "コーヒー豆のグレード・等級を国別に解説。スペシャルティコーヒーの基準とは?"
          , publisher = "D.S COFFEE ROASTER"
          , url = "https://dscoffeeroaster.com/grade-of-coffee-beans/"
          , topics = [ Processing, Origins ]
          }
        ]
