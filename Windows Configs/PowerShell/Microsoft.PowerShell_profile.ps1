$env:POSH_THEMES_PATH = "C:\Program Files (x86)\oh-my-posh\themes"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression

zoxide init powershell | Out-String | Invoke-Expression

Set-Alias ll eza
Set-Alias cat bat -Force

Set-PSReadLineOption -EditMode Windows

Import-Module Terminal-Icons

function reload-profile { & $PROFILE }
function conf-profile { nvim $PROFILE }
