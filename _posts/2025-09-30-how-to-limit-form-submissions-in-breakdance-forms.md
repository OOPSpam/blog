---
layout: post
title: How to Limit Form Submissions in Breakdance Forms?
date: 2025-09-30T01:46:00.000+08:00
author: chazie
image: /blog/assets/posts/bf_rt.jpg
description: Learn how to limit form submissions in Breakdance Forms using
  OOPSpam with rate limits, filters, and spam protection settings.
tags:
  - Breakdance Forms
  - Cloudflare
---
![Breakdance Form](/blog/assets/posts/breakdance-home.png "Breakdance Form")

[Breakdance](https://breakdance.com/) includes Honeypot and [reCAPTCHA v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website), but it does not cap submissions on its own. To limit entries by IP, email, country, or time window, connect an anti-spam plugin like **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋). Add optional edge rules with Cloudflare if you face heavy bursts.

### **Fast Path: Stop obvious spam first**

Turn on simple defenses before rate limiting.

1. Open your form in the **Breakdance** builder.
2. In **Spam Protection**, enable **[Honeypot](https://breakdance.com/documentation/forms/creating-a-form/anti-spam/anti-spam-with-a-honeypot/)**.
3. Add **reCAPTCHA v3** (set keys globally, then enable on the form).

This blocks basic bots and reduces noise before you apply stricter rules.

## **Add real limits with OOPSpam (recommended)**

OOPSpam gives you rate limits, country/IP controls, and [advanced filtering](https://www.oopspam.com/blog/spam-protection-for-breakdance).

### **Step 1: Install and connect**

**Install and activate** the **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** on WordPress. [Create an account](https://app.oopspam.com/Identity/Account/Login) and copy your **API key**.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

Paste the key in **Settings → OOPSpam**.

![Paste the key in Settings](/blog/assets/posts/oopspam-api-key.png "Paste the key in Settings")

Once Breakdance Forms is installed, the spam protection settings will become available. You’ll also have the option to add a **custom message** that appears when a submission is flagged and blocked as spam.

![Breakdance Forms spam protection settings](/blog/assets/posts/settings-‹-oopspam-—-wordpress-04-25-2025_09_43_pm.png "Breakdance Forms spam protection settings")

### **Step 2: Wire OOPSpam into your Breakdance form**

Open the form in Breakdance and go to **Actions After Submission**. Add **“Check for spam by OOPSpam”.** Drag it above “**Store Submission**” and “**Email**” so bad entries are stopped first.

![Breakdance and go to Actions After Submission](/blog/assets/posts/spam-check-action.png "Breakdance and go to Actions After Submission")

> (Optional) Remove Breakdance’s Email action and send notifications from your automation (e.g., [Make](https://www.oopspam.com/blog/stop-spam-on-breakdance-forms-using-make-and-oopspam)/Zapier) **after** a pass result to avoid spam emails.

### **Step 3: Set Submission Limits**

In the OOPSpam [Rate Limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) tab, **enable Rate Limiting** to turn on global protection for your forms.

![Enable Rate Limiting in Breakdance Forms](/blog/assets/posts/rate-limiting-settings.png "Set Submission Limits")

* **Max Submissions per IP per Hour** - Limit entries from the same IP.
* **Max Submissions per Email per Hour** - Stop repeated entries from one email address.
* **Block Duration (hours)** - Set how long a user is blocked after hitting the limit.
* **Data Clean-Up Frequency (hours)** - Automatically clear old logs to keep the site running smoothly.

Click **Save Changes** and apply the new limits to your forms.

## **Edge Protection with Cloudflare (optional)**

![Edge Protection with Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare ")

Use when you’re under heavy bot or brute-force waves.

* **Turnstile:** a low-friction human check.
* **WAF Rate Limiting rules:** throttle repeated POSTs to your form endpoints (e.g., admin-ajax.php or the page URL).
* **IP Access Rules / Bot Fight Mode:** suppress obvious automation before it hits PHP/MySQL.

These controls complement OOPSpam and reduce server load during spikes.

## **Final Thoughts**

Breakdance is a strong form builder but lacks built-in submission limits. Pairing it with OOPSpam gives you real control—rate limits, [IP blocks](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-breakdance-forms), [country filtering](https://www.oopspam.com/blog/how-to-block-countries-in-breakdance-forms), and [log](https://help.oopspam.com/wordpress/form-entries/) clean-up. Start with lenient rules if you expect high traffic, then tighten as needed. With the right setup, you’ll reduce spam, protect your site, and keep your data clean.
