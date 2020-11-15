---
title: Build prerequisites
permalink: /develop/build-prerequisites/

summary: Tools required to build the plug-ins locally and run debug sessions.

comments: true

date: 2015-09-10 20:20:00 +0300

---

## Install & Configure Eclipse

### Install Git for Windows

On Windows, the `git` command is available in the
[Git for Windows](https://git-scm.com/download/win) package.

It also comes with a minimal POSIX environment. To access it, start
the `bash.exe` program.

### Install Sourcetree

For a convenient access to Git, it is recommended to install
[Sourcetree](https://www.sourcetreeapp.com/), available for macOS and Windows.

For GNU/Linux, either use GitKraken, or directly the command line Git.

### Install Java

Starting with Eclipse 2020-09, the minimum requirement is Java 11.
The builds running on the Eclipse infrastructure currently use
[AdoptOpenJDK](https://adoptopenjdk.net) version **11** (LTS).
For consistency reasons, it is recommended to install the same version.

Starting with 2020-09, Eclipse itself includes a JRE instance,
and for normal use it no longer needs a separate Java.
However, active development requires JDK; JRE is not enough,
without JDK it is not possible to compile the plug-ins and
run debug sessions.

{% include note.html content="If you already have a more recent version of
Java installed, or from a different distribution, you might be able to use
it, but, for consistency reasons, it is still recommended to install
AdoptOpenJDK 11." %}

{% capture windows %}

Windows

{% endcapture %}

{% capture macos %}

Go to the AdoptOpenJDK [download](https://adoptopenjdk.net/releases.html) page:

- download the jdk-11* macOS .pkg file (surprisingly, the .tar.gz is
  not an usual archive; it includes the macOS package, and requires
  even more efforts to use)
- double click it to start the install; it'll go into
  `/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk`.

{% endcapture %}

{% capture linux %}

linux

{% endcapture %}

{% include platform-tabs.html %}

### Prepare folders

- in a place of you choice (like `${HOME}/Work`), create a folder `eclipse-embed-cdt.github`
- inside it create a folder `develop`

```bash
mkdir -p "${HOME}/Work/eclipse-embed-cdt.github/develop"
```

### Install Eclipse IDE for Eclipse Committers

This instance of Eclipse is specialised for Eclipse plug-ins development.
The recommened version is 2020-09.

{% assign includeIndex = "2" %}
{% capture windows %}

Windows

{% endcapture %}

{% capture macos %}

Go to the 2020-09
[download](https://www.eclipse.org/downloads/packages/release/2020-09/r/) page:

- identify the **Eclipse IDE for Eclipse Committers** section
- download the macOS binary
  (for example `eclipse-cpp-2020-09-R-macosx-cocoa-x86_64.dmg`)
- double click on the .dmg image file
- drag and drop the `Eclipse.app` into the `eclipse-embed-cdt.github/develop`
  folder
- remove the `com.apple.quarantine` attribute:

```bash
xattr -dr com.apple.quarantine Eclipse.app
```

- rename `Eclipse.app` to `Eclipse-committers-2020-09.app`

{% endcapture %}

{% capture linux %}

linux

{% endcapture %}

{% include platform-tabs.html %}

### Start the new Eclipse

- in the `.../eclipse-embed-cdt.github/develop` folder create a new workspace
  named `eclipse-committers-2020-09-workspace`
  (note: be sure you create the workspace where you need it to be, since
  moving later is generally not supported by Eclipse; if you need this,
  preferably create a new workspace)
- check **Use this as default...**
- check if you installed the right Eclipse; go to the _Eclipse_ menu →
  **Help** (**Eclipse** on macOS) → **About Eclipse** and the first line
  should read **Eclipse IDE for Eclipse Committers**

### Set Java 11 as default

- in the _Eclipse_ menu → **(Window →) Preferences** → **Java** → **Installed JREs**
  - Add → Standard VM
    - JRE Home: select the `/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home` folder
    - JRE name: **AdoptOpenJDK 11**
  - click the **Apply** button
- in the _Eclipse_ menu → **(Window →) Preferences** → **Java** → **Installed JREs** → **Execution Environments**
  - in the left pane select **JavaSE-11**
  - in the right pane select **AdoptOpenJDK 11**
  - click the **Apply and Close** button
- in the _Eclipse_ menu → **(Window →) Preferences** → **Java** → **Compiler**
  - Compiler compliance level: select 11
  - click the **Apply and Close** button

### Install several Eclipse plug-ins

- **Help** → **Install New Software**
  - Work with: `2020-09 - http://download.eclipse.org/releases/2020-09`
    - In **Application Development Framework**
      - optional **Eclipse Project SDK**
    - In **Mobile and Device Development**
      - select **C/C++ GCC Cross Compile Support**
      - select **C/C++ GDB Hardware Debugging**
      - select **C/C++ Memory View Enhancements**
    - In **Programming Languages**
      - optional **C/C++ Autotools**
      - select **C/C++ Development Tools**
      - select **C/C++ Development Tools SDK**
      - optional **C/C++ Docker Container Launch Support**
      - optional **C/C++ LLVM-Family**
      - optional **C/C++ Unit Testing Support**
    - In **Web, XML, Java and OSGi Enterprise Development**
      - select **Eclipse XML Editors and Tools**
      - select **Eclipse XSL Development Tools**
      - select **JavaScript Development Tools**
    - click the **Next** button
    - accept the terms of the license agreement
    - click the **Finish** button
  - wait for the new plug-ins to be installed (in background, see status line)
- restart
- click the Workspace button in the top right corner

{% include note.html content="Without the **C/C++ Development Tools SDK**
which includes the CDT sources, the extension point
schemas will not be available so attempts to add new elements to the
extensions will not be possible, and only 'Generic' elements will be
offered." %}

### Install base API CDT 10.0.0

{% include note.html content="Since 6.0.0; previous releases were based on
CDT 9.2.1." %}

- go to [CDT download](http://www.eclipse.org/cdt/downloads.php) page,
  and download `cdt-10.0.0.zip`
  (for compatibility with Eclipse 2020-09)
- unpack the archive
- move the new `cdt-10.0.0` folder into the `develop` folder
- in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development**
  → **Target Platform**
  - click the **Add...** button
  - select **Nothing: Start with an empty target**
  - Next
    - Enter name: `cdt-10.0.0`
    - click **Add...** → **Directory** → **Next >**
    - click **Browse...** → `cdt-10.0.0`
    - click the **Finish** button
  - click the **Reload** button
  - click the **Finish**
- enable only the **Running Platform as Active** (mandatory!)
- click **Apply and Close**

Selecting the running platform is required when starting Eclipse to Run or
Debug, without it the core plug-ins will not be available.

- in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development**
  → **API Baselines**
  - click the **Add Baseline...** button
  - select **A target platform**
    - Enter name: `cdt-10.0.0`
    - enable `cdt-10.0.0`
    - click the **Refresh** button
    - click the **Finish** button
- click **Apply and Close**

### Create and configure the workspace

- change the workspace preferences
  - go to the _Eclipse_ menu → **(Window →) Preferences...**
  - **General** → **Workspace**
    - enable **Refresh on access**
    - set **Text file encoding: UTF-8**
    - click the **Apply** button
  - **General** → **Editors** → **Text Editors**
    - enable **Show Print Margin** (80)
    - enable **Show Line Numbers**
    - click the **Apply** button
  - **General** → **Editors** → **File Associations**
    - click **Add** and add `*.sh`, `*.command`, `*.ini`, `*.liquid`, `*.launch`
    - for each, click the **Add** button in the Associate editors area
    - associate with the **Text Editor**
    - click the **Apply and Close** button

  - go to the _Eclipse_ menu → **(Window →) Preferences...**
  - **Run/Debug** → **Console**
    - disable Limit console output
    - click the **Apply** button
  - **Java** → **Editor** → **Folding**
    - disable **Header Comments**
    - disable **Imports**
    - click the **Apply** button
  - **XML** → **XML Files** → **Editor**
    - Line width 72
    - enable **Split multiple attributes...**
    - disable **Align final bracket...**
    - enable **Preserve whitespace in tags with PCDATA content**
    - enable **Clear all blank lines**
    - disable **Format comments**
    - enable **Insert whitespace before closing...**
    - enable **Indent using tabs**
    - click the **Apply** button
  - click the **Apply and Close** button

### Install a Eclipse CDT for tests

This separate instance of Eclipse will be used to test the plug-in.

Go to [Eclipse download site](http://www.eclipse.org/downloads/) and follow
the [download packages](https://www.eclipse.org/downloads/eclipse-packages/)
link.

#### Eclipse CDT 2020-09

From
[Eclipse download packages](https://www.eclipse.org/downloads/eclipse-packages/)
install **Eclipse IDE for C/C++ Developers**.

- download **Eclipse IDE for C/C++ Developers**
  (`eclipse-cpp-2020-09-R-macosx-cocoa-x86_64.dmg`)
- unpack the archive into the `develop` folder
- on macOS, remove the `com.apple.quarantine` attribute:

```bash
xattr -dr com.apple.quarantine Eclipse.app
```

- rename `Eclipse.app` to `Eclipse-cpp-2020-09.app`
- start Eclipse, use an workspace named `eclipse-cpp-2020-09-workspace`
- enable **Use this as the default**
- click the **Hide** button in the top right corner
- in the _Eclipse_ menu → **(Window →) Preferences** → **C/C++** →
  **Appearance**
  - disable **Show source roots at top of project**
  - click the **Apply and Close**
- in Project Explorer, click the three vertical dots icon →
  **Filters and Customizations...**
  - disable the **.* resources** line
  - click the **OK** button

Enable the **Plug-in development** prspective ans switch to it.

## Clone the repositories

On Unix systems, the recommended method is using a command line:

```bash
cd ${HOME}/Work/eclipse-embed-cdt.github
git clone --recurse-submodules \
  https://github.com/eclipse-embed-cdt/eclipse-plugins.git \
  eclipse-plugins.git
```

On Windows, the `git` command is available in the
[Git for Windows](https://git-scm.com/download/win) package, it should
have been installed from the first step.

## Import the projects

In the commiters Eclipse, import projects using the generic importer:

- _Eclipse_ menu → **Project**
  - enable **Build Automatically**
- _Eclipse_ menu → **File** → **Import**
- Select
  - General → **Existing Projects into Workspace**
  - click **Next**
- Import Projects
  - Root Directory: `${Work}/eclipse-embed-cdt.github/eclipse-plugins.git`
  - enable **Search for nested projects**
  - disable **Copy projects into workspace**
  - disable **Add project(s) to working set**
  - click **Finish**

## Create the Maven run configurations

To start the plug-ins Maven build from Eclipse:

- in the `Embed CDT plugins root` set, select the `embed-cdt-plugins`
  project
- _Eclipse_ menu → **Run** → **Run Configurations...**
- double click the **Maven Build** entry
- **Name:** `Embed CDT clean verify`
- in the Main tab
  - Base directory: click the Workspace... button and select the
    `embed-cdt-plugins`
  - Goals: `-V clean verify`
- click the **Apply** button
- in the JRE tab
  - select the Execution environment **JavaSE-11** (to ensure compatibility
    with older environments)
- click the **Apply** button  

Duplicate the configuration as `Embed CDT clean` and update the goal to `clean`.

## CDT Wiki

For more details, see [CDT Wiki](https://wiki.eclipse.org/CDT),
especially the [Getting started with CDT development](https://wiki.eclipse.org/Getting_started_with_CDT_development) page.

