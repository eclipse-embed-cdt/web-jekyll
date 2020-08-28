---
title: 'GNU MCU Eclipse plug-ins v4.x update sites URLs migrated to Netlify'

date: 2017-07-09 12:06:00 +0300
last_updated: 2010-08-28 19:39:00 +0300

categories:
  - news
  - project

tags:
  - featured
  - sourceforge
  - netlify
  - downloads
  - update

---

Starting with Eclipse plug-ins v4.x, the **Eclipse update sites URLs** were **migrated** from the venerable SourceForge **to the new Netlify site**.

Currently the project has no more operational dependencies on SourceForge.

[Netlify](https://www.netlify.com) is a new (open source friendly) web hosting profider, with a very convenient way of managing and updating sites.

## Rationale

After several security incidents, by the end of 2016, SourceForge decided to change the security certificates and to mandate the use of HTTPS. This resulted in a large number of complains from users behind firewalls, who were no longer able to access the Eclipse update sites, and had to manually download archives and install locally. Although not at all the fault of GNU MCU Eclipse (the root of the problem seems to be in the Oracle Java libraries), the SourceForge desire to use stronger encryption was in the end perceived as a bad user experience by GNU MCU Eclipse users, a situation that we cannot accept.

## GitHub 

The main development site used by the project is and will remain GitHub, but since GitHub Releases currently do not support subfolders, publishing the Eclipse update sites on GitHub Releases is not an option. Publishing on GitHub Pages or even directly as a Git project might have been technically possible, but neither are intended for high volume downloads and do not provide any analytics.

## Bintray servers

[Bintray](https://bintray.com/) is a modern solution for software distribution, with many new features compared to the traditional SourceForge `rsync` approach.

The Bintray page to manage the downloads is [https://bintray.com/gnu-mcu-eclipse](https://bintray.com/gnu-mcu-eclipse), with several separate repositories, each with its own statistics.

The new internal URL addresses used for for the Eclipse plug-ins v4.x downloads are:

- [https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates](https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates)
- [https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates-test](https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates-test)
- [https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates-experimental](https://dl.bintray.com/gnu-mcu-eclipse/v4-neon-updates-experimental)

## Netlify redirects

The physical files may be stored on Bintray, but the official URL addresses to be used for installs/updates are on Nelify:

- [http://gnu-mcu-eclipse.netlify.com/v4-neon-updates](http://gnu-mcu-eclipse.netlify.com/v4-neon-updates)
- [http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test](http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test)
- [http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-experimental](http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-experimental)

## Expected issues

This change is expected to have no negative consequences on existing Eclipse installations. Enterprise networks with absurd security limitations which prevented direct access to the update site and required manual downloads of the release archives may (or may not...) have a better chance for normal Eclipse install/update.

The change in the public URL should be seamless, with all future plug-ins versions to automatically point to the new URLs.

_**Many thanks to all those who use this project!**_
