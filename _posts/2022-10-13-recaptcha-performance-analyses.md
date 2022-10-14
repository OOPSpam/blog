---
layout: post
title:  "Does reCaptcha slow down your website?"
author: "Onar A."
image: /assets/posts/recaptcha/recaptcha-meta.png
tags: [reCaptcha, contact_form]


description: "Let's look at how reCaptcha slows down your website and what you can do about it. Performance Analyses & Alternatives"
# modified: 
---
<center>
<img width="772" alt="Lighthouse performance results" src="/blog/assets/posts/recaptcha/recaptcha-header.png">
</center>
<br/>

reCaptcha is a popular captcha solution. It's hard to imagine anyone who hasn't solved or seen at least one reCaptcha. It's arguably effective against automated spam bots. There are third-party services (like 2Captcha) that can solve reCaptcha challenges for as little as 0.02 cents each. Not all spam bots use these services, so reCaptcha still works for many.

And the best part is it's free. However, reCaptcha has drawbacks, including concerns with accessibility (only with reCaptcha v2), a slower website, and privacy . 

In this post, we will focus performance aspect of it, how reCaptcha slows down your website, and what you can do about it.

![reCaptcha](/blog/assets/posts/recaptcha/reCaptcha.png "reCaptcha")

{% include toc.md %}

## How reCaptcha slows down your website?

Every included JavaScript, CSS, or font file will hurt your website performance. This is unavoidable. It's best to keep it to a minimal as it's good for search engine ranking and user experience. As you may know, reCaptcha is a JavaScript-based widget. You can [integrate reCaptcha V3](https://developers.google.com/recaptcha/docs/v3) to your website by including a JavaScript file, a callback function to handle the token, and a button with reCaptcha attributes.

Our testing will be on the complete contact form we built in [our previous article](https://www.oopspam.com/blog/contact-form-with-PHP). In that article, we integrated OOPSpam as a spam filter instead of reCaptcha. We'll see the page performance before reCaptcha and after reCaptcha integration.

The form is quite simple with 3 fields and basic styling. We keep clear of using CMS systems like WordPress in order to see a distinct difference and less noise. 

![A simple contact form with 3 fields](/blog/assets/posts/recaptcha/cf.png "A simple contact form with 3 fields")


Using the [Lighthouse](https://web.dev/performance-scoring/) tool, we will evaluate the performance. Lighthouse is available in every Chromium-based browser (Chrome, Brave, etc.).

> The result may be different for you. Note that we are testing on a local PHP server for demonstration purposes. Fast hosting with CDN and performance optimization can improve page speed.

As soon as we integrate reCaptcha and setup it, we immediately notice a rise in network queries and data transfers. 

|  | # of network requests | Compressed transferred data | Uncompressed transferred data | Page Loaded In |
|---|---|---|---|---|
| Before reCaptcha | 5 | 35.6 kB | 37.3 kB | 285 ms |
| After reCaptcha | 13 | 565 kB | 1.3 MB | 1.56 seconds |
| **an increase of** | **160%** | **1487.08%** | **3385.25%** | **447.37%** |

- **# of network requests** : The number of network requests.
- **Compressed transferred data** : The compressed size of all uploaded & downloaded resources.
- **Uncompressed transferred data** : The uncompressed size of all uploaded & downloaded resources.

The browser first downloads compressed data, then decompresses them before using them to process and display relevant details on the page. 

From the above table, we can see that there is an increase of 447.37% in page load speed. In sophisticated systems like WordPress, this can considerably slow down your website. 

![Web page performance with reCaptcha](/blog/assets/posts/recaptcha/page-with-reCaptcha.png "Web page performance with reCaptcha")
![Web page performance without reCaptcha](/blog/assets/posts/recaptcha/page-without-reCaptcha.png "Web page performance without reCaptcha")

A single-page website with a basic form loaded in 1.56 seconds. In any website, you want to keep loading time below three seconds, considering [most people leave a page that takes more than 3 seconds to load](https://about.fb.com/news/2017/08/news-feed-fyi-showing-you-stories-that-link-to-faster-loading-webpages/).


## Faster website with and without reCaptcha

It's possible to improve site speed while using reCaptcha. You can achieve this by using caching, CDN, and delaying other unnecessary CSS and JavaScript files. The key component of reCaptcha integration is to include the reCaptcha's JavaScript file only on pages where reCaptcha is needed. If you are using WordPress, you can [add a code snippet](https://wordpress.ezoic.com/how-to-improve-site-speed-while-using-recaptcha/) into your WordPress theme's _functions.php_ file to prevent reCaptcha from loading its files on other pages.

> Don't load reCaptcha's JavaScript file on every page. Only where you need it.

Another way to improve your website speed is to replace reCaptcha with the back-end based spam filter options like [OOPSpam API](https://www.oopspam.com/) or [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/). Unlike reCaptcha or any other captcha solutions, the back-end-based spam filters work in your server and never interact with your users or load any resources in the front-end. With OOPSpam, there are no cookies, no JavaScript, and no challenges to solve on your website.