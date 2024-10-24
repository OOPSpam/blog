---
layout: post
title:  "4 ways to protect your GiveWP Donation Forms from spam"
author: onar
image: /blog/assets/posts/give/give-meta.png
tags: [WordPress, givewp, "card_testing"]


description: "Learn how to add spam protection to Give Donation forms with these 4 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="772" alt="GiveWP website screenshot" src="/blog/assets/posts/give/give.png">
</center>
<br/>

[GiveWP](https://givewp.com) (aka Give) is one of the most popular donation form builder out there. It comes with generous free and paid versions. Building a donation form where you can accept money from your visitors is straightforward with Give's WordPress plugin.

One of our customers requested integration with GiveWP and we were pleasantly surprised how well it was built. Unlike contact form and comments, donation forms get attacked by different type of spam. Sometimes they are called donation spam, donor spam or more accurately card testing attack. Card testing attack is the most common type of spam e-commerce websites get. What makes donation form even more unique and prone to spam is that unlike traditional e-commerce websites where there are many more steps like adding a product to a shopping card, donation forms have less steps and validation before a visitor can make a payment. To put it simply, donation forms are basic forms with one-click payment options. If you have never heard of card testing attack, it's a way for malicious users to test whether a stolen card is valid/works or not. You can learn more about card testing [in this article](https://stripe.com/docs/card-testing) by Stripe.

Unfortunately, spammers have a lot of stolen cards to check and this can hurt your account reputation with the payment processor you are using. This also can lead to too many failed legitimate donations/payments by your payment processor. In this post, we'll look into some easy & advance ways to prevent these type of spam.

{% include toc.md %}

## OOPSpam WordPress plugin

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is one way to stop spam on your Give donation forms and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While the other three alternatives are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

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

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store, share your data or use cookies. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

Here are a few steps to activate spam protection for GiveWP:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have GiveWP installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/give/OOPSpam-GIveWP-Settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for Give by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  width="350" alt="OOPSpam detected spam on GiveWP forms" src="/blog/assets/posts/give/OOPSpam-Give-Spam-detected.png">
</center>
<br/>

## Set the minimum donation amount to $10

The purpose of the card testing attack is to test the valid card without sacrificing too much money. So, if your donation form allows a $1 or $5 donation then you are more likely to be a victim of this attack. Make it costly for the attacker to test their card on your website. Set minimum donation amount to at least $10.

This is perhaps the simplest way you could avoid spam donations.

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your donation forms. Give introduces built-it honeypot field in [version 1.5](https://givewp.com/give-version-1-5-released/). There is no setting to enable or disable this feature. It's automatically added to your forms. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill all the fields, including the hidden field in your form. Give plugin will dismiss every donation that has an entry in a hidden field. If you are still getting donor spam then try other methods.

## reCAPTCHA

Give also comes with a [CAPTCHA](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem) solution, namely Google's reCAPTCHA. GiveWP team [published a script](https://github.com/impress-org/givewp-snippet-library/blob/master/form-customizations/implement-recaptcha.php) that adds reCAPTCHA too all your forms. To add this script to your donation forms, they recommend following [Adding Custom Functions to your WordPress Website](https://givewp.com/documentation/resources/adding-custom-functions-to-your-wordpress-website/) article. Before implementing reCAPTCHA to your forms, make sure check out the instructions note at the top of the script.

Here you can set up reCAPTCHA integration in two ways: reCAPTCHA v2 or v3.

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCAPTCHA. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold.

Many people are happy with reCAPTCHA. It is effective against simple bots, however, advanced bots can [bypass reCAPTCHA](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCAPTCHA. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

If you are looking for a free solution, reCAPTCHA is a good option.

> 📌 Note: Give [doesn't recommend reCAPTCHA](https://givewp.com/documentation/core/frequent-troubleshooting-issues/donor-spam-troubleshooting/#implementing-a-recaptcha) as it'll slow down your website. However, reCAPTCHA is a great alternative to the honeypot technic and effective against automated bots.

## Cloudflare

<center>
<img loading="lazy"  width="772" alt="" src="/blog/assets/posts/turnstile/cloudflare.png">
</center>
<br>

Cloudflare is a content delivery network. It operates between your website visitors and your hosting. They deliver your website faster and securely across the globe. They also provide a free way to protect your website from known spammers.

Follow [Add site to Cloudflare](https://developers.cloudflare.com/fundamentals/get-started/setup/add-site/) article in their official docs to change your website's DNS address and put it behind Cloudflare. By simple adding your website to Cloudflare isn't enough. You need to [enable Bot Fight Mode](https://developers.cloudflare.com/bots/get-started/free/) to activate this protection. If the visitor's IP is suspicious then a CAPTCHA (namely Turnstile) will appear and ask the user to solve the challenge. Note that the visitor will not be able to solve the CAPTCHA if cookies and javascript are disabled in their browser. More about Turnstile check out: [What No One Tells You About Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile).

Cloudflare is a good alternative to reCAPTCHA as it's much lighter than reCAPTCHA.

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCAPTCHA will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!