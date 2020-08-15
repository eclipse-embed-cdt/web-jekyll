---
title: How to install the Eclipse prerequisites
permalink: /plugins/prerequisites/

toc: false
comments: true
keywords:
  - npm
  - xpack
  - install

jdk: 14

date: 2017-10-09 14:14:00 +0300
last_updated: 2020-07-14 16:41:36 +0300

---

## Overview

The main prerequisite to run the Eclipse Embedded CDT is **Java**. Generally
Java is not available by default on most platforms, and requires a separate
installation.

Although not mandatory, but highly recommended, the second prerequisite
is **xpm** (the xPack Package Manager), which is a **Node.js**
portable application.

To build projects, on Windows it is necessary to install **make**, available
from the **Windows Build Tools**.

To build Arm projects, an **Arm toolchain** is required; similarly, for
RISC-V projects, a **RISC-V toolchain** is required.

To debug projects, a JTAG probe is necessary together with the software
to access it,
for example the **SEGGER J-Link** software, or **OpenOCD**.

To run debug sessions without actual hardware, the **QEMU Arm** emulator is
necessary (the blinky tutorial mandates it).

All of these additional tools can be installed as xPacks, which makes
**xpm** a very convenient tool.

## Prerequisites

The following section covers the common Windows/macOS/Linux platforms;
for a wider range of platforms, see the **Alternate solutions** below.

{% capture openjdk %}
The recommended package is the latest version from the official
[Oracle **OpenJDK** page](https://openjdk.java.net).

Follow the **Download** link in the Oracle page, which currently points to
[jdk.java.net/{{ page.jdk }}](https://jdk.java.net/{{ page.jdk }}).
{% endcapture %}

{% capture windows %}

{{ openjdk }}

In the **Builds** section, download the **Windows/x64** .zip file.

Create a new folder

```plain
mkdir %APPDATA%\Oracle
```

And extract the archive content into `...\AppData\Roaming\Oracle\jdk-{{ page.jdk }}.0.1`.

To set the path, in a cmd.exe terminal, issue the following:

```plain
set Path=%APPDATA%\Oracle\jdk-{{ page.jdk }}.0.1\bin;%Path%
setx Path "%APPDATA%\Oracle\jdk-{{ page.jdk }}.0.1\bin;%Path%"
```

Check version:

```bash
java --version
```

It is possible to install multiple versions on the same system, and chose
which one to use by controlling the Path.

{% endcapture %}

{% capture macos %}

{{ openjdk }}

In the **Builds** section, download the **macOS/x64** .tar.gz file.

```bash
cd ~/Downloads
tar xf openjdk-{{ page.jdk }}.0.1_osx-x64_bin.tar.gz
xattr -d com.apple.quarantine openjdk-{{ page.jdk }}.0.1_osx-x64_bin.tar.gz
sudo mv jdk-{{ page.jdk }}.0.1.jdk/ /Library/Java/JavaVirtualMachines/
```

Check version:

```bash
java --version
```

On recent macOS systems, this might fail or trigger a security message.
To overcome this, go to System Preferences → Security & Privacy → Allow.

On macOS 10.15 the system automatically identifies the latest version
installed in `/Library/Java/JavaVirtualMachines/` and somehow
links `/usr/bin/java` to it.

```console
% which java
/usr/bin/java
% ls -l /usr/bin/java
lrwxr-xr-x  1 root  wheel  74 Jan  2  2020 /usr/bin/java -> /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java
```

How exactly it gets from here to the actual location is a bit of Apple magic.

Since it is possible to install multiple version on the same system,
if you want to override this mechanism and use a different version, try
to configure the user path via `launchctl`:

```bash
sudo launchctl config user path /Library/Java/JavaVirtualMachines/jdk-{{ page.jdk }}.0.1.jdk/Contents/Home/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
sudo reboot
```

For this configuration to become effective, it is necessary to reboot.

To check if the new path was configured properly:

```
launchctl getenv PATH
```

Please note that the above command configures only the path for the GUI
applications. For shell usage, it is necessary to also set the PATH
environment variable in the shell startup files (like `.zprofile`):

```bash
export PATH=/Library/Java/JavaVirtualMachines/jdk-{{ page.jdk }}.0.1.jdk/Contents/Home/bin/:${PATH}
```

{% endcapture %}

{% capture linux %}

On most modern Linux distributions, OpenJDK is available as a package,
and can be installed via the sytem package manager.

For example on Ubuntu:

```bash
sudo apt install --yes openjdk-{{ page.jdk }}-jdk
```

Or on CentOS:

```bash
sudo yum -y install java-{{ page.jdk }}-openjdk
```

Check your system for the available package names and versions.

However, if you cannot find at least JDK 11, install the Oracle OpenJDK.

{{ openjdk }}

In the **Builds** section, download the **Linux/x64** .tar.gz file.

```bash
cd ~/Downloads
tar xf openjdk-{{ page.jdk }}.0.1_linux-x64_bin.tar.gz
mkdir -p ${HOME}/opt
sudo mv jdk-{{ page.jdk }}.0.1/ ${HOME}/opt/
```

Then add the location to the user PATH:

```bash
export PATH=${HOME}/opt/jdk-{{ page.jdk }}.0.1/bin/:${PATH}
```

Check version:

```bash
java --version
```

If your Windows Manager allows to start Eclipse with clicks in the file
manager without using a shell, you might need to set the GUI path in a way
specific to the window manager.

TODO: give some examples.

It is possible to install multiple versions on the same system, and chose
which one to use by controlling the PATH.

{% endcapture %}

{% include platform-tabs.html %}

## Alternate solutions

For those who prefer alternate solutions, the second recommendation
goes to [AdoptOpenJDK](https://adoptopenjdk.net/)
which provides prebuilt OpenJDK binaries for an even wider
range of platforms.

## Install node & xpm

The next step is to install the xPack tools.

For full details, please follow the steps in the separate install pages: 

- [node](https://xpack.github.io/install/)
- [xpm](https://xpack.github.io/xpm/install/)

For convenience for those who already know what this means, here is a brief.

For macOS and GNU/Linux, use **nvm** (for Windows use the .msi, as explained in
the [node](https://xpack.github.io/install/) install page):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
exit
```

In a new terminal, to benefit from the definitions added by the script:

```bash
nvm install --lts node
nvm use node
node --version
nvm install-latest-npm
npm --version
```

Install **xpm**:

```bash
npm install --global xpm@latest
```

On Windows, install **make** and the rest of the build tools:

```bash
xpm install --global @xpack-dev-tools/windows-build-tools@latest
```

Install the toolchain and the other tools; don't skip qemu, since it is used
by the blinky tutorial; openocd may also be useful to run debug sessions;
the riscv toolchain is necessary only for RISC-V projects.

```bash
xpm install --global @xpack-dev-tools/arm-none-eabi-gcc@latest
xpm install --global @xpack-dev-tools/qemu-arm@latest
xpm install --global @xpack-dev-tools/openocd@latest
xpm install --global @xpack-dev-tools/riscv-none-embed-gcc@latest
```

All xPacks are installed in a central folder in the user home; check
the xpm output for the actual location.

{% include tip.html content="Since xPacks are installed in _dot_ folders,
be sure you configure your file manager to show hidden files." %}
