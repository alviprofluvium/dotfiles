import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Magnifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.FixedColumn

--Workspaces
myWorkspaces = ["1:web","2:code"] ++ map show [3..9]

--Layouts
myLayout = onWorkspace "2:code" codeLayout $ standardLayouts
    where 
        codeLayout = limitWindows 3 $ magnifiercz' 1.4 $ FixedColumn 1 1 84 10
        standardLayouts = Full ||| tiled ||| Mirror tiled ||| codeLayout 
        tiled = Tall 1 (3/100) (1/2)

--Barra
myBar = "xmobar"

--Terminal
myTerminal = "urxvt"
        
--Configuration
myConfig = defaultConfig
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , workspaces  = myWorkspaces
    , layoutHook  = myLayout
    }

--Main function
main = xmonad =<< xmobar myConfig

