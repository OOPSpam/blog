---
layout: post
title: How to Limit Form Submissions in Kadence Form?
date: 2025-09-22T05:57:00.000+08:00
author: chazie
image: /blog/assets/posts/kd_rt.jpg
description: Learn how to limit form submissions in Kadence Forms using OOPSpam,
  Cloudflare WAF, and manual caps to control spam, quotas, and abusive entries.
tags:
  - Kadence Form
  - Cloudflare WAF
---
![Kadence Form](/blog/assets/posts/kadence-wp.png "Kadence Form")

[Kadence](https://www.kadencewp.com/) Forms are lightweight and flexible, but they don’t include native tools to hard-cap submissions or enforce per-IP limits. You won’t find built-in controls to automatically close a form after 100 entries, rate-limit users by device, or filter by region.

Instead, Kadence provides basic spam prevention (honeypot, reCAPTCHA, [Cloudflare Turnstile](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) support) and database entry logging. To truly limit submissions, you’ll need to pair Kadence with external solutions like **[OOPSpam](https://www.oopspam.com/)** or Cloudflare WAF.

### **What Kadence Offers Out of the Box**

Kadence Forms keep things simple. Here are the key built-ins:

* **Honeypot Field**: Stops basic bots.
* **Google reCAPTCHA**: Adds Google’s challenge-based spam detection.
* **Cloudflare Turnstile (via Kadence CAPTCHA plugin)**: A privacy-friendly [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) with smoother UX than puzzles.
* **Database Entry (Pro)**: Saves submissions in WordPress for review and export.

These features reduce bot traffic but do not enforce submission quotas or per-user [rate limits](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam). That’s where advanced options come in.

## **Option 1: Advanced Rate Limiting with OOPSpam**

If you need adaptive [filtering](https://www.oopspam.com/blog/spam-protection-for-kadence-form) (spam scoring with ML), [country](https://www.oopspam.com/blog/how-to-block-countries-in-kadence-form) or language blocks, [VPN/Proxy/TOR blocking](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-kadence-forms), and per-source rate limiting, all without modifying your form—**[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) integrates with Kadence Forms. 

You enable it once, and it filters Kadence submissions centrally (with [logs](https://help.oopspam.com/wordpress/form-entries/)). 

### **How to Set It Up**

**Install OOPSpam Anti-Spam** from the WordPress Plugin Repository. **Create an [OOPSpam account](https://app.oopspam.com/Identity/Account/Login)** and generate your API key.

![OOPSpam dashboard showing API usage, response time, active API key, and a test section for spam detection data with sample code.](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

In WordPress, go to **OOPSpam → General Settings** and paste your key.

![OOPSpam General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings")

Activate protection for **Kadence Forms**.

![Activate protection for Kadence Forms](/blog/assets/posts/activate-kadence-form.png "Activate protection for Kadence Forms")

Go to the **Rate Limiting** tab and toggle **Enable Rate Limiting**.

![Enable Rate Limiting](/blog/assets/posts/rate-limiting-settings.png "Enable Rate Limiting")

Configure:

* **Max Submissions per IP per Hour** (e.g., 3 entries).
* **Max Submissions per Email per Hour** (stop one address from spamming).
* **Block Duration** (e.g., 24 hours).
* **Data Clean-Up Frequency** (e.g., 24 hours for smooth performance).

Save changes, then test by submitting multiple entries to confirm the block.

## **Option 2: Firewall-Level Rate Limiting with Cloudflare**

If your site runs through [Cloudflare](https://www.cloudflare.com/), you can add a firewall rule to control traffic at the network level.

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Cloudflare’s [WAF Rate Limiting](https://developers.cloudflare.com/waf/rate-limiting-rules/) lets you cap how many requests an IP can send to your Kadence form’s POST endpoint within a set timeframe.

**Example setup:**

* Rule: Limit POST requests to /wp-admin/admin-ajax.php or your Kadence REST route.
* Condition: 3 requests per 10 minutes per IP.
* Action: Block or Challenge.

This stops brute-force spam before it even touches WordPress.

## **Option 3: Manual Campaign Caps**

![Enable Database Entry in Kadence Pro](/blog/assets/posts/manual-campaign-caps.webp "Enable Database Entry in Kadence Pro")

If you need a form to close after a set number of entries (e.g., “first 200 sign-ups”):

1. Enable **[Database Entry](https://www.kadencewp.com/help-center/docs/kadence-blocks/kadence-forms-and-database-entries/)** in Kadence Pro.
2. Monitor the submission count under **Kadence → Form Entries**.
3. Once the quota is reached, replace the form block with a **“Form Closed”** message, or use **Conditional Display** to hide it automatically when a meta flag is toggled.

![Kadence Form Entries](/blog/assets/posts/kadence-form-entries.webp "Kadence Form Entries")

This isn’t automatic out of the box, but with a small snippet or manual checks, it works well for limited campaigns.

## **Final Thoughts**

Kadence Forms don’t natively support per-IP throttling or total submission caps. But you can achieve the same control by layering tools:

* **OOPSpam** → per-IP/email limits, spam scoring, and country/language filters.
* **Cloudflare WAF** → firewall-level request caps.
* **Database Entry + Conditional Display** → simple manual quota control.

With these combined, your forms stay secure, user-friendly, and free from abuse, without overloading your site or frustrating real visitors.
