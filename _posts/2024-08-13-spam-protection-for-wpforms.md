---
layout: post
title:  "5 ways to protect your WPForms from spam"
author: "Onar A."
image: /assets/social-media-meta.png
tags: [WordPress, contact_form, wpforms]


description: "Learn how to add spam protection to WPForms with these 5 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="600" alt="OOPSpam Anti-Spam WordPress Plugin supports WPForms" src="/blog/assets/posts/wp-forms/intro-wpforms.png">
</center>
<br/>

{% include toc.md %}

## Intro

Recently, we added WPForms support to OOPSpam WordPress plugin after one of our customers requested it on [the support forum](https://wordpress.org/support/topic/please-add-more-plugin-support/). No wonder we got this plugin requested as WPForms is one of the most used contact form plugins for WordPress. It comes with free WPForms Lite and WPForms Pro. The main difference between the two versions is access to more field types. Fancy Fields are only available to the Pro version users while the Lite version is limited to Standard fields.

WPForms comes with the following built-in anti-spam techniques:

- Token-based spam protection (available in Lite)
- reCAPTCHA (available in Lite)
- hCaptcha (available in Lite)
- Custom CAPTCHA (available only in Pro)

## Token-based spam protection

By default, this protection is on. On the WPForms settings page, it is called __Anti-Spam Protection__. It is important to mention that this method relies on JavaScript. So you need JavaScript to be enabled for this to work. Each time your form loads, a unique token is created and stored on the page and passed along with the form submission. On the backend, WPForms validates this token to make sure it is not being reused. If the token expired, is invalid, or doesn't exist then the submission will be halted. Check [the official WPForms documentation](https://wpforms.com/docs/how-to-prevent-spam-in-wpforms/#anti-spam) to learn how to activate this technique.

Token-based spam prevention is effective against basic bots. Unfortunately, they are ineffective against targeted spam, manual spam, and headless browser-based bots.

## reCaptcha

WPForms supports both reCAPTCHA v2 and v3. You can use reCAPTCHA both in WPForms Lite and Pro version. Enabling reCAPTCHA is pretty straightforward through the plugin's settings. It involves creating Google Account then grabbing `Site Key`, `Secret Key` and pasting them to appropriate fields in WPForms' settings. WPForms has step-by-step tutorial on [how to set up reCAPTCHA in WPForms](https://wpforms.com/docs/how-to-set-up-and-use-recaptcha-in-wpforms/).

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In WPForms you don't have control over this threshold.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCaptcha. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

![WPForms reCaptcha](/blog/assets/posts/wp-forms/reCaptcha.png "WPForms reCaptcha")

If you are looking for a free and quick workaround, reCAPTCHA is your solution.

## hCaptcha

Similar to reCaptcha, hCaptcha is supported in both versions of WPForms. They work in a similar fashion and suffer from the same limitations. Unlike reCaptcha, hCaptcha doesn't have an invisible version, so your visitors have to solve the presented puzzle. The most notable difference between reCAPTCHA and hCaptcha is privacy. hCaptcha is considered a privacy-friendly alternative to reCaptcha. Setting up hCaptcha is also very similar to hCaptcha. Check out [the official tutorial on WPForms documentation](https://wpforms.com/docs/how-to-set-up-and-use-hcaptcha-in-wpforms).

![WPForms hCaptcha](/blog/assets/posts/wp-forms/hCaptcha.png "WPForms hCaptcha")

## Custom captcha

The custom CAPTCHA is a paid functionality in WPForms. It comes as an addon, so you need to install the Custom Captcha addon. The Custom Captcha addon is a Math and Q&A-based captcha. As the names suggest, math-based spam filtering presents a math question to the visitor. I have dyslexia so having a math question isn't fun for me and many other people with accessibility needs. This is something you may want to consider.

![WPForms the Custom Captcha Math Question](/blog/assets/posts/wp-forms/CaptchaMathQuestion.png "WPForms the Custom Captcha Math Question")

Another alternative with the custom CAPTCHA is Question and Answer based spam protection. Add a bunch of questions and let your visitors answer one of them before submitting a contact form message. See [How to set up the Custom Captcha in WPForms](https://wpforms.com/docs/how-to-install-and-use-custom-captcha-addon-in-wpforms/) for more details.

![WPForms the Custom Captcha Question & Answer](/blog/assets/posts/wp-forms/CaptchaQA.png "WPForms the Custom Captcha Question & Answer")

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your WPForms and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. Both hCaptcha and reCAPTCHA are free except the Custom Captcha, OOPSpam is a premium service and comes with 40 spam checks/m  to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. For you, it could be [a slow website from reCaptcha/hCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the above alternatives. 

What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

You can also [block IPs, email and email domains, and keywords](https://www.oopspam.com/blog/wpforms-block-user).

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for WPForms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have WPForms installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/wp-forms/WPForms-Spam-Protection.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for WPForms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  width="800" alt="OOPSpam detected spam on WPForms" src="/blog/assets/posts/wp-forms/WPForms.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. The CAPTCHA solutions will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!