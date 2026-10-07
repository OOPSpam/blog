---
layout: post
title: How to Limit Form Submissions in Jetpack Forms?
date: 2025-10-06T10:00:00.000+08:00
author: chazie
image: /blog/assets/posts/jp_rt.jpg
description: Learn how to limit form submissions in Jetpack Forms using oopspam
  Anti-Spam and Cloudflare rate limiting to block bots and repeated entries.
tags:
  - Jetpack Forms
  - Cloudflare
---
![Jetpack Forms](/blog/assets/posts/jetpack-home.png "Jetpack Forms")

[Jetpack](https://jetpack.com/) Forms are simple and effective for WordPress sites, but they don’t have a built-in feature to limit the number of submissions. If you’re running a contest, collecting event signups, or just trying to stop repeated spam, you’ll need extra tools.

The best way is to combine oopspam Anti-Spam with Cloudflare’s rate limiting. Together, they give you full control over who can submit, how often, and from where.

## **Why Limit Submissions in Jetpack Forms?**

Forms attract not just users, but also bots. Left unprotected, they can flood your database, skew survey results, and overwhelm your inbox. Limiting submissions helps:

* Reduce spam and repeated attempts.
* Protect site performance.
* Keep your data clean and fair.

## **Advanced Submission Control with oopspam**

Jetpack already filters basic spam using [Akismet](https://www.oopspam.com/akismet-alternative), but **[oopspam](https://www.oopspam.com/)** (that’s us 👋) takes protection much further. It adds [advanced rules](https://www.oopspam.com/blog/4-ways-to-stop-spam-on-jetpack-forms) to stop bots before their entries reach your inbox.

With oopspam, you can:

* [Limit submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) by IP or email per minute/hour.
* Allow or deny specific [countries](https://www.oopspam.com/blog/how-to-block-countries-in-jetpack-forms).
* Block suspicious language patterns.
* Detect VPNs, proxies, and TOR users.
* [Review logs](https://help.oopspam.com/wordpress/form-entries/) to see what’s being blocked.

### **Setting Up oopspam for Jetpack Forms**

Install and activate **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** from the WordPress plugin directory. [Create an account](https://app.oopspam.com/Identity/Account/Login) with oopspam and copy your API key.

![oopspam ](/blog/assets/posts/oopspam-dashboard-api.png "oopspam ")

In WordPress, go to **oopspam → General Settings** and paste in your key.

![General Settings and paste in your key](/blog/assets/posts/oopspam-api-key.png "General Settings and paste in your key")

Toggle on **spam protection** so it covers your Jetpack forms.

![Jetpack Forms spam protection](/blog/assets/posts/jetpack-form-activate-spam-protection.png "Jetpack Forms spam protection")

Now go to **Rate Limiting Settings**. Turn on **Enable Rate Limiting**. 

![Rate Limiting Settings](/blog/assets/posts/rate-limiting-settings.png "Rate Limiting Settings")

Here you can configure:

* Max submissions per IP/hour (e.g., 8/hour).
* Max submissions per email/hour (e.g., 3/hour).
* Block duration — How long to block once the limit is hit.
* Data clean-up frequency — Automatically clear logs.

Click **Save Changes**. Test by submitting multiple entries to make sure your thresholds work.

## **Firewall-Level Rate Limiting with Cloudflare**

![Firewall-Level Rate Limiting with Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

If your site runs through [Cloudflare](https://www.cloudflare.com/), you can add another layer of control at the network level. This stops abusive requests before they even reach WordPress.

Cloudflare’s [WAF Rate Limiting](https://developers.cloudflare.com/waf/rate-limiting-rules/) lets you cap how many POST requests an IP can send to your form endpoint within a set timeframe.

**Example setup:**

* **Rule:** Limit POST requests to /wp-admin/admin-ajax.php (used by Jetpack Forms).
* **Condition:** Allow 3 requests per 10 minutes per IP.
* **Action:** Block or Challenge once the limit is exceeded.

This method is powerful because it prevents [brute-force spam](https://www.cloudflare.com/ru-ru/learning/bots/brute-force-attack/) at the firewall level, keeping unnecessary traffic away from your server.

## **Final Thoughts**

Jetpack Forms doesn’t include built-in submission limits, but you can still stay in control.

* Use oopspam Anti-Spam to apply advanced filters, block repeat entries, and catch bots.
* Add Cloudflare rate limiting to stop abusive requests before they hit WordPress.

Together, these tools give you fairness, stronger spam protection, and a smoother experience for genuine users.
