---
title: 'Tutorial: Create a Blinky Arm test project'
permalink: /tutorials/blinky-arm/

summary: A complete example, from build to debug.

comments: true

date: 2015-09-11 19:25:00 +0300

---

If you are new to Arm development, it is recommended to follow this short
tutorial and learn how to build a simple test executable program that will
blink a LED. You do not need any physical hardware for this, the test uses
an emulated STM32F4DISCOVERY board.

{% include note.html content="This tutorial was created with
**GNU Arm GCC** toolchains in mind,
like the **xPack GNU Arm Embedded GCC**, or **Arm GNU Toolchain**.
Only when using these toolchains the build is guaranteed to succeed. Using
other toolchains might be possible, but small changes might be necessary
in the source code and in the linker options." %}

{% include important.html content="Follow this steps _by the letter_, without any
alterations, especially if you are new to Eclipse. This will save you a
lot of time. If you mess things up, remove the workspace and start all
over again." %}

## Prerequisites

Before creating a new project, please be sure you checked all prerequisites
described in the
[Prerequisites]({{ site.baseurl }}/plugins/prerequisites/)
page, including the need to install the
[build tools](https://xpack.github.io/dev-tools/windows-build-tools/install/)
if you use Windows as your development platform.

It is also recommended to
[set the workspace preferences]({{ site.baseurl }}/eclipse/workspace/preferences/)
and to install the desired
[CMSIS packs]({{ site.baseurl }}/plugins/packs-manager/).

{% include note.html content="The multi-LED template is currently available
only for ST32F4DISCOVERY, since it has 4 LEDs, and only
in C++, since it allows to easily instantiate multiple BlinkLed objects." %}

## Create a new C++ project

To create a new project, go to _Eclipse_ menu, **File** → **New** (or
the button in the upper left corner), and select the **C++ Project**:

![Create a new C++ project]({{ site.baseurl }}/assets/images/2020/new_c_cpp_project.png)

In the _New C/C++ Project_ window, select **C/C++ Managed Build** and
click the **Next >** button.

![Create a new C++ project]({{ site.baseurl }}/assets/images/2020/new_c_cpp_managed_build_project.png)

In the **C++ Project** window:

- in the _Project name:_ field enter the name of the new project, for example **blinky**
- in the _Project type:_ section expand the **Executable** type and select **STM32F4xx C/C++ Project**
- in the _Toolchains:_ section select **Arm Cross GCC**
- click the **Next >** button

![New C++ blinky project]({{ site.baseurl }}/assets/images/2020/new_c_cpp_blinky_project.png)

In the **Target processor settings** window be sure to:

- select the **STM32F407xx** chip family
- set the _Flash size (kB)_ field to 1024 kB
- set the _Clock (Hz):_ field to 8000000
- for a more complete example, change the _Use system calls:_ fields to
**Semihosting (POSIX system calls via host)**
- click the **Next >** button.

![Blinky processor settings]({{ site.baseurl }}/assets/images/2015/08/BlinkyProcessorSettings1.png)

In the **Folders** page leave the suggested folders unchanged and click the
**Next >** button.

![Blinky project folder settings]({{ site.baseurl }}/assets/images/2015/08/BlinkyFolderSettings.png)

In the **Select Configurations** page leave the suggested Debug/Release
configurations checked and click the **Next >** button.

![Blinky project configurations]({{ site.baseurl }}/assets/images/2015/08/BlinkyConfigurations.png)

In the **Cross GNU Arm Toolchain** window:

- select the _Toolchain name:_ **xPack GNU Arm Embedded GCC** (mandatory)
- if the xPack was installed via xpm, the path is already filled in; otherwise
browse for the `bin` folder within the toolchain folder; don't be afraid
to use the absolute path, it is not stored in the project
- click the **Finish** button

![Blinky toolchain and path selection]({{ site.baseurl }}/assets/images/2020/blinky-toolchain.png)

{% include tip.html content="When selecting the path, be sure to select
the top `/bin` folder
where the programs with long, prefixed names are stored, and not the inner
`/bin` folder where the short name programs may be available." %}

{% include warning.html content="DO NOT SKIP this step, it is mandatory
to have a correct toolchain path defined in order for the build to complete
correctly." %}

![Toolchain path]({{ site.baseurl }}/assets/images/2013/10/HelloToolchainPath.png)

The result of the wizard is a simple project, with a `main()` function printing a greeting on the standard output.

![The new C++ project]({{ site.baseurl }}/assets/images/2015/08/BlinkyProject.png)

## Build the project

To start the build:

- select the new project in the _Project Explorer_ section
- click the **hammer** icon

![Hammer Build]({{ site.baseurl }}/assets/images/2013/10/HammerBuild1.png)

The build process should leave in the _Console_ window a listing like this:

![The build console]({{ site.baseurl }}/assets/images/2015/08/BlinkyProjectBuildConsole.png)

The files created by the build process are left in a folder named by the name of the configuration, for example _Debug_ or _Release_.

![Blinky Build Result]({{ site.baseurl }}/assets/images/2015/08/BlinkyBuildResult1.png)

As seen above, the _Debug_ folder is populated with:

- all make files required for the build (**makefile** and various ***.mk** files, generated by CDT),
- the object files and dependency files generated during the build (**main.o** and **main.d**)  and
- the final executable file, with all debug symbols, useful for a debug session (**blinky.elf**)
- the binary executable file, ready to be programmed in flash (**blinky.hex**)
- a program map, with all symbols and their associated addresses (**blinky.map**)

## Assign a board and a device to the project

Although optional, it is highly recommended to assign a board and a device
to the project, using the packs definitions. If you did not do it before,
install the **STM32F4xx_DFP** package, as explained in the
[Packs Manager]({{ site.baseurl }}/plugins/packs-manager/) page.

{% include warning.html content="Do **not** use STM32F4xx_DFP version
2.15.0 or higher,
since it uses a new definition of the STM32F4-Discovery board, with
STM32F407VGTx, which is not yes supported.
For now stick to 2.14.0." %}

![BlinkyInstallPack]({{ site.baseurl }}/assets/images/2020/packs_filter_stm32f4.png)

{% include tip.html content="Be sure you really install the **STM32F4xx_DFP**
package. Simply updating the list of packages is not enough, you need to
navigate the **Keil** group, select the STM32F4xx_DFP package and install it,
otherwise the board will not show in the next step." %}

To assign the board and device:

- select the project
- either with right click or via **Project** menu, enter **Properties**
- expand the **C/C++ Build** entry
- select the **Settings** entry
- select the **Devices** tab
- in the Boards section, expand **STMicroelectronics**
- expand **STM32F4-Discovery**
- select **STM32F407VG**
- click **OK**

{% include important.html content="If you do not see STM32F407VG but
STM32F407VGTx, you are using a newer, yet unsupported version of the
STM32F4xx_DFP package. If you insist, you can still use this version,
but you have to select STM32F407VG below devices, and later enter
board name manually in the debugger configuration." %}

![BlinkyAssignDevice]({{ site.baseurl }}/assets/images/2015/08/BlinkyAssignDevice.png)

## Debug the test using QEMU Arm

The most convenient way to run a debug session with this test is to use the
[QEMU Debugging plug-in]({{ site.baseurl }}/debug/qemu/); you don't need
any physical hardware.

As for any debugging plug-in,

- select the **blinky.elf** file
- either with right click _Debug As..._ or in the _Debug_ menu,
select **Debug Configurations**
- double click the _GDB QEMU Debugging_
- select the _Debugger_ tab
- check if the _Board name:_ and _Device name:_ are correctly filled-in;
without assigning the board and device to the project, these fields must
be filled in manually;
- enable **Extra verbose**

{% include tip.html content="If the board was not selected when
assigning the device to the project, enter **STM32F4-Discovery**
in the **Board name:** field." %}

![The QEMU Debugger tab]({{ site.baseurl }}/assets/images/2015/08/BlinkyQEMUDebuggerTab.png)

When done, click the **Debug** button.

If you did not disable the graphic windows, an animated image of the board
is shown, with the 4 LEDs blinking.

![The STM32F4-Discovery 4 LEDs]({{ site.baseurl }}/assets/images/2015/08/STM32F4-Discovery-LEDs.png)

The Eclipse debugger is active, with a breakpoint in `main()`. From here you
can either step over several instructions, or click Resume
(the green right pointing triangle) and watch the program run.

![blinky debug]({{ site.baseurl }}/assets/images/2020/blinky_debug_halt.png)

The QEMU process will display some information in its console:

![QEMU console with semihosting output]({{ site.baseurl }}/assets/images/2015/08/QEMUconsole.png)

## Terminate

The test will run for about 20 seconds, and terminate by itself.

To cancel it earlier, click the Terminate button (the top red square).

## Semihosting

Contrary to usual POSIX environments, like GNU/Linux, embedded systems
usually do not provide standard input/output devices. In the code generated
by the template, the output of the `printf()` calls, including
`trace_printf()`,
is redirected to a special debugging channel implemented by most debuggers,
using the semihosting protocol.

## Next step

Once you checked the development environment to be functional, proceed with
creating real projects using the [STM32Fx]({{ site.baseurl }}/templates/stm32f)
templates, Freescale [KLxx]({{ site.baseurl }}/templates/klxx/) templates,
or, if your target processor is not yet supported, using the Generic
[Cortex-M]({{ site.baseurl }}/templates/cortexm/) template.

## Troubleshooting

The usual sources for build failures are:

- a wrong or missing toolchain path; go to the project
**Properties** → **C/C++ Build** → **Settings** → the **Toolchains** tab
and define the correct path;

![Global Tools Path]({{ site.baseurl }}/assets/images/2015/08/GlobalToolsPath.png)

Set the toolchain path for all projects and workspaces.

- missing build tools (make & rm) on Windows; install the
[build tools](https://xpack.github.io/dev-tools/windows-build-tools/);
- a wrong or missing QEMU path; go to the project
(**Window** →) **Preferences** → **MCU** → **Global QEMU Path**
(or **Workspace QEMU Path**) and define the correct path;

![The QEMU path]({{ site.baseurl }}/assets/images/2018/qemu-preferences.png)

## Support

If you encounter any problems when using this template, please refer to
the [Support]({{ site.baseurl }}/support/) page and **do not** send private
emails.
