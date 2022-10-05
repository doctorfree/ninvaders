## nInvaders

Ninvaders is an ncurses version of the Invaders video game.
The native installation packages are customized for integration with
[Asciiville](https://github.com/doctorfree/Asciiville).

The `ninvaders` package gets installed as part of the `Asciiville`
initialization process. See the
[Asciiville README](https://github.com/doctorfree/Asciiville#readme)
for more information.

Many of the [Doctorfree projects](https://github.com/doctorfree) are designed
to integrate with each other including
[Asciiville](https://github.com/doctorfree/Asciiville#readme),
[MirrorCommand](https://github.com/doctorfree/MirrorCommand#readme),
[MusicPlayerPlus](https://github.com/doctorfree/MusicPlayerPlus#readme), and
[RoonCommandLine](https://github.com/doctorfree/RoonCommandLine#readme).

## Table of Contents

1. [Requirements](#requirements)
1. [Installation](#installation)
1. [Removal](#removal)
1. [Quick start](#quick-start)
1. [Asking for help](#asking-for-help)
1. [Building ninvaders from source](#building-ninvaders-from-source)
1. [Contributing](#contributing)

## Requirements

Ninvaders is compiled and packaged for installation on:

- Arch Linux (x86_64)
- Fedora Linux (x86_64)
- Raspberry Pi OS (armhf)
- Ubuntu Linux (amd64)

## Installation

Ninvaders v1.0.0 and later can be installed on Linux systems using
the Arch packaging format, the Debian packaging format, or the Red Hat
Package Manager (RPM).

### Supported platforms

Ninvaders has been tested successfully on the following platforms:

- **Arch Linux 2022.07.01**
    - `ninvaders_<version>-<release>-x86_64.pkg.tar.zst`
- **Ubuntu Linux 20.04**
    - `ninvaders_<version>-<release>.amd64.deb`
- **Fedora Linux 36**
    - `ninvaders_<version>-<release>.x86_64.rpm`
- **Raspberry Pi OS**
    - `ninvaders_<version>-<release>.armhf.deb`

### Debian package installation

Many Linux distributions, most notably Ubuntu and its derivatives, use the
Debian packaging system.

To tell if a Linux system is Debian based it is usually sufficient to
check for the existence of the file `/etc/debian_version` and/or examine the
contents of the file `/etc/os-release`.

To install on a Debian based Linux system, download the latest Debian format
package from the
[ninvaders Releases](https://github.com/doctorfree/ninvaders/releases).

Install the ninvaders package by executing the command

```console
sudo apt install ./ninvaders_<version>-<release>.amd64.deb
```
or
```console
sudo dpkg -i ./ninvaders_<version>-<release>.amd64.deb
```

**NOTE:** In some cases you may see a warning message when installing the
Debian package. The message:

Repository is broken: ninvaders:amd64 (= <version-<release>) has no Size
information can safely be ignored. This is an issue with the Debian packaging
system and has no effect on the installation.

### RPM Package installation

Red Hat Linux, SUSE Linux, and their derivatives use the RPM packaging
format. RPM based Linux distributions include Fedora, AlmaLinux, CentOS,
openSUSE, OpenMandriva, Mandrake Linux, Red Hat Linux, and Oracle Linux.

To install on an RPM based Linux system, download the latest RPM format
package from the
[ninvaders Releases](https://github.com/doctorfree/ninvaders/releases).

Install the ninvaders package by executing the command

```console
sudo yum localinstall ./ninvaders_<version>-<release>.x86_64.rpm
```
or
```console
sudo rpm -i ./ninvaders_<version>-<release>.x86_64.rpm
```

### Arch Package installation

Arch Linux, Manjaro, and other Arch Linux derivatives use the Pacman packaging
format. In addition to Arch Linux, Arch based Linux distributions include
ArchBang, Arch Linux, Artix Linux, ArchLabs, Asahi Linux, BlackArch,
Chakra Linux, EndeavourOS, Frugalware Linux, Garuda Linux,
Hyperbola GNU/Linux-libre, LinHES, Manjaro, Parabola GNU/Linux-libre,
SteamOS, and SystemRescue.

To install on an Arch based Linux system, download the latest Pacman format
package from the
[ninvaders Releases](https://github.com/doctorfree/ninvaders/releases).

Install the ninvaders package by executing the command

```console
sudo pacman -U ./ninvaders_<version>-<release>-x86_64.pkg.tar.zst
```

## Removal

On Debian based Linux systems where the ninvaders package was installed
using the ninvaders Debian format package, remove the ninvaders
package by executing the command:

```console
    sudo apt remove ninvaders
```
or
```console
    sudo dpkg -r ninvaders
```

On RPM based Linux systems where the ninvaders package was installed
using the ninvaders RPM format package, remove the ninvaders
package by executing the command:

```console
    sudo yum remove ninvaders
```
or
```console
    sudo rpm -e ninvaders
```

On Arch based Linux systems where the ninvaders package was installed
using the ninvaders Pacman format package, remove the ninvaders
package by executing the command:

```console
    sudo pacman -Rs ninvaders
```

The ninvaders package can be removed by executing the "Uninstall"
script in the ninvaders source directory:

```console
    git clone https://github.com/doctorfree/ninvaders.git
    cd ninvaders
    ./Uninstall
```

## Building ninvaders from source

Ninvaders can be compiled, packaged, and installed from the source code
repository. This should be done as a normal user with `sudo` privileges:

```
# Retrieve the source code from the repository
git clone https://github.com/doctorfree/ninvaders.git
# Enter the ninvaders source directory
cd ninvaders
# Compile the ninvaders components and create an installation package
./mkpkg
# Install ninvaders and its dependencies
./Install
```

These steps are detailed below.

### Clone ninvaders repository

```
git clone https://github.com/doctorfree/ninvaders.git
cd ninvaders
```

**[Note:]** The `mkpkg` script in the top level of the ninvaders
repository can be used to build an installation package on all supported
platforms. After cloning, `cd ninvaders` and `./mkpkg`. The resulting
installation package(s) will be found in `./releases/<version>/`.

### Install packaging dependencies

ninvaders components have packaging dependencies on the following:

On Debian based systems like Ubuntu Linux, install packaging dependencies via:

```
sudo apt install dpkg
```

On RPM based systems like Fedora Linux, install packaging dependencies via:

```
sudo dnf install rpm-build rpm-devel rpmlint rpmdevtools
```

### Build and package ninvaders

To build and package ninvaders, execute the command:

```
./mkpkg
```

On Debian based systems like Ubuntu Linux, the `mkpkg` scripts executes
`scripts/mkdeb.sh`.

On RPM based systems like Fedora Linux, the `mkpkg` scripts executes
`scripts/mkrpm.sh`.

On PKGBUILD based systems like Arch Linux, the `mkpkg` scripts executes
`scripts/mkaur.sh`.

### Install ninvaders from source build

After successfully building and packaging ninvaders with either
`./mkpkg`, install the ninvaders package with the command:

```
./Install
```

## Contributing

There are a variety of ways to contribute to the ninvaders project.
All forms of contribution are appreciated and valuable. Also, it's fun to
collaborate. Here are a few ways to contribute to the further improvement
and evolution of ninvaders:

### Testing and Issue Reporting

ninvaders is fairly complex with many components, features, options,
configurations, and use cases. Although currently only supported on
Linux platforms, there are a plethora of Linux platforms on which
ninvaders can be deployed. Testing all of the above is time consuming
and tedious. If you have a Linux platform on which you can install
ninvaders and you have the time and will to put it through its paces,
then issue reports on problems you encounter would greatly help improve the
robustness and quality of ninvaders. Open issue reports at
[https://github.com/doctorfree/ninvaders/issues](https://github.com/doctorfree/ninvaders/issues)

### Sponsor ninvaders

ninvaders is completely free and open source software. All of the
ninvaders components are freely licensed and may be copied, modified,
and redistributed freely. Nobody gets paid, nobody is making any money,
it's a project fully motivated by curiousity and love of music. However,
it does take some money to procure development and testing resources.
Right now ninvaders needs a multi-boot test platform to extend support
to a wider variety of Linux platforms and potentially Mac OS X.

If you have the means and you would like to sponsor ninvaders development,
testing, platform support, and continued improvement then your monetary
support could play a very critical role. A little bit goes a long way
in ninvaders. For example, a bootable USB SSD device could serve as a 
means of porting and testing support for additional platforms. Or, a
decent cup of coffee could be the difference between a bug filled
release and a glorious musical adventure.

Sponsor the ninvaders project at
[https://github.com/sponsors/doctorfree](https://github.com/sponsors/doctorfree)

### Contribute to Development

If you have programming skills and find the management and ease-of-use of
digital music libraries to be an interesting area, you can contribute to
ninvaders development through the standard Github "fork, clone,
pull request" process. There are many guides to contributing to Github hosted
open source projects on the Internet. A good one is available at
[https://www.dataschool.io/how-to-contribute-on-github/](https://www.dataschool.io/how-to-contribute-on-github/). Another short succinct guide is at
[https://gist.github.com/MarcDiethelm/7303312](https://gist.github.com/MarcDiethelm/7303312).

Once you have forked and cloned the ninvaders repository, it's time to
setup a development environment. Although many of the ninvaders commands
are Bash shell scripts, there are also applicatons written in C and C++ along
with documentation in Markdown format, configuration files in a variety of
formats, examples, screenshots, video demos, build scripts, packaging, and more.

To compile `ninvaders` from source, run the command:

```
./build
```

On Debian (e.g. Ubuntu), PKGBUILD (e.g. Arch) and RPM (e.g. Fedora) based
systems the ninvaders installation package can be created with the
`mkpkg` scripts. The `mkpkg` script determines which platform it is on
and executes the appropriate build and packaging script in the `scripts/`
directory. These scripts invoke the build scripts for each of the projects
included with ninvaders, populate a distribution tree, and call the
respective packaging utilities. Packages are saved in the
`./releases/<version>/` folder. Once a package has been created
it can be installed with the `Install` script.

It's not necessary to have C/C++ expertise to contribute to ninvaders
development. Many of the ninvaders commands are Bash scripts and require
no compilaton. Script commands reside in the `bin` and `share/scripts`
directories. To modify a shell script, install ninvaders and edit the
`bin/<script>` or `share/scripts/<script.sh>` you wish to improve.
After making your changes simply copy the revised script to `/usr/bin`
or `/usr/share/ninvaders/scripts` and test your changes.

Feel free to email me at github@ronrecord.com with questions or comments.



## COMPILING

Install dependencies (here Ubuntu example):

```
apt-get install cmake libncurses-dev
```

Now you ready to build:
```
cmake -B cmake_build
cmake --build cmake_build -j2
```

Compiled binary `ninvaders` will be in `cmake_build` directory.

## CONTROL KEYS

Controlling nInvaders is really simple. Just press the cursor left/right keys 
to move it left or right, and press space to fire. The esc-key lets you quit 
at any time you want.

## COMMAND LINE OPTIONS

nInvaders accepts the following command line options
-l x  where x is your skill as a number between 0 (nightmare) and 9 (may i
      play daddy)
-gpl prints out the license information.

Any other option gives you a help screen.

## LICENSING

nInvaders is protected under the laws of the GPL and other countries. Any re-
distribution, reselling or copying is strictly allowed. You should have received
a copy of it with this package, if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
Or just start nInvaders with the -gpl option to learn more.

[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-blue.svg)](https://www.gnu.org/licenses/gpl-2.0)
