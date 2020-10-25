---
title:  "The Eclipse Embedded CDT project web has a new look!"

date: 2020-08-05 12:47:00 +0300

categories:
  - news
  - web

tags:
  - jekyll
  - update


---

After several re-branding iterations, the **Eclipse Embedded CDT** project,
available from
[GitHub](https://github.com/eclipse-embed-cdt), has a **new web site**.

## GitHub Pages

The site continues to use [GitHub Pages](https://pages.github.com),
which is the GitHub solution for providing documentation sites to hosted
projects, but, for more flexibility, the conversion from markdown to html
is performed by a CI job.

## Jekyll & markdown

GitHub Pages use [Jekyll](http://jekyllrb.com) to generate static web
sites, and the most convenient input format for Jekyll is
[markdown](http://daringfireball.net/projects/markdown/syntax).

The new site uses the standard GitHub setup, which automatically runs
the Jekyll generator; thus an external build step is no longer needed.

## Old GNU MCU Eclipse web

The old [gnu-mcu-eclipse.github.io](https://gnu-mcu-eclipse.github.io/)
site now automatically redirects most of its pages to the new site.

## Preview web

The new setup also includes a preview site, where new content can be
tested without disturbing the main site.

The preview site URL is
[https://eclipse-embed-cdt.github.io/web-preview/](https://eclipse-embed-cdt.github.io/web-preview/).

The CI job automatically publishes all pushes to the `develop` branch onto
the preview site; pushes to `master` are published onto the main site.
