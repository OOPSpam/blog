---
layout: post
title:  "4 ways to protect your Ninja Forms from spam"
author: onar
image: /blog/assets/nj-oopspam-wordpress-plugin.jpg
tags: [WordPress, contact_form, ninja_forms]

description: "Learn how to add spam protection to Ninja Forms with these 4 different methods in WordPress."
---
<center>
<img loading="lazy" alt="Ninja Forms homepage screenshot" src="/blog/assets/posts/ninja/header.png">
</center>
<br/>

[Ninja Forms Lite](https://wordpress.org/plugins/ninja-forms/) is the most popular of all paid form builders with over 800,000 active installations. It is known to be beginner friendly. The free version comes with over 27 field types, calculations. Unfortunately, some key features like conditional logic, multi-step forms, all payment integrations like Stripe are part of the Pro plan.

Ninja Forms offers several built-in anti-spam features. However, [compared to other form builders](https://www.oopspam.com/blog/best-wordpress-form-builder-plugins), it has limited support for certain free anti-spam tools commonly found in competing plugins. Despite this, Ninja Forms provides effective options to combat spam submissions.

## Built-in: Honeypot

[We wrote](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) extensively about honeypot technique and how it works. While it's not as effective as it used to be, it still prevents some bots from spamming your contact forms. Ninja Forms has a built-in implementation of honeypot.

The honeypot is a hidden field on your form that won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill all the fields, including the hidden field in your form. Ninja Forms will automatically dismiss every submission with an entry in a honeypot field.

The honeypot feature in Ninja Forms is automatically enabled. You don't need to take any action to activate it for your forms.

## Built-in: Anti-Spam field

Ninja Forms offers another built-in spam protection feature: **the Anti-Spam field**. Here's how it works:

1. It's a question-answer type field
2. To set it up:
   - Add the Anti-Spam field to your form
   - Click on the field to configure
   - Enter a question and the correct answer
3. Visitors must provide the correct answer to submit the form
4. Effective against bots that can't interpret or answer custom questions

This simple yet effective method adds an extra layer of protection without significantly impacting user experience.

![Ninja Forms Anti-Spam field](/blog/assets/posts/ninja/antispam.png "Ninja Forms Anti-Spam field")

If you notice an uptick in spam submissions, consider rotating your Anti-Spam field questions frequently and using different questions for each form to keep spambots guessing and maintain the effectiveness of this prevention method.

![Ninja Forms Anti-Spam Question and Answer](/blog/assets/posts/ninja/antispam-qa.png "Ninja Forms Anti-Spam Question and Answer")

## reCAPTCHA

Ninja Forms supports both reCAPTCHA v2 and v3 (Invisible reCAPTCHA). reCAPTCHA is available both for free and paid versions. Enabling reCAPTCHA is pretty straightforward through the plugin's settings. It involves creating Google Account then grabbing `Site Key`, `Secret Key` and pasting them to appropriate fields under **Ninja Forms > Settings > reCAPTCHA Settings**. Ninja Forms has a step-by-step tutorial on [how to set up reCAPTCHA in Ninja Forms](https://ninjaforms.com/docs/plugin-settings/#recaptcha).

### Should I use reCAPTCHA v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCAPTCHA. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. In Ninja Forms, you don't have control over this threshold.

Many people are happy with reCAPTCHA. It is effective against simple bots, however, advanced bots can [bypass reCAPTCHA](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCAPTCHA. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra JS files into your website.

![Ninja Forms reCAPTCHA](/blog/assets/posts/ninja/recaptcha.png "Ninja Forms reCAPTCHA")

If you are looking for a free solution, reCAPTCHA is a good option.


## OOPSpam Anti-Spam Plugin

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select *OOPSpam Dashboard* option on the setting page

2. If you have a Ninja Forms installed and activated then a special section will appear on OOPSpam Anti-Spam plugin's setting page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/oopspam-nj-settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate spam filtering for Ninja Forms by selecting the **Activate Spam Protection** checkbox.

4. Don't forget to enter a short message to display when a spam Ninja Forms entry is submitted.

That is all! Now go on and create your forms.

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

> 📌 Using country filtering allows your site to be available worldwide, but only limits who can submit a form.

Once spam detected your message will appear at the bottom of the message field.

<center>
<img loading="lazy"  alt="OOPSpam detected spam on Ninja Forms" src="/blog/assets/nj-spam-detected.png">
</center>
<br/>

Happy spam-free day!