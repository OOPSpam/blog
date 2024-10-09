---
layout: post
title:  "Does hCAPTCHA slow down your website?"
author: onar
image: /assets/posts/hcaptcha/hcaptcha-meta.png
tags: [captcha, contact_form]


description: "Let's look at how hCAPTCHA slows down your website and what you can do about it. Performance Analyses & Alternatives"
# modified: 
---
<center>
<img loading="lazy"  width="600" alt="Lighthouse hCAPTCHA performance results" src="/blog/assets/posts/hcaptcha/hcaptcha-meta.png">
</center>
<br/>

Slow websites are a big concern because they have a huge impact on your website and business. Here are some of them:

- Bad SEO
- Bad user experience
- Inaccessibility
- Loss of revenue
- Harm to your business reputation

In our previous article we discussed [reCaptcha performance analysis](https://www.oopspam.com/blog/recaptcha-performance-analyses) and detailed how it affects the loading time of your website. In this article, however, we will focus on [hCaptcha](https://www.hcaptcha.com/), a privacy-friendly alternative to [reCAPTCHA](https://www.oopspam.com/blog/best-recaptcha-alternatives). They are almost identical in the way they work and are implemented.

hCAPTCHA is a widely used alternative to reCAPTCHA. It is praised for its privacy-friendly approach and is not as invasive as reCAPTCHA. However, they both suffer from the same issues like accessibility, performance, and privacy (still). There are third-party services (such as 2Captcha) that can solve hCAPTCHA challenges for as little as 0.02 cents each. This is why people still get spam despite having hCAPTCHA. Not all spam bots use these workarounds, so hCAPTCHA still works for many.

We will focus on the performance aspect. How hCAPTCHA slows down your website and what you can do about it.

![hCaptcha](/blog/assets/posts/hcaptcha/hCaptcha.png "hCaptcha")

{% include toc.md %}

## How does hCAPTCHA slow down your website?

Every included JavaScript, CSS or font file will slow down your website. This is unavoidable. It's best to keep it to a minimum as it's good for SEO and user experience. As you may know, hCAPTCHA is a JavaScript based widget. You can [integrate hCAPTCHA](https://docs.hcaptcha.com/) into your website by including a JavaScript file, a callback function to handle the token, and an HTML ``div`` element with hCAPTCHA attributes.

Our tests will be on the full contact form we built in [our previous article](https://www.oopspam.com/blog/contact-form-with-PHP). In that article, we integrated [OOPSpam](https://www.oopspam.com/) as a spam filter instead of hCAPTCHA. This time we will use hCAPTCHA to see the performance of the page before and after hCAPTCHA integration.

The form is quite simple with 3 fields and basic styling. We stay away from using CMS systems like WordPress to see a clear difference and less noise. 

![A simple contact form with 3 fields](/blog/assets/posts/hcaptcha/cf.png "A simple contact form with 3 fields")


With the help of the tool [Lighthouse](https://web.dev/performance-scoring/) we will evaluate the performance. Lighthouse is available in any Chromium-based browser (Chrome, Brave, etc.).

> The result may be different for you. Note that we test on a local PHP server for demonstration purposes. Fast hosting with CDN and performance tuning can improve page speed.

As soon as we integrate and configure hCAPTCHA, we immediately notice an increase in network queries and data transfers.

<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>&nbsp;</th>
      <th># of network requests</th>
      <th>Compressed transferred data</th>
      <th>Resources</th>
      <th>Page Loaded In</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Before hCAPTCHA</td>
      <td>6</td>
      <td>39.1 kB</td>
      <td>40.7 kB</td>
      <td>174 ms</td>
    </tr>
    <tr>
      <td>After hCAPTCHA</td>
      <td>12</td>
      <td>322 kB</td>
      <td>1.0 MB</td>
      <td>557 ms</td>
    </tr>
    <tr>
      <td><strong>an increase of</strong></td>
      <td><strong>100%</strong></td>
      <td><strong>723.52%</strong></td>
      <td><strong>2357%</strong></td>
      <td><strong>220.11%</strong></td>
    </tr>
  </tbody>
</table>

- **# of network requests** : The number of network requests.
- **Compressed transferred data** : The compressed size of all uploaded & downloaded resources.
- **Resources** : The size of the resources

The browser first downloads compressed data, then decompresses it before using it to process and display relevant details on the page. 

From the table above, we can see that there is a 220.11% increase in page load speed. In sophisticated systems like WordPress, this can slow down your website considerably. 

![Web page performance with hCAPTCHA](/blog/assets/posts/hcaptcha/page-with-hCaptcha.png "Web page performance with hCAPTCHA")
![Website performance without hCAPTCHA](/blog/assets/posts/hcaptcha/page-without-hCaptcha.png "Website performance without hCAPTCHA")

A single page website with a simple form loaded in 557 ms. This is much better than reCAPTCHA with 1.56 seconds load time.

In any website, you want to keep the load time below three seconds, considering that [most people leave a page that takes more than 3 seconds to load](https://about.fb.com/news/2017/08/news-feed-fyi-showing-you-stories-that-link-to-faster-loading-webpages/).

## Faster website with and without hCAPTCHA

It's possible to improve website speed while using hCAPTCHA. You can achieve this by using caching, CDN, and delaying other unnecessary CSS and JavaScript files. Another improvement you can do is to make sure that hCAPTCHA scripts are loaded only where you use them. If you are using WordPress, make sure to use their [official plugin](https://wordpress.org/plugins/hcaptcha-for-forms-and-more/) because [since version 1.10.1](https://github.com/hCaptcha/hcaptcha-wordpress-plugin/issues/48) the plugin will only load scripts on hCAPTCHA enabled pages.

If you want to completely eliminate concerns about page speed, try server-side spam filtering options like [OOPSpam API](https://www.oopspam.com/) or [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋). Unlike hCAPTCHA or any other CAPTCHA solution, the backend based spam filters work in your server and never interact with your users or load any resources on the client side. With OOPSpam, there are no cookies, no JavaScript and no challenges to slow down your website or visitors.