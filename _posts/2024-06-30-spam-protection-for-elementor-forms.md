---
layout: post
title:  "5 ways to protect your Elementor Forms from spam"
author: "Onar A."
image: /assets/posts/elementor-forms/ef-meta-image.png
tags: [WordPress, contact_form, elementor_forms]


description: "Learn how to add spam protection to Elementor Forms with these 5 different methods in WordPress."
modified: 2023-11-06
---
<center>
<img loading="lazy"  width="772" alt="OOPSpam Anti-Spam WordPress Plugin supports Elementor Forms" src="/blog/assets/posts/elementor-forms/ef-blog-header.png">
</center>
<br/>

[Elementor Page Builder](https://elementor.com/) is one of the most used and popular page builders for WordPress. It comes with generous free and paid Pro versions. You certainly don't need to have a Pro version to build a website. However, the Pro version brings a lot more built-in widgets which help you avoid installing extra plugins. [Elementor Form](https://elementor.com/features/form-builder/) widget is one of these widgets that comes with Elementor Pro.

Every contact form eventually gets spam. If you are using Elementor Forms, you may already have a spam problem. In this article, we are looking into spam protection options for Elementor Forms.

To address spam issue in your forms, use the built-in honeypot, reCAPTCHA, or a third-party plugin. An alternative approach is to restrict submissions based on the country of origin and the language of the message.

{% include toc.md %}

## OOPSpam WordPress plugin

<center>
<a href="https://wordpress.org/support/plugin/oopspam-anti-spam/reviews/?filter=5">
<img loading="lazy"   alt="OOPSpam Anti-Spam WordPress Plugin reviews" src="/blog/assets/posts/elementor-forms/reviews.png">
</a>
</center>

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to stop spam on your Elementor Forms and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While the other two alternatives are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the below options, and they didn't work for you. It could be a [slow website from reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the below alternatives. These are benefits OOPSpam has over other alternative:

1. Doesn't slow down your website
2. Keeps your site accessible to all users
3. Stops both human spammers and bots

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

> 📌 Using country filtering allows your site to be available worldwide, but only limits who can submit a form.

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

Here are a few steps to activate spam protection for Elementor Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Elementor and Elementor Pro installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/elementor-forms/oopspam-ef-settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for Elementor Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  alt="OOPSpam detected spam on Elementor Forms" src="/blog/assets/posts/elementor-forms/ef-spam-detected.png">
</center>
<br/>

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Elementor Forms has built-it [honeypot field](https://elementor.com/help/form-fields/#type). All you need to do is add a honeypot field to your form. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill all the fields, including the hidden field in your form. Elementor Forms widget will dismiss every submission that has an entry in a hidden field.

![Honeypot field in Elementor Forms](/blog/assets/posts/elementor-forms/honeypot.webp "Honeypot field in Elementor Forms")

## reCAPTCHA

Elementor Forms also comes with a [captcha](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem) solution, namely Google's reCAPTCHA. Check out [step-by-step guide](https://elementor.com/help/recaptcha-elementor-integration/) by Elementor on how to setup reCAPTCHA v2 and v3 on your contact forms.

![reCaptcha in Elementor Forms](/blog/assets/posts/elementor-forms/recaptcha.png "reCaptcha in Elementor Forms")

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCAPTCHA. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Elementor Forms you don't have control over this threshold.

Many people are happy with reCAPTCHA. It is effective against simple bots, however, advanced bots can [bypass reCAPTCHA](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCAPTCHA. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

If you are looking for a free solution, reCAPTCHA is a good option.

> 📌 Tip: Consider adding both reCAPTCHA and the honeypot field to your contact form.

## hCAPTCHA

If you're concerned about privacy, you may want to use hCAPTCHA instead of reCAPTCHA. Unfortunately, Elementor Forms doesn't have built-in hCAPTCHA support. There is [an active feature request](https://github.com/orgs/elementor/discussions/21148) to integrate it with Elementor. In the meantime, you can enable hCAPTCHA for your Elementor Forms using [the official hCAPTCHA plugin for WordPress](https://wordpress.org/plugins/hcaptcha-for-forms-and-more/). Check out [How to Add hCAPTCHA to Elementor Forms](https://www.oopspam.com/blog/adding-hcaptcha-elementorform) article for a step-by-step guide.

## Cloudflare

[Cloudflare](https://www.cloudflare.com/) is a content delivery network. It operates between your website visitors and your hosting. They deliver your website faster and securely across the globe. They also provide a free way to protect your website from known spammers.

Follow [Add site to Cloudflare](https://developers.cloudflare.com/fundamentals/get-started/setup/add-site/) article in their official docs to change your website's DNS address and put it behind Cloudflare. By simple adding your website to Cloudflare isn't enough. You need to [enable Bot Fight Mode](https://developers.cloudflare.com/bots/get-started/free/) to activate this protection.
If the visitor's IP is suspicious then a CAPTCHA (namely Turnstile) will appear and ask the user to solve the challenge. Note that the visitor will not be able to solve the CAPTCHA if cookies and javascript are disabled in their browser. More about Turnstile check out: [What No One Tells You About Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile).


Cloudflare is a good alternative to reCAPTCHA as it's much lighter than reCAPTCHA.

### Block access to website by country

Once you put your website behind Cloudflare, you have an option to block countries. Depending from where you are getting spam, you may consider star blocking China and Russia as many spam originates from these countries.

![Blocking Countries in Cloudflare](/blog/assets/posts/elementor-forms/Blocking-Countries-in-Cloudflare.png "Blocking Countries in Cloudflare")

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCAPTCHA will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all!