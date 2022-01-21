# Modules
Import-Module posh-git

# Set oh-my-posh
$ohMyPoshPath = '~/.oh-my-posh/'
$ohMyPoshThemesPath = $ohMyPoshPath + 'themes/'
$ohMyPoshTheme = 'wasck_dark'
$ohMyPoshThemeConfiguration = $ohMyPoshThemesPath + $ohMyPoshTheme + '.omp.json'

oh-my-posh --init --shell pwsh --config $ohMyPoshThemeConfiguration | Invoke-Expression
Enable-PoshTransientPrompt

# Aliases
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name Loc-ETC -Value goToEtc

function goToEtc {
  Set-Location "C:\Windows\System32\drivers\etc"
}
