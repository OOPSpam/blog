---
layout: post
title:  "Gravity Forms: Advanced User Blocking to Enhance Form Security"
author: onar
image: /assets/posts/user-blocking/gravity-meta.png
tags: [wordpress, contact_form, gravity]

description: "Block Users by Country, Language, Email Domain, Keyword, and IP in Gravity Forms"
# modified: 
---
<center>
<img loading="lazy"  alt="" src="/blog/assets/posts/gravityforms-email-notification/header.png">
</center>
<br/>

All form builders, including [Gravity Forms](https://www.gravityforms.com/), offer some level of spam protection. Gravity Forms provides built-in spam protection like [reCAPTCHA](https://www.oopspam.com/recaptcha-alternative) and [hCAPTCHA](https://www.oopspam.com/hcaptcha-alternative). Unfortunately, these measures aren't always enough to stop sophisticated bots and manual spam, as spammers have [developed ways to bypass traditional protections](https://www.oopspam.com/blog/bypassing-captcha). Other tools and strategies may be needed to effectively combat form spam.

When you're receiving spam and need to take quick action to stop it, you have several options depending on the type of spam:

1. Block IP addresses
2. Block specific countries
3. Block individual email addresses (e.g., *example@domain.com*)
4. Block entire email domains (e.g., *domain.com*)
5. Block keywords in messages
6. Allow submissions only from your target countries
7. Allow messages only in your target languages

To get started, install [the OOPSpam WordPress Plugin](https://wordpress.org/plugins/oopspam-anti-spam/) and submit a form in Gravity Forms.

![Spam Form Submission](/blog/assets/posts/user-blocking/spam-submission.png "Spam Form Submission")

The OOPSpam WordPress plugin automatically blocks millions of malicious IPs, emails, and messages daily. That said, you may occasionally need to manually block unwanted submissions in your Gravity Forms forms.

{% include toc.md %}

## Block users automatically

OOPSpam logs every submission in two tables:

- Form Spam Entries: contains all spam submissions
- Form Ham Entries: contains all non-spam submissions

You can use either table to reclassify entries as spam or not spam (also known as "ham").

Instead of manually blocking submissions by country, keyword, or email, you can use the Form Ham Entries table to flag any submission you believe should be marked as spam.

![Flag as spam in Form Ham Entries](/blog/assets/posts/user-blocking/flag-as-spam.png "Flag as spam in Form Ham Entries")

This action automatically blocks the submission and helps OOPSpam learn what kind of spam you're receiving, making it more likely to block similar form entries in the future.

If you prefer to block submissions manually, you can use OOPSpam's *Manual Moderation* tab and country blocking settings. This approach is particularly useful for handling manual spam.

Here's how you can block a user or bots using the OOPSpam WordPress plugin:

## Blocking IP, Email, Email Domain and Keyword

To block IPs, emails, email domains, and keywords in messages, use the *Manual Moderation* tab in the OOPSpam plugin to prevent users from submitting your Gravity Forms.

![Manual moderation in OOPSpam](/blog/assets/posts/user-blocking/manual-moderation.png "Manual moderation in OOPSpam")

There are three sections where you need to add one entry per line:

1. Blocked emails: Enter individual email addresses (e.g., *eric@spammy-email.com*) or entire email domains (e.g., **@bad-domain.com*). Blocking an email domain prevents all Gravity Forms submissions from that domain.
2. Blocked IPs: List any IP addresses you want to block, one IP per line.
3. Blocked keywords in messages: This powerful tool allows you to quickly block frequently appearing words in unwanted messages.

## Blocking & Allowing Countries

If you want to block all form submissions from certain countries, such as Russia and China, you can use the *"Block messages from these countries"* setting. Once you add these countries to the list, form submissions from Russia and China will no longer be accepted. But users (or bots) from other locations will still be able to submit forms.

![Block country in OOPSpam](/blog/assets/posts/user-blocking/block-country.png "Block country in OOPSpam")

If you're operating in only a few countries, a stricter approach would be to use the *"Allow messages only from these countries"* filter. Unlike blocking specific countries, this filter blocks everyone except those in the allowed countries.
For example, if you have an e-commerce website selling products only in the USA and Canada, it makes sense to restrict your forms and purchases to these countries. You can do this by adding them to the *"Allow messages only from these countries"* filter. This ensures that only users from your target markets can interact with your forms.

![Allowed country in OOPSpam](/blog/assets/posts/user-blocking/allow-country.png "Allow country in OOPSpam")

## Blocking messages by language

Another effective way to block unwanted messages is by filtering languages. If you expect your form submissions to be only in English and Spanish, there's no need to allow submissions in Russian or other languages.
To implement this, use the *"Allow messages only in these languages"* filter to limit submissions to specific languages.

> Note: This filter works best when your Gravity Forms includes a textarea field or any text-based field that accepts at least a few sentences.

![Allowed language in OOPSpam](/blog/assets/posts/user-blocking/allow-language.png "Allowed language in OOPSpam")

## Final thoughts

Nowadays spamming forms is seen as a marketing channel by many people. All form builders, including Gravity Forms, get spam, and limiting Gravity Forms submissions can be a effective tool to combat this. Tools like OOPSpam can help to automatically limit submissions to your users only, but you also have the option to manually block unwanted messages.