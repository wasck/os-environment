# WSL Environmant

- Install Ubuntu. See [WSL installation](https://docs.microsoft.com/de-de/windows/wsl/install)

- Update Ubuntu
```sh
sudo apt update && sudo apt upgrade -y
```

- Install packages
```sh
sudo apt install vim zsh htop git wget curl
```

## Shell
### oh my zsh
- Install oh my zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
```

- Add zsh-autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
```

- Add `zshrc` configuration
```sh
cp zshrc ~/.zshrc
```
### oh my posh
- Get oh-my-posh
```sh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

sudo chmod +x /usr/local/bin/oh-my-posh
```

- Add following to ~/.zshrc:
```sh
export ohMyPoshThemesPaht="~/.oh-my-posh/themes"
export ohMyPoshTheme="wasck"
export ohMyPoshConfig="$ohMyPoshThemesPaht/$ohMyPoshTheme.omp.json"
export_poshconfig "$ohMyPoshConfig" json
eval "$(oh-my-posh --init --shell zsh --config $ohMyPoshConfig)"
```

- Comment zsh default theme
```sh
# ZSH_THEME="bureau"
```

- Reload zsh profile:
```sh
source ~/.zshrc
```
## Docker