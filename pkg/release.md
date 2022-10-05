Ninvaders is an NCurses text-based version of the Invaders video game.

This release of ninvaders adds support for:

* Installation as a separate standalone package on multiple platforms
* Create packaging for Arch Linux, Fedora, Ubuntu, and Raspberry Pi OS
* Integrated features and customizations from Asciiville
* Ported to Arch Linux

## Installation

Download the [latest Debian, Arch, or RPM package format release](https://github.com/doctorfree/ninvaders/releases) for your platform.

Install the package on Debian based systems by executing the command:

```bash
sudo apt install ./ninvaders_1.0.0-1.amd64.deb
```

or, on a Raspberry Pi:

```bash
sudo apt install ./ninvaders_1.0.0-1.armhf.deb
```

Install the package on Arch Linux based systems by executing the command:

```bash
sudo pacman -U ./ninvaders-v1.0.0r1-1-x86_64.pkg.tar.zst
```

Install the package on RPM based systems by executing the following command:

On Fedora Linux:

```bash
sudo yum localinstall ./ninvaders_1.0.0-1.fc36.x86_64.rpm
```

### PKGBUILD Installation

To rebuild this package from sources on Arch Linux, extract `ninvaders-pkgbuild-1.0.0-1.tar.gz` and use the `makepkg` command to download the sources, build the binaries, and create the installation package:

```
tar xzf ninvaders-pkgbuild-1.0.0-1.tar.gz
cd ninvaders
makepkg --force --log --cleanbuild --noconfirm --syncdeps
```

## Removal

Removal of the package on Debian based systems can be accomplished by issuing the command:

```bash
sudo apt remove ninvaders
```

Removal of the package on RPM based systems can be accomplished by issuing the command:

```bash
sudo yum remove ninvaders
```

Removal of the package on Arch Linux based systems can be accomplished by issuing the command:

```bash
sudo pacman -Rs ninvaders
```

## Building ninvaders from source

ninvaders can be compiled, packaged, and installed from the source code repository. This should be done as a normal user with `sudo` privileges:

```
# Retrieve the source code from the repository
git clone https://github.com/doctorfree/ninvaders.git
# Enter the ninvaders source directory
cd ninvaders
# Compile ninvaders and create an installation package
./mkpkg
# Install ninvaders and its dependencies
./Install
```

The `mkpkg` script detects the platform and creates an installable package in the package format native to that platform. After successfully building ninvaders, the resulting installable package will be found in the `./releases/<version>/` directory.

## Changelog

Changes in version 1.0.0 release 1 include:

* Installation as a separate standalone package on multiple platforms
* Integrated features and customizations from Asciiville
* Create packaging for Arch Linux, Fedora, Ubuntu, and Raspberry Pi OS
* Ported to Arch Linux

See [ChangeLog](https://github.com/doctorfree/ninvaders/blob/master/ChangeLog) for a full list of changes in every ninvaders release
