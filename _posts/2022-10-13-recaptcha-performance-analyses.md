---
layout: post
title:  "Does reCaptcha slow down your website?"
author: "Onar A."
image: /assets/posts/recaptcha/recaptcha-meta.png
tags: [captcha, contact_form]


description: "Let's look at how reCaptcha slows down your website and what you can do about it. Performance Analyses & Alternatives"
# modified: 
---
<center>
<img width="772" alt="Lighthouse reCaptcha performance results" src="/blog/assets/posts/recaptcha/recaptcha-header.webp">
</center>
<br/>

reCaptcha is a popular captcha solution. It's hard to imagine anyone who hasn't solved or seen at least one reCaptcha. It's arguably effective against automated spam bots. There are third-party services (such as 2Captcha) that can solve reCaptcha challenges for as little as 0.02 cents each. Not all spam bots use these services, so reCaptcha still works for many.

Best of all, it's free. However, reCaptcha has drawbacks, including accessibility issues (only with reCaptcha v2), a slower website, and privacy concerns.

Slow websites are a big problem because they have a huge impact on your website and business. Here are some of them:

- Bad SEO
- Bad user experience
- Inaccessibility
- Loss of revenue
- Damage to your business reputation

In this article we will focus on the performance aspect, how reCaptcha slows down your website and what you can do about it.

![reCaptcha](/blog/assets/posts/recaptcha/reCaptcha.png "reCaptcha")

{% include toc.md %}

## How does reCaptcha slow down your website?

Any included JavaScript, CSS or font file will slow down your website. This is unavoidable. It's best to keep it to a minimum as it's good for search engine ranking and user experience. As you may know, reCaptcha is a JavaScript based widget. You can [integrate reCaptcha V3](https://developers.google.com/recaptcha/docs/v3) into your website by including a JavaScript file, a callback function to handle the token, and a button with reCaptcha attributes.

Our testing will be done on the complete contact form we created in [our previous article](https://www.oopspam.com/blog/contact-form-with-PHP). In that article, we integrated [OOPSpam](https://www.oopspam.com/) as a spam filter instead of reCaptcha. This time we will use reCaptcha as spam protection. Let's see the page performance before and after reCaptcha integration.

The form is quite simple with 3 fields and basic styling. To see a clear difference and less noise, we stay away from using CMS systems like WordPress. 

![A simple 3 field contact form](/blog/assets/posts/recaptcha/cf.png "A simple 3 field contact form")


We will use the tool [Lighthouse](https://web.dev/performance-scoring/) to evaluate the performance. Lighthouse is available in any Chromium-based browser (Chrome, Brave, etc.).

> The result may be different for you. Note that we test on a local PHP server for demonstration purposes. Fast hosting with CDN and performance tuning can improve page speed.

As soon as we integrate reCaptcha and set it up, we immediately notice an increase in network hits and data transfers.

<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>&nbsp;</th>
      <th># of network requests</th>
      <th>Compressed transferred data</th>
      <th>Uncompressed transferred data</th>
      <th>Page Loaded In</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Before reCaptcha</td>
      <td>5</td>
      <td>35.6 kB</td>
      <td>37.3 kB</td>
      <td>285 ms</td>
    </tr>
    <tr>
      <td>After reCaptcha</td>
      <td>13</td>
      <td>565 kB</td>
      <td>1.3 MB</td>
      <td>1.56 seconds</td>
    </tr>
    <tr>
      <td><strong>an increase of</strong></td>
      <td><strong>160%</strong></td>
      <td><strong>1487.08%</strong></td>
      <td><strong>3385.25%</strong></td>
      <td><strong>447.37%</strong></td>
    </tr>
  </tbody>
</table>

- **# of network requests** : The number of network requests.
- **Compressed transferred data** : The compressed size of all uploaded & downloaded resources.
- **Uncompressed transferred data** : The uncompressed size of all uploaded & downloaded resources.

The browser first downloads compressed data, then decompresses it before using it to process and display relevant details on the page. 

From the table above, we can see that there is a 447.37% increase in page load speed. In sophisticated systems like WordPress, this can slow down your website considerably. 

![Web page performance with reCaptcha](/blog/assets/posts/recaptcha/page-with-reCaptcha.png "Web page performance with reCaptcha")
![Website performance without reCaptcha](/blog/assets/posts/recaptcha/page-without-reCaptcha.png "Website performance without reCaptcha")

A single page website with a simple form loaded in 1.56 seconds. In any website, you want to keep the load time under three seconds, considering [most people leave a page that takes more than 3 seconds to load](https://about.fb.com/news/2017/08/news-feed-fyi-showing-you-stories-that-link-to-faster-loading-webpages/).

## Faster website with and without reCaptcha

It's possible to improve website speed while using reCaptcha. You can achieve this by using caching, CDN, and delaying other unnecessary CSS and JavaScript files. The key component of reCaptcha integration is to include the reCaptcha JavaScript file only on pages where reCaptcha is needed. If you are using WordPress, you can [add a code snippet](https://wordpress.ezoic.com/how-to-improve-site-speed-while-using-recaptcha/) to your WordPress theme's _functions.php_ file to prevent reCaptcha from loading its files on other pages.

> Don't load reCaptcha's JavaScript file on every page. Only where you need it.

Replacing reCaptcha with the server-side spam filtering options like [OOPSpam API](https://www.oopspam.com/) or [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to get a fast-loading website. Unlike reCaptcha or any other captcha solution, the backend based spam filters work in your server and never interact with your users or load any resources on the client side. With OOPSpam there are no cookies, no JavaScript and no challenges for your visitors to solve.