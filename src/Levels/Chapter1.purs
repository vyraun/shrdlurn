module Levels.Chapter1 where

import Data.Array
import qualified Data.StrMap as SM

import Helper
import Transformer
import Types

chapter1 :: Chapter
chapter1 = {
    name: "Chapter 1",

    transformers: SM.fromList [
        "stackEqual" :> {
            name: "stackEqual",
            function: tStackEqual
        },
        "mapClone" :> {
            name: "map({X} ↦ {X}{X})",
            function: map $ concatMap (\x -> [x, x])
        },
        "flatten" :> {
            name: "flatten",
            function: tFlatten
        },
        "replaceYbyB" :> {
            name: "map({Yellow} ↦ {Brown})",
            function: tReplace Yellow Brown
        },
        "replaceYbyBY" :> {
            name: "map({Yellow} ↦ {Brown}{Yellow})",
            function: tReplaceMultiple Yellow [Brown, Yellow]
        },
        "replaceBbyBBB" :> {
            name: "map({Brown} ↦ {Brown}{Brown}{Brown})",
            function: tReplaceMultiple Brown [Brown, Brown, Brown]
        },
        "replaceBbyOO" :> {
            name: "map({Brown} ↦ {Orange}{Orange})",
            function: tReplaceMultiple Brown [Orange, Orange]
        },
        "rejectO" :> {
            name: "reject({Orange})",
            function: map (reject (== Orange)) >>> tClearEmpty
        },
        "pushY" :> {
            name: "map(push({Yellow}))",
            function: map (`snoc` Yellow)
        },
        "tail" :> {
            name: "map(tail)",
            function: tTail
        }
    ],

    levels: [
        {
            id: "1",
            name: "1",
            initial: [[Brown], [Orange], [Orange], [Yellow], [Yellow], [Yellow], [Orange], [Orange], [Brown]],
            target: [[Brown], [Yellow], [Yellow], [Yellow], [Brown]]
        }
    ]
}