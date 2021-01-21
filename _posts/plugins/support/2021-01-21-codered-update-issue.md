---
title:  'Embedded CDT plug-ins v6.0.0: CodeRed update failure'

date:   2021-01-21 09:47:00 +0200

categories:
  - support
  - plugins

tags:
  - gnu
  - arm
  - eclipse
  - sourceforge
  - oracle
  - jdk

---

In certain conditions, updating the Eclipse Embedded CDT plug-ins v6.0.0
may fail to update the CodeRed feature.

## Problem

The issue was identified as a configuration error in the CodeRed feature
([#484](https://github.com/eclipse-embed-cdt/eclipse-plugins/issues/484)).

## Solution

The problem was fixed and from v6.1.1 the CodeRed configuration is correct.

For existing Eclipses, in case the update fails, the workaround
is to **Install New Software** from the `updates/v6` URL.
