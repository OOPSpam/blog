---
layout: post
title:  "4 ways to protect your Fluent Forms from spam"
author: "Onar A."
image: /assets/posts/fluent-forms/twitterCard.png
tags: [WordPress, contact_form, fluent_forms]


description: "Learn how to add spam protection to Fluent Forms with these 4 different methods in WordPress."
# modified: 
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img width="600" alt="OOPSpam Anti-Spam WordPress Plugin supports Fluent Forms" src="/blog/assets/posts/fluent-forms/FluentForms.png">
</a>
</center>
<br/>

{% include toc.md %}

## Intro

Recently, we added Fluent Forms support to OOPSpam WordPress plugin after one of our customers requested it on [the WordPress support forum](https://wordpress.org/support/topic/please-add-more-plugin-support/). Compare to other contact form plugins, Fluent Forms is lightweight with as many features. It comes with a free version and paid [Fluent Forms Pro Add On Pack](https://wpmanageninja.com/downloads/fluentform-pro-add-on/). The free version has some limitations, such as no File upload, Payment integration, and many other complex fields. The good news is that there's no limitation on spam prevention techniques. All the options listed in this post are available for the free version.

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Fluent Forms [has a built-in implementation of honeypot](https://wpmanageninja.com/docs/fluent-form/miscellaneous/spam-protection-with-honeypot-and-google-recaptcha-in-wp-fluent-forms/#spam-protection-with-honeypot). Visit Global Settings on Fluent Forms settings and toggle __Enable Honeypot Security__ to activate honeypot protection. The honeypot is a hidden field on your form that won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill all the fields, including the hidden field in your form. Fluent Forms will automatically dismiss every submission with an entry in a honeypot field.

Do not wait for spam, enable honeypot protection when you build your forms as it is easy to activate and works. Once you start getting spam despite having a honeypot, look into other options.

![Fluent Forms Honeypot](/blog/assets/posts/fluent-forms/honeypot.png "Fluent Forms Honeypot")

## reCaptcha

Fluent Forms supports both reCaptcha v2 and v3 (Invisible reCaptcha). reCaptcha is available both for free and paid versions. Enabling reCaptcha is pretty straightforward through the plugin's settings. It involves creating Google Account then grabbing `Site Key`, `Secret Key` and pasting them to appropriate fields under Global Settings in Fluent Forms. Fluent Forms has a step-by-step tutorial on [how to set up reCaptcha in Fluent Forms](https://wpmanageninja.com/docs/fluent-form/miscellaneous/spam-protection-with-honeypot-and-google-recaptcha-in-wp-fluent-forms/#spam-protection-with-google-recaptcha).

### Should I use reCaptcha v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Fluent Forms, you don't have control over this threshold.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also slow down your website as it loads extra js files into your website.

![Fluent Forms reCaptcha](/blog/assets/posts/fluent-forms/reCaptcha.png "Fluent Forms reCaptcha")

If you are looking for a free and quick workaround, reCaptcha is your solution.

## hCaptcha

Similar to reCaptcha, hCaptcha is supported in both versions of Fluent Forms. They work similarly and suffer from the same limitations. Unlike reCaptcha, hCaptcha doesn't have an invisible version, so your visitors have to solve the presented puzzle. The most notable difference between reCaptcha and hCaptcha is privacy. hCaptcha is considered a privacy-friendly alternative to reCaptcha. Setting up hCaptcha is also very similar to hCaptcha. To enable hCaptcha for Fluent Forms check out [the official documentation](https://wpmanageninja.com/docs/fluent-form/integrations-available-in-wp-fluent-form/how-to-integrate-hcaptcha-in-wp-fluent-forms/).

![Fluent Forms hCaptcha](/blog/assets/posts/fluent-forms/hCaptcha.png "Fluent Forms hCaptcha")

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam in Fluent Forms and WordPress comments. The plugin works with OOPSpam API that protects over 1M websites daily. While other spam filtering methods listed above are free, OOPSpam is a premium service and comes with 40 spam checks/month to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. For you, it could be a slow website from reCaptcha/hCaptcha or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for Fluent Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Fluent Forms installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/fluent-forms/Fluent-Forms-Spam-Protection.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Fluent Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img width="800" alt="OOPSpam detected spam on Fluent Forms" src="/blog/assets/posts/fluent-forms/AFluentForm.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advanced bots. The captcha solutions will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam, and sophisticated bots. I hope this article helps you find a solution to your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!