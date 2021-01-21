---
title: Frequently Asked Questions
permalink: /support/faq/

summary: A list of common questions that other people have already asked.

toc: false
comments: true

date: 2020-08-15 18:18:00 +0300

---

{% comment %}

Use the following with copy/paste to contribute new entries.
Then be sure you update the index and add a new include line.

{% capture question_N %}
Warum?
{% endcapture %}

{% capture answer_N %}
Darum.
{% endcapture %}

{% endcomment %}

{% capture question_27 %}
Why updating CodeRed fails?
{% endcapture %}

{% capture answer_27 %}
The v6.0.0 version of the clipse Embedded CDT plug-ins had an error in the
CodeRed configuration; the error was corrected in v6.1.1.

For existing Eclipses, in case the update fails, the workaround
is to **Install New Software** from the `updates/v6` URL.
{% endcapture %}

{% capture question_26 %}
How to add folders to the build?
{% endcapture %}

{% capture answer_26 %}

The CDT managed build plug-ins can be configured to search for
source files in any project folders.

Project Properties → C/C++ General → Path and Symbols → Source Locations

Similarly any header folders can be added to the build:

Project Properties → C/C++ General → Path and Symbols → Includes

{% include faq-panel.html id="collapse-25" question=question_25 answer=answer_25 %}

{% endcapture %}

{% capture question_25 %}
An internal error occurred during: "Load QML Analyzer"
{% endcapture %}

{% capture answer_25 %}
This error during startup is caused by the Qt plug-ins not running
with Java 15; for more details please see the
[Known Issues]({{ site.baseurl }}/support/known-issues/)
page.
{% endcapture %}

{% capture question_1 %}
Why the **xPack...** button is not enabled?
{% endcapture %}

{% capture answer_1 %}
> I correctly installed the `@xpack-dev-tools/arm-none-eabi-gcc` xPack,
  but the **xPack...** button is still disabled and I cannot select the
  desired version.

This button is enabled only for the **xPack GNU Arm Embedded GCC**
toolchain; check the toolchain name, you might have
selected a toolchain which has no xPacks available,
like the old **GNU Tools for ARM Embedded Processors**.
{% endcapture %}

{% capture question_2 %}
xpm: integrity checksum failed (Cannot read property 'path' of null)
{% endcapture %}

{% capture answer_2 %}
On Windows, binary packages are .zip archives containing .exe files; 
some aggressive antivirus programs may quarantine those files, or even 
modify the content of the archives, affecting the checksum and thus 
preventing the packages to be installed.

Errors may look like:

```
Downloading https://github.com/gnu-mcu-eclipse/qemu/releases/download/v2.8.0-4-20190211/gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win64.zip...
{ Error: sha256-p3CgzXJt4zi5g0kxQXlOpss3Xu5Yy+Zv8HXWXkUdg6g= integrity checksum failed when using sha256: wanted sha256-p3CgzXJt4zi5g0kxQXlOpss3Xu5Yy+Zv8HXWXkUdg6g= but got sha512-k1s9UW6Zb20llIuopUwbf3D38OP1F+Nkgf3wGWwsXPwoQfhuiR89+VF3Rrf7YF20fN3tG4/3jZSC3apiHbQ6NA== sha256-ABnfxLMtY8E5KqJkrtIlPB4ML7CSFvjizCabv7i7SbU=. (9 bytes)
...
Extracting 'gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win64.zip'...
error: Cannot read property 'path' of null
```

The solution is to configure the antivirus to be less aggressive, at
least for files in the `AppData\Roaming\xPacks` and
`AppData\Local\Caches\xPacks` folders.

If this is not possible, temporarily disable the antivirus; if this
is also not possible, install the packs manually (if you can!).
{% endcapture %}

{% capture question_3 %}
Cannot find the `bin` folder
{% endcapture %}

{% capture answer_3 %}
When installing binary packages as xPacks, the install location is
a folder that ends in `.content/bin`, like:

