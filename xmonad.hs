import XMonad
import XMonad.Hooks.SetWMName

main = xmonad defaultConfig
         { modMask = mod4Mask
         , startupHook = setWMName "LG3D"
         , terminal = "urxvt"
         }
