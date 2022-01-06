---
layout: post
title:  "3 ways to protect your Elementor Forms from spam"
author: "Onar A."
image: ../blog/assets/posts/elementor-forms/ef-meta-image.png
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img width="772" alt="OOPSpam Anti-Spam WordPress Plugin supports Elementor Forms" src="/blog/assets/posts/elementor-forms/ef-blog-header.png">
</a>
</center>
<br/>

Elementor Page Builder is one of the most used and popular page builders for WordPress. It comes with generous free and paid Pro versions. You certainly don't need to have a Pro version to build a website. However, the Pro version brings a lot more built-in widgets which help you avoid installing extra plugins. Elementor Form widget is one of these widgets that comes with Elementor Pro.

Every contact form eventually gets spam. If you are using Elementor Forms, you may already have a spam problem. In this article, we are looking into spam protection options for Elementor Forms.

{% include toc.md %}

## Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Elementor Forms has built-it [honeypot field](https://elementor.com/help/form-fields/#type). All you need to do is add a honeypot field to your form. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill all the fields, including the hidden field in your form. Elementor Forms widget will dismiss every submission that has an entry in a hidden field.

## reCaptcha

Elementor Forms also comes with a [captcha](https://www.oopspam.com/blog/ways-to-stop-spam#captcha-solve-an-interactive-problem) solution, namely Google's reCaptcha. Check out [step-by-step guide](https://elementor.com/help/recaptcha-elementor-integration/) by Elementor on how to setup reCaptcha v2 and v3 on your contact forms.

### Should I set up v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Elementor Forms you don't have control over this threshold.

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also slow down your website as it loads extra js files into your website.

If you are looking for a free and quick workaround, reCaptcha is your solution.

> 📌 Tip: Consider adding both reCaptcha and the honeypot field to your contact form.

## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Elementor Forms and WordPress comments. The plugin works with OOPSpam API that protects over 300K websites daily. While the other two alternatives are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test.

### Why should I pay for OOPSpam when I can use the free alternatives?

It's a fair question. Likely, you have already tried the above options, and they didn't work for you. For you, it could be a slow website from reCaptcha or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")


Here are a few steps to activate spam protection for Elementor Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Elementor and Elementor Pro installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/elementor-forms/oopspam-ef-settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filter for Elementor Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img width="350" alt="OOPSpam detected spam on Elementor Forms" src="/blog/assets/posts/elementor-forms/ef-spam-detected.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!