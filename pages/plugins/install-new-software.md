---
title: How to install new Eclipse features
permalink: /plugins/install-new-software/

summary: Add optional features to an existing Eclipse.

comments: true

date: 2020-09-03 19:24:00 +0300

---

## For those in a hurry

New Eclipse features can be installed using the standard Eclipse install
mechanism:

- in the _Eclipse_ menu, go to **Help** → **Install New Software ...**

![Install New Software]({{ site.baseurl }}/assets/images/2020/install-new-software.png)

## Overview

As a collection of features, Eclipse projects may chose to pack only a
limited selection of features in the standard distributions, making all
other optional.

The user may chose to install the optional packages at any time.

The first choice is what repository to work with:

![Work With]({{ site.baseurl }}/assets/images/2020/available-software-work-with.png)

There are many choice, but most probably you'll want to install optional
CDT features.

The list of available repositories can be managed from here by 
using the **Manage...** button, or from the preferences pages.

![Work With]({{ site.baseurl }}/assets/images/2020/manage-available-software-sites.png)

## Install release candidates

Before each release, the new Eclipse Embedded CDT plug-ins are available
for beta testing from a separate p2 repository:

- `https://download.eclipse.org/embed-cdt/updates/v6-test/`

To use this p2 repository, click the **Add...** button and add the URL.
Name it **Eclipse Embedded CDT test**.

Usually the test plug-ins should be safe, but use them with caution.

## Updates

Once installed, the optional features can be updated as all other features,
using the **Check for Updates** mechanism. For details see the
[Update an Existing Eclipse]({{ site.baseurl }}/plugins/update/) page.

## Multiple standalone Eclipse instances

If multiple Eclipse instances are installed on a system (which is a good thing!)
each Eclipse is standalone, and does not share any content with other Eclipses.

Thus, installing new features in one Eclipse does not affect the features installed on other
Eclipses. Maintaining Eclipse consistency is very important in production
environments, and one of the reasons of using multiple Eclipse
instances.

## Conclusions

This Eclipse install mechanism allows to install features/plug-ins from
multiple repositories, and is relatively easy to use.
