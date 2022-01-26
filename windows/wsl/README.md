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

## Docker