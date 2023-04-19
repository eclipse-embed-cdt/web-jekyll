---
title: Project Templates
permalink: /templates/

summary: The C/C++ project templates.

comments: true

date: 2015-09-11 22:35:00 +0300

---

## Quick links

If you know what this is all about and you only need to go to specific
templates:

- [Hello World QEMU templates]({{ site.baseurl }}/templates/hello-world-qemu-xpack/)
- [STM32Fxx templates]({{ site.baseurl }}/templates/stm32f/)
- [Kinetis KLxx templates]({{ site.baseurl }}/templates/klxx/)
- [Generic Cortex-M template]({{ site.baseurl }}/templates/cortexm/)

## Overview

In addition to cross build and debugging support, the Eclipse Embedded
CDT plug-ins also provide several C/C++ project templates, that generate
ready to run projects.

These projects obviously are not fully fledged applications, but provide a
good starting point for writing such applications.

One of the main requirements is to build correctly, even if functionality
is only sketchy.

## Install

The template plug-ins are installed using the same procedure as the other plug-ins:

- in the _Eclipse_ menu, go to **Help** → **Install New Software...**
- select _Work with:_ **Eclipse Embedded CDT**
- extend the **Embedded C/C++ Cross Development Tools**
- be sure the desired **Embedded C/C++ ... Project Template** are selected

![Install the template plug-ins]({{ site.baseurl }}/assets/images/2023/install-template-plugins.png)

## C vs C++

Most of the Eclipse Embedded CDT templates are available for both C and
C++ projects. The first difference between the two is the extension of
the main source file: it is `main.c` for C projects and `main.cpp` for
C++ projects. The content is usually the same, but more elaborate versions
are planned to better exemplify the use of C++.

## Arm CMSIS

After defining a minimum common hardware implementation in the Cortex-M core,
to be implemented by all vendors, Arm also defined CMSIS (pronounced _sim-sys_)
as a common software interface, to be used with all Cortex-M implementations.
CMSIS stands for
[Cortex Microcontroller Software Interface Standard](https://www.arm.com/products/processors/cortex-m/cortex-microcontroller-software-interface-standard.php)
and consists of several components (CORE, DSP, RTOS, SVD).

The Eclipse Embedded CDT plug-ins use the CMSIS-CORE code in the Cortex-M
templates, as jointly provided by Arm and each vendor.

There is no equivalent of CMSIS for RISC-V.

## Hello vs Blinky

Based on a long tradition among the embedded application developers, the
first challenge when encountering a new board is to make it
say _Hello_ and possibly blink a LED.
It doesn't seem much, but in fact there are many details that must fit
together for this to work:

- the startup code must be functional
- the manufacturer CMSIS initialisations must set the desired clock
- the memory map and the linker scripts must match the actual hardware
- possibly the newlib `printf()` must be directed to an available device for
viewing the trace messages
- for Blinky, the GPIO definitions/drivers must be available

The **Hello World** templates generate the simplest projects, which do not
require any device specific drivers, but instead output the traditional
_Hello World_ message via the semihosting trace chanel.

This kind of projects are the starting point for more complex unit tests.

The **Blinky** templates make an extra step, and the generated projects
blink a LED with 1Hz.
To exercise the interrupts, the time base is obtained with a system timer
configured at 1000Hz, with the `delay()` function counting ticks.

Once all details are understood, a real life application simply grows on
top of the **Blinky** project, by adding extra functionality.

## Project structure

The xPack generated projects share a common folders structure, similar to the following:

![Project structure]({{ site.baseurl }}/assets/images/2023/hello-arm-qemu-xpack.png)

### Application code

The application code is located in the top level `src` and `include` folders.
Add more files as required by your application.

### Platform specific code

For the xPack templates, the various platform specific code is grouped
in a folder including the platform name, like `platform-qemu-cortex-m7f`.

This structure facilitates multi-architecture/multi-platform projects, which
may include multiple such folders.

In the older templates the platform specific libraries are located
in the `system` folder.

### Dependencies

The xPack templates group all external libraries below the `xpacks` folder.

In the older templates the various libraries are located
in the `system` folder.

## Available templates

### xPack templates

- Hello World Arm QEMU xPack
- Hello World RISC-V QEMU xPack

### ST Micro templates

- STM32F0xx template
- STM32F1xx template
- STM32F2xx template
- STM32F3xx template
- STM32F4xx template
- STM32F7xx template

### Freescale templates

- Kinetis KLxx templates (end-of-life)
- Processor Expert template (end-of-life)

### Generic templates

- Cortex-M template

### Adding new templates

Considering the large number of existing Cortex-M implementations, it is
not realistic to expect templates for all of them.

If you use a microcontroller that has no template yet, and want to
contribute to this project, the first step is to create a project that
mimics the Hello World or Blinky variant of an existing template.
For Arm devices, this means you need
to have the CMSIS specific files publicly available (yes, this seems
strange, but some manufacturers do not provide these files) and possibly
the standard peripheral library.

If you have such a project, you can register a new feature request and
attach your project to the request, for us to review and possibly use
as a base for a new template.
