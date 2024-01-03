---
title: How to install the Eclipse prerequisites
permalink: /plugins/prerequisites/

summary: "Install Java 11, xpm, toolchains and debugging tools."

comments: true

keywords:
  - npm
  - xpack
  - install
  - java
  - jdk
  - xpm

jdk_major: 20
jdk_minor_patch:

date: 2017-10-09 14:14:00 +0300

---

## Overview

### Java

The main prerequisite to run the Eclipse Embedded CDT is Java.
Generally Java is not available by default on most platforms, and requires
a separate installation.

{% include tip.html content="Recent Eclipse packages are standalone and
come bundled with the Java JRE; in this case
it is no longer necessary to install a separate Java." %}

### Other tools

Here is a list of other tools/packages that need to be installed **before**
starting Eclipse.

{% include tip.html content="If you already started Eclipse, close it,
install these tools, and reopen Eclipse." %}

- **node/npm/xpm** - although not mandatory by Eclipse itself, it is
highly recommended to use **xpm** (the xPack Project Manager, which
is a **Node.js** portable CLI application) to install
various build tools (the _Hello World Arm/RISC-V QEMU xPack_ project
template mandates it)
- **Windows Build Tools** - to build projects, on Windows it is necessary
to install `make`, available from the xPack Windows Build Tools;
- **Arm Embedded GCC toolchain** - to build Arm projects, an Arm toolchain like
the xPack GNU Arm Embedded GCC is required;
- **RISC-V Embedded GCC toolchain** - similarly, for RISC-V projects, a RISC-V toolchain
like the xPack GNU RISC-V Embedded GCC is required;
- **SEGGER J-Link** - to debug projects, a JTAG probe is necessary together
with the software to access it, for example the SEGGER J-Link software;
- **OpenOCD** - for some boards, xPack OpenOCD might also be useful;
- **QEMU Arm** - to run debug sessions without actual hardware, the
xPack QEMU Arm emulator is necessary (the blinky tutorial mandates it).
- **QEMU RISC-V** - similarly, the
xPack QEMU RISC-V emulator is useful to run RISC-V application
(the Hello World RISC-V
tutorial mandates it).

{% include note.html content="Many of the additional tools can be
installed as xPacks, which makes **xpm** a very convenient tool." %}

## Install Java

The following section covers the common Windows/macOS/Linux platforms;
for a wider range of platforms, see the **Alternate solutions** below.

{% include note.html content="Recent Eclipse releases include Java,
so this step is no longer necessary." %}

{% capture openjdk %}
The recommended package is the latest version from the official
[Oracle **OpenJDK** page](https://openjdk.java.net).

Follow the **Download** link in the Oracle page, which currently points to
[jdk.java.net/{{ page.jdk_major }}](https://jdk.java.net/{{ page.jdk_major }}).
{% endcapture %}

{% capture windows %}

Current Windows distributions do not include Java.

{{ openjdk }}

In the **Builds** section, download the **Windows/x64** `.zip` file.

Create a new folder

```plain
mkdir %APPDATA%\Oracle
```

And extract the archive content into `...\AppData\Roaming\Oracle\jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}`.

To set the path, in a cmd.exe terminal, issue the following:

```plain
set Path=%APPDATA%\Oracle\jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}\bin;%Path%
setx Path "%APPDATA%\Oracle\jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}\bin;%Path%"
```

Check version:

```bash
java --version
```

It is possible to install multiple versions on the same system, and choose
which one to use by controlling the Path.

{% endcapture %}

{% capture macos %}

The current macOS releases no longer pack Java.

{{ openjdk }}

In the **Builds** section, download the **macOS/x64** .tar.gz file.

```bash
cd ~/Downloads
xattr -c openjdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}_osx-x64_bin.tar.gz
tar xf openjdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}_osx-x64_bin.tar.gz
sudo mv jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}.jdk/ /Library/Java/JavaVirtualMachines/
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
not be possible on older systems, for example Java 14 fails to
start on macOS 10.10." %}

Since it is possible to install multiple version on the same system,
if you want to override this mechanism and use a different version, try
to configure the user path via `launchctl`:

```bash
sudo launchctl config user path /Library/Java/JavaVirtualMachines/jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}.jdk/Contents/Home/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
sudo reboot
```

As shown above, for this configuration to become effective, it is
necessary to reboot.

To check if the new path was configured properly:

```sh
launchctl getenv PATH
```

Please note that the above command configures only the path for the GUI
applications. For shell usage, it is necessary to also set the PATH
environment variable in the shell startup files (like `.zprofile`):

```bash
export PATH=/Library/Java/JavaVirtualMachines/jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}.jdk/Contents/Home/bin/:${PATH}
```

{% endcapture %}

{% capture linux %}

On most modern Linux distributions, OpenJDK is available as a package.

To check if it is already installed, ask the version:

```sh
java -version
```

If it is not installed, or it is not at least Java 11,
install it via the package manager.

For example on Ubuntu:

```bash
sudo apt install --yes openjdk-{{ page.jdk_major }}-jdk
```

Or on CentOS:

```bash
sudo yum -y install java-{{ page.jdk_major }}-openjdk
```

Check your system for the available package names and versions.

However, if you cannot find at least JDK 11, install the Oracle OpenJDK.

{{ openjdk }}

In the **Builds** section, download the **Linux/x64** .tar.gz file.

```bash
mkdir -p ${HOME}/opt
cd ${HOME}/opt
tar xf ~/Downloads/openjdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}_linux-x64_bin.tar.gz
```

Then add the location to the user PATH:

```bash
export PATH=${HOME}/opt/jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}/bin/:${PATH}
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

It is possible to install multiple versions on the same system, and choose
which one to use by controlling the PATH.

It is also possible to edit [eclipse.ini](https://wiki.eclipse.org/Eclipse.ini)
and add a `-vm` option pointing to the Java bin path; be sure this
option is placed before `-vmargs`, which should be the last one:

```sh
--launcher.defaultAction
openFile
-vm
/home/ilg/opt/jdk-{{ page.jdk_major }}{{ page.jdk_minor_patch }}/bin/
-vmargs
-Dosgi.requiredJavaVersion=11
-XX:MaxPermSize=256m
-Xms256m
-Xmx2048m
```

{% endcapture %}

{% include platform-tabs.html %}

{% include warning.html content="The Qt plug-ins do not start
with Java 15; for more details please see the Known Issues page." %}

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

For convenience for those who already know what this means, below is a brief.

For macOS and GNU/Linux, use **nvm** (for Windows use the .msi, as explained in
the [node](https://xpack.github.io/install/) install page):

```sh
mkdir -pv "${HOME}/Downloads/"
curl --output "${HOME}/Downloads/install-nvm-node-npm-xpm.sh" https://raw.githubusercontent.com/xpack/assets/master/scripts/install-nvm-node-npm-xpm.sh
cat "${HOME}/Downloads/install-nvm-node-npm-xpm.sh"

bash "${HOME}/Downloads/install-nvm-node-npm-xpm.sh"

exit
```

This shell script will install `nvm` (the Node Version Manager), `node`,
`npm` and `xpm`.

{% include note.html content="To activate `nvm` automatically,
the script adds several lines
to the shell initialisation script." %}

On Windows, install **make** and the rest of the build tools:

```bash
xpm install --global @xpack-dev-tools/windows-build-tools@latest
```

Install the toolchain and the other tools; don't skip qemu, since it is used
by the blinky tutorial; openocd may also be useful to run debug sessions;
the riscv toolchain is necessary only for RISC-V projects.

```bash
xpm install --global @xpack-dev-tools/arm-none-eabi-gcc@latest --verbose
xpm install --global @xpack-dev-tools/qemu-arm@latest --verbose

xpm install --global @xpack-dev-tools/riscv-none-elf-gcc@latest --verbose
xpm install --global @xpack-dev-tools/qemu-riscv@latest --verbose

xpm install --global @xpack-dev-tools/openocd@latest --verbose

xpm install --global @xpack-dev-tools/cmake@latest --verbose
xpm install --global @xpack-dev-tools/meson-build@latest --verbose

xpm install --global @xpack-dev-tools/ninja-build@latest --verbose
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
[xPack Windows Build Tools](https://xpack.github.io/dev-tools/windows-build-tools/)
and can be easily installed via **xpm**.

### Discontinued 32-bit support

All recent Eclipses are 64-bit and require 64-bit platforms; using older
32-bit systems is still possible with older Eclipse versions, but is
discouraged.

### Eclipse Neon and up to Eclipse 2020-09

Starting with version 6.0.0, the Embedded CDT plug-ins are based on
the API defined in CDT 10.0.0 and require at least Eclipse 2020-09.

The previous releases, up to 5.2.1, were based on CDT 9.2.1, which
was published with [Eclipse 4.6 Neon](https://www.eclipse.org/neon/), released
in 2016.

If, for any reason, you need to use an older Eclipse (like, for example,
for running on a 32-bit system), be sure it includes at least CDT 9.2.1.
