---
title: How to update the Eclipse Embedded CDT plug-ins
permalink: /plugins/update/

summary: Update the plug-ins installed on an Eclipse instance.

date: 2020-08-17 18:33:00 +0300
last_updated: 2020-09-08 18:17:52 +0300

---

## For those in a hurry

The Eclipse Embedded CDT plug-ins use the standard Eclipse update
mechanism:

- in the _Eclipse_ menu, go to **Help** → **Check for Updates...**

![Check for Updates]({{ site.baseurl }}/assets/images/2020/check-for-updates.png)

## Overview

By design, Eclipse is a collection of features, each refering one or more
plug-ins; the features are the smallest unit for installing and updating
plug-ins.

Each feature keeps track of the URL of the update site used to install it (also called _Eclipse p2 repository_).

When Eclipse is instructed to check for updates, all the p2 repositories are
checked for newer versions.

If newer versions are available, Eclipse lists them and the user can select
which to update.

![Available Updates]({{ site.baseurl }}/assets/images/2020/available-updates.png)

The next tep is to review and accept the license:

![Available Updates License]({{ site.baseurl }}/assets/images/2020/available-updates-license.png)

The update may take a while, and Eclipse will ask to restart to make use of
the new plug-ins.

## Multiple standalone Eclipse instances

If multiple Eclipse instances are installed on a system (which is a good thing!)
each Eclipse is standalone, and does not share any content with other Eclipses.

Thus, updating one Eclipse does not affect the plug-ins installed on other
Eclipses. Maintaining Eclipse consistency is very important in production
environments, and one of the reasons of using multiple Eclipse
instances.

## Conclusions

This mechanism is common for all Eclipse plug-ins, and, unless when in the
middle of a critical project, it is recommended that
from time to time to update the Eclipse plug-ins.
