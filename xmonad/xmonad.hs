import XMonad
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Magnifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.FixedColumn

myWorkspaces = ["1:web","2:code"] ++ map show [3..9]
myLayout = toggleLayouts Full perWS 
    where 
        perWS = onWorkspace "2:code" codeLayout $ standardLayouts
        codeLayout = limitWindows 3 $ magnifiercz' 1.4 $ FixedColumn 1 1 84 10
        standardLayouts = Full ||| Tall 1 (3/100) (1/2) ||| codeLayout 
        

main = xmonad defaultConfig
    { terminal    = "urxvt"
    , modMask     = mod4Mask
    , workspaces  = myWorkspaces
    , layoutHook  = myLayout
    }

