
module Language.Renderer.Nodes.Number ( rendereASTNumber ) where

-- ─── IMPORTS ────────────────────────────────────────────────────────────────────

import Language.FrontEnd.Types
import Infrastructure.Text.Layout
import Data.Scientific

-- ─── RENDER ─────────────────────────────────────────────────────────────────────

rendereASTNumber :: Scientific -> SpacedBox
rendereASTNumber x =
    spacedBox value where
        value =
            if length stringedNumber > 10
                then formatScientific Generic ( Just 10 ) x
                else stringedNumber
        stringedNumber =
            show x

-- ────────────────────────────────────────────────────────────────────────────────
