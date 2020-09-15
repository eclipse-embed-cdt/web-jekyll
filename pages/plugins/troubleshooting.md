---
title: Troubleshooting Eclipse Embedded CDT install
permalink: /plugins/troubleshoot/

comments: true

keywords:
  - install

date: 2020-08-18 13:04:00 +0300

---

## Identifying plug-ins versions

One of the confusing details of the Eclipse Embedded CDT plug-ins versioning
system is matching the version from the release announcement (for example
**Version 2.6.1-201502281154 released**) with existing plug-ins/features.

The short answer is that the announced version refers to the update site.
The same version is also used for the `ilg.gnuarmeclipse.core` plug-in:

![Installed plug-ins]({{ site.baseurl }}/assets/images/2017/plugins-versions.png)

Although the core plug-in is referred by all features, this version number
cannot be found in the list of the features:

![Installed features]({{ site.baseurl }}/assets/images/2017/features.png)

However, the common point for all these magic numbers is the release date,
*201707191338* in this case, which is identical for all plug-ins and features.

Thus, the recommended method to **identify plug-ins and features** is
**by date, not by version**, which differs from object to object.

## Linux GTK issue

Eclipse may be incompatible with the GTK version 3 available in some older
distributions. To overcome this, disable the use of GTK 3, by adding the
following line to your environment:

```console
$ export SWT_GTK3=0
```

If, for any reason, a global setting is not possible, the GTK version can be
set in `eclipse.ini`:

```
--launcher.GTK_version
2
```

You might need to place this definition before:

```
--launcher.appendVmargs
```

This requirement is anecdotal and appears on some forums; the Eclipse
documentation does not mention it.

## macOS com.apple.quarantine

On macOS Sierra and later, unsigned applications are marked as _quarantined_
and subject to various restrictions, for example path randomization, which
prevents Eclipse to maintain persistent preferences (for more details see
[blog post](https://ilgthegeek.wordpress.com/2017/07/13/macos-com-apple-quarantine/)).
To disable this, remove the `com.apple.quarantine` extended attribute
from `Eclipse.app`:

```console
$ xattr Eclipse.app
com.apple.quarantine
$ xattr -dr com.apple.quarantine Eclipse.app
```

### Incomplete Eclipse

If Eclipse complains that some required items could not be found, most
probably you are trying to install the plug-ins on an older Eclipse, or
on another Eclipse package than the recommended
**Eclipse IDE for C/C++ Developers**.

```console
Cannot complete the install because one or more required items could not be found.
  Software being installed: GNU ARM C/C++ J-Link Debugging 4.1.1.201606210758 (ilg.gnuarmeclipse.debug.gdbjtag.jlink.feature.group 4.1.1.201606210758)
  Missing requirement: GNU ARM C/C++ Core 3.1.1.201606210758 (ilg.gnuarmeclipse.core 3.1.1.201606210758) requires 'bundle org.eclipse.cdt 8.6.0' but it could not be found
  Cannot satisfy dependency:
    From: GNU ARM C/C++ J-Link Debugging 4.1.1.201606210758 (ilg.gnuarmeclipse.debug.gdbjtag.jlink 4.1.1.201606210758)
    To: bundle ilg.gnuarmeclipse.core 0.0.0
  Cannot satisfy dependency:
    From: GNU ARM C/C++ J-Link Debugging 4.1.1.201606210758 (ilg.gnuarmeclipse.debug.gdbjtag.jlink.feature.group 4.1.1.201606210758)
    To: ilg.gnuarmeclipse.debug.gdbjtag.jlink [4.1.1.201606210758]
```

Reinstall the correct Eclipse package, or add CDT to the existing Eclipse
(**Programming Languages** → **C/C++ Development Tools**).

## Compatibility issues

Please note that starting with 4.x, compatibility with Eclipses previous
than 4.6 Neon was no longer possible. If, for any reason, you need a
solution for Eclipse Luna or Mars, you can try the Eclipse Embedded CDT
Plug-ins version 3.*, but please keep in mind that this version is no
longer maintained.

Similarly:

- starting with 3.1.x, compatibility with Eclipses previous than 4.4 Luna
was no longer possible. If, for any reason, you need a solution for Eclipse
Kepler, you can try the GNU ARM Eclipse Plug-in version 2.12, but please
keep in mind that this version is no longer maintained.
- starting with 1.1.x, compatibility with Eclipses previous than 4.3 Kepler
was no longer possible. If, for any reasons, you need a solution for older
Eclipse versions, you can try the GNU ARM Eclipse Plug-in version 0.5.5,
but please keep in mind that this old version is no longer maintained.

## Support

If you encountered any problems when installing the plug-ins, please refer to
the [Support]({{ site.baseurl }}/support/) page and **do not** send private
emails.
