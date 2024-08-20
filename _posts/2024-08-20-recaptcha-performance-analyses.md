---
layout: post
title:  "Does reCAPTCHA slow down your website?"
author: "Onar A."
image: /assets/posts/recaptcha/recaptcha-meta.png
tags: [captcha, contact_form]


description: "Let's look at how reCAPTCHA slows down your website and what you can do about it. Performance Analyses & Alternatives"
# modified: 
---
<center>
<img loading="lazy"  width="772" alt="Lighthouse reCAPTCHA performance results" src="/blog/assets/posts/recaptcha/recaptcha-header.webp">
</center>
<br/>

reCAPTCHA is a popular CAPTCHA solution. It's hard to imagine anyone who hasn't solved or seen at least one reCAPTCHA. It's arguably effective against automated spam bots. There are third-party services (such as 2Captcha) that can solve reCAPTCHA challenges for as little as 0.02 cents each. Not all spam bots use these services, so reCAPTCHA still works for many.

Best of all, it's free. However, reCAPTCHA has drawbacks, including accessibility issues (only with reCAPTCHA v2), a slower website, and privacy concerns.

Slow websites are a big problem because they have a huge impact on your website and business. Here are some of them:

- Bad SEO
- Bad user experience
- Inaccessibility
- Loss of revenue
- Damage to your business reputation

In this article we will focus on the performance aspect, how reCAPTCHA slows down your website and what you can do about it.

![reCaptcha](/blog/assets/posts/recaptcha/reCaptcha.png "reCaptcha")

{% include toc.md %}

## How does reCAPTCHA slow down your website?

Any included JavaScript, CSS or font file will slow down your website. This is unavoidable. It's best to keep it to a minimum as it's good for search engine ranking and user experience. 

As you may know, reCAPTCHA is a JavaScript based widget. You can [integrate reCAPTCHA V3](https://developers.google.com/recaptcha/docs/v3) into your website by including a JavaScript file in [every page](https://www.oopspam.com/blog/loading-recaptcha), a callback function to handle the token, and a button with reCAPTCHA attributes.

Our testing will be done on the complete contact form we created in [our previous article](https://www.oopspam.com/blog/contact-form-with-PHP). In that article, we integrated [OOPSpam](https://www.oopspam.com/) as a spam filter instead of reCAPTCHA. This time we will use reCAPTCHA as spam protection.

The form is quite simple with 3 fields and basic styling. To see a clear difference and less noise, we stay away from using CMS systems like WordPress.

![A simple 3 field contact form](/blog/assets/posts/recaptcha/cf.png "A simple 3 field contact form")

We will use the tool [Lighthouse](https://web.dev/performance-scoring/) to evaluate the performance. Lighthouse is available in any Chromium-based browser (Chrome, Brave, etc.).

> The result may be different for you. Note that we test on a local PHP server for demonstration purposes. Fast hosting with CDN and performance tuning can improve page speed.

As soon as we integrate reCAPTCHA and set it up, we immediately notice an increase in network hits and data transfers.

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
      <td>Before reCAPTCHA</td>
      <td>5</td>
      <td>35.6 kB</td>
      <td>37.3 kB</td>
      <td>285 ms</td>
    </tr>
    <tr>
      <td>After reCAPTCHA</td>
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

![Web page performance with reCAPTCHA](/blog/assets/posts/recaptcha/page-with-reCaptcha.png "Web page performance with reCAPTCHA")
![Website performance without reCAPTCHA](/blog/assets/posts/recaptcha/page-without-reCaptcha.png "Website performance without reCAPTCHA")

A single page website with a simple form loaded in 1.56 seconds. In any website, you want to keep the load time under three seconds, considering [most people leave a page that takes more than 3 seconds to load](https://about.fb.com/news/2017/08/news-feed-fyi-showing-you-stories-that-link-to-faster-loading-webpages/).

## Faster website with and without reCAPTCHA

It's possible to improve website speed while using reCAPTCHA. You can achieve this by using caching, CDN, and delaying other unnecessary CSS and JavaScript files.

> Some people may recommend not [loading reCAPTCHA files on every page](https://www.oopspam.com/blog/loading-recaptcha). According to Google's documentation, reCAPTCHA works best when it has the full context of how users interact with your entire site - both the legitimate behavior and the sketchy stuff.

Replacing reCAPTCHA with the server-side spam filtering options like [OOPSpam API](https://www.oopspam.com/) or [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to get a fast-loading website. Unlike reCAPTCHA or any other CAPTCHA solution, the backend based spam filters work in your server and never interact with your users or load any resources on the client side. With OOPSpam there are no cookies, no JavaScript and no challenges for your visitors to solve.