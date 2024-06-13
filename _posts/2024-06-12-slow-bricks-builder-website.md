---
layout: post
title:  "Slow Bricks Site? 7 Hacks to Improve Website Performance"
author: "Onar A."
image: /assets/posts/slow-bricks/meta.png
tags: [wordpress]

description: "Learn how to speed up website building with Bricks Builder with these 7 proven tips."
# modified: 
---
<center>
<img loading="lazy"  alt="Bricks Builder homepage" src="/blog/assets/posts/slow-bricks/bricks.png">
</center>
<br/>

[In our previous article](https://www.oopspam.com/blog/slow-wordpress-website), we talked about performance issues with WordPress and how to speed up your website no matter what page builder you are using. If you haven't checked out the article, please do so before continuing, as it provides general speed optimization tips that would still apply to [Bricks Builder](https://bricksbuilder.io/).

In this article, however, we will focus on what you can do to improve your Bricks-built website using the tools Bricks Builder provides, without relying on additional plugins.

{% include toc.md %}

## Why is Bricks Slow?

Unless you are building a website with a native page builder like WordPress's Gutenberg, anything you add to your website, such as Bricks Builder, will put additional strain on your server. Adding more plugins, builders, and themes means more weight on your server, which can lead to slower performance. The good news is that Bricks Builder is a theme, not a plugin, unlike other page builders, and is optimized for speed. It produces clean semantic HTML, uses lazy loading, has no JQuery dependencies, and more. So it should be faster out of the box.

![Slow Bricks Website page speed](/blog/assets/posts/slow-Bricks/pagespeed.webp "Slow Bricks Website page speed")

Before we dive into optimizing Bricks' theme, it's important to take a step back and consider the broader factors that can affect your website's speed:

1. Do you have a fast and reliable hosting provider?
2. Have you installed too many third-party plugins?
3. Is your chosen WordPress theme heavyweight and poorly optimized?

These are the foundational issues that can significantly impact your website's performance, regardless of the page builder you're using. If you haven't addressed these, you may want to do so before focusing specifically on Bricks optimization.

## Hosting, Hosting, Hosting

One of the primary reasons why WordPress and Bricks websites can be slow is the hosting provider you're using. If you're experiencing slow loading times, the first thing to check is whether other users are reporting similar issues with your hosting company.

Some popular hosting providers like Bluehost and GoDaddy are known for being slower compared to other options. If you're technically inclined or prefer a DIY approach, consider opting for a dedicated VPS (Virtual Private Server) or cloud hosting solutions.

Cloud hosting providers like [DigitalOcean](https://www.digitalocean.com/), [Hetzner](https://www.hetzner.com/), and [Cloudways](https://www.cloudways.com/en/) are generally faster and more affordable than traditional shared WordPress hosting plans. Cloudways, in particular, is a managed cloud hosting service that makes it easy to set up WordPress without dealing directly with the cloud provider.

For non-technical users, other reliable and faster hosting options include [Siteground](https://www.siteground.com/), [Kinsta](https://kinsta.com/), [GridPane](https://gridpane.com/), and [WPEngine](https://wpengine.com/). Among these, Siteground is often considered the most affordable option while still providing faster performance compared to other cheap hosts.

Regardless of your technical expertise, investing in a reliable and performant hosting solution is crucial for ensuring your Bricks-powered website loads quickly and provides a smooth user experience.

## Caching

Caching is an effective way to improve the performance of your Bricks-powered website. By caching your website's content, you can dramatically reduce the server's workload and serve pages to visitors more quickly.

Before installing a caching plugin, it's recommended to first set up your website behind Cloudflare. [Cloudflare](https://developers.cloudflare.com/fundamentals/setup/account-setup/add-site/) is a content delivery network (CDN) that can cache your website's assets and serve them from a location closer to your visitors, reducing the time it takes for the content to load.

Keep in mind that while Cloudflare can help, it may not completely solve the problem if you have a slow hosting provider. Cloudflare will still be limited by the speed of your underlying hosting infrastructure.

If you still experience slowness after setting up Cloudflare, you should consider adding a caching plugin to your WordPress website. This will help cache the dynamic content on your pages, further improving loading times.

Some popular caching plugin options include:

- **WP Fastest Cache** (free) - A lightweight and easy-to-use caching plugin for WordPress.
- **Perfmatters** (paid) - A premium caching plugin that works great with Bricks.

![WP Fastest Cache stats](/blog/assets/posts/slow-Bricks/caching-plugin.jpg "WP Fastest Cache stats")

Some hosting providers, like Siteground, also offer their own caching plugins that may integrate better with your hosting environment. It's worth trying these before using a third-party caching plugin, as they may provide better optimization for your specific hosting setup.

By leveraging both Cloudflare and a reliable caching plugin, you can significantly improve the loading speed of your Bricks-built website, providing a better user experience for your visitors.

## Plugins

Every WordPress plugin you add to your website comes with a certain degree of performance impact. While some plugins primarily affect the backend (admin dashboard), many of them target the front-end of your website, which can significantly slow down your Bricks-powered site.

These front-end-focused plugins often load a lot of JavaScript, use cookies, and perform extra calculations on the client-side. This additional overhead can negatively impact your website's loading times, and the plugins may not always play well with caching solutions.

To give a concrete example from our experience building performance-optimized anti-spam solutions at [OOPSpam](https://www.oopspam.com/), the Bricks Forms comes with [built-in anti-spam options](https://www.oopspam.com/blog/spam-protection-for-bricks) like hCaptcha and reCaptcha. As we discussed in [our previous article](https://www.oopspam.com/blog/recaptcha-performance-analyses), enabling reCaptcha on your Bricks forms can add several seconds to your website's loading time, even if the form itself is simple and fast.

For more information on how form plugins can impact your website's performance and accessibility, check out [The Form Plugins for Accessibility, Performance and Spam Protection](https://www.oopspam.com/blog/best-wordpress-form-builder-plugins) article. As an alternative, we recommend disabling the reCaptcha/hCaptcha features in your Bricks Forms and using the [OOPSpam Anti-Spam WordPress](https://wordpress.org/plugins/oopspam-anti-spam/) plugin, which can provide better website loading times.

When it comes to plugins, it's crucial to be selective and only install the ones that are truly necessary for your website's functionality. If you must use a plugin, try to find a performance-optimized option. Additionally, go through all the plugins you currently have installed, both active and inactive, and remove any that are unnecessary. Even inactive plugins can still impact your site's performance.

## Configuring performance settings

Bricks Builder comes with performance settings that you can adjust to increase the speed of your website. Here are some of them that can speed up your website:

- Disable emojis: There is an additional JavaScript file that is loaded to support emoji on your website. You can prevent this file from loading by enabling this setting. Note that emojis will not render after you enable this.
- Disable embed: To support video embedding, Bricks also loads a javascript file, so if you are not embedding anything from external sources on your site, like a YouTube video, then enable this feature.
- Disable lazy-loading: If you are not happy with how Bricks handles lazy loading, you can disable it and use a third party plugin instead. I recommend disabling this setting as it's not worth adding another plugin for lazy loading. Bricks Builder's lazy loading works fine as it is.
- Cache query loops: This setting allows you to cache some queries. Some plugins may not work well with this feature, so check your site again after enabling it.

![Bricks Builder Performance settings tab](/blog/assets/posts/slow-bricks/perf-settings.png "Bricks Builder Performance settings tab")

## Other Tips: Image Optimization, HTTP/2

Caching can help improve image loading times, but it won't be able to optimize large, uncompressed images effectively. Make sure to optimize your images by compressing them and reducing their file sizes before uploading them to your Bricks-powered website.

Popular WordPress plugins for image optimization and compression include:

- [ShortPixel](https://wordpress.org/plugins/shortpixel-image-optimiser/)
- [TinyPNG](https://wordpress.org/plugins/tiny-compress-images/)

These plugins can automatically optimize your images, reducing their file sizes without sacrificing quality, which can have a significant impact on your website's overall loading speed.

Another important factor to consider is the use of SSL (also known as TLS or HTTPS). In today's web landscape, it's hard to imagine a modern website without SSL. Fortunately, most hosting companies now offer free SSL certificates. 

When choosing a hosting provider, make sure to also check if they support HTTP/2, which is a newer, faster version of the HTTP protocol. HTTP/2 offers several performance improvements over the previous HTTP/1.1 version, including multiplexing, header compression, and server push, all of which can help your Bricks-built website load faster.

By combining image optimization techniques, leveraging caching, and ensuring your website uses the latest HTTP/2 protocol, you can significantly improve the overall performance of your Bricks-powered website, providing a smooth and efficient experience for your users.
