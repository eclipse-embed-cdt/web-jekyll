---
title: "Eclipse Embedded CDT"
permalink: /
layout: home

summary: Eclipse Embedded C/C++ Development Tools (formerly **GNU MCU/ARM Eclipse**).
toc: false
keywords:
  - eclipse
  - development
  - c/c++
  - embedded
  - arm
  - risc-v
  - openocd
  - qemu

date: 2020-08-05 11:58:00 +0300
last_updated: 2020-08-29 13:46:57 +0300

---

**Eclipse Embedded CDT** is an open source project that includes a family
of Eclipse plug-ins and tools for multi-platform embedded cross (Arm and RISC-V)
development, based on GNU toolchains. The project is now part of the
[Eclipse Foundation](https://projects.eclipse.org/projects/iot.embed-cdt/),
and is hosted on
[GitHub](https://github.com/eclipse-embed-cdt).

## The Eclipse Embedded CDT plug-ins

These plug-ins provide Eclipse CDT (C/C++ Development Tooling) extensions for
GNU embedded toolchains like
[xPack GNU Arm Embedded GCC](https://xpack.github.io/arm-none-eabi-gcc/),
[xPack GNU RISC-V Embedded GCC](https://xpack.github.io/riscv-none-embed-gcc/),
etc.

[![Arm logo]({{ site.baseurl }}/assets/images/2020/Arm_logo_blue_150MN.png){: class="right-align-image"  style="margin: 10px"}](https://www.arm.com) In short, the Eclipse Embedded CDT plug-ins allow to create, build,
debug and in general to **manage Arm & RISC-V projects** (executables
and static/shared libraries, in both 32 and 64-bit versions) with the
Eclipse framework (currently tested up to Eclipse 4.16, 2020-06).
The plug-ins run on Windows, macOS and GNU/Linux. For more details
please visit the [Features]({{ site.baseurl }}/plugins/features/) page.

![Create new STM32F4 C++ project]({{ site.baseurl }}/assets/images/2015/intro-new-f4-project.png)

## Additional tools

Apart from the main Eclipse plug-ins, this project is accompanied by
several other tools, distributed as separate packages.

- **xPack Windows Build Tools**

  The [**xPack Windows Build Tools**](https://xpack.github.io/windows-build-tools/)
  project includes the additional tools required to perform builds on Windows
  (**make** & **rm**).

- **xPack GNU Arm Embedded GCC**

  The [**xPack GNU Arm Embedded GCC**](https://xpack.github.io/arm-none-eabi-gcc/)
  project is an alternate binary distribution that complements the official
  [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm) maintained by Arm. Binaries for Windows, macOS and GNU/Linux are available.

- **xPack GNU RISC-V Embedded GCC**

  The [**xPack GNU RISC-V Embedded GCC**](https://xpack.github.io/riscv-none-embed-gcc/)
  project is a new distribution of the bare metal version of
  [RISC-V GCC](https://github.com/riscv/riscv-gcc), maintained by
  [SiFive](https://www.sifive.com). Binaries for Windows, macOS and GNU/Linux
  are available.

- **xPack OpenOCD**

  The [**xPack OpenOCD**](https://xpack.github.io/openocd/) project is a
  new distribution of [OpenOCD](http://openocd.org/), customised for a
  better/more convenient integration with the **OpenOCD Debugging** plug-in.
  Binaries for Windows, macOS and GNU/Linux are available.

- **xPack QEMU Arm**

  The [**xPack QEMU Arm**](https://xpack.github.io/qemu-arm/) project is a
  fork of [QEMU](http://wiki.qemu.org/Main_Page) (an open source machine emulator),
  intended to provide support for Cortex-M emulation in Eclipse Embedded CDT.
  Binaries for Windows, macOS and GNU/Linux are available.

  ![The STM32F4-Discovery 4 LEDs]({{ site.baseurl }}/assets/images/2015/stm32f4-discovery-leds.png)

## Notifications

To stay up-to-date with new releases, the recommended way is
to follow [@{{ site.twitter_id }}](https://twitter.com/{{ site.twitter_id }}/) on Twitter.

Alternatively you can subscribe to this site 
[RSS feed](https://eclipse-embed-cdt.github.io/feed.xml).

To stay current with changes to individual projects, enable **watching**
in the GitHub web interface for each project of interest.

## License

Unless otherwise mentioned, all Eclipse plug-ins
are provided **free of charge** under the terms of the
[Eclipse Public License 2.0](https://projects.eclipse.org/license/epl-2.0).

## Let us know if you enjoyed using this project!

If you enjoyed using this project, please let us know; here are some advices:

- the best way to praise us would be to **donate**; if you want to speed
up development and help future versions include more and more great
features, please consider donating; any contribution, small or
generous, will be highly appreciated;
- star the projects you liked on GitHub
([eclipse-plugins](https://github.com/eclipse-embed-cdt/eclipse-plugins));
- follow the project on [Twitter](https://twitter.com/{{ site.twitter_id }}/),
to get notifications on new releases.

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="NXKFN7DJH8DJ6" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="." border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
</form>
