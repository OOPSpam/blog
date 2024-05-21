---
layout: post
title:  "5 ways to prevent spam on WS Form"
author: "Onar A."
image: /assets/posts/ws-form/twitterCard.png
tags: [WordPress, contact_form, wsform]


description: "Learn how to add spam protection to WS Form with these 5 different methods in WordPress."
# modified: 
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img loading="lazy"  width="600" alt="OOPSpam Anti-Spam WordPress Plugin supports WS Form" src="/blog/assets/posts/ws-form/WSForm.png">
</a>
</center>
<br/>

## Intro

[WS Form](https://wsform.com/) is one of the most feature-rich form builders for WordPress. It supports over 55 field types, 100 ready-to-go templates, and all other good stuff like conditional logic and multi-step forms. My favorite part of WS Form is the developer friendliness of it. It has Debug Console that allows you quickly test forms. Similar to other popular form builders, it has lots of hooks for custom integrations. When it comes to spam protection, they offer much built-in integration like reCaptcha, hCaptcha, Turnstile, and Akismet. Note that not all features are available in [free WS Form Lite](https://wordpress.org/plugins/ws-form/). In terms of spam filtering, it seems only reCaptcha, hCaptcha, and Turnstile are part of WS Form Lite. 

{% include toc.md %}

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about the honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Here is a short description of what the honeypot method is:

> A honeypot field is a hidden field that is meant to be filled only by bots. Bots scan a website and fill in all the fields, including the hidden field in your form. WS Form will automatically dismiss every submission with an entry in a honeypot field.

WS Form comes with a built-in honeypot field. It is by default disabled, so you need to enable it. I recommend activating the honeypot field as it's an easy and simple way to fool basic bots. 

Follow these steps to add a honeypot field to your WS Forms:

1. Edit your form
2. Go to Form Settings by clicking the gear icon on the top-right corner.
3. Switch to the SPAM tab
4. Under the Honeypot setting, click Enabled

Check out the screenshot below if you are a visual person.

![WS Form Honeypot](/blog/assets/posts/ws-form/honeypot.png "WS Form Honeypot")

## reCaptcha

Like most form builders, WS Form supports reCaptcha. reCaptcha comes as a field, meaning you need to add the reCaptcha field to your form from Toolbox and configure it.

It supports both reCaptcha v2 and v3 (Invisible reCaptcha). reCaptcha is available both for free Lite and paid Pro versions. Enabling reCaptcha is pretty straightforward through the plugin's settings. It involves creating Google Account then grabbing `Site Key`, and `Secret Key` and pasting them to appropriate fields under Toolbox -> reCaptcha in Edit Form mode. Check out the official tutorial on [how to set up reCaptcha in WS Form](https://wsform.com/knowledgebase/recaptcha/).

### Should I use reCaptcha v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In WS Form, you can control this threshold under _Form Settings -> Spam -> Spam Threshold_.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also [slow down your website](/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

![WS Form reCaptcha](/blog/assets/posts/ws-form/reCaptcha.png "WS Form reCaptcha")

If you are looking for a free and quick workaround, reCaptcha is your solution.

## hCaptcha

Similar to reCaptcha, hCaptcha is supported in both versions of the WS Form. They work similarly and suffer from the same limitations. hCaptcha integration comes with two types: Visible and Invisible. The most notable difference between reCaptcha and hCaptcha is privacy. hCaptcha is considered a privacy-friendly alternative to reCaptcha. Setting up hCaptcha is also very similar to hCaptcha. Check out [the official tutorial on WS Form documentation](https://wsform.com/knowledgebase/hcaptcha/). It involves adding the reCaptcha field to your form and entering Site Key and Secret Key. You can obtain these keys by creating an account on [hCaptcha's website](https://www.hcaptcha.com/).

![WS Form hCaptcha](/blog/assets/posts/ws-form/hCaptcha.png "WS Form hCaptcha")

If you are getting spammed and you already tried other options, it's a good practice to try hCaptcha as well. It's free and already built-in with WS Form. In some cases, however, the switch from reCaptcha to hCaptcha doesn't change much as spammers can bypass captcha solutions nowadays.

## Turnstile

WS Form also comes with Cloudflare's Turnstile integration. Turnstile is still in open beta. It's similar to invisible captcha alternatives in terms of how it works. However, unlike reCaptcha and hCaptcha, it doesn't have a visible mode. So, there is no challenge to solve for users. That being said in some cases if a user is suspected to be a bot, some sort of interaction is needed by the user.

Here is how [Cloudflare's docs](https://developers.cloudflare.com/turnstile) describes this interaction:

> A non-intrusive interactive challenge (such as clicking a button), if the visitor is a suspected bot.

Like reCaptcha and hCaptcha, Turnstile injects a JavaScript file into your website and runs on the user's browser. This makes it suspectable to manipulation and bypassing. You could prevent this by [putting your websites behind Cloudflare CDN](/blog/spam-protection-for-givewp#cloudflare) instead of relying on Turnstile. Remember that if your website is already behind Cloudflare CDN, you don't need to use Turnstile.

To add Turnstile to your WS Form, follow [steps on WS Form's knowledge base](https://wsform.com/knowledgebase/cloudflare-turnstile/). Here is a quick way to add it to your forms:

1. Edit your form
2. Add the Turnstile field to your form
3. Go to the field setting
4. Enter Site Key and Secret Key
5. Done! 🎉

![WS Form Turnstile](/blog/assets/posts/ws-form/turnstile.png "WS Form Turnstile")

More about Turnstile check out: [What No One Tells You About Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile).

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam in WS Form and WordPress comments. The plugin works with OOPSpam API that protects over 1.5M websites daily. While other spam filtering methods listed above are free, OOPSpam is a premium service and comes with 40 spam checks/month to test and see the difference.

Likely, you have already tried the above options, and they didn't work for you. For you, it could be [a slow website from reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses), hCaptcha, Turnstile, or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP & email reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score which is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping (recommend) the default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for WS Form

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have WS Form installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/ws-form/oopspam.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for WS Form by checking the **Activate Spam Protection** checkbox.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

5. We are done with setting up the OOPSpam plugin. 🎉


Now your form is ready to receive submissions. Each submission will be checked by OOPSpam for spam.


## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic, it attracts more serious spammers with advanced bots. The captcha solutions will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam, and sophisticated bots. I hope this article helps you find a solution to your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!