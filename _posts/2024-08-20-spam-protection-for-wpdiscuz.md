---
layout: post
title: 5 Ways to Stop Spam on WPDiscuz Comments
date: 2026-03-24T21:55:00.000+08:00
author: chazie
image: /blog/assets/posts/header_wpdiscuz.png
description: Learn 5 effective ways to protect WPDiscuz from spam using built-in
  tools, moderation settings, and OOPSpam for advanced filtering.
tags:
  - WordPress
  - comment
  - wpdiscuz
  - CAPTCHA
---
<center>
<img loading="lazy"  width="600" alt="WPDiscuz plugin" src="/blog/assets/posts/wpdiscuz/wpDiscuz.png">
</center>
<br/>

Spam is part of running any website with comments. If [WPDiscuz](https://wpdiscuz.com/) is enabled, spam will show up. The goal is not to eliminate it completely, but to control it before it becomes a problem.

The most effective approach is simple: use WPDiscuz’s built-in protection, tighten WordPress moderation, and add one strong filtering layer like OOPSpam.

This guide walks you through the exact setup.

{% include toc.md %}

## **Why WPDiscuz Comment Spam Happens**

Spam is no longer just bots posting dozens of links. It has evolved. Today, spam often looks like:

* Short, human-like comments
* One or two links instead of many
* Fake names and disposable emails
* Repeated submissions from the same IP or region

That means basic filters alone are not enough. You need layered protection.

## **1. Use WPDiscuz Built-In Invisible Spam Protection**

WPDiscuz already includes [invisible antispam protection](https://wpdiscuz.com/docs/wpdiscuz-documentation/settings/comment-form/#invisible_spam_protection), and this should always stay enabled.

![WPDiscuz Invisible Spam Protection](/blog/assets/posts/wpdiscuz-invisible-antispam-protection.png "WPDiscuz Invisible Spam Protection")

You’ve likely seen this message on your form: *“This comment form is under antispam protection.”*

This system works by comparing a unique key between the frontend and server, which helps block automated spam submissions without showing users a challenge.

**Note:** This message is displayed by default in the comment form. You can hide or customize it in: **Dashboard → Comments → Phrases → Form** tab.

### **Important setup note**

If you regenerate the antispam key:

* Clear your website cache
* Purge your CDN

If you skip this step, legitimate comments may fail. This is your first layer, not your only layer.

## **2. Enable CAPTCHA** 

WPDiscuz includes [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) options, but they work best when used alongside its built-in invisible antispam system, not as a replacement.

### **Google reCAPTCHA**

WPDiscuz 7 comes with built-in support for Google reCAPTCHA v2, which you can enable in:
 **Dashboard → wpDiscuz → Settings → reCAPTCHA**

Once enabled, it adds the familiar “I’m not a robot” checkbox to your comment form. This creates a visible verification step that helps block automated submissions.

![reCAPTCHA](/blog/assets/posts/wpdiscuz-recaptcha.png "reCAPTCHA")

### **Invisible reCAPTCHA (v3)**

WPDiscuz also supports reCAPTCHA v3 via an [addon](https://gvectors.com/product/wpdiscuz-recaptcha/). This version runs in the background and does not require users to interact with a checkbox.

This is a better option if your goal is to reduce friction while still filtering spam effectively.

#### **Should I set up reCAPTCHA v2 or v3?**

reCAPTCHA v2 requires users to solve a challenge, while v3 runs in the background and scores visitors based on behavior (0 = bot, 1 = human).

v3 offers a smoother user experience, but both versions can be bypassed by advanced bots or captcha farms. They may also add extra scripts that can slow your site slightly.

If you need a free option, reCAPTCHA is still a solid choice. For better usability, go with the invisible version.

### **hCAPTCHA**

![hCAPTCHA](/blog/assets/posts/hcaptcha-wpdiscuz.png "hCAPTCHA")

Unlike reCAPTCHA, [hCAPTCHA ](https://www.oopspam.com/hcaptcha-alternative)is not built into WPDiscuz. However, you can use the official hCAPTCHA WordPress plugin which supports WPDiscuz. hCAPTCHA and reCAPTCHA work similarly and share the same limitations. The most notable difference is privacy: hCAPTCHA is considered a privacy-friendly alternative to reCAPTCHA. hCAPTCHA integration comes with two types: Visible and Invisible.

Once the hCAPTCHA plugin is installed, navigate to **hCaptcha → Integration** and enter your Site Key and Secret Key. To obtain these keys, follow these steps:

* Visit the hCAPTCHA website at hcaptcha.com and sign up for an account.
* Once logged in, navigate to the **Sites** section and click **Register a new site**.
* Fill in your website name and domain, then choose your hCAPTCHA type: **Checkbox** (visible) or **Invisible**.
* After completing registration, hCAPTCHA will generate a unique **Site Key** and **Secret Key** for your website. Copy and keep them in a secure location.

If you are still getting spammed after trying reCAPTCHA, it is a good practice to try hCAPTCHA as well. It’s free and easy to set up. In some cases, however, switching between CAPTCHA solutions doesn’t change much, as spammers can bypass both nowadays.

### **Simple CAPTCHA** 

WPDiscuz previously included a Simple CAPTCHA field by default, but starting from version 5.1.0, it has been disabled in favor of invisible antispam protection.

You can still enable it manually in the Comment Form Builder if needed. However, most websites will not need it when invisible antispam and [reCAPTCHA](https://www.oopspam.com/recaptcha-alternative) are already in place.

### **CAPTCHA Generation Type**

If you enable Simple CAPTCHA and the image does not display, the issue is usually related to how it is generated.

* Default: **Session** (works for most servers)
* Alternative: **File System** (use if the default does not work)

Switching this setting typically resolves compatibility issues on certain hosting environments.

WPDiscuz already includes invisible antispam by default, so CAPTCHA should be treated as an additional layer, not your only defense.

> Adding too many verification steps can reduce real user engagement. The best setup combines CAPTCHA with moderation rules and an advanced filtering tool like OOPSpam for stronger, more balanced protection.

## **3. Control Guest Commenting** 

This is one of the most important settings in WPDiscuz, and it is often misunderstood.

WPDiscuz does not follow the default WordPress setting that requires users to be registered and logged in to comment. Instead, it uses its own control:

**“Allow guests to comment”**

You can find this in: **Dashboard → wpDiscuz → Forms → Edit Form**

![Control Guest Commenting ](/blog/assets/posts/wpdiscuz-disable-guest-comemnting.png "Control Guest Commenting ")

As shown in your settings, this option directly controls whether non-logged-in visitors can post comments.

### **How this setting works**

Guests are visitors who are not logged in. When this option is turned off, the comment form will display a message like: ***“Please login to comment”***

At this point, users must register or log in before they can submit anything. This immediately reduces spam but also limits participation.

### **Your options**

**Disable guest commenting**

Only registered users can comment. This provides strong spam reduction but can reduce engagement, especially for blogs or public-facing content.

**Allow guest commenting** 

This keeps your comment section open and accessible. However, it also increases exposure to spam, so it must be combined with other protections.

### **Important WPDiscuz nuance**

WPDiscuz allows you to create multiple comment forms, each with its own guest commenting setting.

This means you can:

* allow guest comments on blog posts
* restrict comments on sensitive pages

This flexibility is useful for balancing engagement and control across your site.

## **4. Tighten Comment Moderation and Filtering Rules**

WordPress and WPDiscuz provide moderation tools, but most sites do not use them to their full potential. When configured properly, these settings can significantly reduce spam before it ever appears on your site.

You can access these options here: **Dashboard → Settings → Discussion**

![Tighten Comment Moderation and Filtering Rules](/blog/assets/posts/wp-comment_moderation.png "Tighten Comment Moderation and Filtering Rules")

### **Limit the number of links in a comment**

WordPress allows you to hold a comment for moderation if it contains a certain number of links. This is based on the long-standing pattern that spam often includes hyperlinks.

You can set a threshold, such as 1 or 2 links, to automatically flag comments for review.

> However, there is an important shift to understand. Spammers used to include many links, but today they often use only one or two to avoid detection. This means link limits are still useful, but they should not be your only filter.

### **Create a keyword and data-based blacklist**

You can also filter comments based on specific entries found in:

* comment content
* name or username
* URL
* email address
* IP address

Each word or value should be added on its own line. WordPress will check for matches even within words, so partial matches will still trigger moderation.

### **Enable moderation before comments appear**

![Enable moderation before comments appear](/blog/assets/posts/wpdiscuz-before_a_comment_appears.png "Enable moderation before comments appear")

Under the “**Before a comment appears**” section, you can control how comments are approved.

A practical setup is:

* first-time commenters are held for moderation
* previously approved commenters can post without delay

This approach keeps your comment section safe while maintaining a smooth experience for legitimate users.

### **Use frontend moderation for better workflow**

For sites with higher comment volume, WPDiscuz offers a [frontend moderation addon](https://gvectors.com/product/wpdiscuz-frontend-moderation/) that makes managing comments faster and more efficient.

It allows you to:

* approve or unapprove comments instantly
* mark comments as spam or move them to trash
* send messages to comment authors
* move comments between posts
* add users directly to the blacklist

It also gives registered users limited control, such as deleting their own comments within a set time.

This is especially useful if you want to manage discussions without constantly navigating the WordPress admin dashboard.

## **5. Add OOPSpam for Advanced Filtering** 

WPDiscuz’s built-in tools are a strong start, but modern spam requires smarter detection. This is where OOPSpam comes in. [OOPSpam](https://www.oopspam.com/) (that's us 👋) integrates directly with WPDiscuz and filters comments automatically.

### **How to set it up**

Install “[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)” from WordPress plugins and activate the plugin.

![OOPSpam ](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam ")

[Create an account](https://app.oopspam.com/Identity/Account/Login) on OOPSpam and copy your API key.

![OOPSpam dashboard ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Go to Settings → OOPSpam and paste the key. 

![OOPSpam Settings ](/blog/assets/posts/oopspam-api-key.png "OOPSpam Settings ")

On the plugin’s settings page, you can also adjust how sensitive you want the spam filter to be. Even keeping the default **Sensitivity level** setting will help you cut spam down to zero. The plugin also allows you to accept submissions only from certain countries and languages — or to block submissions from specific countries entirely.

Enable WPDiscuz protection inside OOPSpam settings. Once enabled, it works immediately.

![WPDiscuz protection ](/blog/assets/posts/wpdiscuz-protection.png "WPDiscuz protection ")

### **What makes OOPSpam different**

Unlike CAPTCHA, it doesn’t rely on user interaction. It analyzes submissions using multiple signals:

* [Rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wpdiscuz) (blocks repeated spam attempts)
* Country filtering (allow or deny regions)
* [VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wpdiscuz) / proxy / TOR detection
* Disposable email blocking
* Language filtering
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* Spam [logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring

For most sites, this becomes your main spam filter, while CAPTCHA and moderation act as support layers.

## **Final thoughts**

Spam is not going away. But it can be controlled. 

WPDiscuz already gives you a solid foundation. When you combine it with moderation rules and OOPSpam, you create a system that filters spam before it becomes a problem.

Start with these five steps, then adjust based on how your site grows. That is all! Go on and create your forms.

Happy spam-free day!
