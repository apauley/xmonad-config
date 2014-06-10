import XMonad
import qualified XMonad.StackSet as W
import XMonad.Layout.IndependentScreens
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myWorkspaces = withScreens 2 ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myKeys xmproc = [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
         , ((0, xK_F3), spawn "sleep 0.2; scrot -s")
         , ((0, xK_F4), spawn "scrot")] ++
         [
         -- workspaces are distinct by screen
          ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
               | (i, k) <- zip (workspaces' (conf xmproc)) [xK_1 .. xK_9]
               , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
         ]

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

conf xmproc = defaultConfig
         { modMask            = mod4Mask
         , workspaces         = myWorkspaces
         , manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
         , layoutHook         = avoidStruts  $  layoutHook defaultConfig
         , logHook            = dynamicLogWithPP xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                    , ppTitle  = xmobarColor "green" "" . shorten 50
                                    }
         , startupHook        = setWMName "LG3D"
         -- , terminal           = "urxvt"
         , borderWidth        = 2
         , focusFollowsMouse  = False
         , normalBorderColor  = "#cccccc"
         , focusedBorderColor = "#cd8b00"
         } `additionalKeys` (myKeys xmproc)


main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc"
  xmonad $ conf xmproc
