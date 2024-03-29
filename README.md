# Papirus Themes for Claws Mail

<p align="center">
  <img src="https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-claws-mail-theme/master/preview.png" alt="Preview Papirus Themes Claws Mail"/>
</p>

## Installation

### Ubuntu and derivatives

You can install Papirus icon themes for Claws Mail from our official [PPA](https://launchpad.net/~papirus/+archive/ubuntu/papirus):

```
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install claws-mail-themes-papirus
```

or download .deb packages from [here](https://launchpad.net/~papirus/+archive/ubuntu/papirus/+packages?field.name_filter=claws-mail-themes-papirus).

### Arch Linux
You can install Papirus icon themes for Claws Mail from [AUR](https://aur.archlinux.org/) by installing [papirus-claws-mail-theme-git](https://aur.archlinux.org/packages/papirus-claws-mail-theme-git/) package:
```
pacaur -S papirus-claws-mail-theme-git
```

### Papirus Installer

Use the scripts to install the latest version directly from this repo (independently on your distro):

#### Install / Update

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-claws-mail-theme/master/install.sh | sh
```

#### Remove

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-claws-mail-theme/master/install.sh | env uninstall=true sh
```

### Third-party packages

Packages in this section are not part of the official repositories. If you have a trouble or a question please contact with package maintainer.

| **Distro** | **Maintainer** | **Package** |
|:-----------|:---------------|:------------|
| Arch Linux | Mohammadreza Abdollahzadeh | [papirus-claws-mail-theme-git](https://aur.archlinux.org/packages/papirus-claws-mail-theme-git) <sup>AUR</sup> |
| openSUSE   | Vinzenz Vietzke | [papirus-claws-mail-theme](http://software.opensuse.org/download.html?project=X11:common:Factory&package=papirus-claws-mail-theme) <sup>OBS [[link](https://build.opensuse.org/package/show/X11:common:Factory/papirus-claws-mail-theme)]</sub> |

**NOTE:** If you maintainer and want be in the list please create an issue or send a pull request.

###  Manual Install

1. Install dependencies:

    - git
    - make
    - librsvg2-bin

2. Run the following commands as normal user:

    ```
    git clone https://github.com/PapirusDevelopmentTeam/papirus-claws-mail-theme.git
    cd papirus-claws-mail-theme
    make build
    sudo make install
    ```

3. Start Claws Mail and choose a theme.
