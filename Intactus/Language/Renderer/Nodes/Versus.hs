

module Language.Renderer.Nodes.Versus ( renderASTVersus ) where

-- ─── IMPORTS ────────────────────────────────────────────────────────────────────

import Language.FrontEnd.Types
import Infrastructure.Text.Layout

-- ─── VERSUS SIGN ────────────────────────────────────────────────────────────────

versusSign = SpacedBox { boxLines = [ " • ", " • ", " • " ]
                       , height   = 3
                       , width    = 3
                       , baseLine = 1
                       }

-- ─── RENDER ─────────────────────────────────────────────────────────────────────

renderASTVersus :: [ AST ] -> ( AST -> SpacedBox ) -> SpacedBox
renderASTVersus parts render = result where
    result =
        case length parts of
            0 -> spacedBox "empty"
            1 -> render $ parts !! 0
            _ -> baselineVerticalConcat $ computeSignedParts parts
    computeSignedParts xs =
        ( render $ head xs ) : concat [ [ versusSign, render x ] | x <- tail xs ]

-- ────────────────────────────────────────────────────────────────────────────────