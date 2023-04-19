---
title: Hello World Arm & RISC-V QEMU xPack templates
permalink: /templates/hello-world-qemu-xpack/

summary: The C/C++ project templates for Hello World semihosted projects.

comments: true

date: 2023-04-15 20:59:00 +0300

---

## Overview

The first challenge when encountering a new board is to make it
say _Hello_. This is even simpler that blinking a LED, since it does
not require any peripheral drivers, like GPIO or timers.

The preferred way to output _Hello_ message is via the standard output,
routed to the semihosting trace channel,
which is supported by most debuggers.

Such a project is a good starting point for writing unit tests, which
generally are standard applications displaying various messages and
returning an exit code.

## Prerequisites

Before creating a new project, please be sure you checked all prerequisites
described in the
[Prerequisites]({{ site.baseurl }}/plugins/prerequisites/)
page,

### xpm

Special consideration should be given to install `node`/`npm`/`xpm`, which are mandatory for
instantiating xPack templates.

### Pre-download binary tools

This is a mandatory step, since the Eclipse plug-in will install all
dependencies anyway, including the toolchains and all other binary tools,
but, especially for the RISC-V toolchain, which is very large,
it is recommended to manually download them before trying to create a
new project.

For Cortex-M and Arm 32-bit projects, the following commands can be used:

```bash
xpm install --global @xpack-dev-tools/arm-none-eabi-gcc@11.2.1-1.2.2 --verbose
xpm install --global @xpack-dev-tools/qemu-arm@7.0.0-1.1 --verbose

xpm install --global @xpack-dev-tools/cmake@3.21.6-1.1 --verbose
xpm install --global @xpack-dev-tools/meson-build@0.60.3-1.1 --verbose

xpm install --global @xpack-dev-tools/ninja-build@1.11.0-1.1 --verbose
```

For RISC-V projects, replace the first lines with:

```sh
xpm install --global @xpack-dev-tools/riscv-none-embed-gcc@12.1.0-2.1 --verbose
xpm install --global @xpack-dev-tools/qemu-riscv@7.0.0-1.1 --verbose
```

## Create a new C++ project

To create a new project, go to _Eclipse_ menu, **File** → **New** (or
the button in the upper left corner), and select the **C++ Project**:

![Create a new C++ project]({{ site.baseurl }}/assets/images/2023/new-c-cpp-project.png)

In the _New C/C++ Project_ window, select **C/C++ Managed Build** and
click the **Next >** button.

![Create a new C++ project]({{ site.baseurl }}/assets/images/2023/new-cpp-managed-build.png)

In the **C++ Project** window:

- in the _Project name:_ field enter the name of the new project, for example **hello-m7f**
- in the _Project type:_ section expand the **Executable** type and select **Hello World Arm QEMU xPack C/C++ Project**
- in the _Toolchains:_ section select **Arm Cross GCC**
- click the **Next >** button

![New C++ hello project]({{ site.baseurl }}/assets/images/2023/create-new-m7f-project.png)

In the **Project settings** window:

- select the _MCU:_ as **Cortex-M7F**
- enable **Check some warnings**
- disable all other
- click the **Next >** button.

![Hello processor settings]({{ site.baseurl }}/assets/images/2023/hello-project-settings.png)

In the **Select Configurations** page leave the suggested Debug/Release
configurations checked and click the **Next >** button.

![Hello project configurations]({{ site.baseurl }}/assets/images/2023/hello-select-configurations.png)

In the **Cross GNU Arm Toolchain** window:

- select the _Toolchain name:_ **xPack GNU Arm Embedded GCC** (mandatory)
- if the xPack was installed via xpm, click **xPack...** and select the version; otherwise
browse for the `bin` folder within the toolchain folder; don't be afraid
to use the absolute path, it is not stored in the project
- click the **Finish** button

![Hello toolchain and path selection]({{ site.baseurl }}/assets/images/2023/hello-arm-cross-toolchain.png)

