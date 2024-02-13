---
layout: post
title:  "3 ways to protect your Beaver Builder Contact Form from spam"
author: "Onar A."
image: /assets/posts/beaver/bb-meta.png
tags: [WordPress, contact_form]


description: "Learn how to add spam protection to Beaver Builder Contact Form with these 3 different methods in WordPress."

---
<center>
<img loading="lazy"  width="772" alt="Beaver Builder homepage screenshot" src="/blog/assets/posts/beaver/blog-header.png">
</center>
<br/>

[Beaver Page Builder](https://www.wpbeaverbuilder.com/) is one of the most used and popular page builders for WordPress. It comes with generous free and paid Pro versions. You certainly don't need to have a Pro version to build a website. However, the Pro version brings a lot more built-in modules which help you avoid installing extra plugins. [Beaver Contact Form](https://docs.wpbeaverbuilder.com/beaver-builder/layouts/modules/contact-form/) module is one of these widgets that comes with Beaver Builder Pro.

Every contact form eventually gets spam. If you are using Beaver Builder Contact Form module, you may already have a spam problem. In this article, we are looking into spam protection options for this module..

Beaver Builder Form module comes with a basic form functionality. There are limited number of form fields and no way to add new custom fields. When it comes to spam protection, it has only reCaptcha support. Although, there are other free and paid third-party solutions.

{% include toc.md %}


## reCaptcha

Beaver Builder Contact Form comes with a [captcha](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem) solution, namely Google's reCaptcha. Check out [step-by-step guide](https://docs.wpbeaverbuilder.com/beaver-builder/layouts/modules/contact-form/add-a-google-recaptcha-checkbox-to-a-form) by Beaver Builder on how to setup reCaptcha v2 and v3 on your contact forms.

![reCaptcha in Beaver Builder](/blog/assets/posts/beaver/form-settings.png "reCaptcha in Beaver Builder")

### Should I set up v2 or v3?

Beaver Builder Contact Form module supports v2 ("I'm not a robot" checkbox), invisible v2, and invisible v3.

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. 

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also slow down your website as it loads extra js files into your website.

If you are looking for a free and quick workaround, reCaptcha is your solution.

## Cloudflare

[Cloudflare](https://www.cloudflare.com/) is a content delivery network. It operates between your website visitors and your hosting. They deliver your website faster and securely across the globe. They also provide a free way to protect your website from known spammers.

Follow [Add site to Cloudflare](https://developers.cloudflare.com/fundamentals/get-started/setup/add-site/) article in their official docs to change your website's DNS address and put it behind Cloudflare. By simple adding your website to Cloudflare isn't enough. You need to [enable Bot Fight Mode](https://developers.cloudflare.com/bots/get-started/free/) to activate this protection. If the visitor's IP is suspicious then a captcha (namely Turnstile) will appear and ask the user to solve the challenge. Note that the visitor will not be able to solve the captcha if cookies and javascript are disabled in their browser.

Cloudflare is a good alternative to reCaptcha as it's much lighter than reCaptcha.

### Block access to website by country

Once you put your website behind Cloudflare, you have an option to block countries. Depending from where you are getting spam, you may consider star blocking China and Russia as many spam originates from these countries.

![Blocking Countries in Cloudflare](/blog/assets/posts/elementor-forms/Blocking-Countries-in-Cloudflare.png "Blocking Countries in Cloudflare")

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Beaver Builder Forms and WordPress comments. The plugin works with OOPSpam API that protects over 1.5M websites daily. While the other two alternatives are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. For you, it could be a [slow website from reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every contact and registration form submissions, comments and search (yes, internal search spam is a thing :) ) in WordPress website. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

> 📌 Using country filtering allows your site to be available worldwide, but only limits who can submit a form.

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

Here are a few steps to activate spam protection for Beaver Builder Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Beaver Builder Pro installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/beaver/oopspam-bb-settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for Beaver Builder Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.


<center>
<img loading="lazy"  width="350" alt="OOPSpam detected spam on Beaver Builder Contact Form" src="/blog/assets/posts/beaver/bb-spam-detected.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!