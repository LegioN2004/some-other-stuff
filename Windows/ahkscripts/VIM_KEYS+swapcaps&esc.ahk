#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

CapsLock & h::Left
CapsLock & j::Down
CapsLock & k::Up
CapsLock & l::Right
CapsLock & d::^x
CapsLock & y::^c
CapsLock & p::^v
CapsLock & u::^z
CapsLock & r::^y
CapsLock & i::F2
CapsLock & 0::Home
CapsLock & 4::End
LShift & RShift::CapsLock

CapsLock::Send {Escape}