```
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin
```

Unfortunately, the Eclipse file system browser does not show file/folders
starting with a dot; thus, the `.content/bin` final part of the path must
be entered manually.

This is one more reason to use the **xPack...** button, and select the
xPack version in the drop down box.

{% endcapture %}

{% capture question_4 %}
Undefined reference to `_exit()`
{% endcapture %}

{% capture answer_4 %}
Newlib, by design, requires the user to implement several low level functions,
like `_exit()`, `_sbrk()`, `_write()`, `_close()`, etc.

Without them, the project will fail during link:

```
Building target: hello-arm.elf
Invoking: GNU ARM Cross C Linker
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -Xlinker --gc-sections -Wl,-Map,"hello-arm.map" -o "hello-arm.elf"  ./src/main.o   
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-exit.o): in function `exit':
exit.c:(.text.exit+0x16): undefined reference to `_exit'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-sbrkr.o): in function `_sbrk_r':
sbrkr.c:(.text._sbrk_r+0xc): undefined reference to `_sbrk'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-writer.o): in function `_write_r':
writer.c:(.text._write_r+0x12): undefined reference to `_write'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-closer.o): in function `_close_r':
closer.c:(.text._close_r+0xc): undefined reference to `_close'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-lseekr.o): in function `_lseek_r':
lseekr.c:(.text._lseek_r+0x12): undefined reference to `_lseek'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-readr.o): in function `_read_r':
readr.c:(.text._read_r+0x12): undefined reference to `_read'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-fstatr.o): in function `_fstat_r':
fstatr.c:(.text._fstat_r+0x12): undefined reference to `_fstat'
/Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/bin/ld: /Users/ilg/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/9.3.1-1.1.1/.content/bin/../lib/gcc/arm-none-eabi/9.3.1/../../../../arm-none-eabi/lib/thumb/v7-m/nofp/libg.a(lib_a-isattyr.o): in function `_isatty_r':
isattyr.c:(.text._isatty_r+0xc): undefined reference to `_isatty'
collect2: error: ld returned 1 exit status
make: *** [hello-arm.elf] Error 1
"make all" terminated with exit code 2. Build might be incomplete.
```

For an example how to implement these functions, check the code generated
by the Blink Arm template.

For a quick workaround, pass `--specs=nosys.specs` to the linker, and
it'll include dummy definitions for all those functions, but be
warned that the resulting project will not be functional, and
will definitelly not display any `printf()` messages.
{% endcapture %}

{% capture question_5 %}
I cannot connect via J-Link to my ST DISCOVERY or NUCLEO board
{% endcapture %}

