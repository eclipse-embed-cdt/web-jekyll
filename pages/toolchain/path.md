---
title: Toolchain path management
permalink: /toolchain/path/

date: 2015-09-11 23:00:00 +0300
last_updated: 2020-08-28 19:45:02 +0300

---

## Overview

Generally toolchain path management is an advanced feature, required when multiple toolchains are installed on a machine.

## Why use multiple toolchains?

### Production environments

In production environments, when doing maintenance for old products, to obtain repetitive results, it is strongly recommended to build old versions with their original toolchain version.

Since toolchains developers are quite active, releasing several versions each year, it soon becomes necessary to manage multiple toolchains, each with multiple versions.

### R&D environments

In addition to production environments, in research environments, developers usually experiment with multiple toolchains and toolchain versions, to test their programs.

## Path management in commercial IDEs

Most of the commercial IDEs include the toolchain packed in the distribution, and handle the path to it automatically and transparently for the user. When using the supplied toolchain, things are extremely easy. Using other toolchains/versions is a different story, more complicated and sometimes even impossible.

## Default path management in Eclipse CDT

By default, the Eclipse managed build plug-ins do not handle the toolchain path at all, and rely on the proper setting of the environment PATH to reach the toolchain binaries. The PATH can be set in different places:

- in the environment where Eclipse is started (either a system global setting or a per user setting)
- in the Eclipse workspace, common for all projects
- in the project build configuration

This mechanism can be both flexible and a source of nuisance. When only a single toolchain is installed, any global setting is acceptable and the exact method makes no real difference.

However, when multiple toolchains are installed, the use of any global setting is strongly discouraged, since it soon leads to serious problems generally due to messing headers and executables between different toolchains. In this case the only recommended solution is to define the toolchain path for each build configuration.

![Toolchain path in project environment]({{ site.baseurl }}/assets/images/2017/project-environment.png)

## CDT Cross build plug-in

The integrated CDT Cross build plug-in does exactly this, defines a path for each projects. Unfortunately it stores this setting in the .cproject file, making it non-portable between different machines, and even worse between different platforms (Windows/Unix).

## What is project portability?

In short, a portable project is a project that can be used without changes on any workspace on any platform.

For more details, please see the separate
[Project portability]({{ site.baseurl }}/eclipse/project/portability/) page.

## The Eclipse Embedded CDT solution

Generating portable projects was one of the design requirements of the Eclipse Embedded CDT cross build plug-in, at the same time with the apparently conflicting requirement for handling multiple toolchains and versions.

To achieve this, the Eclipse Embedded CDT cross build plug-in provides a large selection of existing toolchains, and associate each one with a separate path. For special projects that require a specific version, it also allows to associate a path to each project. In all cases this association is stored in the workspace internal folders, and not in the project configuration, so it is not passed via the repository from one developer to the other.

The default (and the recommended) setting, is to use the global toolchain path.

![Toolchains Properties]({{ site.baseurl }}/assets/images/2018/toolchain-properties.png)

The displayed path is associated with the selected toolchain. To change the toolchain path use the hyperlinks; it is recommended to use the global page, but, if needed, the toolchain path can also be configured per workspace or even per project.

![Global Tools Paths]({{ site.baseurl }}/assets/images/2018/global-arm-toolchains-paths.png)

Clicking the **xPack...** button allows to enter the path by selecting the xPack version. (The button is enabled only for toolchains that are distributed as xPacks).

![Global Tools Paths]({{ site.baseurl }}/assets/images/2018/global-arm-toolchains-paths-xpack.png)

> macOS note: due to a weird decision of the Eclipse macOS developers, the file system browser does not show file/folders starting with a dot; thus, the `.content/bin` final part of the path must be entered manually.

Using the global toolchain path does not store any data in the project configuration files, but in the Eclipse folders, so the project portability is not affected.

## Troubleshooting

### No toolchain path

Forgetting to set the toolchain path, or setting a wrong value, is easy to diagnose, since the Eclipse editor will be full of red markers to all definitions related to system headers, and, even more explictly, the build will fail:

![Missing or wrong path]({{ site.baseurl }}/assets/images/2014/02/NoToolchainPath.png)

If so, enter the project **C/C++ Settings**, the **Toolchains** tab, and add/correct the toolchain path (see above).

### Checking the compiler version

If you are not sure that the plug-in selected the desired toolchain, you can insert a pre-build action to display the version. The command to do this is

	${cross_prefix}${cross_c}${cross_suffix} --version

The page to setup this is the project **Properties** → **C/C++ Build** → **Settings** → **Build Steps**:

![Pre-build step to display compiler version]({{ site.baseurl }}/assets/images/2014/02/PreBuildVersion.png)

### The installer already updated the system path

If you used an unfriendly installer, which already updated the system path without asking, you should manually fix this situation, and **remove the toolchain path from the system path**.
