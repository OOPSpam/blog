---
layout: post
title: How to Hide the reCAPTCHA Badge?
author: Onar A.
image: /assets/posts/recaptcha-badge/meta.png
tags: [recaptcha]

description: Learn how to properly hide the reCAPTCHA badge and display the required notice on your form?
---

## Why is there a "Protected by reCAPTCHA?" badge?

If you use [reCAPTCHA](https://developers.google.com/recaptcha/), you need to include a disclaimer on every page where reCAPTCHA is loaded. This disclaimer can take the form of a badge or a simple text link to Google's privacy policy and terms.

![Protected by reCAPTCHA](/blog/assets/posts/recaptcha-badge/recaptcha-badge-icon-banner.png "Protected by reCAPTCHA")

## Can I hide the reCAPTCHA badge?

The reCAPTCHA Terms of Service [require](https://developers.google.com/recaptcha/docs/faq#id-like-to-hide-the-recaptcha-badge.-what-is-allowed) any site using reCAPTCHA to display the reCAPTCHA badge to users. Hiding the reCAPTCHA badge without displaying the required disclaimer and links to the privacy policy and terms of service may violate these terms.

## How to hide reCAPTCHA badge?

Apply CSS to your website as below:

```css
.grecaptcha-badge { visibility: hidden; }
```

then make sure that the reCAPTCHA branding is visible in the user flow with the following text:

```html
This site is protected by reCAPTCHA and the Google <a href="https://policies.google.com/privacy">Privacy Policy</a> and <a href="https://policies.google.com/terms">Terms of Service</a> apply.
```

## How do I hide the reCAPTCHA badge on a WordPress website?

In your WordPress dashboard, go to *Appearance -> Customize -> Additional CSS* and add the above CSS code.

![CSS code to hide the reCAPTCHA badge in WordPress](/blog/assets/posts/recaptcha-badge/css-hide-badge.png "CSS code to hide the reCAPTCHA badge in WordPress")

Next, we need to add a privacy and terms notice to our form to let our users know that we use reCAPTCHA. Remember, you need to include this if you hide the badge.

![Form protected by reCAPTCHA](/blog/assets/posts/recaptcha-badge/privacy-notice.png "Form protected by reCAPTCHA")

## No CAPTCHA, no badge solution?

Maybe you don't want to have a badge or a notice on your form and want to keep it clean from noise. Some other reasons why people don't want to use reCAPTCHA is because it [slows down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses), makes it inaccessible and raises privacy concerns. If you are looking for an alternative solution, [OOPSpam API](https://www.oopspam.com/) and [OOPSpam WordPress plugin](https://www.oopspam.com/wordpress) works in the background, never interacts with your visitors, has no impact on your website speed.

Hope this article was helpful. Have a spam free day!