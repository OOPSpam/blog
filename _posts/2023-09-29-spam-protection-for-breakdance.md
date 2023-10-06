---
layout: post
title:  "Breakdance Forms Spam Protection: A Step-by-Step Guide"
author: "Onar A."
image: /assets/posts/breakdance/sm.png
tags: [WordPress, contact_form, breakdance]


description: "Learn how to add spam protection to Breakdance Forms with these 3 different methods in WordPress."
# modified: 
---
<center>
<img width="500" alt="Breakdance homepage" src="/blog/assets/posts/breakdance/breakdance.png">
</center>
<br/>

[Breakdance](https://breakdance.com/) is a new and popular site builder for WordPress. Like other page builders, it comes with a form builder. [Breakdance Form](https://breakdance.com/features/form-builder/) is included in the free version, but there are some limitations in the free version, like no third party actions can be used. So you are left with the ``Email`` and ``Store Submission`` actions. To use other built-in and third-party actions, you need a Pro version.

In this article we will focus on the spam filtering options for Breakdance Forms. It comes with two built-in choices: reCaptcha and Honeypot. However, you can also use other third-party anti-spam plugins like ours, [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/).

{% include toc.md %}

## Honeypot

We have previously discussed [how the honeypot technique works](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field). While it's not as effective as it used to be, it still prevents some bots from spamming your forms.
Breakdance Form has a built-in honeypot field, but you must enable it. The honeypot field won't be visible to humans, but bots will see the hidden field as a valid field. Bots scan a web page and fill in all the fields, including the hidden field in your form. Breakdance Forms will reject any submission that has an entry in a hidden field.

To enable the honeypot field, edit your form and enable the __Advanced -> Add Honeypot Field__ option.

![Breakdance Forms Honeypot](/blog/assets/posts/breakdance/honeypot.png "Breakdance Forms Honeypot")

## reCaptcha

Breakdance Form also supports reCaptcha v3. You have probably heard of it, but for those who have never heard of it, reCaptcha is a spam protection solution Google. It has visible and invisible modes, but many people have concerns about privacy, [slow website](https://www.oopspam.com/blog/recaptcha-performance-analyses) and possibly accessibility (in visible mode). For now, Breakdance Form only supports v3, which is the default invisible mode. With reCaptcha v3, users don't solve a challenge. Instead, it tracks the user's behavior on your site and scores the user from 0 (bot) to 1 (human).

However, reCaptcha is free and works well against simple automated spam bots. Especially if your site is new, enabling both Honeypot + reCaptcha can help.

There are two ways to enable reCaptcha for your Breakdance forms. 
First one is through the form settings, which allows you to set up reCaptcha for each form individually. Edit your form, click the edit icon under __Advanced -> reCAPTCHA__ and check the __Enable reCAPTCHA__ option. reCaptcha requires you to have a Secret Key and Site Key from Google to work. On this screen you will see __Custom__ tab and here you add your keys.

Here is how to get reCaptcha keys:

1. Go to [the reCaptcha website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCaptcha type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/gravity/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCaptcha into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/gravity/recaptcha-keys.jpg "reCaptcha generates Site keys")

![Breakdance reCaptcha setting](/blog/assets/posts/breakdance/recaptcha.png "Breakdance reCaptcha setting")

On the screenshot above, you can see that there is a __Default__ tab next to the Custom tab. If the default option is selected, your secret key and site key will automatically be taken from the __Breakdance -> Settings -> API Keys__ settings. This is the second way you can enter the keys here and enable reCaptcha globally for all your forms without entering the keys individually.

![Breakdance reCaptcha keys settings](/blog/assets/posts/breakdance/recaptcha-keys.png "Breakdance reCaptcha keys settings")

> 📌 Tip: Make sure to enable reCaptcha on each of your breakdance forms.

> 📌 Tip: Consider adding both reCaptcha and the HoneyPot field to your contact form. Remember that HoneyPot is NOT enabled by default.


## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Breakdance Forms and WordPress comments. The plugin works with OOPSpam API that protects over 1M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely that you've already tried the above options and they didn't work for you. It could be [a slow website from reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam that you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow down your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty because everything happens on your server instead of the client side. The OOPSpam API uses machine learning models, content analysis, IP & email reputation and other rules-based checks to score each contact form submission. A combination of all these analysis results in a single spam score that accurately stops both manual spam and bots.

The plugin's settings page also allows you to adjust how sensitive your spam filter should be. Even leaving the default setting __Sensitivity Level__ will help you reduce spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept or block submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](/blog/assets/posts/breakdance/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

Unlike other premium solutions, OOPSpam is privacy friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

Here are a few steps to activate spam protection for Breakdance Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Breakdance installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/breakdance/oopspam-bd-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. Now, OOPSpam is activated. You can edit your form and go to __Actions -> Actions After Submission__ and select __Check for spam by OOPSpam__ action. make sure __Check for spam by OOPSpam__ comes before __Store Submission__ action so that OOPSpam checks for spam before a submission is stored.

    ![OOPSpam spam check action in Breakdance Form setting](/blog/assets/posts/breakdance/spam-check-action.png "OOPSpam spam check action in Breakdance Form setting")

4. Done!

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!