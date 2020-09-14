---
title: How to install the Eclipse prerequisites
permalink: /plugins/prerequisites/

summary: "Install Java 11, xpm, toolchains and debugging tools."

toc: true
comments: true
keywords:
  - npm
  - xpack
  - install
  - java
  - jdk
  - xpm

jdk: 14

date: 2017-10-09 14:14:00 +0300

---

## Overview

### Java

The main prerequisite to run the Eclipse Embedded CDT is Java.
Generally Java is not available by default on most platforms, and requires
a separate installation.

### Other tools

Here is a list of other tools/packages that need to be installed **before**
starting Eclipse.

{% include tip.html content="If you already started Eclipse, close it,
install these tools, and reopen Eclipse." %}

- **node/npmxpm** - although not mandatory, but highly recommended, the
second prerequisite is **xpm** (the xPack Package Manager), which is
a **Node.js** portable application;
- **Windows Build Tools** - to build projects, on Windows it is necessary
to install `make`, available from the xPack Windows Build Tools;
- **Arm toolchain** - to build Arm projects, an Arm toolchain like
the xPack GNU Arm Embedded GCC is required;
- **RISC-V toolchain** - similarly, for RISC-V projects, a RISC-V toolchain
like the xPack GNU RISC-V Embedded GCC is required;
- **SEGGER J-Link** - to debug projects, a JTAG probe is necessary together
with the software to access it, for example the SEGGER J-Link software;
- **OpenOCD** - for some boards, xPack OpenOCD might also be useful;
- **QEMU Arm** - to run debug sessions without actual hardware, the
xPack QEMU Arm emulator is necessary (the blinky tutorial mandates it).

{% include note.html content="Many of the additional tools can be
installed as xPacks, which makes **xpm** a very convenient tool." %}

## Install Java

The following section covers the common Windows/macOS/Linux platforms;
for a wider range of platforms, see the **Alternate solutions** below.

{% capture openjdk %}
The recommended package is the latest version from the official
[Oracle **OpenJDK** page](https://openjdk.java.net).

Follow the **Download** link in the Oracle page, which currently points to
[jdk.java.net/{{ page.jdk }}](https://jdk.java.net/{{ page.jdk }}).
{% endcapture %}

{% capture windows %}

Current Windows distributions do not include Java.

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

The current macOS releases no longer pack Java.

{{ openjdk }}

In the **Builds** section, download the **macOS/x64** .tar.gz file.

```bash
cd ~/Downloads
xattr -d com.apple.quarantine openjdk-{{ page.jdk }}.*_osx-x64_bin.tar.gz
tar xf openjdk-{{ page.jdk }}.*_osx-x64_bin.tar.gz
sudo mv jdk-{{ page.jdk }}.*.jdk/ /Library/Java/JavaVirtualMachines/
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

{% include warning.html content="Installing the latest Java may
not be possble on older systems, for example Java 14 fails to
start on macOS 10.10." %}

Since it is possible to install multiple version on the same system,
if you want to override this mechanism and use a different version, try
to configure the user path via `launchctl`:

```bash
sudo launchctl config user path /Library/Java/JavaVirtualMachines/jdk-{{ page.jdk }}.0.1.jdk/Contents/Home/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
sudo reboot
```

As shown above, for this configuration to become effective, it is
necessary to reboot.

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

On most modern Linux distributions, OpenJDK is available as a package.

To check if it is already installed, ask the version:

```
java -version
```

If it is not installed, or it is not at least Java 11,
install it via the package manager.

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

On some distributions (like Ubuntu) this can be achieved via `~/.xsessionrc`,
sourced from one of the files in `/etc/X11/Xsession.d/`.

It is possible to install multiple versions on the same system, and chose
which one to use by controlling the PATH.

{% endcapture %}

{% include platform-tabs.html %}

## Alternate Java distributions

For those who prefer alternate solutions, the second recommendation
goes to [AdoptOpenJDK](https://adoptopenjdk.net/)
which provides prebuilt OpenJDK binaries for an even wider
range of platforms.

{% include tip.html content="Since recent Eclipses are all 64-bit, be sure
you install a 64-bit Java." %}

## Install node/npm/xpm

The next step is to install the xPack tools.

For full details, please follow the steps in the separate install pages:

- [node/npm](https://xpack.github.io/install/)
- [xpm](https://xpack.github.io/xpm/install/)

For convenience for those who already know what this means, here is a brief.

For macOS and GNU/Linux, use **nvm** (for Windows use the .msi, as explained in
the [node](https://xpack.github.io/install/) install page):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
exit
```

In a new terminal, to benefit from the environment variables
added by the script:

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

{% include tip.html content="Since xPacks are installed in _.dot_ folders,
be sure to configure the file manager to show hidden files." %}

## Miscellaneous

### Windows Build Tools

Briefly mentioned before as a supplementary step after installing xpm,
running builds on Windows requires tools that Microsoft does not include
in the base distribution and need to be installed separately.

For convenience, these tools were packed as the
[xPack Windows Build Tools](https://xpack.github.io/windows-build-tools/)
and can be easily installed via **xpm**.

### Discontinued 32-bit support

All recent Eclipses are 64-bit and require 64-bit platforms; using older
32-bit systems is still possible with older Eclipse versions, but is
discouraged.

### Eclipse Neon and later

The Embedded CDT plug-ins are based on the API defined in CDT 9.2.1, which
was published with [Eclipse 4.6 Neon](https://www.eclipse.org/neon/), released
in 2016.

If, for any reason, you need to use an older Eclipse (like, for example,
for running on a 32-bit system), be sure it includes at least CDT 9.2.1.
