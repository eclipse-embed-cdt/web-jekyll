---
title: Eclipse Embedded CDT Features
permalink: /plugins/features/

summary: The list of main project features and benefits.

comments: true

date: 2015-09-10 19:59:00 +0300

---

## Main features

The main features of the Eclipse Embedded CDT family of plug-ins are:

- create/build/manage embedded Arm/AArch64/RISC-V applications, using the
managed project features of Eclipse CDT, i.e. without having to manually
create and maintain makefiles
- provide ready to run templates for some Arm Cortex-M microcontrollers
- provide debugging support via JTAG/SWD
- provide a special view to examine and modify peripheral registers during
debug sessions

Other features of the cross build plug-in are:

- supports a wide range of 32 and 64-bit toolchains
- provides extra build steps to generate the binary files required to
write the controller flash memory
- supports the automatic discovery of system paths and macro definitions
for accurate indexing and auto-completion
- provides common options for all toolchains
- provides fully configurable toolchain definitions
- provides advanced toolchain path management
- improved project portability
- ... and many more

## Supported toolchains

The build plug-in supports most existing toolchains currently available
for both 32 and 64-bit Arm and RISC-V processors.

### Arm toolchains

- [**xPack GNU Arm Embedded GCC**](https://xpack.github.io/dev-tools/arm-none-eabi-gcc/) (arm-none-eabi-*)
- [**Arm GNU Toolchain**](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain) (arm-none-eabi-*)
- **[Linaro](https://launchpad.net/gcc-linaro) **ARMv7 **bare-metal EABI** (arm-none-eabi-*)
- **[Linaro](https://launchpad.net/gcc-linaro) **ARMv7 **big-endian bare-metal EABI** (armeb-none-eabi-*)
- **[Linaro](https://launchpad.net/gcc-linaro) **ARMv7 **Linux GNU EABI HF** (arm-linux-gnueabihf-*)
- **[Linaro](https://launchpad.net/gcc-linaro) **ARMv7 **big-endian Linux GNU EABI HF** (armeb-linux-gnueabihf-*)
- **[Mentor Sourcery CodeBench Lite](https://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/)** for **ARM EABI** (arm-none-eabi-*)
- **[Mentor Sourcery CodeBench Lite](https://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/)** for **ARM GNU/Linux** (arm-none-linux-gnueabi-*)
- devkit **ARM EABI** (arm-eabi-*) (obsolete, no longer maintained)
- Yagarto, Summon, etc. **ARM EABI** (arm-none-eabi-*) (obsolete, no longer maintained)

### AArch64 toolchains

- **[Linaro](https://launchpad.net/linaro-toolchain-binaries) AArch64 bare-metal ELF** (aarch64-none-elf-*)
- **[Linaro](https://launchpad.net/linaro-toolchain-binaries) AArch64 big-endian bare-metal ELF** (aarch64_be-none-elf-*)
- **[Linaro](https://launchpad.net/linaro-toolchain-binaries) AArch64 Linux GNU** (aarch64-linux-gnu-*)
- **[Linaro](https://launchpad.net/linaro-toolchain-binaries) AArch64 big-endian Linux GNU** (aarch64_be-linux-gnu-*)

![The list of supported Arm toolchains]({{ site.baseurl }}/assets/images/2023/wizard-arm-toolchains.png)

### RISC-V toolchains

- [**xPack GNU RISC-V Embedded GCC**](https://xpack.github.io/dev-tools/riscv-none-eabi-gcc/) (riscv-none-elf-*)
- **RISC-V GCC/Newlib** (riscv64-unknown-elf-*)
- **RISC-V GCC/Linux** (riscv64-unknown-linux-gnu-*)
- **RISC-V GCC/RTEMS** (riscv64-unknown-rtems-*)

![The list of supported RISC-V toolchains]({{ site.baseurl }}/assets/images/2023/wizard-riscv-toolchains.png)

## Extra build steps

In addition to building the ELF file, the build plug-in can also create
a binary file (**ihex**, **srec**, **binary**) to be programmed in the
microcontroller flash memory.

Since resources are usually limited, the plug-in can also display the
program size, and create a listing.

![An example of how secondary targets are generated]({{ site.baseurl }}/assets/images/2015/console-build-secondary.png)

## Discovery Options & Indexing

Frankly, this is mainly a CDT feature, but in order for it to work,
the build plug-in must provide the CDT with various toolchain details,
like compiler command (for example arm-none-eabi-gcc), compiler options
and the right path to the toolchain binary.

To understand **Discovery Options**, you need to understand what
**Indexing** is. In order to allow Eclipse user to navigate to
definitions, to declarations, to allow smart completion, refactoring
and all these nice features, the CDT needs to have **exactly** the
same knowledge of the source files as the compiler. For this, it also
needs to know the system headers used at compile time and the default
preprocessor definitions issued by the compiler. GCC provides a magic
combination of command options to do this
(`-E -P -v -dD ${plugin_state_location}/specs.c`), so the CDT needs
to issue the proper compiler commands (one for each language,
C & C++). The build plug-in provides these details, for each toolchain.

This feature also provides a quick check if you configured properly
your environment: after creating a new project, you should see the
special folder **Includes** in the root of your project, containing
the paths of the system include files used by your compiler. If you
don't see this, you probably misconfigured the toolchain path.

![Example of automatically detected include paths]({{ site.baseurl }}/assets/images/2015/project-explorer-includes.png)

## Simplified multiple tools configurations

In addition to being tedious, setting options for each tool (C compiler,
C++ compiler, linker) might also be a source of subtle errors when
incompatible options are used for different tools.

To minimise the risk of such errors, and to make the plug-in easier
to use, unlike in most other CDT compiler settings plug-ins, special
configuration entries were defined at toolchain level instead of
specific tools. Options enabled at this level are used for all tools,
without exception.

![Example of common options used for all tools]({{ site.baseurl }}/assets/images/2015/properties-c-settings-tool-optimization.png)

## Fully configurable toolchains

Toolchain definitions include most of the configurable details, not
only the prefix and the path, allowing the use of almost any GNU
compatible toolchain.

![All toolchain details can be configured]({{ site.baseurl }}/assets/images/2023/properties-c-settings-toolchains.png)

## Advanced toolchain path management

The traditional way of accessing the toolchain components was to add
the toolchain path to the system PATH and later do nothing special
inside Eclipse. Unfortunately this model does not scale; serious
development often requires multiple toolchains (either different
versions of the same toolchain, or even toolchains from different
sources) on the same machine, and polluting the system PATH is a
source of major headaches.

The Eclipse Embedded CDT cross build plug-in provides advanced
toolchain path management; for more details, please read the
separate [Toolchain path management]({{ site.baseurl }}/toolchain/path/) page.

## Improved project portability

Even more, for improved project portability, the toolchain path
is stored in the workspace, in preference to the path stored in the project.

Project portability is essential for team collaboration, when
multiple developers use different platform to develop a single
project. Without project portability, after a Windows machine
would commit the project to a central repository, macOS or GNU/Linux
users would have to manually adjust the path in their projects
after each update, and the other way around; for more details,
please read the separate
[Project portability]({{ site.baseurl }}/eclipse/project/portability/) page.

## Functional ready to run templates

For beginners, who need initial help to put all details together
for their first project, a complete sample, with startup code,
linker scripts, semi-hosting enabled and all necessary options
already set, can be a major time saver.

The **Hello World Arm QEMU xPack C/C++ Project** and
**Hello World RISC-V QEMU xPack C/C++ Project** templates are intended
for simple, but functional, _Hello World_ projects that can be immediately
executed without any physical hardware using the QEMU emulator;
please see the [Hello World Arm & RISC-V QEMU xPack templates]({{ site.baseurl }}/templates/hello-world-qemu-xpack/)
for more details.

![The Hello World Arm QEMU template project]({{ site.baseurl }}/assets/images/2023/hello-arm-qemu-xpack.png)

Other older templates, like
**STM32F4xx C/C++ Project**, are available for the STM families of
microcontrollers **STM32F[01234]x**, and for some Freescale **KLxx**
microcontrollers. They create the classical application that blinks
a LED, and, specific for the Debug configuration, prints a string on
the tracing (SWV or semi-hosting) output; please see the
[Tutorial: Create a Blinky Arm test project]({{ site.baseurl }}/tutorials/blinky-arm/)
for more details.

## Debugging support

During the lifetime of a project, creating/editing source files and
building binaries are certainly important activities, but in many
cases the most time is spent during debugging sessions, and a reliable
debugging environment is an absolute must.

There are many debugging techniques and tools, but we recommend two solutions:

- the [SEGGER J-Link](https://www.segger.com/jlink_base.html) probe
with its integrated GDB server, via
[the J-Link plug-in]({{ site.baseurl }}/debug/jlink/)
- the [OpenOCD](https://openocd.org) GDB server for many other JTAG probes.

  ![The J-Link Debugger tab]({{ site.baseurl }}/assets/images/2015/launch-jlink-debugger-tab.png)

We also recommend the use of specific Arm debugging support, like
tracing via the SWO output, with a second choice for semihosting
output (both are supported by the J-Link plug-in).

## The packages manager perspective

The Eclipse Embedded CDT plug-ins were the first open source tools
to benefit from the new CMSIS Packs technology promoted by Arm.

Packages are a convenient way to distribute software components,
hardware descriptions and documentation, in a structured way.

There are many packages available, mostly maintained by Keil,
and in order to conveniently manage them a dedicated perspective
was created, with filtering and outline capabilities.

![The Packs perspective]({{ site.baseurl }}/assets/images/2015/perspective-packs.png)

Among other things, the packages metadata include a complete
list of devices, grouped by vendor, family, sub-family, and a
list of development boards. These extra data allow to easily
associate additional properties (like device name) to projects,
and later use these definition to automate other configurations,
like debugging sessions.

![Assigning a device and board to the project]({{ site.baseurl }}/assets/images/2015/properties-c-settings-device-tab.png)

## Peripherals registers view in debug

One of the great features of CMSIS Packs is the availability of
hardware descriptions for all Cortex-M devices, with details down
to the register field level.

These descriptions can be used to assist the debugger in examining
and modifying memory mapped peripheral registers.

![The peripheral registers view]({{ site.baseurl }}/assets/images/2015/debug-view-peripheral-registers.png)

## Device and board documentation files

The CMSIS packs also provide lots of documentation files, like device
data sheets, user manuals, references manuals, and also board related
files, including schematics and other manuals.

The list of documentation files is shown in a separate view, located
on the right of the **Outline** view. In case the **Documents** view
is not visible, a **Reset** is needed for the **C/C++** perspective
(right click the perspective button and select Reset).

To open the individual documents, double click their names and
specific viewers will open, generally outside Eclipse.

![The documentation view]({{ site.baseurl }}/assets/images/2015/view-documents.png)

 [7]: {{ site.baseurl }}/debug/jlink/ "The J-Link hardware debugging Eclipse plug-in"
