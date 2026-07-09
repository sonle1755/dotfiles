import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Actions.SpawnOn
import XMonad.Actions.OnScreen
import XMonad.Util.EZConfig(additionalKeysP)

import XMonad.Actions.UpdatePointer
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks

import XMonad.Util.Loggers
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import qualified XMonad.StackSet as W
import Data.Maybe (listToMaybe)
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.Rescreen
import Data.Monoid (Last(..))


-- Colors

colorBlack   = "#181825"
colorRed     = "#FF0000"
colorGreen   = "#a6e3a1"
colorYellow  = "#f9e2af"
colorBlue    = "#89b4fa"
colorMagenta = "#cba6f7"
colorCyan    = "#94e2d5"
colorWhite   = "#FFFFFF"

colorGray    = "#6c7086"
colorOrange  = "#fab387"

---------------------------------------------------------------------------------------------------
-- ON STARTUP -------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
myManageHook :: ManageHook
myManageHook = 
  composeAll
    [ title =? "Code" --> doShift "\xEAC4 Code"
    , title =? "Process" --> doShift "\xEBA2 Process"
    , className =? "Brave-browser" --> doShift "\xE743 Brave"
    ]

-- greedyViewOnScreen forces the workspace onto its assigned screen (swapping
-- if needed), unlike viewOnScreen (jumps focus) or onlyOnScreen (no-ops).
-- https://hackage.haskell.org/package/xmonad-contrib/docs/XMonad-Actions-OnScreen.html
myScreenPinning :: X ()
myScreenPinning = do
  windows (greedyViewOnScreen 2 "\xE743 Brave")
  windows (greedyViewOnScreen 1 "\xEBA2 Process")
  windows (greedyViewOnScreen 0 "\xEAC4 Code")

myStartupHook :: X ()
myStartupHook = do
  myScreenPinning
  spawnOnce "alacritty --title Code"
  spawnOnce "brave"
  spawnOnce "alacritty --title Process"

---------------------------------------------------------------------------------------------------
-- KEYBINDING -------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
myWorkspaces :: [String]
myWorkspaces =
    ["\xEAC4 Code", "\xE743 Brave", "\xE706 Database", "4", "5", "6", "7", "8", "9", "\xEBA2 Process"]

myKeys :: [(String, X ())]
myKeys =  
  [ ("M-p", spawn "rofi -show drun") ]
  ++
  -- Switch to workspace i on screen 2. If i is visible then focus that workspace
  [ ("M-" ++ show n, windows (viewOnScreen 0 ws))
  | (ws, n) <- zip myWorkspaces ([1..9] ++ [0])
  ]

---------------------------------------------------------------------------------------------------
-- LAYOUT -----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

myLayout =
  spacing 10 $
    Tall 1 (3/100) (1/2)
    ||| Mirror (Tall 1 (3/100) (1/2))
    ||| noBorders Full

---------------------------------------------------------------------------------------------------
-- XMOBAR -----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

xmobar0 = statusBarPropTo "_XMONAD_LOG_1" "xmobar -x 0 ~/.config/xmobar/xmobarrc0" (myPP 0)
xmobar1 = statusBarPropTo "_XMONAD_LOG_2" "xmobar -x 1 ~/.config/xmobar/xmobarrc1" (myPP 1)
xmobar2 = statusBarPropTo "_XMONAD_LOG_3" "xmobar -x 2 ~/.config/xmobar/xmobarrc2" (myPP 2)

barSpawner :: ScreenId -> StatusBarConfig
barSpawner 0 = xmobar0 
barSpawner 1 = xmobar1
barSpawner 2 = xmobar2
barSpawner _ = mempty -- nothing on the rest of the screens

myPP :: ScreenId -> X PP
myPP sid = do
    ws <- gets windowset
    let focused = W.screen (W.current ws) == sid
        color = if focused then colorCyan else colorGray

    pure $
        xmobarPP
            { ppCurrent = \ws ->
                  xmobarColor colorWhite "" "["
                  ++ xmobarColor colorRed "" ws
                  ++ xmobarColor colorWhite "" "]"
            , ppVisible = xmobarColor color ""
            , ppSep             = magenta " • "
            , ppTitleSanitize   = xmobarStrip
            , ppHidden          = \ws ->
                  xmobarColor color "" (ws ++ "*")
            , ppUrgent          = red . wrap (yellow "!") (yellow "!")
            , ppOrder  = \(ws:l:t:ex) -> [ws]++ex++[t]
            }
            where
              formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
              formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

              -- | Windows should have *some* title, which should not not exceed a
              -- sane length.
              ppWindow :: String -> String
              ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

              blue, lowWhite, magenta, red, white, yellow :: String -> String
              magenta  = xmobarColor "#ff79c6" ""
              blue     = xmobarColor "#bd93f9" ""
              white    = xmobarColor "#f8f8f2" ""
              yellow   = xmobarColor "#f1fa8c" ""
              red      = xmobarColor "#ff5555" ""
              lowWhite = xmobarColor "#bbbbbb" ""

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . dynamicEasySBs(pure . barSpawner)
     $ myConfig

myConfig = def 
  { workspaces = myWorkspaces
  , terminal = "alacritty"
  , layoutHook = myLayout
  , borderWidth = 2
  , focusedBorderColor = "#ff0000"
  , normalBorderColor = "#000000"
  , focusFollowsMouse = False
  , startupHook = myStartupHook <+> startupHook def
  , manageHook = myManageHook <+> manageHook def
  } `additionalKeysP` myKeys


