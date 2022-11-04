import XMonad

--MANAGE HOOKS
import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers

--KEYBINDINGS
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

--LAYOUT EXTRAS
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

--XMOBAR
import XMonad.Hooks.DynamicLog


main :: IO()
--main = xmonad . ewmh =<< statusBar "dzen2 -ta l -w 768" myDzenPP defToggleStrutsKey myConfig
main = xmonad . ewmh =<< statusBar "xmobar" myXmobarPP defToggleStrutsKey myConfig
    where
    defToggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
    defToggleStrutsKey XConfig{modMask = modm} = (modm, xK_b)

myConfig = def
    {
      modMask		 = mod4Mask -- Makes WindowsKey the Modkey
    , layoutHook	 = myLayout --Uses custom layout
    , terminal		 = "alacritty"
    , manageHook     = myManageHook --Actions bound to certain windows
    , focusedBorderColor = "#6b2ec0"
    , borderWidth = 2
    }
    `additionalKeysP`
    --RUNNER & CLIPBOARD
    [("M-r", spawn "rofi -show run &"), 
     ("M-v", spawn "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}' &"),
    --AUDIO CONTROLS
     ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5% &"),
     ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5% &"),
     ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    --BRIGHTNESS CONTROLS
     ("<XF86MonBrightnessUp>" , spawn "xbacklight -inc 5 &"),
     ("<XF86MonBrightnessDown>" , spawn "xbacklight -dec 5 &"),
    --HIBERNATE
     ("M-C-h", spawn "systemctl hibernate &"),
    --SCREENSHOT
     ("<Print>", spawn "flameshot gui &"),
    --FILEMANAGER
     ("M-f", spawn "alacritty -e vifm &")
     ]

myLayout = spacing 6 tiled ||| noBorders Full
    where
     tiled = Tall nmaster delta ratio
     nmaster = 1	--Number of windows in master pane
     ratio = 1/2	--Proportion occupied by master
     delta = 3/100	--Percent increase of master window
myManageHook :: ManageHook
myManageHook = composeAll
    [className =? "Gcolor3" --> doFloat,
     isDialog   --> doFloat]

myXmobarPP :: PP
myXmobarPP = def{
    ppCurrent = xmobarColor "#ff3571" "" . wrap "" "",
    ppTitle   = xmobarColor "#50fa7b"  "" . shorten 30,
    ppHidden  = wrap "" ""
    }
myDzenPP :: PP
myDzenPP = def{
    ppCurrent = wrap " ^fg(#ff3571)" "^fg()",
    ppTitle   = wrap "^fg(#50fa7b)" "^fg()" . shorten 30,
    ppHidden  = wrap " " "",
    ppLayout  = take 0
    }
