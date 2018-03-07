---
title: Building Gimp for Windows Part 1 - First build
date: 2018-03-05 20:22
categories: en Gimp Programming
kramdown:
  parse_block_html: true
---

Building GIMP for Windows seems like a tedious task at first - there seems to be no current information about which requirements have to be met and what to do in which order. There is a short tutorial on [wiki.gimp.org](https://wiki.gimp.org/wiki/Hacking:Building/Windows#Building_GIMP_natively_under_Windows_using_MSYS2) that guides you through the most basic steps of building Gimp so I will  refer to that tutorial for most of the basic things like setting up a basic build environment.

After the basic setup I will guide you through the necesseary steps to integrate the needed build steps into Visual Studio Code. This will enable you to build and debug GIMP from within VS Code.

<!--more-->
## Setup 

### Setting up an MSYS2 build environment
Until recently, Gimp couldl not be built natively on Windows. Its build process requires certain tools to be available on the build system that do not come with a typical windows installation. This changed with Windows 10's optional Ubuntu Subsystem but since not everyone uses Windows 10 yet, this Tutorial will still use the 'old' approach of using [MSYS2](http://www.msys2.org/) to get the required build essentials. Basically, MSYS2 emulates a Linux environment with full support of Arch Linux' 'pacman' package manager. When downloading, make sure to use the 64 bit version of MSYS2 if your system supports it - there is no advantage of using the 32bit version.

**Info:** You could install MSYS2 wherever you want but from this point I will assume that it is located in a direct subfolder of the C: drive to make paths shorter. Also be carful not to use a path that contain spaces since this could lead to strange problems later on.
{: class="hint"}

After you've installed MSYS2, let's have a quick look at its root folder: You will see that there are four executables: 
* msys2.exe - this is the exectuable that we will use for basic setup
* mingw32/64.exe - those are the executables we will use when building GIMP (mingw64.exe probably only exists on your system if you installed the 64bit version of MSYS2)
* maintenancetool.exe

msys will create home dir with user



Update packages:

msys2: 
~~~ bash
pacman -Syu
~~~
follow instructions

~~~ bash
pacman -Su
~~~
follow instructions


### GIMP specific Setup

With an up-to-date MSYS2 environment, we can now start installing dependencies that we will need for our first GIMP build. As mentioned above, all steps that follow will be done in the mingw64 environment. So make sure, you used the mingw64 executable 
~~~ bash
pacman -S base-devel \
mingw-w64-x86_64-toolchain \
git \
mingw-w64-x86_64-gtk2 \
mingw-w64-x86_64-json-glib \
mingw-w64-x86_64-json-c \
mingw-w64-x86_64-gexiv2 \
mingw-w64-x86_64-lcms2 \
mingw-w64-x86_64-glib-networking
~~~


#### Setting up the environment
build-setup.sh

~~~ bash
#!/bin/sh
#Gimp build
export PREFIX=`realpath ~/gimp_dev/build`
export PATH="$PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export SRC_DIR=~/gimp_dev/src

mkdir -p $PREFIX
mkdir -p $SRC_DIR

export BINARY_PATH=$PREFIX/bin
mkdir -p $BINARY_PATH
export INCLUDE_PATH=$PREFIX/inc
mkdir -p $INCLUDE_PATH
export LIBRARY_PATH=$PREFIX/lib
mkdir -p $LIBRARY_PATH
export CPATH="$INCLUDE_PATH"
export CFLAGS="-ggdb"
export MAKEFLAGS="-j4"

echo "Setup complete, environment variables have been set:"
echo "PREFIX:" $PREFIX
echo "SRC_DIR:" $SRC_DIR
echo "PKG_CONFIG_PATH:" $PKG_CONFIG_PATH
echo "LD_LIBRARY_PATH:" $LD_LIBRARY_PATH
echo "BINARY_PATH:" $BINARY_PATH
echo "INCLUDE_PATH:" $INCLUDE_PATH
echo "LIBRARY_PATH:" $LIBRARY_PATH
echo "CPATH:" $CPATH
echo "CFLAGS:" $CFLAGS
~~~

## Building
For now, we will build GIMP and its most volatile dependencies by hand and from the command line since this gives you a good feeling for what requirements there are for the GIMP build to succeed.

#### Libmypaint

~~~ bash
git clone https://github.com/mypaint/libmypaint.git
cd libmypaint
git fetch --all --tags --prune
git checkout tags/v1.3.0 -b Branch_v1.3.0
./autogen.sh 
./configure --prefix=$PREFIX
make
make install
cd ..
~~~

~~~ bash
git clone https://github.com/Jehan/mypaint-brushes.git
cd mypaint-brushes
git fetch --all --tags --prune
git checkout origin/v1.3.x -b Branch_v1.3.x

~~~

~~~ bash
git clone git://git.gnome.org/babl
cd babl
./autogen.sh --prefix=$PREFIX --disable-docs
make
make install
cd ..
~~~

~~~ bash
git clone git://git.gnome.org/gegl
cd gegl
./autogen.sh --prefix=$PREFIX --enable-gtk-doc-html=no --disable-docs
make
make install
cd ..
~~~

~~~ bash
git clone git://git.gnome.org/gimp
cd gimp
./autogen.sh --prefix=$PREFIX --disable-python --disable-gtk-doc --with-gimpdir=GIMP/git-master
make
make install
cd ..
~~~

*[MSYS2]: MSYS2 is an independent rewrite of msys and mingw64. It has nothing to do with msys as you might know it from od mingw32 installations.