---
title: Debugging
permalink: /debug/

summary: The Eclipse Embedded CDT debugging plug-ins.

comments: true

date: 2015-09-11 19:59:00 +0300

---

## Quick links

If you know what you are doing, you can directly skip to:

- [SEGGER J-Link install]({{ site.baseurl }}/debug/jlink/install/)
- [SEGGER J-Link plug-in usage]({{ site.baseurl }}/debug/jlink/)
- [xPack OpenOCD install](https://xpack.github.io/dev-tools/openocd/install/)
- [OpenOCD plug-in usage]({{ site.baseurl }}/debug/openocd/)
- [xPack QEMU Arm install](https://xpack.github.io/dev-tools/qemu-arm/)
- [QEMU Arm plug-in usage]({{ site.baseurl }}/debug/qemu/)
- [The Peripherals Registers view]({{ site.baseurl }}/debug/peripheral-registers/)

## Recommandations

In short, for bare metal embedded development, we highly recommend
solutions that can be used on all major platforms (Windows, macOS and
GNU/Linux), with hardware probes that implement the SWD protocol and
possibly support tracing via the SWO pin.

The preferred probes that
match the above requirements are
the [J-Link Debug Probes](https://www.segger.com/products/debug-probes/j-link/)
from [SEGGER](http://www.segger.com/).

{% include note.html content="For educational purposes and hobbyists,
SEGGER offers [J-Link EDU](http://www.segger.com/j-link-edu.html) at a
promotional price providing the same functionality as the J-Link BASE." %}

## Debugging overview

Although it varies a lot depending on personal skills and experience,
debugging can be one of the most time consuming activities during software
development, and any solutions intended to address it are welcome.

Generally there are two approaches:

- manually stepping through the code to check the program flow and
inspect various status variables
- letting the program run and automatically collect various tracing
messages (like the traditional `printf()` calls) and/or execution events
(enter/exit interrupt handlers, memory location change, etc)

To be noted that these approaches are not exclusive, but complement
each other, since they better serve different purposes, and have
specific advantages and disadvantages.

### Manual stepping

Manually stepping through the code is great for debugging a standalone
linear piece of code, to check if the implementation of an algorithm is
correct, to detect off-by-one errors (accessing past the size of an array
or collection). It is also useful to get an initial understanding of the
functionality of a piece of code written by someone else. Its main
drawback is severely distorting the time behaviour of the debugged
code, which, if the debugged device is interacting with other external
devices, will most likely trigger timeouts. For complex code, with
multiple iterations and multiple processes, it is quite tedious,
requiring a lot of manual interactions with the debugger to reach
the desired point in time, especially when the sessions are expected
to be restarted often.

The manual stepping approach generally requires a generic debugger
and a specific method to connect it to the application to be debugged.
The GNU toolchains provide a standard **GDB** command line tool to
interact with the debugged application, and Eclipse provides various
plug-ins to integrate the command line tool into the IDE.

The recommended way to connect GDB, running on the development machine,
to the application, running on an embedded device, is to use a
**GDB server**. If the debugged application is a GNU/Linux Arm
application, running on a SBC like BeagleBone or Raspberry, the GDB
server must be first installed and started on it, then the GDB client
needs to be instructed to connect via TCP/IP to it and start the debug
session.

If the debugged application runs on a bare metal device, then it is
necessary to use a physical probe, to load the device memory and to
assist during the debugging session. The standard way is to use a
JTAG or SWD probe, paired with a custom GDB server, able to talk to
it on one side, and to accept the standard GDB commands on the other side.

### Using trace messages

Collecting tracing messages and events, when used wisely, can be a
valuable source of information regarding the flow of a complex
application, with multiple interacting threads, being especially useful
when the debug sessions are restarted often. Once the trace messages are
added, the dynamic life of various threads/handlers can be seen with a
simple view of the trace log. In addition to classical `printf()` messages
that need to be manually inserted in the code, for embedded applications,
modern Arm cores, including those in the Cortex-M families, provide special
support for collecting hardware events, like accurate timestamps when an
interrupt handler was entered/exited, when a memory location was accessed,
and more.

Recognising the importance of these methods, the designers of the Arm
families added special support, like the **SWO** (Serial Wire Output)
pin in Cortex-M microcontrollers, or even more elaborate interfaces for larger
Arm processors.

## GDB

The tool used by Eclipse Embedded CDT for debugging is the Arm version
of GDB, the venerable GNU debugging tool.

### No initialisation files

For having a total control of the debugging session, the debugging
plug-ins start the GDB client process with the `--nx` option, which
prevents the execution of the commands found in any initialization
file; none of the standard files (`system.gdbinit`, `~/.gdbinit`,
`./.gdbinit`) are loaded.

To add more commands to the GDB initialisation sequence, use the
_Commands:_ field in the _GDB Client Setup_ section:

![Launch J-Link debugger client]({{ site.baseurl }}/assets/images/2015/launch-jlink-debugger-client.png)

All commands listed here are passed to the GDB client. By convention,
commands prefixed with `mon` will be further passed by the GDB
client to the GDB server.
