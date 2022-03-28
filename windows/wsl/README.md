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
### [oh my zsh](https://ohmyz.sh/)
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
### [oh my posh](https://ohmyposh.dev/docs/)
- [Get oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh/releases)
```sh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

sudo chmod +x /usr/local/bin/oh-my-posh
```

- Add following to ~/.zshrc:
```sh
export ohMyPoshThemesPaht="~/.oh-my-posh/themes"
export ohMyPoshTheme="wasck"
export ohMyPoshConfig="$ohMyPoshThemesPaht/$ohMyPoshTheme.omp.json"

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
### [Installation](https://docs.docker.com/engine/install/)
- Uninstall old versions
```sh
sudo apt remove docker docker-engine docker.io containerd runc
```
- Install dependencies
```sh
sudo apt update && sudo apt install ca-certificates curl gnupg  lsb-release
```
- Add Docker's official GPG key:
```sh
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
- Set up the stable repository
```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- Install Docker Engine
```sh
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Configuration
- Add current user to `docker` group
```sh
sudo usermod -aG docker $USER
```

- [wsl only] Shared directory for docker socket
```sh
DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
chgrp docker "$DOCKER_DIR"
```

- [wsl only] Daemon configuration file
```json
# paht: /etc/docker/daemon.json
{
  "hosts": ["unix:///mnt/wsl/shared-docker/docker.sock"],
  "iptables": false // disable so docker can use nftables
}
```

- [wsl only] Place following lines for launch script for `dockerd` in `.bashrc`, `.profile` or `.zshrc`
```sh
# see docker distro by running: wsl -l -q
DOCKER_DISTRO="Ubuntu-20.04"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"

export DOCKER_HOST="unix://$DOCKER_SOCK"

if [ ! -S "$DOCKER_SOCK" ]; then
    mkdir -pm o=,ug=rwx "$DOCKER_DIR"
    chgrp docker "$DOCKER_DIR"
    /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
fi
```

- For running `docker` from Windows add following lines to your PowerShell profile
```PowerShell
$DOCKER_DISTRO = "Ubuntu-20.04"
function docker {
    wsl -d $DOCKER_DISTRO docker -H unix:///mnt/wsl/shared-docker/docker.sock @Args
}
```

### Docker compose
- Installation
```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

- Apply executable permissions to the binary
```sh
sudo chmod +x /usr/local/bin/docker-compose
```
