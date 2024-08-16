---
layout: post
title:  "Securing Bricks Form: Effective Strategies for Spam Prevention"
author: "Onar A."
image: /assets/posts/bricks/sm.png
tags: [WordPress, contact_form, bricks]


description: "Learn how to add spam protection to Bricks Form Element with these 4 different methods in WordPress."
# modified: 
---
<center>
<img loading="lazy"  width="500" alt="Bricks homepage" src="/blog/assets/posts/bricks/header.png">
</center>
<br/>

[Bricks](https://bricksbuilder.io/) is a popular new website builder for WordPress. Like other page builders, it includes [a form element](https://academy.bricksbuilder.io/article/form-element/). Typically, page builders are in the form of plugins, but Bricks is a theme. Its performance and lightness are highly praised. It's important to note that Bricks Builder is a premium theme, which means there is no free version available.

In this post, we will explore the spam filtering options for Bricks Form Element. The tool includes two integrated options out of the box: reCAPTCHA and hCAPTCHA (since version 1.9.2). But you can also use other third party anti-spam plugins like ours, [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) and set up a honeypot field yourself.

{% include toc.md %}

## reCAPTCHA

Bricks Form supports reCAPTCHA v3, a spam protection solution developed by Google. Although reCAPTCHA has visible and invisible modes, some people are concerned about privacy and potential accessibility issues in visible mode, as well as its [impact on website speed](https://www.oopspam.com/blog/recaptcha-performance-analyses). At this point, Bricks Form only supports v3, which is invisible by default. doesn't require users to solve a challenge. Instead, it tracks the user's behavior on your site and scores the user from 0 (bot) to 1 (human). The default score threshold is set to 0.5, but can be adjusted using the ```bricks/form/recaptcha_score_threshold``` filter. Refer to the example in the official [Bricks documentation](https://academy.bricksbuilder.io/article/form-element/#form-validation#spam) for details. It's recommended to keep the default threshold, but increasing it to a more aggressive level like 0.8 can be effective if you get spammed.

reCaptcha is a free and effective method for dealing with simple automated spam bots. Enabling Honeypot + reCAPTCHA is especially beneficial for new websites.

To activate reCapthca on your Bricks forms, enter the reCAPTCHA Site Key and Site Secret Key under __Bricks > Settings > API Keys__.

Follow these steps to obtain the necessary reCAPTCHA keys:

1. Go to [the reCAPTCHA website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCAPTCHA type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/gravity/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCAPTCHA into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/gravity/recaptcha-keys.jpg "reCaptcha generates Site keys")

![Bricks builder reCAPTCHA setting](/blog/assets/posts/bricks/recaptcha.png "Bricks builder setting")

Once you have entered the necessary keys, edit your form on your page. Scroll to the bottom of the page, find the "Spam Protection" setting on the right sidebar, and enable reCAPTCHA to activate it.

![Bricks Form Element enabling reCAPTCHA](/blog/assets/posts/bricks/enable-recaptcha.png "Bricks Form Element enabling reCAPTCHA")

## hCAPTCHA

[Bricks Forms also supports hCAPTCHA](https://academy.bricksbuilder.io/article/form-element/#form-validation#spam#hcaptcha) (added in version 1.9.2), which functions similarly to reCAPTCHA and suffers from the same limitations.

hCaptcha integration can be either visible or hidden.  The most significant difference between reCAPTCHA and hCAPTCHA is privacy, as hCAPTCHA is considered a privacy-friendly alternative. Setting up hCAPTCHA follows a process similar to reCAPTCHA. Navigate to __Bricks > Settings > API Keys__ and input the hCAPTCHA Site Key and Secret Key.

and follow these step-by-step instructions to get keys:

1. Visit the hCAPTCHA website: Go to [the official hCAPTCHA website](https://www.hcaptcha.com/).
2. Sign up for an account: Click on the "Sign Up" button and provide the required information to create a new account.
3. Create a new site: Once you're logged in, navigate to the "Sites" section or dashboard.
4. Register a new site: Click on the "Register a new site" button or a similar option to register a new website.
5. Provide website details: Fill in the necessary information for your website, such as the website name, domain, and any other required fields.
6. Select hCAPTCHA type: Choose the type of hCAPTCHA you want to use. You can select between the "Checkbox" or "Invisible" options depending on your preference.
7. Get Site Key and Secret Key: After completing the registration process, hCAPTCHA will generate a unique Site Key and Secret Key for your website. 
8. Copy the keys: Copy the generated Site Key and Secret Key and keep them in a secure location. 

If you are receiving unwanted messages and have already attempted other solutions, it may be helpful to try hCAPTCHA. This option is both free and simple to setup.  However, in some cases, switching from reCAPTCHA to hCAPTCHA may not make a significant difference, as spammers can now navigate around CAPTCHA solutions.

## Honeypot

We previously talked about [how the honeypot technique prevents bots](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) from spamming your forms. Although it's less effective now, it still works to some extent.
Bricks Form doesn't currently provide a built-in honeypot field, so you'll need to create one on your own. The hidden honeypot field will not be visible to humans, but bots will regard it as a valid field. Bots scan website pages and complete all fields, including the invisible field in your form. Bricks form element declines any submission containing an entry in a hidden field.

Securing your form with honeypot is a bit of work, but can be easily done by following [this video tutorial](https://www.youtube.com/watch?v=r_EMcQI-g38).

## OOPSpam WordPress plugin

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to stop spam on your Bricks Form and WordPress comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely that you've already tried the above options and they didn't work for you. It could be [a slow website from reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam that you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) and is effective against human spammers and bots. There is no challenge to solve. No performance penalty because everything happens on your server instead of the client side. The OOPSpam API uses machine learning models, content analysis, IP & email reputation and other rules-based checks to score each contact form submission. A combination of all these analysis results in a single spam score that accurately stops both manual spam and bots.

The plugin's settings page also allows you to adjust how sensitive your spam filter should be. Even leaving the default setting __Sensitivity Level__ will help you reduce spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept or block submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](/blog/assets/posts/breakdance/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

OOPSpam is privacy friendly. We don't store or share your information. And you don't need to send us your visitors' email or IP to accurately detect spam.

Here are a few steps to activate spam protection for Bricks form element:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Bricks installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/bricks/oopspam-br-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Bricks Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Done!

<center>
<img loading="lazy"  width="800" alt="OOPSpam detected spam on Bricks Forms" src="/blog/assets/posts/bricks/bricks-spam-form.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both hCAPTCHA or reCAPTCHA will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!