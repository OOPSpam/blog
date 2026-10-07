---
layout: post
title: How to Limit Form Submissions in MetForm?
date: 2025-10-28T06:08:00.000+08:00
author: chazie
image: /blog/assets/posts/metform_rt.jpg
description: Learn how to limit form submissions in MetForm using built-in
  settings and OOPSpam for advanced rate limiting, spam control, and abuse
  prevention.
tags:
  - MetForm
  - rate limiting
---
![MetForm](/blog/assets/posts/metform.png "MetForm")

[MetForm](https://wpmet.com/plugin/metform/) lets you set a submission cap through its “Limit Total Entries” feature. For advanced protection, pair it with OOPSpam to control how often users can submit, block spam, and manage abusive behavior automatically.

### **Why Limiting Form Submissions Matters**

Limiting form entries helps prevent spam, manage resources, and ensure accurate data collection. Whether you’re running an event registration, a survey, or a giveaway, setting submission limits keeps things organized and secure.

## **Option 1: Limit Total Entries in MetForm**

MetForm Pro includes a built-in feature to cap how many times a form can be submitted. Once the limit is reached, users see a message that submissions are closed.

### **Here’s how to do it:**

![Limit Total Entries in MetForm](/blog/assets/posts/metform-forms.png "Limit Total Entries in MetForm")

1. Go to your **WordPress Dashboard → MetForm → Forms.**
2. Choose the form you want to edit and click **Edit.**
3. Under the **General** tab, find **Limit Total Entries.**
4. Toggle the option **Yes.**
5. Enter the total number of submissions you want to allow.
6. Click **Save Changes.**

![Set limit in MetForm](/blog/assets/posts/limit-form-entries-metform.png "Set limit in MetForm")

That’s it! Once your form hits the set limit, it will stop accepting new entries.

### **Why Use This Setting**

This option is perfect for:

* Limited-time campaigns (e.g., contests, event sign-ups)
* Preventing duplicates and over-submissions
* Managing database load during peak activity

However, MetForm’s built-in setting only limits total entries, not per user or per IP. For finer control, move on to OOPSpam.

## **Advanced Rate Limiting with OOPSpam**

To stop repetitive spam or abuse, you’ll need more advanced control. **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) adds rate limiting to MetForm, allowing you to restrict how many times a user, IP, or email can submit within a set period. With OOPSpam, you can:

* [Limit submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) per IP or email per hour.
* Block VPN, proxy, or TOR traffic.
* Apply country and language filters.
* Review detailed [logs](https://help.oopspam.com/wordpress/form-entries/) of blocked attempts.

This plugin integrates directly into WordPress and filters each submission before it reaches your inbox or CRM.

## **How to Set Up OOPSpam for MetForm**

![OOPSpam ](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam ")

### **Step 1: Install and Connect**

From your dashboard, go to **Plugins → Add New.** Search for **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, install, and activate it.

[Create an account](https://app.oopspam.com/Identity/Account/Login) at OOPSpam and copy your **API Key**.

![OOPSpam and copy your API Key](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam and copy your API Key")

In WordPress, go to **OOPSpam → General Settings** and paste your API key.

![General Settings and paste your API key](/blog/assets/posts/oopspam-api-key.png "General Settings and paste your API key")

Enable **MetForm spam protection** and then click Save Changes to apply your settings.

![Activate Spam Protection for MetForm](/blog/assets/posts/activate-spam-protection-for-metform.png "Activate Spam Protection for MetForm")

### **Step 2: Enable Rate Limiting**

Go to **OOPSpam → Rate Limiting Settings.** Toggle **Enable Rate Limiting** to **ON.**

![Rate Limiting Settings](/blog/assets/posts/rate-limiting-settings.png "Rate Limiting Settings")

Set your thresholds:

* **Max Submissions per IP/hour** – How often a single IP can submit.
* **Max Submissions per Email/hour** – How many times an email can submit.
* **Block Duration (hours)** – How long a user/IP remains blocked after exceeding limits.
* **Data Cleanup (hours)** – When old data is cleared automatically.

Click **Save Changes.**

> **Example:** Allow three submissions per IP and two per email per hour. If users exceed the limit, they’re blocked for 24 hours.

### **Strengthen Protection**

Enhance form security by enabling additional OOPSpam filters:

* **VPN/Proxy/TOR Blocking** – Prevents anonymous or automated spam.
* **Country Rules** – Only accept submissions from the regions you serve.
* **Language Filter** – Reject irrelevant or foreign-language spam.

After setup, test by submitting multiple entries quickly to ensure the limits trigger as expected.

## **Final thoughts**

MetForm’s Limit Total Entries feature is ideal for basic submission control. For everything beyond that, like per-IP limits, spam detection, and abuse prevention, OOPSpam is the advanced, more flexible solution.

**Key advantages:**

* Works with any MetForm submission method.
* Uses machine learning and reputation data to identify spam automatically.
* Reduces database clutter with automatic cleanup.
* Doesn’t slow down your website.

Together, MetForm and OOPSpam create a reliable, layered defense, one that controls both the volume and quality of form submissions.

## Related guides

- [How to block countries in MetForm?](https://www.oopspam.com/blog/how-to-block-countries-in-metform)
- [How to Block VPN and Data Center IP Submissions in MetForm?](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-metform)
