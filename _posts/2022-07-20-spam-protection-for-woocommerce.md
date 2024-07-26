---
layout: post
title:  "5 ways to stop spam orders and registrations in WooCommerce"
author: "Onar A."
image: /assets/posts/woo/woo-meta.png
tags: [WordPress, WooCommerce, "card_testing"]


description: "Learn how to prevent fake orders, spam reviews and registrations with these 5 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="772" alt="WooCommerce website screenshot" src="/blog/assets/posts/woo/woo.png">
</center>
<br/>

[WooCommerce](https://woocommerce.com/) is a go-to e-commerce plugin for WordPress. It supports different payment methods including Paypal, Stripe via add-ons, and standard payments like credit cards even cash & check payments. WooCommerce comes with a lot of features for free. You can start selling your products and offer a subscription with multiple currencies out of the box. No surprise WooCommerce is a leading e-commerce solution with [%36.68 market share](https://www.statista.com/statistics/710207/worldwide-ecommerce-platforms-market-share/).

{% include toc.md %}

As your store grows, it will attract spammers too. You may already have this issue as this is pretty common to have fake orders. Especially for the stores with high traffic.

![WooCommerce Fake Orders](/blog/assets/posts/woo/fake-orders.png "WooCommerce Fake Orders")

## Why do spammers create fake orders?

To stop spam orders first we need to understand why spammers decide to create a bunch of fake orders that going to be declined anyway. What benefit do they get from it?

There are so many reasons why bots (and spammers behind them) would attack your website. One of the most common reasons for spam orders is the card testing attack that we talked about in [GiveWP Donation Form article](https://www.oopspam.com/blog/spam-protection-for-givewp). The card testing attack is a way to check if a stolen credit card is valid or not. This attack can be automated or manual and they tend to target donation forms where there are fewer steps to take to test a stolen card. For this reason, your WooCommerce store needs to at least require user registration to purchase a product.

Sometimes vulnerability scanners look for a specific security bug in WooCommerce. The spam bots create an order to test certain behavior in the checkout process and hope to discover a bug they are looking for. Before WooCommerce version 4.6.2, [a user reported failed orders in WooCommerce support](https://wordpress.org/support/topic/failed-orders-fake-information/) where an attacker was able to create an account without registration even though _“Allow customers to create an account during checkout”_ setting is enabled. [They announced](https://developer.woocommerce.com/2020/11/05/developer-advisory-spam-orders-and-accounts-from-bots/) the bug publicly and released a fix. This is a great example of why you may see many false orders. It's important to keep your WordPress plugins including WooCommerce up-to-date.

Besides the above reasons, sometimes fake orders can be simply malicious targeted attacks to harm your business. Usually, spam orders cause chargeback issues, a bad reputation with the payment processors, lost sales (putting a lot of orders and making an item out of stock), and many others.

No matter the motive, you need to protect your WooCommerce store before it gets hit by hundred of spam orders. We're going to look into some of the steps you can take to protect yourself from these attacks.

## Configure user registration

As pointed out above, spammers are more likely to spam your store if allow they to buy without registration and leave anonymize reviews. WordPress and WooCommerce plugins come with a built-in configuration that allows you to prevent visitors from buying your product without registration. Both WordPress and WooCommerce have registration flow and they are separated. Disable WordPress registration if you don't need it. Disabling it will NOT affect your WooCommerce account registration.

In your WordPress dashboard visit _Settings -> General -> Membership_ and uncheck **Anyone can register**. This will effectively prevent spam WP user registration.

![WordPress Any can register setting](/blog/assets/posts/woo/wordpress-settings-anyone-can-register.png "WordPress Any can register setting")

Time to require registration for the store purchases so that bots cannot create spam orders without registration. This allows us to track who created fake orders and block them. Visit _WooCommerce -> Settings -> Guess Checkout_ and uncheck **Allow customers to place orders without an account** and check **Allow customers to log into an existing account during checkout**.

![WooCommerce Guest Checkout](/blog/assets/posts/woo/WooCommerce-Guest-Checkout.png "WooCommerce Guest Checkout")

This is a basic configuration you could to prevent some bots. However, many bots can create accounts during the checkout because all it takes is to fill the email field in the checkout form. The main goal here is to capture and track the spammers' email addresses and block them.

## Block countries

This is perhaps the easiest way to prevent spam orders. WooCommerce comes with two powerful features that allow you to block countries. These are _Selling location(s)_ and _Shipping location(s)_ settings.

![WooCommerce Selling Location setting](/blog/assets/posts/woo/WooCommerce-Selling-Location.png "WooCommerce Selling Location setting")

These features are a great fit for the store that serves a certain area. In the above example, we choose to sell only in US and Canada and ship only to these selected countries. Using just these two settings you could eliminate most of your fake orders. Besides the _Selling to specific countries_ option, _Selling location(s)_ setting has _Sell to all countries, except for ..._ which is another useful way to open your store to all countries but only block the spammers' location. Once you start getting fraudulent orders, check the source countries of bots and add them under this setting.

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about the honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your store. Unfortunately, WooCommerce doesn't support honeypot, so you need to use a third-party plugin. There is [a free plugin; WooCommerce Honey Pot Anti Spam](https://wordpress.org/plugins/woo-honey-pot-anti-spam/) that adds the honeypot field to your WooCommerce Login and Registration forms. If you haven't heard about the honeypot field, it is a simple hidden field in your form. As it's hidden from regular users, they will not able to fill it but this isn't true for bots. Some bots fill every possible field in the registration/login form regardless hidden or visible. The honeypot technic relays on the fact that only bots will fill the hidden field and this is how it catches bots.

Using the honeypot method with the WooCommerce store is effective, especially when you just started getting spammed. It's better to use this with another method for maximum protection.

## reCAPTCHA & hCaptcha

Just like the honeypot, WooCommerce doesn't support reCaptcha. Surprisingly, WooCommerce doesn't offer these free spam protection measurements. However, you can add reCAPTCHA to your store through [WooCommerce extension store](https://woocommerce.com/products/). There are a couple of reCAPTCHA solutions available. [reCaptcha for WooCommerce](https://woocommerce.com/products/recaptcha-for-woocommerce/) seems to be the most popular extension. While reCAPTCHA itself is a free solution, the extension isn't. As of now, it's $29/year. The extension supports both reCAPTCHA versions 2 and 3.

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold.

![WooCommerce reCaptcha](/blog/assets/posts/woo/WooCommerce-reCaptcha.png "WooCommerce reCaptcha")

### hCaptcha

If you are looking for a free and privacy-friendly alternative to reCAPTCHA then hCaptcha is your solution. There is a free [hCaptcha for WordPress](https://wordpress.org/plugins/hcaptcha-for-forms-and-more/) plugin that supports WooCommerce too.


Many people are happy with reCAPTCHA and hCaptcha. They are effective against simple bots, however, advanced bots can still [bypass CAPTCHA solutions](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" (e.g 2Captcha) where people get paid to solve reCAPTCHA and hCaptcha as low as 0.25 cents. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.


## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop fake orders and spam registrations on your WooCommerce stores. The plugin works with OOPSpam API that protects over 3.5M websites daily. While most of the alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. For you, it could be [a slow website from reCaptcha/hCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam orders or registrations you are still getting despite implementing the above options. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve, no cookies are stored or used. No performance penalty as everything happens on your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every order, registration, and review. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping the default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept orders only from certain countries and languages (for WooCommerce reviews). Country blocking is similar to WooCommerce's _Selling location(s)_ settings, however, OOPSpam applies this restriction across the website including product reviews, registration, and orders. As additional protection, the OOPSpam WordPress plugin also adds a honeypot field to all forms so you don't have to install another plugin.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store, share your data, or use cookies. All the rejected spam logs are stored in your local WordPress database and can be viewed under _Form Spam Entires_ settings.

Here are a few steps to activate spam protection for the WooCommerce-based store:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have WooCommerce installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/woo/OOPSpam-WooCommerce-Settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for WooCommerce by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam order or registration is detected.

<center>
<img loading="lazy"  width="" alt="OOPSpam detected spam on WooCommerce registration" src="/blog/assets/posts/woo/OOPSpam-WooCommerce-Spam-Account.png">
</center>

<center>
<img loading="lazy"  width="" alt="OOPSpam detected spam on WooCommerce checkout form" src="/blog/assets/posts/woo/OOPSpam-WooCommerce-Spam-Checkout.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a store grows and gets more traffic it attracts more serious spammers with advanced bots. Both honeypot and CAPTCHA solutions will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam, and sophisticated bots. I hope this article helped you find a solution to your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!