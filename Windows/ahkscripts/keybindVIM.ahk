#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
+CapsLock::CapsLock
LCtrl::CapsLock
CapsLock::LCtrl
;Makes CapsLock become Ctrl. To retain the ability to turn CapsLock on and off, add the remapping +CapsLock::CapsLock first. This toggles CapsLock on and off when you hold down Shift and press CapsLock. Because both remappings allow additional modifier keys to be held down, the more specific +CapsLock::CapsLock remapping must be placed first for it to work. yess 

^h::Left
^j::Down
^k::Up
^l::Right

