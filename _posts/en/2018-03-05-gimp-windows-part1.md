---
title: Building Gimp for Windows Part 1
date: 2018-03-05 20:22
categories: Gimp Programming
kramdown:
  parse_block_html: true
---

Building GIMP for Windows seems like a tedious task at first - there seems to be no current information about which requirements have to be met and what to do in which order. There is a short tutorial on [wiki.gimp.org](https://wiki.gimp.org/wiki/Hacking:Building/Windows#Building_GIMP_natively_under_Windows_using_MSYS2) that guides you through the most basic steps of building Gimp so I will  refer to that tutorial for most of the basic things like setting up a basic build environment.

After the basic setup I will guide you through the necesseary steps to integrate the needed build steps into Visual Studio Code. This will enable you to build and debug GIMP from within VS Code.

<!--more-->

### Setting up a basic build environment
Gimp cannot be build on Windows natively. Its build process requires certain tools to be available on the build system that do not come with a typical windows installation. In order to get these tools, we will download [MSYS2](http://www.msys2.org/), which essentially emulates a Linux environment and therefore contains most of the tools and libraries that are required to build GIMP on a Windows system.

**Hint:** You can install MSYS2 wherever you want but from this point I will assume that it is installed on the C: drive to make paths shorter.
{: class="hint"}

