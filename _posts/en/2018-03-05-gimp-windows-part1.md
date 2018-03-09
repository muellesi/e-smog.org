---
title: Building Gimp for Windows Part 1 - First build
date: 2018-03-05 20:22
categories: en Gimp-Build Programming
kramdown:
  parse_block_html: true
image: assets/post_images/wilber_puzzle.png
---
When I first tried to build GIMP for Windows, I felt kind of lost - I did not find a single Tutorial that was working without any errors. And as someone who did some programming on Windows before but is a complete beginner when it comes to the GNU/Linux way of compiling C-programs, it took me a while until I finally got a working result.

Now that I have the feeling to have figured out at least the most important things, I want to share this knowledge and hope, it will maybe help someone else down the line sometimes. This first part of the tutorial will show you how to compile GIMP for yourself. In subsequent tutorials, I will show you how to integrate the GCC toolchain in [Visual Studio Code](https://www.visualstudio.com/de/) in order to get some kind of simple IDE for the whole process of bug hunting and fixing.
<!--more-->

There is a short tutorial on [wiki.gimp.org](https://wiki.gimp.org/wiki/Hacking:Building/Windows#Building_GIMP_natively_under_Windows_using_MSYS2) that guides you through the most basic steps of building Gimp but it a bit old and is therefore missing some important steps. I will try to stay as close as possible to that tutorial for most of the basic things like setting up a basic build environment and simply add information where it is needed.

## Setup 

Since GIMP's build process requires the GCC toolchain to be available on the build system, Gimp could not be built natively on Windows until recently. This changed with Windows 10's optional Ubuntu Subsystem but since not everyone uses Windows 10 yet, this Tutorial will still use the 'old' approach of using [MSYS2](https://www.msys2.org/) to get the required build essentials. 

### Setting up an MSYS2 build environment
Basically, MSYS2 emulates a Linux environment with full support of Arch Linux' 'pacman' package manager. When downloading, make sure to use the 64 bit version of MSYS2 if your system supports it - there is no advantage of using the 32bit version and I will focus on building GIMP for 64 bit systems anyways.

**Info:** You can install MSYS2 wherever you want but for simplicities sake, I will assume that it is located in a direct subfolder of the C: drive. Also be careful not to use a path that contains spaces since this could lead to strange problems later on.
{: class="hint"}


After you've installed MSYS2, let's have a quick look at its root folder: You will see that there are four executables: 
* msys2.exe - this is the exectuable that we will use for basic setup
* mingw32/64.exe - those are the executables we will use when building GIMP (mingw64.exe probably only exists on your system if you installed the 64bit version of MSYS2)
* maintenancetool.exe

If you didn't already start the MSYS2 shell after the installation, do this now by running the cmd script `msys2_shell.cmd` from the MSYS2 root directory. At the the first start, MSYS2 will create a home directory for your current Windows Username in `C:\MSYS2\home\`. 

#### Updating

The first thing to do after installing MSYS2 is to upgrade all the packages that come preinstalled with it. This procedure is explained in detail on the MSYS2 homepage, so I will keep this part as short as possible and only show you the needed commands. For more information on updating/upgrading MSYS2, please refer to the [MSYS2 website](https://www.msys2.org/) and to [this tutorial](https://github.com/msys2/msys2/wiki/MSYS2-installation) directly. 

First, start msys2.exe and use the following command to trigger an update of pacman's package index and a first package upgrade. The upgrade will happen in multiple stages, so simply follow the instructions in the terminal.

~~~ bash
pacman -Syu
~~~

After successful completion of the first step, close the terminal and start msys2_shell.cmd again. Now use the following command for the second update step. Again, follow the instructions in your terminal if there are any.

~~~ bash
pacman -Su
~~~

After you are done with this, you can simply close the MSYS2 shell - we will not need it for any of the upcoming steps.

### GIMP specific Setup

With a freshly updated MSYS2 environment, we can now start installing dependencies that will be needed for our first GIMP build. As mentioned above, all steps that follow will not be executed in the global MSYS2 environment. Instead we will use the mingw64 environment because our build is supposed to support 64 bit. So start mingw64.exe from the MSYS2 root folder and run the following command:

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
This will install a whole lot of libraries and software that is needed for building GIMP.

As you can see, most library-packages start with `mingw-w64-x86_64-` so if you later encounter a missing dependency during compiling, you can first try to install it via `pacman -S mingw-w64-x86_64-PACKAGENAME`.
{: class="hint"}


#### Setting up the environment
Now that we have most of the necessary dependencies installed, we can start with actually doing something ourselves. 

##### Directory structure and environment variables
As already mentioned, MSYS2 created a home directory for your current Windows username in `C:\MSYS2\home` this directory can be accessed via the tilde shortcut, just like on any linux system. Since this is a good way of keeping the paths nice and short, we will now use this new home directory for building GIMP. But just in case we want to use MSYS2 for some other projects later on, we will not use the home directory directly but create a subfolder named `gimp_x64` instead. Inside this folder, we create a new file called `setup.sh` with the following content

{% highlight bash linenos %}
#!/bin/bash
# If you did not use the same folder names as in the tutorial, change this
export DEVROOT=`realpath ~/gimp_x64`
export PREFIX=$DEVROOT/build
export SRC_DIR=$DEVROOT/src

# Modify environment variables according to the definitions above
export PATH="$PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"

# Create the prefix and source directories
mkdir -p $PREFIX
mkdir -p $SRC_DIR

# Some more environment variables
export BINARY_PATH=$PREFIX/bin
mkdir -p $BINARY_PATH
export INCLUDE_PATH=$PREFIX/inc
mkdir -p $INCLUDE_PATH
export LIBRARY_PATH=$PREFIX/lib
mkdir -p $LIBRARY_PATH
export CPATH="$INCLUDE_PATH"
export CFLAGS="-ggdb" # build with debug symbols
export MAKEFLAGS="-j4" # use 4 tasks while building

# Echo all changed environment variables to make sure they are correct
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
{% endhighlight %}

## Building
For now, we will build GIMP and its most volatile dependencies by hand and from the command line since this will give you a good feeling for what requirements there are and the problems that could possibly arise.

#### Libmypaint
Since GIMP supports the use of Mypaint brushes for some time now, you will need libmypaint 1.3.0 to build the latest git master of GIMP.

Don't use any other version than 1.3.0! If you do so, GIMP's compilation will most likely fail and sometimes it can be hard to find the problem.
{: class="attention"}

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

#### Mypaint-Brushes
A relatively new dependency is mypaint-brushes. Jehan created a git repository with the intent to collect those brushes in one place for other projects to use it instead of each of them shipping their own copy of the brushes. Building this package mostly consists of copying the brushes to your `$PREFIX` so it is fairly quick. 

Since we used the 1.3 version of libmypaint before, we also have to use the 1.3 version of the brushes now. Failing to do so will result in a segfault when trying to start GIMP.
{: class="attention"}

~~~ bash
git clone https://github.com/Jehan/mypaint-brushes.git
cd mypaint-brushes
git fetch --all --tags --prune
git checkout origin/v1.3.x -b Branch_v1.3.x
./autogen.sh
./configure --prefix=$PREFIX
make
make install
~~~

#### Babl
[Babl](https://gegl.org/babl) is the library that is used internally to convert between different color models. It is a fairly small library so its build process is also very quick.
~~~ bash
git clone git://git.gnome.org/babl
cd babl
./autogen.sh --prefix=$PREFIX --disable-docs
make
make install
cd ..
~~~

#### GEGL
[GEGL](https://gegl.org) is a "data flow based image processing framework" that finds more and more use inside of GIMP. Its main advantage is that it is really fast and can therefore be used to provide non-destructive image manipulations.
~~~ bash
git clone git://git.gnome.org/gegl
cd gegl
./autogen.sh --prefix=$PREFIX --enable-gtk-doc-html=no --disable-docs
make
make install
cd ..
~~~
Building GEGL will take quite a bit longer than building the previous three libraries, so don't panic if it takes a while .

#### And finally: GIMP itself
Once all of the above dependencies are compiled and installed without any errors, we should be able to compile GIMP itself now. The basic procedure is exactly the same as for the dependencied before: `git clone`, `autogen`, `make`, `make install`:
~~~ bash
git clone git://git.gnome.org/gimp
cd gimp
./autogen.sh --prefix=$PREFIX --disable-python --disable-gtk-doc --with-gimpdir=GIMP/git-master
make
make install
cd ..
~~~

As you can see, we pass the option `--with-gimpdir=GIMP/git-master` to the autogen-script. This changes the path that our newly built GIMP will use to store its user settings.
{: class="hint"}

Building GIMP in a clean working directory for the first time will probably take a lot of time. Luckily we don't need to rebuild every part of GIMP for every single code change so subsequential builds will most likely be much faster.


## Troubleshooting

So you did everything exactly as described above and suddenly you encounter an error. What do you do now? First of all, don't panic! Instead, check which step failed exactly and scroll through the console output to find any possible error messages.

### Fail in autogen/configure

#### Missing dependency
As described [above](#), first try to install the missing dependency via pacman. Keep in mind that the dependency might have a version number attached to its name. You can also search pacman's package repositories for a string by using `pacman -Fs SEARCHSTRING`

#### A library that you compiled yourself is not found or the wrong version
* Did you run make install for the missing dependency?
* Check, whether all your environment variables have the correct contents. If you restarted the terminal after running the setup script, you always need to re-run it to set up the correct environment again.