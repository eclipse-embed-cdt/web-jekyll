---
title:  Eclipse IDE for Embedded C/C++ Developers 2020-12 released

date:   2020-12-16 13:00:00 +0200

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

For convenience, version **6.0.0** of the plug-ins is also available as
Eclipse packages, which pack together the
**Eclipse IDE for C/C++ Developers** standard distribution
(Eclipse 4.18) with the **Eclipse Embedded CDT plug-ins**.

## Compatibility

Special precautions were taken to preserve compatibility with projects
created by pre-6.x plug-ins, such that user projects will continue to
be accepted directly for **Import**, without modifications.

However, due to the way Eclipse manages perspectives and views, by
caching some IDs, workspaces created with pre-6.x plug-ins may exhibit
several problems when used directly.

To avoid such situations, it is recommended to **create a new workspace**
with the new release and **import the projects there**.

## Download

- Windows x86_64 [zip](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-win32-x86_64.zip) ([sha](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-win32-x86_64.zip.sha))
- macOS x86_64 [tar.gz](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-macosx-cocoa-x86_64.tar.gz) ([sha]( https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-macosx-cocoa-x86_64.tar.gz.sha))
- macOS x86_64 [dmg](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-macosx-cocoa-x86_64.dmg) ([sha]( https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-macosx-cocoa-x86_64.dmg.sha))
- Linux x86_64 [tar.gz](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-linux-gtk-x86_64.tar.gz) ([sha](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-linux-gtk-x86_64.tar.gz.sha))
- Linux AArch64 [tar.gz](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-linux-gtk-aarch64.tar.gz) ([sha](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-embedcpp-2020-12-R-linux-gtk-aarch64.tar.gz.sha)) <-- NEW! Runs on Raspberry Pi OS 64-bit

## Eclipse IDE 2020-12 R Packages

These packages are also available from the
[Eclipse IDE 2020-12 R Packages](https://www.eclipse.org/downloads/packages/release/2020-12/r) page.

## Eclipse Installer 2020‑12 R

These packages can also be installed via the Eclipse Installer, which
now includes a JRE for macOS, Windows and Linux.

## macOS security notice

On macOS, if you download the archive with the browser, the strict
security checks on recent macOS will prevent it to run, and complain
that the program is damaged. That's obviously not true, and the fix
is simple, you need to remove the com.apple.quarantine extended
attribute.

```console
$ xattr -c ~/Downloads/eclipse-embedcdt-2020-12-R-macosx-cocoa-x86_64.tar.gz
```

After un-archiving, if the application still complains, check/remove
the attribute from the `Eclipse.app` folder too:

```console
$ xattr -cr ~/Downloads/Eclipse.app
```
