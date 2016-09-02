import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Named
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Magnifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.FixedColumn
--Multihead
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS

--Workspaces
myWorkspaces = ["1:web","2:code"] ++ map show [3..9]

--Layouts
myLayout = onWorkspace "2:code" codeLayout $ standardLayouts
    where 
        codeLayout = (named "Code" $ limitWindows 3 $ magnifiercz' 1.4 $ FixedColumn 1 1 84 10) ||| Full
        standardLayouts = Full ||| tiled ||| Mirror tiled ||| codeLayout 
        tiled = Tall 1 (3/100) (1/2)

--Barra
myBar = "xmobar"

--Terminal
myTerminal = "urxvt"

--CustomKeys
myKeys = [((m .|. mod4Mask, k), windows $ f i)
            | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
        ++
        [((mod4Mask, xK_u), prevScreen)
        ,((mod4Mask .|. shiftMask, xK_u), shiftPrevScreen)
        ,((mod4Mask, xK_i), swapPrevScreen)]
        
--Configuration
myConfig = defaultConfig
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , workspaces  = myWorkspaces
    , layoutHook  = myLayout
    } `additionalKeys` myKeys

--Main function
main = xmonad =<< xmobar myConfig

