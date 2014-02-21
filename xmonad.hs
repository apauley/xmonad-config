import XMonad
import XMonad.Util.Run(spawnPipe)

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.config/xmobar/xmobarrc"
  xmonad defaultConfig
         { modMask = mod4Mask
         , startupHook = setWMName "LG3D"
         , terminal = "urxvt"
         }
