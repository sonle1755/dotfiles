import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

rofiCmd = "rofi -show drun"
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks def
        { layoutHook = avoidStruts  $  layoutHook def
        , terminal = "alacritty"
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
	, ((mod1Mask, xK_p), spawn rofiCmd)
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s ~/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png")
        , ((0, xK_Print), spawn "scrot ~/Pictures/Screenshots/%Y-%m-%d-%T-screenshot")
        ]
