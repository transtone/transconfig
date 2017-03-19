import XMonad

import Data.Monoid
import System.Exit
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.XMonad
import XMonad.Prompt.AppLauncher

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName 
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.XSelection
import XMonad.Util.WorkspaceCompare
import XMonad.Util.WindowProperties
import XMonad.Util.NamedWindows (getName)

import Data.List(isPrefixOf)
import Data.Ratio ((%))
import qualified System.IO.UTF8 as U
import qualified XMonad.StackSet as W
import qualified XMonad.Actions.FlexibleResize as Flex
import qualified Data.Map        as M

--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_r     ), spawn "exe=`dmenu_path | yeganesh -- -fn Monaco-12` && eval \"exec $exe\"")
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((controlMask,        xK_Print ), spawn "sleep 0.2; scrot -s")
    , ((0 ,                 xK_Print ), spawn "scrot")
--    , ((0 ,                0x1008ff11), spawn "amixer set Master 5%- ")
--    , ((0 ,                0x1008ff13), spawn "amixer set Master 5%+ ")
--    , ((0 ,                0x1008ff11), spawn "ossmix vmix0-outvol -- -1")
--    , ((0 ,                0x1008ff13), spawn "ossmix vmix0-outvol -- +1")
    , ((0 ,                0x1008ff2f), spawn "gksudo pm-suspend")
    , ((0 ,                0x1008ff93), spawn "gksudo pm-hibernate")
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_b     ), sendMessage ToggleStruts)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_r     ), spawn "killall conky dzen2 tint2 parcellite fcitx volumeicon; xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_7]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_p] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]


myManageHook = composeAll . concat $
    [ [isFullscreen --> doFullFloat, isDialog --> doCenterFloat]
    , [className =? c  --> doFloat  | c <- myFloats]
    , [title     =? t  --> doFloat  | t <- myTitleFloats]
    , [resource  =? r  --> doIgnore | r <- myIgnores]
--    , [className =? s  --> doTile   | s <- myTiles]
    ]
    where
    myFloats      = ["Gpick", "Chromium", "Gimp", "Volumeicon", "MPlayer", "Umplayer", "Gnome-mplayer", "Tintwizard", "Gsimplecal", "Vlc", "Lxrandr", "Arandr", "Audacious", "Deadbeef", "VirtualBox", "Firefox", "Firefox-bin", "Linux-fetion", "Gcalctool", "Gmlive", "Skype", "Ossxmix", "Pidgin", "Emesene", "Openfetion", "Vncviewer", "Cairo-dock", "RipperX", "Goldendict" ]
    myTitleFloats = ["Downloads", "Preferences", "Save As...", "QEMU", "emacs", "Add-ons", "Firefox", "Chromium", "Exe", "Options", "首选项", "Wicd Network Manager"]
    myIgnores     = ["trayer", "dzen", "stalonetray", "systray", "cairo-dock"]
--    myTiles       = ["tilda", "pcmanfm", "thunar", "dolphin", "lxterminal"]

myIconDir = "/home/zhou/.xmonad/dzen/layouts/"
myBorderWidth   = 0
myNormalBorderColor  = "#729fcf"
myFocusedBorderColor = "#7292cf"

myFont             = "xft:Droid Serif:pixelsize=9"
-- dzen settings:
dzFont             = "Terminus-8"
mySmallFont        = "OpenLogos-8"
-- workspace colors:
dzBgColor                     = "#FDF6E3"
dzFgColor                     = "#657B83"
myCurrentBGColor              = "#8FB3D9"
myCurrentFGColor              = "#002B36"
myCurrentCornerColor          = "#002B36"
myVisibleBGColor              = "#28618f"
myVisibleFGColor              = "white"
myVisibleCornerColor          = ""
myHiddenBGColor               = dzBgColor
myHiddenFGColor               = dzFgColor
myHiddenCornerColor           = "#DC322F"
myHiddenNoWindowsBGColor      = dzBgColor
myHiddenNoWindowsFGColor      = dzFgColor
myHiddenNoWindowsCornerColor  = ""
myUrgentBGColor               = ""
myUrgentFGColor               = "#DC322F"
myUrgentCornerColor           = "#002B36"

myStatusBar :: String
myStatusBar = "dzen2 -fn '" ++ dzFont ++ "' -fg '" ++ dzFgColor ++ "' -bg '" ++ dzBgColor ++ "' -e 'button3=' -h '18'  -ta l"
myConkyBar :: String
--myConkyBar = "conky | dzen2 -fg '" ++ dzFgColor ++ "' -bg '" ++ dzBgColor ++ "' -x '700' -h '20' -fn '" ++ dzFont ++ "' -sa c -ta r"
myConkyBar = "sleep 5; conky | dzen2 -e '' -h '18' -x '800' -ta r -fg '" ++ dzFgColor ++ "' -bg '" ++dzBgColor  ++ "'"
--mySysTray :: String
--mySysTray = "sleep 3; trayer --expand true  --alpha 0 --edge top --align right --SetDockType true --transparent flase --SetPartialStrut true --widthtype request --tint 0xffffff --height 18 --margin 65"

