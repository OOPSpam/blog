---
layout: post
title:  "Securing Your Forminator Contact Forms: Proven Tactics for Spam Prevention"
author: onar
image: /blog/assets/posts/forminator/forminator-meta.png
tags: [WordPress, contact_form, forminator]


description: "Learn how to add spam protection to Forminator Forms with these 4 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="500" alt="Forminator plugin" src="/blog/assets/posts/forminator/forminator.png">
</center>
<br/>

[Forminator](https://wpmudev.com/project/forminator-pro/) is another popular contact form builder packed with features. It has a generous free plan and a pro plan with extra features like Stripe integration, E-signature, and better support. In this article, however, we are going to talk about Forminator's anti-spam capabilities.

Forminator comes with [built-in spam protection features](https://wpmudev.com/blog/prevent-form-comment-spam-forminator/). These are free tools like reCAPTCHA, hCAPTCHA, and honeypot field, and Akismet is a paid option. Our plugin OOPSpam WordPress plugin now supports Forminator too. Let's go through each of them.

{% include toc.md %}

## OOPSpam WordPress plugin

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to stop spam on your Forminator and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

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

Here are a few steps to activate spam protection for Forminator

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Forminator installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/forminator/oopspam-forminator-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Forminator by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  width="350" alt="OOPSpam detected spam on Forminator" src="/blog/assets/posts/forminator/forminator-spam-detected.png">
</center>
<br/>

## Honeypot

We previously discussed [how the honeypot technique works](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field). While it's not as effective as it used to be, it still prevents some bots from spamming your forms.
Forminator has a built-in honeypot field but you need to enable it. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill in all the fields, including the hidden field in your form. Forminator will dismiss every submission that has an entry in a hidden field.

To enable the honeypot field, edit your form and switch to __Behavior__ settings and under __Security__ toggle __Enable Honeypot protection__ option.

![Forminator Anti-spam honeypot](/blog/assets/posts/forminator/honeypot.png "Forminator Anti-spam honeypot")

## reCAPTCHA and hCAPTCHA

Forminator also supports both [reCaptcha and hCAPTCHA](https://wpmudev.com/docs/wpmu-dev-plugins/forminator/#captcha-field). For those who have never heard of these options, both reCAPTCHA and hCAPTCHA are spam protection solutions. reCAPTCHA, by Google, verifies users with challenges. It has visible and invisible modes but raises privacy concerns. hCAPTCHA is a privacy-friendly alternative. It supports both challenge and invisible modes.

It is available as a field in your forms. Edit your forms and click on __Insert Fields__ and choose __Captcha__. On the presented screen, you will be able to select reCAPTCHA or hCAPTCHA. Here, you can also select what type of reCAPTCHA you want on your website.

![Forminator Captcha Field](/blog/assets/posts/forminator/captcha-Field.png "Forminator Captcha Field")

Before start using either of the CAPTCHA options, you need to get Site Key and Secret Key for it. You can enter your keys under __Forminator -> Settings -> CAPTCHA__.

![Forminator Captcha Settings](/blog/assets/posts/forminator/captcha-setup.png "Forminator Captcha Settings")

Here is how to get reCAPTCHA keys:

1. Go to [the reCAPTCHA website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCAPTCHA type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/gravity/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCAPTCHA into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/gravity/recaptcha-keys.jpg "reCaptcha generates Site keys")

To obtain hCAPTCHA Site Key and Secret Key, follow these step-by-step instructions:

1. Visit the hCAPTCHA website: Go to [the official hCAPTCHA website](https://www.hcaptcha.com/).
2. Sign up for an account: Click on the "Sign Up" button and provide the required information to create a new account.
3. Create a new site: Once you're logged in, navigate to the "Sites" section or dashboard.
4. Register a new site: Click on the "Register a new site" button or a similar option to register a new website.
5. Provide website details: Fill in the necessary information for your website, such as the website name, domain, and any other required fields.
6. Select hCAPTCHA type: Choose the type of hCAPTCHA you want to use. You can select between the "Checkbox" or "Invisible" options depending on your preference.
7. Get Site Key and Secret Key: After completing the registration process, hCAPTCHA will generate a unique Site Key and Secret Key for your website. 
8. Copy the keys: Copy the generated Site Key and Secret Key and keep them in a secure location. 

By following these steps, you should be able to obtain your hCAPTCHA Site Key and Secret Key for your website's forms.

> 📌  Make sure to add the CAPTCHA field to your Forminator form.


### Should I set up reCAPTCHA v2 or v3?

Forminator supports both v2 and v3 versions. First, let's quickly see how are they different.

- reCAPTCHA v2: A visitor solves provided captcha
- reCAPTCHA v2: Invisible: Hidden by default. A CAPTCHA appears if a visitor is detected as malicious
- reCAPTCHA v3: Invisible all the time

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCAPTCHA. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. 

Many people are happy with reCAPTCHA. It is effective against simple bots, however, advanced bots can [bypass reCAPTCHA](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCAPTCHA. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

If you're looking for a free and easy solution, reCAPTCHA may be the answer.

> 📌 Tip: Consider adding both reCAPTCHA and the honeypot field to your contact form. Remember HoneyPot is NOT enabled by default.

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCAPTCHA/hCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!