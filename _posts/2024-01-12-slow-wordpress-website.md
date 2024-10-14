---
layout: post
title:  "You're Doing WordPress Performance WRONG. Here's Why."
author: onar
image: /blog/assets/posts/slow-wordpress/meta.png
tags: [wordpress]


description: "Let's take a look at what's slowing down your WordPress website and what you can do to fix it."
# modified: 
---
<center>
<img loading="lazy"  width="600" alt="WordPress logo" src="/blog/assets/posts/slow-wordpress/wp.png">
</center>
<br/>

Slow websites are a big concern because they have a huge impact on your website and business. Here are some of them:

- Bad SEO
- Bad user experience
- Inaccessibility
- Loss of revenue
- Harm to your business reputation

In our previous articles we discussed [reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) and [hCaptcha](https://www.oopspam.com/blog/hcaptcha-performance-analyses) performance analysis and detailed how they affect the loading time of your website.

In this article, however, we will focus on why your [WordPress](https://wordpress.org/) website is slow. This is a common topic and deserves its own article. Our main focus would be: hosting, plugins and best practices to keep in mind.

{% include toc.md %}

## Why is WordPress slow?

No, WordPress is not slow by nature. It is fast. It gets slower when you start adding stuff to it without performance in mind. Keep in mind that most plugins, themes don't cause immediate performance problems. They pile up and eventually you end up with a slow site. This is where you start going down a rabbit hole to pinpoint the actual problem, but the issue usually doesn't originate from one fact, but several. That is why it is important when building your WordPress website to make every decision with performance in mind.

Let's look at these reasons and what you can do if you already have a performance problem with your website.

## Hosting, hosting, hosting

One of the main reasons why WordPress websites are slow is the hosting you are using. So if you are having slow loading time with your website, first thing to check is if others are having it too. Some popular hosting companies like BlueHost, GoDaddy are known to be slow.

If you are a technical or DIY person, go with a dedicated VPS. Cloud hosting options like [DigitalOcean](https://www.digitalocean.com/), [Hetzner](https://www.hetzner.com/) are cheaper and much faster than anything you will get from shared WordPress hosting companies. Alternatively, if you don't want to deal directly with cloud hosting companies, check out [Cloudways](https://www.cloudways.com/en/) (owned by DigitalOcean). Cloudways is cheap, fast, and easy to set up WordPress.

Other options for the non-DIY crowd are [Siteground](https://www.siteground.com/), [Kinsta](https://kinsta.com/), [GridPane](https://gridpane.com/), [WPEngine](https://wpengine.com/). Siteground is the cheapest among them and is faster compared to other cheap hosts.

## Caching

Caching is another way to help with slow website performance. There are plugins that you can use to cache your website. However, before installing a caching plugin, [put your website behind Cloudflare](https://developers.cloudflare.com/fundamentals/setup/account-setup/add-site/). Cloudflare will cache your website and serve your website from a location close to your visitors. Keep in mind that if you have a slow hosting, Cloudflare alone will not solve the slow website problem. 

Cloudflare will load images faster by caching them. If you still have a slow website, adding a caching plugin would help with a content cache (dynamic page content) so that your content loads faster. 

There are many options when it comes to caching plugins. From free solutions, check out [WP Fastest Cache](https://wordpress.org/plugins/wp-fastest-cache/). Perfmatters is a paid caching plugin that works great. Some hosting companies like Siteground offer their own caching plugin. They may work better with your hosting. Try them before using third parties.

## Plugins

Every WordPress plugin comes with some degree of performance impact. While admin-side (backend) plugins may affect your WordPress admin dashboard, many of the plugins target your front-end. These plugins load a lot of javascript, use cookies, do extra calculations on the client side, and this is where your website will start to slow down. They may also not play well with caching plugins. Before installing any plugin, be sure to check the performance impact. The more javascript and fonts you load on your website, the slower your website will be.

To give an example from our experience working with anti-spam solutions at [OOPSpam](https://www.oopspam.com/), contact form builders come with anti-spam features like hCAPTCHA, reCAPTCHA. If you start getting spam, you may want to enable reCAPTCHA on your forms. As shown in [our previous article](https://www.oopspam.com/blog/recaptcha-performance-analyses), reCAPTCHA will add extra seconds to your website loading time even if your form is simple and fast. For more information on how these solutions impact your website, check out [The Form Plugins for Accessibility, Performance and Spam Protection](https://www.oopspam.com/blog/best-wordpress-form-builder-plugins) article.

If you must use a plugin for a task, look for a performance optimized one. While you are at it, go through every plugin you have on your website and see which ones are unnecessary or inactive, remove them. Remember, an inactive plugin can still slow down your site.

## Other tips: Image optimization, HTTP2

Caching will help with image loading time, but it won't be able to optimize large images well. Make sure images are smaller, compressed so you don't load massive images on your site. Popular plugins for image optimization and compression are [ShortPixel](https://wordpress.org/plugins/shortpixel-image-optimiser/) and [TinyPNG](https://wordpress.org/plugins/tiny-compress-images/).


It is hard to imagine modern websites without SSL (also known as TLS, HTTPS) these days. Almost all hosting companies offer free SSL. Before settling on a hosting company, check if they offer HTTP2, which is much faster than the previous HTTP1.1.