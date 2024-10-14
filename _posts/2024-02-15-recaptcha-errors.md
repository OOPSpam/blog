---
layout: post
title: Common reCAPTCHA Errors And How To Solve Them
author: onar
image: /blog/assets/posts/recaptcha-errors/meta.png
tags: [recaptcha]

description: Learn how to fix common reCAPTCHA issues
---

Getting errors with reCAPTCHA can be frustrating. However, don't worry! This guide will walk you through the most common issues users face with reCAPTCHA and provide simple solutions to troubleshoot them quickly. Whether you're integrating reCAPTCHA into your website or encountering errors during usage, this article will help you navigate through them smoothly. Let's dive in and solve those pesky reCAPTCHA errors together!

{% include toc.md %}

## Invalid site key

Here are some reasons why you may be seeing this error:

- Double-check that you have copied the correct site key from your reCAPTCHA admin console and that it matches the one on your website.
- Remember that reCAPTCHA keys are domain-specific, so they won't work if used on a different domain. Make sure to enter your domain name under *Domains* when generating keys.
- Also, ensure that your reCAPTCHA keys match the version of reCAPTCHA you are using. reCAPTCHA comes in v2 and v3. Verify that you are using the correct reCAPTCHA type (v2 or v3) corresponding to the reCAPTCHA version you are using on your site.
- Confirm whether your site key has expired or has been revoked for any reason. If so, generate a new site key from the reCAPTCHA admin console.

![reCAPTCHA Type](/blog/assets/posts/recaptcha-errors/Type.png "reCAPTCHA Type")

## Blocked a frame with origin from accessing a cross-origin frame

- First, ensure that the website has SSL/HTTPS/TLS enabled. If not, you may get this error.
- Disable any browser extensions, especially privacy extensions, that may attempt to remove or block reCAPTCHA scripts from loading. 
- If none of the above solutions work, contact your hosting company. Your server may have security restriction policies, such as Content Security Policy or Cross-Origin, in place that prevent reCAPTCHA from loading.

![reCAPTCHA CORS error](/blog/assets/posts/recaptcha-errors/origin.jpg "reCAPTCHA CORS error")

## Localhost is not in the list of supported domains

This is self-explanatory. If you run your website locally, reCAPTCHA won't work because it doesn't support localhost. If you want to enable it, you need to add it (e.g. `127.0.0.1`, `locahost`, `yourlocaldomain.host`) under *Domains* in the admin console.

![reCAPTCHA Domains](/blog/assets/posts/recaptcha-errors/Domains.png "reCAPTCHA Domains")

## reCAPTCHA has already been rendered in this element

Check to see if you are loading reCAPTCHA twice. This is a common issue with CMS solutions where you may have different form builders and you have enabled reCAPTCHA on two different solutions. In WordPress, if two different form builder plugins try to load reCAPTCHA, it will cause a script conflict and neither reCAPTCHA will work.

If you load reCAPTCHA scripts twice, you may also see these errors:

- reCAPTCHA placeholder element must be an element or id
- reCAPTCHA placeholder element must be empty

![reCAPTCHA Rendered error](/blog/assets/posts/recaptcha-errors/rendered.png "Rendered error")

## No CAPTCHA, no error solution?

reCAPTCHA works in the browser of your visitors. So it is open to manipulation, conflicts with browser extensions. These are only some of the reasons why people have to deal with the above mentioned issues. Some other reasons why people don't want to use reCAPTCHA is because it [slows down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses), makes it inaccessible and raises privacy concerns. If you are looking for an alternative solution, [OOPSpam API](https://www.oopspam.com/) (that's us 👋) and [OOPSpam WordPress plugin](https://www.oopspam.com/wordpress) works in the background, never interacts with your visitors, has no impact on your website speed.

Hope this article was helpful. Have a spam free day!