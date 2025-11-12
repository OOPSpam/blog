---
layout: post
title: How to Limit Form Submissions in Toolset Forms?
date: 2025-11-12T07:52:00.000+08:00
author: chazie
image: /blog/assets/posts/tf_rt.jpg
description: Learn how to limit form submissions in Toolset Forms using Access
  Control and OOPSpam rate limiting for better spam prevention.
tags:
  - Toolset Forms
  - rate limiting
---
![Toolset Forms](/blog/assets/posts/toolset-forms.png "Toolset Forms")

[Toolset Forms](https://toolset.com/home/cred/) helps users create and edit posts or register accounts on your website. But without submission limits, you risk spam, duplicates, or abuse. This guide explains how to limit form submissions in Toolset Forms using built-in access controls and third-party spam protection like **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋). 

## **Why Limit Form Submissions?**

Too many form submissions, especially from bots, can slow down your site and flood your inbox. Limiting them ensures:

* Better user experience
* Lower spam rates
* Easier moderation
* More accurate data

Toolset doesn’t have a direct “limit entries per user” setting. But you can combine Access Control and OOPSpam’s rate limiting to achieve the same result.

## **Method 1: Control Who Can Submit Forms**

Start by managing who has [access to Toolset Forms](https://toolset.com/lesson-placement/lesson-placements-1621521-1612073/). You’ll use the Toolset Access plugin.

![Toolset Forms Control Who Can Submit Forms](/blog/assets/posts/toolset-access-control-options-for-user-forms.jpg "Toolset Forms Control Who Can Submit Forms")

1. Install and activate the **Toolset Access** plugin.
2. Go to **Toolset → Access Control → Toolset Forms**.
3. Expand one of the following:
4. * **Post Forms Front-end Access** – for creating or editing posts.

   * **User Forms Front-end Access** – for user registration or profile edits.
5. A table appears showing user roles and permissions.

Tick or untick boxes to define who can:

* **Create posts** – submit new content.
* **Edit own posts** – update personal entries.
* **Edit others’ posts** – manage all submissions.

![Access Control → Toolset Forms](/blog/assets/posts/toolset-forms-selectin-access-permission-for-post-content-form.png "Access Control → Toolset Forms")

Use this table to prevent unauthorized or repeated form use. For example, let “Authors” create posts but block “Subscribers” from submitting.

## **Method 2: Use OOPSpam for Advanced Rate Limiting**

Toolset doesn’t include hourly or per-IP rate limits. That’s where OOPSpam Anti-Spam comes in.

### **Install and Connect**

![OOPSpam ](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam ")

Go to **Plugins → Add New** and install **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**. Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and copy your **API key**.

![OOPSpam Anti-Spam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam dashboard")

In WordPress, open **OOPSpam → General Settings** and **paste your API key**.

![OOPSpam General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings")

Enable Toolset Forms spam protection, and click **Save Changes**.

![Enable Toolset Forms spam protection](/blog/assets/posts/toolset-forms-protection.png "Enable Toolset Forms spam protection")

### **Enable Rate Limiting**

Open the **Rate Limiting** tab. Turn **Enable Rate Limiting → ON**.

![Rate Limiting tab](/blog/assets/posts/enabled-rate-limiting-settings.png "Rate Limiting tab")

Set your limits:

* **Max Submissions per IP/hour** – stop repeated attempts.
* **Max Submissions per Email/hour** – block mass sign-ups.
* **Block Duration (hours)** – how long a violator stays blocked.
* **Data Cleanup (hours)** – auto-delete old logs.

Click **Save Changes.**

### **Strengthen Protection Further**

Enable additional filters for more security:

* VPN / Proxy / TOR blocking
* [Country-based filtering](https://www.oopspam.com/blog/how-to-block-countries-in-toolset-forms)
* Language filter
* [Contextual spam](https://www.oopspam.com/blog/introducing-contextual-spam-detection) detection
* [Logs](https://help.oopspam.com/wordpress/form-entries/) and monitoring

These keep spam low and genuine engagement high.

## **Final thoughts**

The best way to manage Toolset Forms is to combine access control and rate limiting. You don’t need complex code, just clear settings. Use Toolset Access to define who can submit and OOPSpam to manage [how often submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) are allowed. Together, these create a secure, balanced system that keeps your forms clean and your website running smoothly.