myLogHook h = dynamicLogWithPP $ defaultPP
      { ppCurrent   = \wsId -> rangeId wsId myCurrentCornerColor myCurrentBGColor myCurrentFGColor
        , ppHidden  = \wsId -> rangeId wsId myHiddenCornerColor myHiddenBGColor myHiddenFGColor
        , ppVisible = \wsId -> rangeId wsId myVisibleCornerColor myVisibleBGColor myVisibleFGColor
        , ppHiddenNoWindows = \wsId -> rangeId wsId myHiddenNoWindowsCornerColor myHiddenNoWindowsBGColor myHiddenNoWindowsFGColor
        , ppUrgent  = \wsId -> rangeId wsId myUrgentCornerColor myUrgentBGColor myUrgentFGColor
        , ppWsSep   = ""
        , ppSep     = " "
        , ppLayout  = dzenColor "#859900" "" .
                          (\ x -> case x of
                              "Tall"                   -> wrap "^ca(1,xdotool key super+space)" "^ca()" ("^i(" ++ myIconDir ++ "tile.xbm)")
                              "Mirror Tall"            -> wrap "^ca(1,xdotool key super+space)" "^ca()" ("^i(" ++ myIconDir ++ "tilebottom.xbm)")
--                              "magnifier"              -> "^i(/home/zhou/.xmonad/dzen/layouts/magnifier.xbm)"
                              "Full"                   -> wrap "^ca(1,xdotool key super+space)" "^ca()" ("^i(" ++ myIconDir ++ "fullscreen.xbm)")
                          ) 
        , ppTitle    = ("^fn(SimStone-8)" ++) . dzenColor dzFgColor dzBgColor . dzenEscape
        , ppOutput   = hPutStrLn h
      }
      where
        rangeId wsName cornerColor bgColor fgColor = let base=drop 2 wsName; corner=take 1 wsName; getid1=take 2 wsName; getid=drop 1 getid1 in "^ca(1,xdotool key super+" ++ getid ++ ")^fg(" ++ fgColor ++ ")^bg(" ++ bgColor ++ ") " ++ base ++ "^p(;-3)^fn(" ++ mySmallFont ++ ")^fg(" ++ cornerColor ++ ")" ++ corner ++ " ^fn()^p()^fg()^bg()^ca()" 

-- myWorkspaces = ["1:Term", "2:Surf", "3:Edit", "4:File", "5:View", "6:Pics"]
myWorkspaces = ["Q1Term", "I2Surf", "U3Edit", "T4File", "J5View", "A6Pics"]

--
-- Layouts
genericLayout = tiled 
              ||| Mirror tiled 
--              ||| magnifier (Tall 1 (3/100) (1/2)) 
              ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio = 1/2
     -- Percent of screen to increment by when resizing panes
     delta = 3/100
myLayout =  genericLayout

main :: IO ()
main = do
  spawn "/usr/libexec/polkit-gnome-authentication-agent-1"
  spawn "parcellite"
--  spawn "wide-client"
  spawn "nm-applet"
  spawn "volumeicon"
  spawn "tint2"
  spawn "urxvt"
  spawn "cairo-compmgr"  
  spawn "sleep 10 && fcitx"

  dzen <- spawnPipe myStatusBar
  spawn myConkyBar
--  spawn mySysTray
--  spawn "xcompmgr"

  xmonad $ ewmh defaultConfig {
         modMask = mod4Mask
       , focusFollowsMouse  = True
       , borderWidth = myBorderWidth
       , terminal = "urxvt"
       , manageHook = manageDocks <+> manageHook defaultConfig <+> myManageHook
       , logHook    = myLogHook dzen >> fadeInactiveLogHook 0xdddddddd
--       , logHook = ewmhDesktopsLogHook >> (dynamicLogWithPP $ myLogHook dzen)
--       , layoutHook = ewmhDesktopsEventHook $ avoidStruts $ myLayout
       , layoutHook = avoidStruts $ myLayout
       , workspaces = myWorkspaces
--       , workspaces = ["^ca(1,xdotool key super+1)^fn(OpenLogos-11)Q^ca()","^ca(1,xdotool key super+2)^fn(OpenLogos-12)I^ca()","^ca(1,xdotool key super+3)^fn(OpenLogos-11)U^ca()","^ca(1,xdotool key super+4)^fn(OpenLogos-11)T^ca()","^ca(1,xdotool key super+5)^fn(OpenLogos-11)J^ca()","^ca(1,xdotool key super+6)^fn(OpenLogos-11)A^ca()","^ca(1,xdotool key super+7)^fn(OpenLogos-13)R^ca()^fn(MingLiu-8)"]
      -- key bindings
       , keys               = myKeys
       , mouseBindings      = myMouseBindings
--       , handleEventHook = handleEventHook conf `mappend` fullscreenEventHook
       }