{% include tip.html content="When selecting the path, be sure to select
the top `/.content/bin` folder
where programs like `arm-none-eabi-gcc` are located." %}

{% include warning.html content="DO NOT SKIP this step, it is mandatory
to have a correct toolchain path defined in order for the build to complete
correctly." %}

![Toolchain path]({{ site.baseurl }}/assets/images/2023/hello-toolchain-path.png)

With all setting ready, the plug-in runs the external command `xpm init --template ...` to actually populate the project with files:

![Toolchain path]({{ site.baseurl }}/assets/images/2023/hello-xpm-init.png)

This takes a few moments, and then the plug-in runs `xpm install`, which
downloads all dependencies.

{% include warning.html content="If the binaries were not downloaded
previously, this step may take a few good minutes, especially on
slow internet links, to download the toolchain and the other tools;
unfortunately Eclipse provides no feedback on the progress;
be patient and wait for it to complete." %}

The result of the wizard is a simple project, with a `main()` function printing a greeting on the standard output.

![The new C++ project]({{ site.baseurl }}/assets/images/2023/hello-arm-qemu-xpack.png)

## Build the project

To start the build:

- select the new project in the _Project Explorer_ section
- click the **hammer** icon

![Hammer Build]({{ site.baseurl }}/assets/images/2023/hello-hammer-build.png)

The build process should leave in the _Console_ window a listing like this:

![The build console]({{ site.baseurl }}/assets/images/2023/hello-build-console.png)

The files created by the build process are left in a folder named by the name of the configuration, for example _Debug_ or _Release_.

![Blinky Build Result]({{ site.baseurl }}/assets/images/2023/hello-debug-folder.png)

As seen above, the _Debug_ folder is populated with:

- all make files required for the build (**makefile** and various ***.mk** files, generated by CDT),
- the object files and dependency files generated during the build (**main.o** and **main.d**)  and
- the final executable file, with all debug symbols, useful for a debug session (**hello-m7f.elf**)
- the binary executable file, ready to be programmed in flash (**hello-m7f.hex**)
- a program map, with all symbols and their associated addresses (**hello-m7f.map**)

## Run/Debug the test using QEMU Arm

The most convenient way to run a debug session with this test is to use the
[QEMU Debugging plug-in]({{ site.baseurl }}/debug/qemu/); no physical hardware is required.

Eclipse menu → **Run** → **Debug Configurations...**

![The build console]({{ site.baseurl }}/assets/images/2023/debug-configurations.png)

- expand the _GDB QEMU arm Debugging_ category
- select the **hello-m7f-debug-qemu** configuration
- click the **Debug** button

![The QEMU Debugger tab]({{ site.baseurl }}/assets/images/2023/hello-debug-qemu.png)

Confirm the switch to the debugger perspective, and allow the plug-in
to remember this setting.

The Eclipse debugger is starts, with a breakpoint in `main()`.

![The QEMU Debugger tab]({{ site.baseurl }}/assets/images/2023/hello-debug-halt.png)

From here you
can either step over several instructions, or click **Resume**
(the green right pointing triangle).

QEMU will run the program and display some information,
including several trace lines, in the console:

![blinky debug]({{ site.baseurl }}/assets/images/2023/hello-debug-done-console.png)

## Full semihosting

Contrary to usual POSIX environments, like GNU/Linux, embedded systems
usually do not provide standard input/output devices. In the code generated
by the template, the output of the `printf()` calls, including
`trace_printf()`,
is redirected to a special debugging channel implemented by most debuggers,
using the semihosting protocol.

Even more, the
[Arm semihosting specs](https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst)
also define read/write file operations, which can be used
during tests to read input stimulus data and to output test results.

## Project structure

The resulting project has a quite regular structure, with separate
folders for the portable content, for the platform specific content,
and for the dependencies.

### The portable content

The portable content is located in the top `src` and `include` folders.

In this project, there is only a `main.cpp` file with its header:

```console
% tree src include
src
└── main.cpp
include
└── main.h

0 directories, 2 files
```

### The platform specific code

As configured when the template was instantiated, the project
is expected to run on a Cortex-M7F, emulated by QEMU.

The project specific code for Cortex-M7F is in the `platform-qemu-cortex-m7f` folder:

```console
% tree platform-qemu-cortex-m7f
platform-qemu-cortex-m7f
├── CMakeLists.txt
├── README.md
├── cmake
│   ├── dependencies.cmake
│   └── globals.cmake
├── include-config
│   └── micro-os-plus
│       └── config.h
├── include-platform
│   └── micro-os-plus
│       ├── platform-qemu-cortex-m7f
│       │   └── defines.h
│       └── platform.h
├── linker-scripts
└── src

8 directories, 7 files
```

Most of the files are placeholders, the only file with some content is
`include-config/micro-os-plus/config.h`, which defines some startup
and semihosting variables.

The actual code is in the dependent libraries installed in the `xpacks`
folder.

### The dependencies folders

As per the xPack design, the source libraries are downloaded and linked in
the `xpacks` folder:

![the xPacks folders]({{ site.baseurl }}/assets/images/2023/hello-xpacks.png)

Each library has the usual structure, with a `src` folder for the C/C++ source
files, an `include` folder with the headers, and some metadata for assisting
the build.

For example, the `@micro-os-plus/semihosting` package has the
following content:

```console
% tree xpacks/micro-os-plus-semihosting
xpacks/micro-os-plus-semihosting
├── CHANGELOG.md
├── CMakeLists.txt
├── LICENSE
├── README.md
├── include
│   └── micro-os-plus
│       ├── semihosting-inlines.h
│       └── semihosting.h
├── meson.build
├── package.json
├── src
│   ├── semihosting-startup.cpp
│   ├── semihosting-syscalls.cpp
│   └── semihosting-trace.cpp
└── xpack.json

3 directories, 12 files
```

The dependent libraries are actually not located in the project, but in
a central store, and the sub-folders below `xpacks` are symbolic links
(junctions for Windows).

The content of the central store is read-only, such that the source files
(which can be used by multiple projects) cannot be inadvertently changed.

For development purposes, it is possible to replace the links to the
central store with links to a local repository, where the files can be
edited, using a pair of the `xpm link` commands (see the
[xpm link](https://xpack.github.io/xpm/cli/link/) page).

## Headless builds

The template is a separate project that can be fully used in a
terminal:

- <https://github.com/micro-os-plus/hello-world-qemu-template-xpack/>

To run the builds, a series of actions are pre-configured, for example
to build the Debug configuration for Cortex-M7, a `prepare` should
be performed only once, and later the `build` step can be performed:

```sh
xpm run prepare --config qemu-cortex-m7f-cmake-debug
xpm run build --config qemu-cortex-m7f-cmake-debug
```


## Support

If you encounter any problems when using this template, please refer to
the [Support]({{ site.baseurl }}/support/) page and **do not** send private
emails.
