# Modules
Import-Module posh-git

# Set oh-my-posh
$ohMyPoshPath = '~/.oh-my-posh/'
$ohMyPoshThemesPath = $ohMyPoshPath + 'themes/'
$ohMyPoshTheme = 'stelbent.minimal'
$ohMyPoshThemeConfiguration = $ohMyPoshThemesPath + $ohMyPoshTheme + '.omp.json'

oh-my-posh --init --shell pwsh --config $ohMyPoshThemeConfiguration | Invoke-Expression

# Aliases
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name Loc-ETC -Value goToEtc

function goToEtc {
  Set-Location "C:\Windows\System32\drivers\etc"
}
