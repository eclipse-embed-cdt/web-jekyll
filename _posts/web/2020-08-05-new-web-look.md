---
title:  "The Eclipse Embedded CDT project web has a new look!"

date: 2020-08-05 12:47:00 +0300
last_updated: 2020-08-28 19:39:02 +0300

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
projects

## Jekyll & markdown

GitHub Pages use [Jekyll](http://jekyllrb.com) to generate static web
sites, and the most convenient input format for Jekyll is
[markdown](http://daringfireball.net/projects/markdown/syntax).

The new site uses the standard GitHub setup, which automatically runs
the Jekyll generator; thus an external build step is no longer needed.

## Content migration

The initial location of the new site was the `web-preview.git` project.

Content from the old site was migrated to the new site, with updates.

Switching fom the external builder to GitHub required some changes:

- there is no automatic detection of last modified date, so
  the `last_updated:` was added to posts
- the `kramdown` markdown parser does not have the `autolink` option, so
  links must be explicit
