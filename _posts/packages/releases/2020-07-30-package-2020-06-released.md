---
title:  Eclipse IDE for Embedded C/C++ Developers 2020-06 released

date:   2020-07-30 13:00:00 +0300

categories:
  - releases
  - packages

tags:
  - gnu
  - arm
  - mcu
  - eclipse
  - risc-v
  - packages

---

For convenience, version **5.1.1** of the plug-ins is also available as
Eclipse packages, which pack together the
**Eclipse IDE for C/C++ Developers** standard distribution
(Eclipse 4.16) with the **Eclipse Embedded CDT plug-ins**.

## Download

- Windows x86_64 [zip](https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-win32.win32.x86_64.zip) ([sha](https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-win32.win32.x86_64.zip.sha))
- macOS x86_64 [tar.gz](https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-macosx.cocoa.x86_64.tar.gz) ([sha]( https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-macosx.cocoa.x86_64.tar.gz.sha))
- Linux x86_64 [tar.gz](https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-linux.gtk.x86_64.tar.gz) ([sha](https://www.eclipse.org/downloads/download.php?file=/embed-cdt/packages/2020-06/eclipse-embedcdt-2020-06-R-linux.gtk.x86_64.tar.gz.sha))

## macOS security notice

On macOS, if you download the archive with the browser, the strict
security checks on recent macOS will prevent it to run, and complain
that the program is damaged. That's obviously not true, and the fix
is simple, you need to remove the com.apple.quarantine extended
attribute.

```console
$ xattr -d com.apple.quarantine ~/Downloads/eclipse-embedcdt-2020-06-R-macosx.cocoa.x86_64.tar.gz
```

After un-archiving, if the application still complains, check/remove
the attribute from the `Eclipse.app` folder too:

```console
$ xattr -dr com.apple.quarantine ~/Downloads/Eclipse.app
```
