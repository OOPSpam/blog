---
layout: post
title:  "4 Ways to Stop Fake Account Sign-Ups"
author: "Onar A."
image: /assets/posts/spam-signups/meta.png
tags: [signup, spam]


description: "Learn practical measures to minimize damage from fake sign-ups. Safeguard your business with effective strategies and ensure genuine user engagement"
# modified: 
---
<center>
<img loading="lazy"  width="600" alt="Old door" src="/blog/assets/posts/spam-signups/old-door.jpg">
</center>
<br/>

If you run a business with a website and a signup form, you may already be getting spam signups. From a custom SaaS application to a WordPress blog, almost everyone is affected in one way or another. Here are some of the ways bot signups hurt businesses:

- More chargebacks
- Damaged account reputation with payment processors like Stripe, Paddle.
- Signup reports that are misleading
- Damaged domain reputation
- Increased chance of your emails ending up in spam folders (email deliverability)
- Poor email list
- Increased database usage


No matter what your use case is or how it may negatively impact your business down the road, you need to have some sort of protection against fake signups from day one. In this post, we will go through some of the measures you can put in place to minimize the damage.

{% include toc.md %}

## Using CDN (DNS level protection)

If you are using a CDN for your website, check if they have a bot protection feature. One of the most popular and free CDN is [Cloudflare](https://www.cloudflare.com/) or a paid alternative [KeyCDN](https://www.keycdn.com/). Cloudflare comes with [Bot Fight Mode](https://developers.cloudflare.com/bots/get-started/free). The Bot Fight Mode will help you reduce bot traffic to your site and potentially reduce fake registrations. You also get DDoS protection and faster load times.

![Bot Fight Mode in Cloudflare](/blog/assets/posts/spam-signups/Bot-Fight-Mode-in-Cloudflare.png "Bot Fight Mode in Cloudflare")

## Using client-side protection

### Honeypot

Honeypot is the oldest trick in the book with 0 impact on your website performance, accessibility and privacy. It is considered client-side protection. It involves creating a hidden field in a form and hoping that bots won't notice it and fill it in automatically. The hidden honeypot field will not be visible to humans, but bots will consider it a valid field. Bots scan web pages and fill in all fields, including the hidden field in your form. You can then reject any submission that contains an entry in a hidden field. We previously talked more about [How the honeypot technique prevents bots](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) from spamming your forms. Although it's less effective now, it still works to some extent.

### CAPTCHA

If you are not using Cloudflare or another CDN that comes with bot protection. You can use Cloudflare's [Turnstile](https://www.cloudflare.com/products/turnstile/) on your sign-up forms. Another option is to add reCAPTCHA or hCAPTCHA to your forms.

Be aware of the complication with this approach, as all of them inject javascript into your website. [This will negatively impact your site's speed](https://www.oopspam.com/blog/recaptcha-performance-analyses) and may cause accessibility issues.

Implementing Turnstile, hCAPTCHA or reCAPTCHA on your website involves similar steps:

1. Generate Site Key and Secret Key for your website
2. Add javascript file to your website
3. Server-side validation

Here is the detailed documentation for each of them:

- Turnstile: [https://developers.cloudflare.com/turnstile/get-started#new-sites](https://developers.cloudflare.com/turnstile/get-started#new-sites)
- hCAPTCHA: [https://docs.hcaptcha.com/](https://docs.hcaptcha.com/)
- reCAPTCHA: [https://developers.google.com/recaptcha/docs/v3](https://developers.google.com/recaptcha/docs/v3)

![hCaptcha](/blog/assets/posts/spam-signups/hcaptcha.png "hCaptcha")

### Which one to use: hCAPTCHA, reCAPTCHA or Turnstile?

Here is a simple table comparing these tools.

<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>&nbsp;</th>
      <th>reCaptcha</th>
      <th>hCaptcha</th>
      <th>Turnstile</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Accessibility</td>
      <td>Partially</td>
      <td>Partially</td>
      <td>Partially</td>
    </tr>
    <tr>
      <td>Slow website</td>
      <td><a href="https://www.oopspam.com/blog/recaptcha-performance-analyses">Worse</a></td>
      <td><a href="https://www.oopspam.com/blog/hcaptcha-performance-analyses">Bad</a></td>
       <td><a href="https://www.oopspam.com/blog/cloudflare-turnstile">Better</a></td>
    </tr>
    <tr>
      <td>Can be bypassed</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>Privacy</td>
      <td>Worse</td>
      <td>Better</td>
      <td>Better</td>
    </tr>
    <tr>
      <td>Made by</td>
      <td>Google</td>
      <td>Intuition Machines</td>
      <td>Cloudflare</td>
    </tr>
  </tbody>
</table>

<br>

They are partially accessible because they all come with an invisible mode that you can use. However, if your visitors are detected as suspicious, they will likely be stuck with endless loop puzzles to solve.

Anything you add to your site's HTML will negatively impact your site's performance, but Turnstile's JS file seems to have the least impact compared to reCAPTCHA and hCAPTCHA.

![Turnstile](/blog/assets/posts/spam-signups/cloudflare_turnstile.webp "Turnstile")

### Do you get fake signups despite reCAPTCHA, hCAPTCHA, Turnstile?

You are not alone. Captchas are effective against simple bots, but advanced bots can [bypass reCAPTCHA](https://github.com/ultrafunkamsterdam/undetected-chromedriver). There are also "captcha farms" (e.g. 2Captcha) where people are paid to solve reCAPTCHA at low cost.

This is where we come in. Another way to protect your sign-up forms without using CAPTCHA solution is to use server-side solution [OOPSpam](https://www.oopspam.com/). To put it simply, your registration form will have no challenge, no javascript or cookies, so no accessibility issues, no slow website. 

We already have [WordPress](https://wordpress.org/plugins/oopspam-anti-spam/), [Bubble](https://bubble.io/plugin/oopspam-spam-detection-1582908608700x936823858020745200), [Make](https://www.make.com/en/integrations/oopspam-anti-spam) and [Zapier](https://zapier.com/apps/oopspam/integrations) applications, so no need to implement. But if you are building a custom site, use the [OOPSpam API](https://www.oopspam.com/docs/#introduction) to reject or allow new users before confirming or sending a welcome email. For more implementation tips, see [Building a complete contact form with PHP & HTML](https://www.oopspam.com/blog/contact-form-with-PHP).

## Complete protection: Cloudflare + OOPSpam + Honeypot

Best of both worlds, we can combine Cloudflare with OOPSpam and Honeypot to increase our chances against fake account creation and just get a clean sign-up form without all the errors and frustrated users.

__OOPSpam__: Process your submissions with OOPSpam on your server. This is your last line of defense against bots and manual spammers.

__Cloudflare__: We recommend using DNS level protection with Cloudflare. You get the same benefit as Turnstile without the website performance and accessibility issues. More about Turnstile check out: [What No One Tells You About Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile).

__Honeypot__: This is easy to implement and free.

## Final Notes

All websites get hit by spammers eventually. As a site grows and gets more traffic, it attracts more serious spammers with advanced bots. Both honeypot and CAPTCHA will protect your site to a certain extent, but they are not enough against targeted spam sign-up attacks, manual spam and sophisticated bots. Using a couple of tools will harden your forms.

I hope this article helps you find a solution to your bot signup problem.

Have a spam-free day!