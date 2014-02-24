import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaultConfig
         { modMask            = mod4Mask
         , manageHook         = manageDocks <+> manageHook defaultConfig
         , layoutHook         = avoidStruts  $  layoutHook defaultConfig
         , startupHook        = setWMName "LG3D"
         -- , terminal           = "urxvt"
         , borderWidth        = 2
         , normalBorderColor  = "#cccccc"
         , focusedBorderColor = "#cd8b00"
         }
