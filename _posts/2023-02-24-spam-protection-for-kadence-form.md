---
layout: post
title:  "3 ways to protect your Kadence Form Block from spam"
author: "Onar A."
image: /assets/posts/kadence/kb-meta-image.png
tags: [WordPress, contact_form, kadence]


description: "Learn how to add spam protection to Kadence Forms with these 3 different methods in WordPress."
# modified: 
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img width="772" alt="OOPSpam Anti-Spam WordPress Plugin supports Kadence Form Block" src="/blog/assets/posts/kadence/kb-blog-header.png">
</a>
</center>
<br/>

[Kadence](https://www.kadencewp.com/) is a well-known company in the WordPress community that has a couple of different products, including Kadence Theme and Kadence Blocks for building with Gutenberg. Their blocks work well and the theme is optimized for speed.

Both products are free to use but a Pro version is available for additional functionality. Kadence Blocks comes with [Form Block](https://www.kadencewp.com/help-center/docs/kadence-blocks/form-block/) for building contact forms, newsletter forms, login pages, and more. In this post, I will focus on Kadence Form's spam protection capabilities. The good news is that Form Block already comes with built-in support for honeypot and reCaptcha for free. Cloudflare's Turnstile is available as part of [Kadence CAPTCHA Plugin](https://www.kadencewp.com/product/kadence-google-recaptcha/) which is a premium plugin you need to purchase separately as part of their Full Bundle plan.

![Kadence spam protection options](/blog/assets/posts/kadence/kadence-spam-protection.png "Kadence spam protection options")

{% include toc.md %}

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about the honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your forms. Kandence Form Block has a built-it honeypot field and it is enabled by default. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill in all the fields, including the hidden field in your form. Kadence Form Block will dismiss every submission that has an entry in a hidden field.

## reCaptcha

Kadence Form Block also comes with a [captcha](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem) solution, namely Google's reCaptcha. Setting up the form with reCaptcha is pretty straightforward. Generate reCaptcha keys through Google Admin Console and enter them in your form settings. Here is how to get reCaptcha keys:

1. Go to [the reCaptcha website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCaptcha type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/kadence/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCaptcha into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/kadence/recaptcha-keys.jpg "reCaptcha generates Site keys")

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Kadence Forms, you don't have control over this threshold.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also slow down your website as it loads extra js files into your website.

If you're looking for a free and easy solution, reCaptcha may be the answer.

> 📌 Tip: Consider adding both reCaptcha and the honeypot field to your contact form. Remember HoneyPot is enabled by default under Basic Spam Check setting. You don't have to do anything.

After generating your Site Keys, edit your form and go to the Google reCAPTCHA setting. This setting is available directly on the page where you inserted your form.

![Kadence reCaptcha setting](/blog/assets/posts/kadence/kadence-reCaptcha.png "Kadence reCaptcha setting")

Insert the Site and Secret key you obtained from Admin Console into these fields and click Save. That is all.

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Kadence Form Block and WordPress comments. The plugin works with OOPSpam API that protects over 350K websites daily. While the other two alternatives are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. It could be a slow website from reCaptcha or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.


Here are a few steps to activate spam protection for Kadence Form:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Kadence Blocks installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/kadence/oopspam-kb-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for Kadence Form Block by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img width="350" alt="OOPSpam detected spam on Kadence Form Block" src="/blog/assets/posts/kadence/kb-spam-detected.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!