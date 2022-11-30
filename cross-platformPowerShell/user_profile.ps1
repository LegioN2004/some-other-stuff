# ohmyposh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_modern.omp.json" | Invoke-Expression

#PSReadLine
 Set-PSReadLineOption -EditMode Emacs
 Set-PSReadLineOption -BellStyle none
 Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
 Set-PSReadLineOption -PredictionSource History

#Icons
Import-Module -Name Terminal-Icons 

#Fzf
 # Import-Module PSFzf
 # Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#Alias 
Set-Alias grep findstr 
Set-Alias ll ls
Set-Alias touch New-Item
Set-Alias v nvim
Set-Alias svim 'vim -u C:\Users\sunny\.SpaceVim\vimrc'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias vi 'C:\Program Files\Git\usr\bin\vi.exe'
Set-Alias vim 'C:\Program Files\Git\usr\bin\vim.exe'
Set-Alias svim 'vim -u C:\Users\sunny\.SpaceVim\vimrc'
# Set-Alias gv gvim
# Set-Alias nv neovide

# Utilities
function which ($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue |
     Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
} 

# Invoke-Expression (&starship init powershell)
