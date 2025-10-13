---
layout: post
title: How to Limit Form Submissions in Bricks Forms?
date: 2025-10-13T02:56:00.000+08:00
author: chazie
image: /blog/assets/posts/bricksf_rt.jpg
description: Stop spam and floods in Bricks Forms. Use Bricks’ native limits
  plus OOPSpam rate limiting, VPN detection, and country filters for full
  protection.
tags:
  - Bricks
  - VPN
---
![Bricks Forms](/blog/assets/posts/bricks-visual-site-builder.png "Bricks Forms")

Spam, duplicate entries, and submission floods can damage your site performance and clutter your inbox. [Bricks Forms](https://bricksbuilder.io/forms/) includes simple controls to limit submissions, and with OOPSpam you can add advanced protection like rate limits, VPN detection, and country rules.

## **Native Options in Bricks Forms**

[Bricks](https://bricksbuilder.io/) lets you set total entry caps and prevent duplicates, but not time-based rate limits.

### **Max. entries**

Set a maximum number of submissions stored for a form. Good for event registrations, giveaways, or capped campaigns. 

Once the limit is reached, Bricks blocks further entries and shows your custom error message.

### **Prevent duplicates**

![Prevent duplicates in Bricks Forms](/blog/assets/posts/save-submission-bricks.png "Prevent duplicates in Bricks Forms")

If you’ve turned on “Save IP address,” you can use the **`ip`** keyword to block and ignore any new submissions from that same IP address.

![Prevent duplicates](/blog/assets/posts/bricks-save-submission-prevent-duplicate.png "Prevent duplicates")

Bricks flags duplicates, halts actions, and shows your message.

> These features don’t stop repeated submissions over time. They only cap totals or exact duplicates.

### **Viewing and Managing Submissions**

![Viewing and Managing Submissions in Bricks Forms](/blog/assets/posts/form-submissions-bricks-forms.png "Viewing and Managing Submissions in Bricks Forms")

Go to **Bricks → Form submissions** in WordPress. Use the **overview** to see total entries per form.

* Click a form name for individual submissions, search, or CSV export.
* Bulk delete if needed, but make backups first.
* Use role-based access to control who can view entries.

### **Why You Need More Than Built-In Tools**

* Max. entries is a hard cap, not per user.
* Prevent duplicates only works on exact matches (same email/IP).
* Bots and human-assisted spam can still flood your form with unique variations.

This is where **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) adds the missing layer.

## **Advanced Rate Limiting With OOPSpam**

OOPSpam integrates directly with Bricks Forms. Once activated, it screens every submission before your form actions run. This means your inbox and CRM stay clean without extra setup. With OOPSpam you can:

* [Limit submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) per IP or email per hour.
* Detect and [block VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricks-forms), proxy, or TOR traffic.
* Apply [country](https://www.oopspam.com/blog/how-to-block-countries-in-bricks-forms) allow/deny lists.
* Filter by language.
* Review [detailed logs](https://help.oopspam.com/wordpress/form-entries/) of blocked attempts.

### **How to Set Up OOPSpam in Bricks Forms**

Start by installing the **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** plugin from WordPress.org. [Create an OOPSpam](https://app.oopspam.com/Identity/Account/Login) account and copy your API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

In your WordPress dashboard, go to **OOPSpam → General Settings** and paste the API key. 

![Paste the API key](/blog/assets/posts/oopspam-api-key.png "Paste the API key")

Then enable **Bricks Forms protection**. From now on, all Bricks submissions are filtered.

![Enable Bricks Forms protection](/blog/assets/posts/activate-spam-protection-bricks-forms.png "Enable Bricks Forms protection")

### **Enabling Rate Limits in OOPSpam**

Go to the **Rate Limiting Settings** tab and switch on **Enable Rate Limiting**. This is where you set your thresholds.

![Enabling Rate Limits in OOPSpam](/blog/assets/posts/rate-limiting-settings.png "Enabling Rate Limits in OOPSpam")

You can configure:

* Maximum submissions per IP per hour.
* Maximum submissions per email per hour.
* Block duration (how long someone is locked out after hitting the limit).
* Automatic log cleanup to keep your database optimized.

For example, you might allow three entries per IP per hour and two per email. If someone exceeds this, they’ll be blocked for 24 hours.

After saving your changes, test by submitting multiple entries. Adjust the limits until they match your site traffic and user behavior.

## **Recommended Layered Protection**

* Keep Bricks’ Max. entries for event caps.
* Use Prevent duplicates on email + IP for obvious repeats.
* Enable OOPSpam rate-limits for time-based control and spam scoring.
* ***(Optional)*** Add Cloudflare [WAF rate limiting rules](https://developers.cloudflare.com/waf/rate-limiting-rules/) to challenge or block bursts at the network edge.

## **Final Thoughts**

Bricks’ built-in tools are fine for simple caps and duplicate control. But for real-world spam, you need OOPSpam. It adds intelligent filters, per-hour quotas, and VPN/proxy detection, all without [slowing down](https://www.oopspam.com/blog/slow-bricks-builder-website) real users.
