---
title: 'Announcement - Eclipse is coming to Raspberry Pi'
permalink: /articles/2020-09-08-raspberrypi-org-eclipse/

date: 2020-09-08 03:20:00 +0300

tags:
  - eclipse
  - embedded
  - j-link
  - raspberry
  - aarch64

categories:
  - article

---

<small>(This announcement was posted in the [Raspberry Pi Forum](https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=284879), on 08.09.2020).</small>

## Eclipse Aarch64

We are pleased to announce that **the first official Eclipse Aarch64 package**
running on **Raspberry Pi OS 64-bit** is now available for evaluation from:

[https://projects.eclipse.org/projects/iot.embed-cdt/downloads/](https://projects.eclipse.org/projects/iot.embed-cdt/downloads/)

(see the 2020-09-M3-KSE pre-release section)

The **Eclipse IDE for Embedded C/C++ Developers** packs together the
**Eclipse IDE for C/C++ Developers** standard distribution with the
**Eclipse Embedded CDT plug-ins** (formerly known as the
**GNU MCU Eclipse plug-ins**, now part of the Eclipse Foundation
and rebranded).

## Additional tools

All additional open source tools used by the project, like
**Arm & RISC-V toolchains**, **OpenOCD**, **QEMU**, are immediately
available as binary packages (xPacks) that also have Arm variants.

And, last but not least, **SEGGER**, the manufacturer of **J-Link**,
the market-leading debug probe, fully committed to support the industry
migration towards Arm platforms, recently released V6.84 of the
**J-Link Software**, which also includes Arm binaries that run on
Raspberry Pi ([download](https://www.segger.com/downloads/jlink/)).
The SEGGER graphical tools (Ozone, SystemView, etc) will be available
at a later date.

With all these components in place, now **the whole development cycle -
create, build, flash and debug - can be performed directly on a
Raspberry Pi 4** single board computer.

## Documentation

The current pre-release is intended for evaluation and feedback. A
final release is planned for the second half of September, after
Eclipse 2020-09 is out.

The project also has a new web site, available from:

[https://eclipse-embed-cdt.github.io/](https://eclipse-embed-cdt.github.io/)

(the site is still work in progress, thank you for helping to improve it)

## How to evaluate

Those who want to evaluate the new Eclipse are invited to follow
the _Getting Started_ steps in the project web, starting with the
_Prerequisites_, _Install a New Eclipse_, up to the _Blinky Arm Tutorial_,
which ends with a debug session blinking 4 LEDs in an emulated
STM32F4DISCOVERY board.

![Raspberry Pi Eclipse]({{ site.baseurl }}/assets/images/2020/raspberry-eclipse.png)

For now the Eclipse for Aarch64 is built using the same procedures as
the Eclipses for Intel, and requires the same **Java 11** package
(or higher) from Oracle.

We are aware that Java and especially Eclipse have both heavy
implementations and generally running them on a small platform
may require a bit of patience. At this moment, startup is slow;
occasionally it takes some time for a menu item to appear, but
subsequent accesses should be ok. Sometimes Eclipse may require
a restart. If you run htop in a separate terminal, you can see when
Java is busy compiling the byte code. The graphical CPU usage
monitor enabled in the top bar may also give a good indication
when Eclipse completed the startup.

This first Raspberry Pi release is about providing functionality.
If you are a Java/Eclipse developer and feel inspired, your
contributions to improve performance will be highly appreciated.

The systems used for development are Raspberry Pi4, with 8GB RAM,
booting from a SanDisk Extreme Portable 250GB, USB 3.1, SSD. It is
possible to run Eclipse in 4GB RAM, but 8GB and a fast SSD disk
provide a better experience.

Feedback appreciated.

Liviu & Koen
