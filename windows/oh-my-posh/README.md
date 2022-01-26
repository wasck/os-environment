# Oh my posh

# Windows
## Chocolatey
- Installation
  ```PowerShell
  choco install oh-my-posh
  ```
- Update
  ```PowerShell
  choco upgrade oh-my-posh
  ```

# Configuration
- Create `.oh-my-posh` in your home directory
```Shell
mkdir ~/.oh-my-posh
```
- Copy the `wasck.omp.json` theme and paste it under a themes direcory in `~/.oh-my-posh`
```Shell
mkdir ~/.oh-my-posh/themes
cp ./wasck.omp.json ~/.oh-my-posh/themes
```
- In PowerShell Profile add the following:
```PowerShell
# oh-my-posh configuration
$ohMyPoshPath = '~/.oh-my-posh/'
$ohMyPoshThemesPath = $ohMyPoshPath + 'themes/'
$ohMyPoshTheme = 'wasck_dark'
$ohMyPoshThemeConfiguration = $ohMyPoshThemesPath + $ohMyPoshTheme + '.omp.json'

oh-my-posh --init --shell pwsh --config $ohMyPoshThemeConfiguration | Invoke-Expression
Enable-PoshTransientPrompt
```

- In case you are not able to see username and hostname change the following in `wasck.omp.json`:
```Json
// from
"template": "{{ .Env.USERNAME }} <p:mint-green,>\u2022</> {{ .Env.COMPUTERNAME }} \u27E9 "
// to
"template": "{{ .UserName }} <p:mint-green,>\u2022</> {{ .HostName }} \u27E9 ",
```