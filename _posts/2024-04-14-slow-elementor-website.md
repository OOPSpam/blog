---
layout: post
title:  "Slow Elementor Site? 7 Hacks Experts Use to Drastically Improve Page Speed"
author: onar
image: /assets/posts/slow-elementor/meta.png
tags: [wordpress]

description: "Learn how to speed up your Elementor website with these proven 7 tips."
# modified: 
---
<center>
<img loading="lazy"  alt="Elementor website builder homepage" src="/blog/assets/posts/slow-elementor/elementor.png">
</center>
<br/>

[In our previous article](https://www.oopspam.com/blog/slow-wordpress-website), we talked about performance issues with WordPress and how to speed up your website no matter what page builder you are using. If you haven't checked out the article, please do so before continuing, as it provides general speed optimization tips that would still apply to [Elementor](https://elementor.com/).

In this article, however, we will focus on what you can do to improve your Elementor-built website using the tools Elementor provides, without relying on additional plugins.

{% include toc.md %}

## Why is Elementor Slow?

If you are not building a website with a native page builder like WordPress's Gutenberg, then anything you add to your website, like Elementor, will be an additional burden on your server. Adding more plugins, builders, and themes means more weight on your server, which can lead to slower performance.

![Slow Elementor Website page speed](/blog/assets/posts/slow-elementor/pagespeed.webp "Slow Elementor Website page speed")

However, using Elementor doesn't automatically mean you will have a slower website. In fact, Elementor's default theme, [Hello Theme](https://elementor.com/blog/introducing-hello-theme/), is designed to be faster than many other WordPress themes.

Before we dive into optimizing Elementor, it's important to take a step back and consider the broader factors that can affect your website's speed:

1. Do you have a fast and reliable hosting provider?
2. Have you installed too many third-party plugins?
3. Is your chosen WordPress theme heavyweight and poorly optimized?

These are the foundational issues that can significantly impact your website's performance, regardless of the page builder you're using. If you haven't addressed these, you may want to do so before focusing specifically on Elementor optimization.


## Hosting, Hosting, Hosting

One of the primary reasons why WordPress and Elementor websites can be slow is the hosting provider you're using. If you're experiencing slow loading times, the first thing to check is whether other users are reporting similar issues with your hosting company.

Some popular hosting providers like Bluehost and GoDaddy are known for being slower compared to other options. If you're technically inclined or prefer a DIY approach, consider opting for a dedicated VPS (Virtual Private Server) or cloud hosting solutions.

Cloud hosting providers like [DigitalOcean](https://www.digitalocean.com/), [Hetzner](https://www.hetzner.com/), and [Cloudways](https://www.cloudways.com/en/) are generally faster and more affordable than traditional shared WordPress hosting plans. Cloudways, in particular, is a managed cloud hosting service that makes it easy to set up WordPress without dealing directly with the cloud provider.

For non-technical users, other reliable and faster hosting options include [Siteground](https://www.siteground.com/), [Kinsta](https://kinsta.com/), [GridPane](https://gridpane.com/), and [WPEngine](https://wpengine.com/). Among these, Siteground is often considered the most affordable option while still providing faster performance compared to other cheap hosts.

Regardless of your technical expertise, investing in a reliable and performant hosting solution is crucial for ensuring your Elementor-powered website loads quickly and provides a smooth user experience.

## Caching

Caching is an effective way to improve the performance of your Elementor-powered website. By caching your website's content, you can dramatically reduce the server's workload and serve pages to visitors more quickly.

Before installing a caching plugin, it's recommended to first set up your website behind Cloudflare. [Cloudflare](https://developers.cloudflare.com/fundamentals/setup/account-setup/add-site/) is a content delivery network (CDN) that can cache your website's assets and serve them from a location closer to your visitors, reducing the time it takes for the content to load.

Keep in mind that while Cloudflare can help, it may not completely solve the problem if you have a slow hosting provider. Cloudflare will still be limited by the speed of your underlying hosting infrastructure.

If you still experience slowness after setting up Cloudflare, you should consider adding a caching plugin to your WordPress website. This will help cache the dynamic content on your pages, further improving loading times.

Some popular caching plugin options include:

- **WP Fastest Cache** (free) - A lightweight and easy-to-use caching plugin for WordPress.
- **Perfmatters** (paid) - A premium caching plugin that works great with Elementor.

![WP Fastest Cache stats](/blog/assets/posts/slow-elementor/caching-plugin.jpg "WP Fastest Cache stats")

Some hosting providers, like Siteground, also offer their own caching plugins that may integrate better with your hosting environment. It's worth trying these before using a third-party caching plugin, as they may provide better optimization for your specific hosting setup.

By leveraging both Cloudflare and a reliable caching plugin, you can significantly improve the loading speed of your Elementor-built website, providing a better user experience for your visitors.

## Plugins

Every WordPress plugin you add to your website comes with a certain degree of performance impact. While some plugins primarily affect the backend (admin dashboard), many of them target the front-end of your website, which can significantly slow down your Elementor-powered site.

These front-end-focused plugins often load a lot of JavaScript, use cookies, and perform extra calculations on the client-side. This additional overhead can negatively impact your website's loading times, and the plugins may not always play well with caching solutions.

To give a concrete example from our experience building performance-optimized anti-spam solutions at [OOPSpam](https://www.oopspam.com/), the Elementor Forms comes with [built-in anti-spam options](https://www.oopspam.com/blog/spam-protection-for-elementor-forms) like hCAPTCHA and reCAPTCHA. As we discussed in [our previous article](https://www.oopspam.com/blog/recaptcha-performance-analyses), enabling reCAPTCHA or [hCAPTCHA](https://www.oopspam.com/blog/adding-hcaptcha-elementorform) on your Elementor forms can add several seconds to your website's loading time, even if the form itself is simple and fast.

For more information on how form plugins can impact your website's performance and accessibility, check out [The Form Plugins for Accessibility, Performance and Spam Protection](https://www.oopspam.com/blog/best-wordpress-form-builder-plugins) article. As an alternative, we recommend disabling the reCAPTCHA/hCaptcha features in your Elementor Forms and using the [OOPSpam Anti-Spam WordPress](https://wordpress.org/plugins/oopspam-anti-spam/) plugin, which has zero impact on website loading times.

When it comes to plugins, it's crucial to be selective and only install the ones that are truly necessary for your website's functionality. If you must use a plugin, try to find a performance-optimized option. Additionally, go through all the plugins you currently have installed, both active and inactive, and remove any that are unnecessary. Even inactive plugins can still impact your site's performance.

## Website Layout and Structure

One of the keys to making your Elementor-built website fast is to keep the structure of the page simple. The way your page is built, with all the different elements and how they're arranged, can really affect how quickly it loads. The goal here is to keep the Document Object Model (DOM) size to a minimum.

![Website layout](/blog/assets/posts/slow-elementor/layout.webp "Website layout")

1. Don't Use Too Many Plugins
Elementor has tons of plugins and add-ons you can use to add more features. But each plugin you add will make your page a bit heavier and slower. Try to only use the essential plugins and widgets.

2. Make Your Own Custom Elements
If there are certain element combinations you use a lot, you can create your own custom Elementor elements for those. This lets you reuse them without adding a lot of extra stuff to the page.

3. Use CSS Instead of Nesting
Elementor makes it easy to nest lots of elements inside each other. But that can make the page structure really complex. See if you can achieve the same visual effects using CSS positioning and layout tools instead.

4. Organize With Containers
Elementor has handy container elements like sections and columns. Use these to group related content together, instead of just scattering elements around. This keeps the structure clean and simple.

5. Design for Performance
When you're building your Elementor pages, always think about how the structure will affect performance. Try to find the most efficient way to achieve the look you want, without making the page overly complex.

## Other Tips: Image Optimization, HTTP/2

Caching can help improve image loading times, but it won't be able to optimize large, uncompressed images effectively. Make sure to optimize your images by compressing them and reducing their file sizes before uploading them to your Elementor-powered website.

Popular WordPress plugins for image optimization and compression include:

- [ShortPixel](https://wordpress.org/plugins/shortpixel-image-optimiser/)
- [TinyPNG](https://wordpress.org/plugins/tiny-compress-images/)

These plugins can automatically optimize your images, reducing their file sizes without sacrificing quality, which can have a significant impact on your website's overall loading speed.

Another important factor to consider is the use of SSL (also known as TLS or HTTPS). In today's web landscape, it's hard to imagine a modern website without SSL. Fortunately, most hosting companies now offer free SSL certificates. 

When choosing a hosting provider, make sure to also check if they support HTTP/2, which is a newer, faster version of the HTTP protocol. HTTP/2 offers several performance improvements over the previous HTTP/1.1 version, including multiplexing, header compression, and server push, all of which can help your Elementor-built website load faster.

By combining image optimization techniques, leveraging caching, and ensuring your website uses the latest HTTP/2 protocol, you can significantly improve the overall performance of your Elementor-powered website, providing a smooth and efficient experience for your users.

In addition to the tips and tricks discussed above, check out the official Elementor speed optimization [article](https://elementor.com/help/speed-up-a-slow-site/) and [videos](https://www.youtube.com/playlist?list=PLZyp9H25CboFg7tA0J3ksRf7gjOsrW1Ot).
