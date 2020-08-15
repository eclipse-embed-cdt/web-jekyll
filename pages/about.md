---
permalink: /about/
title: About

summary: Perfekt ist nicht gut genug.
comments: true

date: 2016-03-03 22:45:00 +0300
last_updated: 2019-12-06 22:15:37 +0200

---

## Motto

{% include callout.html content="_Perfekt ist nicht gut genug._" type="primary" %}

Some time ago, while watching a TV documentary about Porsche, I heard
this line and I liked it. If this is indeed one of the Porsche mottos,
then thank you Porsche for it (and for the beautiful designs).
(English: _"Perfect is not good enough"_)

## The project

The **GNU ARM Eclipse plug-in** project was registered on
[SourceForge](http://sourceforge.net/projects/gnuarmeclipse/) in
November 2006, and initially included an XML only plug-in definition;
although functional, it was somehow limited.

### First edition

The first fully functional edition of the plug-in (version 0.5.3) was
announced in March 2009, when the plug-in was practically recreated,
functionality was extended and more toolchains were supported. The
Eclipse specifics, like adding a feature project and an update site
project were also added.

### Second Edition

In September 2013, based on the Eclipse CDT and the new developments
in ARM Toolchains, work on the second edition of the plug-in started,
involving a major rewrite, inspired by the CDT Cross Compile plug-in.

In December 2013, new plug-ins were added to the project: the
**STM32Fx templates** and an experimental version of the SEGGER
J-Link hardware debugging plug-in.

At the same time, since the project is no longer about a single plug-in,
but a family of plug-ins, the SourceForge project name was changed to
plural: **GNU ARM Eclipse plug-ins**.

In February 2014, the version 2.x of the plug-ins family was published,
bringing official debugging support, via **SEGGER J-Link** and **OpenOCD**.
Templates for Freescale were also added.

In July 2014, the experimental version of the Packs plug-in was published,
providing management support (list/install/uninstall/outline) for CMSIS Packs.

### Migration to GitHub

In August 2015 the project was migrated to
[GitHub](https://github.com/gnuarmeclipse) and restructured as separate
sub-projects. For a more stability over time, the blog and wiki sites
hosted on the private livius.net server were migrate to the public
GitHub Pages.

With this migration also the name was shortened to **GNU ARM Eclipse**.

### Migration to Eclipse Foundation

In September 2019, the project was invited to join the Eclipse Foundation.
The legal process took some time to complete, and the project was
rebranded as Eclipse Embedded CDT. In July 2020 the 5.1.1
release was published on the Eclipse servers.

## Credit

Many thanks to:

- Wilfried Holzke who created the initial project and maintained versions
prior to 0.5.3;
- my good friend Dan Maiorescu, for his invaluable support during the design,
development and testing of the plug-ins.

## This site

The first project wiki was created in August 2008 using the SourceForge
hosted apps.

In early 2012, the Project Web was redesigned and the developer pages
were moved from the SourceForge hosted apps to the Project web, as a
MediaWiki site.

Unfortunately SourceForge introduced the policy of blocking outgoing
traffic from the Project web pages, and managing WordPress and MediaWiki
sites on SourceForge servers became unpractical.

In October 2013, the project documentation was moved to an external
[WordPress](http://wordpress.org/) site, and was intended to improve
communication with users by keeping them informed about current issues
and releases. The original URL was http://gnuarmeclipse.livius.net/blog.

The developer specific pages were also moved to an external MediaWiki site.
The original URL was http://gnuarmeclipse.livius.net/wiki.

In August 2015 those two sites were first migrated to GitHub Wiki, with
content split between multiple projects. Then the entire project pages
was migrated to a GitHub Pages site, located at
[http://gnuarmeclipse.github.io/](http://gnuarmeclipse.github.io/).

In August 2020, as part of the migration to the Eclipse Foundation,
the content was reorganised and with the xPacks related content
already moved to the [xPacks](https://xpack.github.io) site,
the Eclipse specific content was published at
[https://www.eclipse.org/embed-cdt](https://www.eclipse.org/embed-cdt).

## The author

This project is currently maintained by the Eclipse Foundation.
The project lead is **Liviu Ionescu**, a senior IT
engineer, with expertise in operating systems, compilers, embedded
systems and Internet technologies.

He can be reached at [ilg@livius.net](mailto:ilg@livius.net)
(this email address is given for courtesy, for all correspondence
related to this project please use the
[Support]({{ site.baseurl }}/support/) pages).
