---
layout: post
title: "6 Ways to Block Spam & Card Testing Attack in MemberPress Checkouts"
author: onar
image: /blog/assets/posts/mpress/meta.png
tags: [WordPress]


description: "Learn how to add spam & card testing protection to the MemberPress Forms using these 6 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="500" alt="MemberPress plugin" src="/blog/assets/posts/mpress/header.png">
</center>
<br/>

MemberPress is a popular WordPress membership plugin that allows you to create and manage subscription-based content, courses, and communities. While it offers robust features for membership sites, it's important to protect your MemberPress installation from spam registrations and card testing attacks. These malicious activities can damage your business, compromise the user experience, and potentially lead to financial loss.

In this article, we'll explore several methods to protect your MemberPress site from spam and card testing attacks.

{% include toc.md %}

## Built-in MemberPress Security Features

### Card Testing Protection

MemberPress comes with a built-in protection against card testing called *Card Testing Protection*. It is enabled by default, but just to be sure, go to __Dashboard > MemberPress > Settings > General__ and make sure __Enable Card Testing Protection__ is checked. By enabling this protection, MemberPress will permanently block any further payment attempts from any user who has 5 failed payments in a 2 hour window.

### IP blocking

Another built-in feature to combat fake member registrations is the **Block IP Address** setting. If you receive spam orders, subscriptions, or anything that doesn't look legitimate, you can quickly block the IP to prevent any further transactions from that IP.

## CAPTCHA

[CAPTCHAs](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem), which offer additional challenges that users must solve before they can continue their membership. You have a few options here: Math Add-on, Turnstile, hCAPTCHA.

- Math Add-on: Math CAPTCHA is developed by MemberPress. It is not available as a built-in solution, but you can install it as an add-on from the **Dashboard > MemberPress > Add-Ons** page. As the name suggests, it asks users to solve a simple math problem. See [How to configure Math CAPTCHA add-on article](https://memberpress.com/docs/math-captcha/).
- Cloudflare Turnstile: To set up Turnstile with your MemberPress membership form, you need to install the [Simple Cloudflare Turnstile](https://wordpress.org/plugins/simple-cloudflare-turnstile/) plugin. [MemberPress has published a guide on how to set up Turnstile with MemberPress](https://memberpress.com/docs/how-to-prevent-card-testing-and-fraudulent-sign-ups/#turnstile).
 ![MemberPress Turnstile](/blog/assets/posts/mpress/turnstile.png "MemberPress Turnstile")
- hCAPTCHA: Similar to Turnstile, hCAPTCHA offers a puzzle for visitors to solve before payment is processed. There is [an official plugin for WordPress](https://wordpress.org/plugins/hcaptcha-for-forms-and-more/) from the hCAPTCHA team that supports MemberPress. Once installed, go to **hCAPTCHA -> Integrations** and activate hCAPTCHA for MemberPress.
   ![MemberPress hCAPTCHA](/blog/assets/posts/mpress/hcaptcha.png "MemberPress hCAPTCHA")


## OOPSpam WordPress plugin

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to stop spam and card testing attack on your MemberPress forms. The plugin works with [OOPSpam API](https://www.oopspam.com/) that protects over 3.5M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. It could be [a slow website from reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP & email reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for MemberPress:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have MemberPress installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/mpress/oopspam-mpress-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for MemberPress by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  alt="OOPSpam detected spam on MemberPress" src="/blog/assets/posts/mpress/spam.png">
</center>
<br/>

## Final thoughts

All websites are eventually attacked by spammers. As a website grows and gets more traffic, it attracts more serious attacks with advanced bots. Both CAPTCHA and IP blocking will protect your site to a certain extent, but they are not enough for targeted spam attacks, manual card testing and sophisticated bots. I hope this article will help you find a solution to your spam problem.

Happy spam-free day!