{% capture answer_5 %}
If you try to connect via the SEGGER J-Link debug plug-in to a stock
ST DISCOVERY or NUCLEO board and the JLinkGDBServer keeps refuses to
connect (_'Connecting to J-Link failed. Connected correctly?'_), please
note that the on-board programmer firmware on the ST boards is compatible
with ST-LINK, not J-Link. However, SEGGER provides an upgrade path,
and most of the ST bemo boards can be converted to J-Link; please follow
the SEGGER
[Converting ST-LINK on-board into a J-Link](https://www.segger.com/products/debug-probes/j-link/models/other-j-links/st-link-on-board/) page.
{% endcapture %}

{% capture question_6 %}
I installed Eclipse with Synaptics and I have problems to install the plug-ins
{% endcapture %}

{% capture answer_6 %}
On GNU/Linux, **DO NOT** install Eclipse with the system package
manager, because usually it installs an older version, and CDT is not
included.

Instead, go to the
[Eclipse download site](https://projects.eclipse.org/projects/iot.embed-cdt/downloads/) and get the
proper **Eclipse IDE for Embedded C/C++ Developers**.
{% endcapture %}

{% capture question_7 %}
Cannot find the tools path preferences page
{% endcapture %}

{% capture answer_7 %}
> The JLink/QEMU/OpenOCD plug-in doesn't appear to be installing correctly,
or at all, there is no JLink/QEMU/OpenOCD page in the Run/Debug group.

Starting with version 4.x, the Preferences were moved under the new **MCU** group:

![MCU]({{ site.baseurl }}/assets/images/2017/preferences-mcu.png)
{% endcapture %}

{% capture question_8 %}
Java was started but returned exit code=13
{% endcapture %}

{% capture answer_8 %}
This obscure message is issued by Eclipse when you are trying to use a
64-bit Eclipse on a 32-bit Java.

If you install Java for the first time, be sure you use the 64-bit
Java on 64-bit systems, and then the 64-bit version of Eclipse.
{% endcapture %}

{% capture question_9 %}
OpenOCD fails to start with `-c echo "Started by GNU ARM Eclipse"`
{% endcapture %}

{% capture answer_9 %}
> I'm trying to start OpenOCD in a terminal and it fails to execute
the `echo` command...

The syntax required by the OpenOCD `echo` command is a single string,
in other words both echo and the message must be in the same string.
To achieve this in a shell, the string must be quoted:

```
-c 'echo "Started by GNU ARM Eclipse"'
```

Please note that this command is used by the plug-in to detect when
the GDB server is initialised and ready to receive commands; it is
not necessary when starting OpenCOD manually.
{% endcapture %}

{% capture question_10 %}
How to compile files excluded from build?
{% endcapture %}

{% capture answer_10 %}
> Why the default state for `system/src/.../xxx.c` is not enabled?

Because during project creation the wizard was configured with **Exclude unused**.

> How to enable them?

Right click → **Resource Configurations** → **Exclude from build** → uncheck
{% endcapture %}

{% capture question_11 %}
How do I create a C-only (not C++) Cortex-M projects?
{% endcapture %}

{% capture answer_11 %}
Well, easily, with **New C Project**. However if the question is related to the projects generated by the templates, they always use G++ as linker.

> I want to make sure the G++ compiler is not putting any object code in that I do not want.

No need to worry, if you have no C++ source files in your project, the g++ compiler is never used.

The advantage of using g++ as linker is that, even for C projects, you can link a library that has a C interface but internally uses C++ (this is perfectly possible).

If you have no C++ object files in the project, there is no difference.
{% endcapture %}

{% capture question_12 %}
Why my breakpoints are not effective and execution stops somewhere else?
{% endcapture %}

{% capture answer_12 %}
> My breakpoints behave erratic, the program does not stop in the desired
function but in the function immediately following.

This is usually the effect of optimisations, if your function was not
referred in your program, the linker removed it completely. Eclipse does
not know this, and any breakpoint placed in the removed function is in
fact placed at the beginning of the next function.
{% endcapture %}

{% capture question_13 %}
How to single-step empty loops?
{% endcapture %}

{% capture answer_13 %}
> I'm trying to single-step a simple loop, but execution does not stop
after a single iteration, the target runs continuously, with permanent
interactions with the debugger.

The current GDB has a problem with placing breakpoints **in simple loops**,
and **single-stepping fails**. The problem was already reported
([bug 1401565](https://bugs.launchpad.net/gcc-arm-embedded/+bug/1401565)).
If you really need this, switch to assembly view and single-stepping is
again functional.
{% endcapture %}

{% capture question_14 %}
Why the debugging flow with -Og is sometimes jumpy?
{% endcapture %}

{% capture answer_14 %}
> The manual suggests to use `-Og` for optimising programs for Debug, but
when stepping loops the execution flow is sometimes quite jumpy, moving
outside the loop and back.

In GCC prior 4.9, the definition of `-Og` needs a small adjustment,
also add the `-fno-move-loop-invariants` option to the Debug
configuration; this will prevent the compiler to move some constant
parts of the loop outside it and the execution flow will be more easy
to follow. The problem was already reported
([bug 1395077](https://bugs.launchpad.net/gcc-arm-embedded/+bug/1395077)).
Starting with 4.9, the `-fno-move-loop-invariants` is added automatically
to `-Og`.
{% endcapture %}

{% capture question_15 %}
Semihosting enabled application hangs
{% endcapture %}

{% capture answer_15 %}
> After usb disconected and reconected program do not run (the example
flashing led is not blinking).

This is absolutely normal for any application build with semihosting
support. The semihosting channel is using resources from the debugger.
Without the debugger active, the instructions used for the communication
channel generate run-time faults.

Update: M3/M4 projects generated with version 2.2.1-201404120702 or
later check when not running under debugger and skip the trace call,
so it is possible to run the application standalone.
{% endcapture %}

{% capture question_16 %}
Program `echo` not found in PATH
{% endcapture %}

{% capture answer_16 %}
You are running on Windows, and did not install the full content of
the archive described in the
[Windows Build Tools](https://xpack.github.io/windows-build-tools/) page.
The `echo` program
is not used per se, it is only a workaround for a known CDT bug.
On macOS and GNU/Linux the `echo` program is always present, being part
of the standard configuration. On Windows it should be installed
separately and, for convenience, it is provided in the Windows Build Tools
package.
{% endcapture %}

{% capture question_17 %}
The plug-in seems to ignore assembly .s files. How can I add them to the project?
{% endcapture %}

{% capture answer_17 %}
Due to a very complicated portability reason, Eclipse is not able
to distinguish, and thus separately process, `.s` and `.S` files.
The current CDT configuration associates assembly files only with
`.asm` and `.S` files, and ignores `.s` files. Although it might be
possible to change the Eclipse file associations, I would not recommend
this. Better change the assembly file extensions to `.S` and use the
default settings.

Please note that `.S` assembly files will be processed by **gcc**, not
by **as**; this also means that the file will be first preprocessed like
all C/C++ files, allowing conditional compilation and macro expansion.
{% endcapture %}

{% capture question_18 %}
The generated Makefile seems to be broken. How can I fix it?
{% endcapture %}

{% capture answer_18 %}
If you notice something wrong in the Makefiles, like macro names not
substituted, missing sections, labels, etc, the project file might be
broken. To fix it, create a new project. Do not copy/paste the damaged
one, be sure you create it from scratch. However, you can copy/paste
the source files.

As mentioned in the
[Known issues]({{ site.baseurl }}/support/known-issues/),
avoid changing settings for
individual files/folders or changing the toolchain for a project,
since these are known problems in some CDT version and might damage
your project.
{% endcapture %}

{% capture question_19 %}
The build generates a long console listing instead of creating the
secondary targets
{% endcapture %}

{% capture answer_19 %}
You enabled the Internal builder, which does not work properly. Switch
back to the External builder and the build will succeed.
{% endcapture %}

{% capture question_20 %}
Cannot run program "make": Launching failed
{% endcapture %}

{% capture answer_20 %}
Most probably you are running on Windows, and forgot to add the builder
tools or to add the path to them. See the
[Windows Build Tools](https://xpack.github.io/windows-build-tools/) page.
{% endcapture %}

{% capture question_21 %}
Program "arm-none-eabi-gcc" not found in PATH
{% endcapture %}

{% capture answer_21 %}
You most probably did not configure properly the toolchain path, and
CDT cannot start the discovery process. Check the path in the project
**Properties** → **C/C++ Build** → **Settings** → **Toolchains** → **Path**.

![Setting the toolchain path and preffx]({{ site.baseurl }}/assets/images/2013/10/SettingsPathPrefix.png)
{% endcapture %}

{% capture question_22 %}
Program "gcc" not found in PATH
{% endcapture %}

{% capture answer_22 %}
Although it looks like the above, it is worse, since it shows that the
prefix is not prepended to the compiler command. Check the prefix in
the project **Properties** → **C/C++ Build** → **Settings** →
**Toolchains** → **Prefix**.
{% endcapture %}

{% capture question_23 %}
I tried to use Float ABI: hard on Cortex-M4, but the linker fails
{% endcapture %}

{% capture answer_23 %}
```console
Building target: test1.elf
Invoking: Cross ARM C++ Linker
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/bin/ld: error: test1.elf uses VFP register arguments
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/lib/libg.a(lib_a-impure.o) does not
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/bin/ld: failed to merge target specific data of file
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/lib/libg.a(lib_a-impure.o)
...
```

Although on Cortex-M4 the only available FPU hardware is fpv4-sp-d16,
the compiler does not have a default defined for this, and it is necessary
to explicitly select **FPU Type: fpv4-sp-d16** in the C/C++ Settings page.
{% endcapture %}

{% capture question_24 %}
What do the template configurations (standalone, retargetting or semihosting) mean?
{% endcapture %}

{% capture answer_24 %}

- **Standalone** means a typical embedded configuration, that does not
use the POSIX system calls (open, close, read, write, etc).
- **Retargetting** is a more elaborate embedded configuration where the
application makes use of these calls, but redirects the file descriptors
to local devices or files, by providing custom implementations for the
system calls (like \_open, \_close, \_read, \_write, etc). This
configuration allows to port POSIX programs easier.
- **Semihosting** is a special testing configuration, that bridges
**all** system calls to the host operating system where the GDB server
runs. This configurations is particularly interesting for running test
programs that can leave the test results in a file stored on the host,
for automated integration in a test suite.
{% endcapture %}

{% include div-panel-group.html %}
{% include faq-panel.html id="collapse-27" question=question_27 answer=answer_27 %}
{% include faq-panel.html id="collapse-26" question=question_26 answer=answer_26 %}
{% include faq-panel.html id="collapse-25" question=question_25 answer=answer_25 %}
{% include faq-panel.html id="collapse-1" question=question_1 answer=answer_1 %}
{% include faq-panel.html id="collapse-2" question=question_2 answer=answer_2 %}
{% include faq-panel.html id="collapse-3" question=question_3 answer=answer_3 %}
{% include faq-panel.html id="collapse-4" question=question_4 answer=answer_4 %}
{% include faq-panel.html id="collapse-5" question=question_5 answer=answer_5 %}
{% include faq-panel.html id="collapse-6" question=question_6 answer=answer_6 %}
{% include faq-panel.html id="collapse-7" question=question_7 answer=answer_7 %}
{% include faq-panel.html id="collapse-8" question=question_8 answer=answer_8 %}
{% include faq-panel.html id="collapse-9" question=question_9 answer=answer_9 %}
{% include faq-panel.html id="collapse-10" question=question_10 answer=answer_10 %}
{% include faq-panel.html id="collapse-11" question=question_11 answer=answer_11 %}
{% include faq-panel.html id="collapse-12" question=question_12 answer=answer_12 %}
{% include faq-panel.html id="collapse-13" question=question_13 answer=answer_13 %}
{% include faq-panel.html id="collapse-14" question=question_14 answer=answer_14 %}
{% include faq-panel.html id="collapse-15" question=question_15 answer=answer_15 %}
{% include faq-panel.html id="collapse-16" question=question_16 answer=answer_16 %}
{% include faq-panel.html id="collapse-17" question=question_17 answer=answer_17 %}
{% include faq-panel.html id="collapse-18" question=question_18 answer=answer_18 %}
{% include faq-panel.html id="collapse-19" question=question_19 answer=answer_19 %}
{% include faq-panel.html id="collapse-20" question=question_20 answer=answer_20 %}
{% include faq-panel.html id="collapse-21" question=question_21 answer=answer_21 %}
{% include faq-panel.html id="collapse-22" question=question_22 answer=answer_22 %}
{% include faq-panel.html id="collapse-23" question=question_23 answer=answer_23 %}
{% include faq-panel.html id="collapse-24" question=question_24 answer=answer_24 %}
{% include div-end.html %}

