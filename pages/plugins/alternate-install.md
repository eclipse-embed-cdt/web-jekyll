---
title: Alternate ways to install the Eclipse Embedded CDT plug-ins
permalink: /plugins/install-alternate/

summary: Other ways to install the Embedded CDT plug-ins on an existing Eclipse.

date: 2020-08-18 21:04:00 +0300
last_updated: 2020-08-29 13:46:55 +0300

---

## Overview

If, for any reasons, installing the **Eclipse IDE for Embedded C/C++
Developers** is not convenient, it is possible to install the **Eclipse
Embedded CDT plug-ins** on top of an existing Eclipse, for example
**Eclipse IDE for C/C++ Developers**.

## Eclipse IDE for C/C++ Developers

To install this package, go to the
[Eclipse packages](http://www.eclipse.org/downloads/eclipse-packages) and
get the **Eclipse IDE for C/C++ Developers** archive appropriate for your
platform.

Links to older versions are available in the **More Downloads** section,
at the bottom.

![Eclipse packages]({{ site.baseurl }}/assets/images/2016/eclipse-packages.png)

In case you reached the main Eclipse downloads page, avoid the recommended
download and follow the link to the Eclipse packages.

![Eclipse downloads]({{ site.baseurl }}/assets/images/2016/eclipse-downloads.png)

## Prerequisites: CDT 9.2.1

For the **Eclipse Embedded CDT plug-ins** to run, the minimum CDT version is
**9.2.1**, that came with **Eclipse** 4.6 Neon.3**.

{% include warning.html content="Do not
try to use earlier versions, since either the install will fail (with
something like _... requires 'bundle org.eclipse.cdt 9.2.1' but it could
not be found_), or it will not run properly." %}

As mentioned before, the recommended way is to use a fresh **Eclipse IDE
for C/C++ Developers** for the cross ARM development projects. Even if you
did so, but especially if you did not do so, it is a good idea to check
if you really have the latest version available. For this, enter the
_Eclipse_ menu and go to **Help** → **Install New Software**

![Install new software]({{ site.baseurl }}/assets/images/2016/install-new-software.png)

- select *Work with:* **Neon** (or more recent)
- if the *Group items by category* is enabled, expand the **Programming
Languages** group
- select the **C/C++ Development Tools** feature
- click the **Next** button and follow the usual installation procedure

![CDT install]({{ site.baseurl }}/assets/images/2017/install-cdt.png)

{% include important.html content="Be sure your Eclipse is **4.6 Neon.3** or
later, otherwise the plug-ins will refuse to install, claiming **Missing
requirements** and **Cannot satisfy dependency**." %}

## The Eclipse Marketplace way

The easiest way to install/update the plug-ins is to use the Eclipse Marketplace:

- go to the _Eclipse_ menu → **Help** → **Eclipse Marketplace...**
- in the Find field, enter **Eclipse Embedded CDT**
- click the **Go** button

This should identify Eclipse Embedded CDT and offer to Install/Update/Uninstall
assets:

![Eclipse Marketplace Search]({{ site.baseurl }}/assets/images/2017/eclipse-marketplace-search.png)

## The Eclipse update site way

The classical way to install the Eclipse Embedded CDT plug-ins is to use the Eclipse standard install/update mechanism in the _Eclipse_ menu → **Help** → **Install New Software...**

- in the *Install* window, click the **Add...** button (on future updates, select the URL in the **Work with:** combo)
- fill in *Name:* with **Eclipse Embedded CDT**
- fill in *Location:* with **https://download.eclipse.org/embed-cdt/updates/neon/**
- click the **OK** button

![AddRepository]({{ site.baseurl }}/assets/images/2017/add-repository.png)

- normally the main window should list a group named **GNU ARM & RISC-V Cross Development Tools**; expand it
- (in case the main window will list *There are no categorized items*, you are probably using a very old version; disable the Group items by category option)
- select all the plug-ins (the one marked *End of life* is needed only for compatibility with previous version, normally can be safely skipped)
- click the **Next** button and follow the usual installation procedure

![Plug-ins install]({{ site.baseurl }}/assets/images/2017/plugins-install.png)

Once you define the update site URL, further updates are greatly simplified (**Help** → **Check For Updates**).

## The local archive way

If, for any reason, you need to install a specific version of the plug-in, the solution is to download the `ilg.gnumcueclipse.repository-<version>.zip` archive from [Eclipse servers](https://projects.eclipse.org/projects/iot.embed-cdt/governance/); for releases pre v5.1.1 use [GitHub Releases](https://github.com/eclipse-embed-cdt/eclipse-plugins/releases), or, for even older releases, from [SourceForge Files](http://sourceforge.net/projects/gnuarmeclipse/files/Current%20Releases/) and to point the Eclipse update mechanism to the local archive: In the _Eclipse_ menu → **Help** → **Install New Software...**

- in the *Install* window, click the **Add...** button
- in the *Add Repository* window, click the **Archive...** button
    - in the *Repository archive* window, select the downloaded .zip archive
    - click the **OK** button
- click the OK button
- follow the usual installation procedure

![Add repository from archive]({{ site.baseurl }}/assets/images/2013/10/AddArchiveRepository.png)

## Off-line install

If, for any reasons, you need to install the Eclipse Embedded CDT plug-ins on a system without permanent Internet connection, and decide for the alternate way presented above, please be aware that the debug plug-ins require the presence of the **C/C++ GDB Hardware Debugging** plug-in. Usually this plug-in is not included in the standard package, but is present in the **CDT Optional Features** category, packed with the CDT archives available from the [CDT download site](https://www.eclipse.org/cdt/downloads.php). Download the desired archive, add it to your update sites, select the **C/C++ GDB Hardware Debugging** plug-in, restart as usual, and then install the Eclipse Embedded CDT plug-ins from the local archive, as above.

![Install the GDB Hardware]({{ site.baseurl }}/assets/images/2013/10/GDB_Hardware_Install.png)

Note: Attempts to install the Eclipse Embedded CDT plug-ins off-line without having the **C/C++ GDB Hardware Debugging** installed fails with an error related to installing the `ilg.gnumcueclipse.debug.gdbjtag.jlink.feature.group` and other debugging features.

On-line install do not have this problem since the Eclipse automatically downloads the C/C++ GDB Hardware Debugging plug-in from the CDT update site.
