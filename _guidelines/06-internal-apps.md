---
layout:     guidelines
title:      "Internal Application endpoints"
subtitle:   "Who what where?"
collection: guidelines
permalink:  /guidelines/appendpoints/
---

## Table of Contents
{:.no_toc}

1. Automatic Table of Contents Here
{:toc}


### Where to look for our apps...

The links below are the latest set of builds that are available on our internal server for internal use only.
Links may change without warning as we are still working out this world of CD, all of the available apps are listed on the [deployment homepage](https://internal.exceedra-sp.com:10111/deployapp/)

## Basic URL structure moving forwards will be

https://internal.exceedra-sp.com:10111/deployapp/[major].[minor].[patch]_[Enhancement]_[Branch]/wpf.xbap


Branch note: [master] is the one that we send to our clients (+ the demo) and is the version available from sftp, [dev] is an unstable and is not available anywhere else except here and changes on every check-in to the dev branch.

Once [dev] features are tested and pas okay they are merged into [master].

One further note is the last number of the version is now dictated by the build server and is the build ID for that version on TeamCity and because E0 is actually already 2.9.1.207 we need to make E1 version start at 2.9.1.1000 so anything under 1000 is E0.

Apologies for the complexity, but we cannot remove the ‘1’ from all E0 clients without creating a lot of work for our support team.

Version 2.9 E2 is an easier one as its 2.9.2.xxx