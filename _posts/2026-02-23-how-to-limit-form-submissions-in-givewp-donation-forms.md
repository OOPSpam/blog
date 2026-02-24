---
layout: post
title: How to Limit Form Submissions in GiveWP Donation Forms?
date: 2026-02-23T23:52:00.000+08:00
author: chazie
image: /blog/assets/posts/givewp_limit_meta.jpg
description: Learn how to limit form submissions in GiveWP using donation
  limits, goals, and OOPSpam rate limiting to reduce spam and fraud.
tags:
  - GiveWP
  - GiveWP Donation Forms
---
![GiveWP](/blog/assets/posts/givewp-wordpress.png "GiveWP Donation Forms")

[GiveWP donation forms](https://givewp.com/features/donation-form/) are public, which makes them targets for bots and fraud. Attackers may test stolen cards, attempt large donations, or submit repeatedly. To limit submissions, use three layers: donation amount limits, Donation Goals, and rate limiting with OOPSpam. Together, they reduce spam and abuse while keeping forms open for real donors.

## **1. Set Donation Amount Limits in GiveWP**

Start by [controlling the donation amount](https://givewp.com/donation-form-amount-limit/) inside the form settings. This prevents very small card-testing amounts and unusually large fraudulent donations.

![Set Donation Amount Limits in GiveWP](/blog/assets/posts/set-donation-amount-limits-in-givewp.png "Set Donation Amount Limits in GiveWP")

### **How to Set Minimum and Maximum Amounts**

1. Go to **Donations → All Forms**.
2. Click **Edit** on the form.
3. Click **Donation Options** in the left panel.

Under **Custom Amount**, make sure it is **Enabled** if you want donors to enter their own amount.

Scroll to **Donation Limit**. Set:

* Minimum amount
* Maximum amount

For example, you might set a minimum of $10 and a maximum of $5,000.

Click **Update** to save.

These limits apply to all payment gateways connected to the form.

### **How to Disable Custom Amounts**

If you want full control over donation values:

1. In **Donation Options**, set **Custom Amount** to **Disabled**.

Now donors must choose from preset **Donation Levels** (e.g., $10, $25, $50). This prevents extreme or suspicious entries.

Setting amount limits reduces financial abuse. To control repeated submissions, you will also need rate limiting.

## **2. Enable Donation Goal to Close Forms Automatically**

![Enable Donation Goal](/blog/assets/posts/enable-donation-goal.png "Enable Donation Goal")

Donation Goals allow you to automatically close a form when a target is reached. This is useful for limited campaigns and event-based fundraising.

You can configure a goal based on:

1. A total donation amount
2. A number of donations

Once the goal is reached, the form closes automatically.

Donation Goals are ideal for campaigns with fixed targets. They control how long a form remains open, but they do not control how frequently someone can submit it.

## **3. Add Rate Limiting with OOPSpam**

GiveWP does not include built-in per-IP or per-email rate limits. Without [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam), a bot can submit your form many times within minutes.

![Add Rate Limiting with OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "Add Rate Limiting with OOPSpam")

[OOPSpam](https://www.oopspam.com/) (that's us 👋) adds this missing control. It checks submissions before GiveWP processes them and blocks repeated abuse automatically.

### **Step 1: Install OOPSpam**

Go to **Plugins → Add New**. Search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**. Install and activate the plugin.

[Create an account](https://app.oopspam.com/Identity/Account/Login) at OOPSpam.com and copy your API key.

![Install OOPSpam](/blog/assets/posts/oopspam-dashboard-api.png "Install OOPSpam")

In WordPress, open **OOPSpam → General Settings**, paste the API key, and save.

![Paste the API key](/blog/assets/posts/oopspam-api-key.png "Paste the API key")

Your site is now connected to OOPSpam’s filtering system.

### **Step 2: Enable Protection for Donation Forms**

In OOPSpam settings, enable [spam protection](https://www.oopspam.com/blog/spam-protection-for-givewp) for your forms so each submission is checked before it reaches GiveWP.

![Enable Protection for Donation Forms](/blog/assets/posts/spam-protection-for-givewp.png "Enable Protection for Donation Forms")

This ensures spam and abuse are filtered early.

### **Step 3: Turn On Rate Limiting**

Open the **Rate Limiting** tab in OOPSpam and enable it.

![Turn On Rate Limiting](/blog/assets/posts/rate-limiting-settings-oopspam.png "Turn On Rate Limiting")

You can configure:

* **Max submissions per IP per hour** – Limits how many times one IP can submit in an hour.
* **Max submissions per email per hour** – Limits how many times one email can submit in an hour.
* **Block duration** – How long the IP or email stays blocked after hitting the limit.
* **Data cleanup schedule** – Automatically removes old logs to keep the system running smoothly.

For example, you might allow 5 submissions per IP per hour. If the limit is exceeded, that IP is temporarily blocked.

This stops rapid-fire bot activity and repeated abuse attempts.

### **Strengthen Protection with Advanced Filters**

OOPSpam also provides additional controls that GiveWP does not include by default. You can enable:

* [VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-givewp-donation-forms), proxy, and TOR blocking
* [Country allow or deny lists](https://www.oopspam.com/blog/how-to-block-countries-in-givewp-donation-forms)
* Language filtering
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* Detailed [logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring attempts

OOPSpam also includes manual moderation tools. From the moderation tab, you can block specific email addresses, block abusive IP addresses, block common spam keywords, and allow trusted emails or IPs to bypass spam checks when needed.

![Manual moderation tools](/blog/assets/posts/manual-moderation-settings-oopspam.png "Manual moderation tools")

These features create layered protection. They help reduce false positives while catching more sophisticated spam behavior.

### **How the Three Layers Work Together**

Each method addresses a different risk.

1. Donation amount limits protect against financial abuse.
2. Donation Goals control campaign limits and form availability.
3. OOPSpam rate limiting protects against repeated and automated submissions.

When combined, they create a balanced and effective protection strategy for GiveWP donation forms.

## **Final Thoughts**

Limiting form submissions in GiveWP is not complicated. You simply need the right combination of controls. With these layers in place, your GiveWP donation forms remain secure, stable, and focused on fundraising rather than fighting spam.
