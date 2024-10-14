---
layout: post
title: How spammers abuse GitHub, Microsoft, and Google
author: onar
image: /blog/assets/posts/abused-by-spammers/meta.png
tags:
  - abuse
  - spam
description: At OOPSpam, we noticed new wide-spread spam campaign across top companies like Github, SoundCloud, Microsoft, Google due to lack of abuse detection.
preview: /posts/abused-by-spammers/meta.png
---

OOPSpam has recently mitigated spam campaigns that target our customers with lots of links to popular companies like Microsoft, GitHub, SoundCloud, MIT, ConvertKit and others. These spam attacks sometimes didn't contain much information, just simple links to these platforms, hoping to use their domain reputation to bypass spam filters.

![Spam on MIT's Scratch](/blog/assets/posts/abused-by-spammers/mit.jpg "Spam on MIT's Scratch")

The above screenshot is from MIT's [Scratch project](https://scratch.mit.edu/), the largest coding platform for kids. To avoid exposing children to harmful content, it is more important to have some kind of abuse detection.

The spam campaigns seem to come from the same source, trying to advertise similar products and websites.

Here is an example where a spammer is abusing the GitHub Apps page to build backlinks to their websites.

![Spam on GitHub Apps](/blog/assets/posts/abused-by-spammers/github.png "Spam on GitHub Apps")

Another example comes from ConvertKit, in this case the bad actor is using the ConvertKit community forum to post links to the above GitHub Apps page. 

![Spam on ConvertKit Community forum](/blog/assets/posts/abused-by-spammers/convertkit.png "Spam on ConvertKit Community forum")

Public platforms that require registration and ask you to solve a CAPTCHA are targeted.

Here's another one from Google Groups, unfortunately the link still lives, although the post was made November 15th, 2023.

![Spam on Google Group](/blog/assets/posts/abused-by-spammers/google.png "Spam on Google Group")

There are hundreds of attacks like this targeting popular websites. We have seen many universities, SaaS, public forums contain this type of spam.

## How do you mitigate abuse on a platform?

The problem has a lot of layers. First, at the DNS level, bots need to be blocked. This alone will not stop abuse. Both account creation, new post submissions need to go through spam detection.