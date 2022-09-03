
#Prompt
Import-Module posh-git 
Import-Module oh-my-posh 
Set-PoshPrompt takuya

#PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle none
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#Icons
Import-Module -Name Terminal-Icons 

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#Alias 
Set-Alias grep findstr 
Set-Alias ll ls
Set-Alias g git
Set-Alias touch New-Item
Set-Alias svim 'vim -u C:\Users\sunny\Downloads\.SpaceVim\vimrc'
Set-Alias nvimrc 'nvim C:\Users\sunny\AppData\Local\nvim\init.vim'
Set-Alias v nvim
#.. git aliases
# Set-Alias gcl git clone --depth 1
# Set-Alias gi git init
# Set-Alias ga git add
# Set-Alias gc git commit -m
# Set-Alias gp git push #add branch name if needed
# Set-Alias gs git status


#Utilities
function which ($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue |
     Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
} 

#starship
# Invoke-Expression (&starship init powershell)
