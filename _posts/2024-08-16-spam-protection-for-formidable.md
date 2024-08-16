---
layout: post
title:  "5 effective ways to protect your Formidable Forms from spam"
author: "Onar A."
image: /assets/posts/formidable-forms/twitterCard.png
tags: [WordPress, contact_form, formidable]


description: "Learn how to add spam protection to Formidable Forms with these 5 different methods in WordPress."
# modified: 
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img loading="lazy"  width="600" alt="OOPSpam Anti-Spam WordPress Plugin supports Formidable Forms" src="/blog/assets/posts/formidable-forms/FormidableForms.png">
</a>
</center>
<br/>

{% include toc.md %}

Formidable Forms is one of the most popular contact form builder out there with over 13M downloads. It has everything you need to build a complex form from payment gateway integrating (Stripe etc.) to conditional logic and more. Formidable Forms Lite is [available](https://wordpress.org/plugins/formidable/) in the WordPress plugin directory and comes with basic fields and built-it spam filtering options. The Pro version adds advanced fields and many more features. [Check out official comparison](https://formidableforms.com/lite-upgrade/) between Lite & Pro.

Now we have talked about what Formidable Forms is. So let's focus on what you can do about the spam you get through your Formidable Forms.

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is one way to stop spam in Formidable Forms and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While other spam filtering methods listed below are free, OOPSpam is a premium service and comes with 40 spam checks/month to test and see the difference.

It's likely you have already tried the below options, and they didn't work for you. It could be a [slow website from reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the below alternatives. These are benefits OOPSpam has over other alternative:

1. Doesn't slow down your website
2. Keeps your site accessible to all users
3. Stops both human spammers and bots

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping (recommended) default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for Formidable Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Formidable Forms installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/formidable-forms/oopspam.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Formidable Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  width="800" alt="OOPSpam detected spam on Formidable Forms" src="/blog/assets/posts/formidable-forms/spam-in-formidable-forms.png">
</center>
<br/>

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about the honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Here is a short description of what the honeypot method is:

> A honeypot field is a hidden field that is meant to be filled only by bots. Bots scan a website and fill all the fields, including the hidden field in your form. Formidable Forms will automatically dismiss every submission with an entry in a honeypot field.

Formidable Forms comes with the honeypot feature and it's enabled by default. If you getting spammed, first make sure this honeypot is still enabled.

Unlike other contact form solutions like [Fluent Forms](https://www.oopspam.com/blog/spam-protection-for-fluent-forms), Formidable Forms allows you to configure honeypot in three different modes: _Off_, _Basic_, and _Strict_. This is a great way to harden spam protection.

- **Off**: This is the obvious one. We don't recommend turning the honeypot technique off.
- **Basic**: The default value and enabled for all the forms. Adds a hidden text field to your contact form.
- **Strict**: Improvement over Basic mode. Adds a hidden email field that tricks bots to fill it but you may see more false positives.
 
Always make sure the honeypot is enabled for all your forms. Switch from Basic to Strict mode, if you start getting spammed. This method is the less expensive and simplest way to stop spam. Once you start getting spam despite having a honeypot, look into other options.

![Formidable Forms Honeypot](/blog/assets/posts/formidable-forms/honeypot.png "Formidable Forms Honeypot")

## Token-based spam protection

Formidable Forms also provides Javascript-based (aka token-based) spam filtering. As this method relies on JavaScript, JavaScript needs to be enabled in the visitors' browser for this to work. This technique prevents automated spam bots from submitting multiple entries.

This anti-spam measurement comes built-in and isn't enabled by default. Here is how it works: Each time a form loads, a unique token is created and stored on the page and passed along with the form submission. On the backend, Formidable validates this token to make sure it is not being reused. If the token expired, is invalid, or doesn't exist then the submission will be halted.

Token-based spam prevention is effective against basic bots. Unfortunately, they are ineffective against targeted spam, manual spam, and headless browser-based bots. Give a shot this option if you are getting spammed despite honeypot.

![Formidable Forms Javascript-based spam filtering](/blog/assets/posts/formidable-forms/token-based.png "Formidable Forms Javascript-based spam filtering")

It's worth mentioning that in some cases caching (if you are using one) could be a problem with this technique as a token stored in the page's DOM. [Formidable Forms points out](https://formidableforms.com/knowledgebase/add-spam-protection/#kb-javascript-token) this issue in their official docs. You can avoid this by increasing token expiration time. Formidable Forms recommends using either [frm_form_token_check_after_today](https://formidableforms.com/knowledgebase/frm_form_token_check_after_today/) or [frm_form_token_check_before_today](https://formidableforms.com/knowledgebase/frm_form_token_check_before_today/) hooks to do so.

## Using WordPress's Comment Moderation

Formidable Forms did a great job by incorporating already available comment moderation into their forms. I'm talking about a feature that comes with every WordPress and accessible under _WordPress Settings -> Discussion page -> Disallowed Comment Keys_. This is a quick way to block surge of spam by adding URLs, IP or any spam words (per line) into this field. Formidable Forms then will check every submission against this list and block if matched.

![Formidable Forms Comment Blacklist](/blog/assets/posts/formidable-forms/comment-keys.png "Formidable Forms Comment Blacklist")

## reCaptcha

Up to this point, we saw technics that don't require third-party solutions. reCAPTCHA is a popular CAPTCHA solution that many websites use. Formidable Forms has built-in integration with reCaptcha. Unfortunately, unlike other similar contact form builders, Formidable Forms doesn't have hCaptcha integration.

Formidable Forms supports both reCAPTCHA v2 and v3 (Invisible reCaptcha). reCAPTCHA is available both for free and paid versions. Enabling reCAPTCHA is pretty straightforward through the plugin's settings. It involves creating Google Account then grabbing `Site Key`, and `Secret Key` and pasting them to appropriate fields under Global Settings -> reCAPTCHA in Formidable Forms. They provide a step-by-step tutorial on [how to set up reCAPTCHA in Formidable Forms](https://formidableforms.com/knowledgebase/recaptcha/).

### Should I use reCAPTCHA v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Formidable Forms, you don't have control over this threshold.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCaptcha. It will also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra JS files into your website.

![Formidable Forms reCaptcha](/blog/assets/posts/formidable-forms/recaptcha.png "Formidable Forms reCaptcha")

If you are looking for a free and quick workaround, reCAPTCHA is your solution.

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advanced bots. The CAPTCHA solutions will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam, and sophisticated bots. I hope this article helps you find a solution to your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!