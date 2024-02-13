---
layout: post
title:  "5 ways block spam Ultimate Member registrations"
author: "Onar A."
image: /assets/posts/umember/meta.png
tags: [WordPress]


description: "Learn how to add spam protection to the Ultimate Member Registration Form using these 5 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="500" alt="Ultimate Member plugin" src="/blog/assets/posts/umember/header.png">
</center>
<br/>

[Ultimate Member](https://ultimatemember.com/) is a popular membership plugin for WordPress. It extends standard WordPress login, registration features and add more comprehensive user profile. It is commonly used for creating online community, content restriction and more. It comes with Free and Pro versions for more features. 

Ultimate Member already comes with built-in spam protection like [a honeypot field](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field), time delay when registering and nonces check. You may still receive spam even with these measures enabled, as they are becoming more and more absolute.

{% include toc.md %}

## Email Verification

It is common to use fake emails for registration. One way to deal with this problem is to require users to confirm their email before completing registration. This will ensure that the registered accounts belong to real people and not automated scripts or bots. Even if you don't use bot registration, you may want to keep your email list clean of fake emails for better deliverability and lower bounce rates.

## reCaptcha

Ultimate Member also supports reCaptcha. Unlike other built-in anti-spam features, to enable reCaptcha you need to install [the official reCaptcha plugin for Ultimate Member](https://wordpress.org/plugins/um-recaptcha/).

Ultimate Member supports both reCaptcha v2 and v3 (invisible reCaptcha). reCaptcha is available in both free and paid versions. Enabling reCaptcha is straightforward through the reCaptcha plugin settings. It involves creating a Google account, then grabbing `Site Key` and `Secret Key` and pasting them into the appropriate fields under *Ultimate Member > Settings > Extensions > Google reCAPTCHA*. They provide a step-by-step tutorial on [how to set up reCaptcha in Ultimate Member registration](https://docs.ultimatemember.com/article/72-google-recaptcha).

### Should I use reCaptcha v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asked visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve a challenge. Instead, it tracks the user's behavior on your site and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Ultimate Member, you can adjust the *reCaptcha Score* setting in *Ultimate Member > Settings > Extensions > Google reCAPTCHA*.

A lot of people are happy with reCaptcha. It is effective against simple bots, but advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It will also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra JS files into your website.

![Ultimate Member form reCaptcha](/blog/assets/posts/umembers/recaptcha.png "Ultimate Member form reCaptcha")

If you are looking for a free and quick workaround, reCaptcha is your solution.

## Email Blocking

Another way to block spam registration is to manually block it in the *Ultimate Member > Settings > Access > Other* setting. See the [official documentation](https://docs.ultimatemember.com/article/1604-block-email-address-on-registration) on how to properly block email.

While you can block entire top level domains like *gmail.com*, you need to make sure that you are not blocking legitimate users.
In general, this is a reactive approach, meaning that you may need to quickly block ongoing spam account creation, or proactively block entire domains if you don't expect registrations from certain domains.

## Cloudflare

[Cloudflare](https://www.cloudflare.com/) is a content delivery network. It works between your website visitors and your hosting. They deliver your website faster and more securely around the world. They also provide a free way to protect your website from known spammers.

Follow the [Add site to Cloudflare](https://developers.cloudflare.com/fundamentals/get-started/setup/add-site/) article in their official documentation to change your website's DNS address and put it behind Cloudflare. Simply adding your website to Cloudflare isn't enough. You need to [enable Bot Fight Mode](https://developers.cloudflare.com/bots/get-started/free/) to activate this protection. If the visitor's IP is suspicious, a captcha (namely Turnstile) will appear and ask the user to solve the challenge. Note that the visitor will not be able to solve the captcha if cookies and javascript are disabled in their browser.

Cloudflare is a good alternative to reCaptcha as it's much lighter than reCaptcha.

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Ultimate Member registration forms. The plugin works with [OOPSpam API](https://www.oopspam.com/) that protects over 1.5M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. It could be [a slow website from reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP & email reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for Ultimate Member:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Ultimate Member installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/umember/oopspam-umember-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Ultimate Member by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  alt="OOPSpam detected spam on Ultimate Member" src="/blog/assets/posts/umember/umember-spam-detected.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

Happy spam-free day!