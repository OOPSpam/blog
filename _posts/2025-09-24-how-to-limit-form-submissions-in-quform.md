---
layout: post
title: How to Limit Form Submissions in QuForm?
date: 2025-09-24T06:51:00.000+08:00
author: chazie
image: /blog/assets/posts/qu_rt.jpg
description: Limit form submissions in QuForm with built-in caps, user/IP
  restrictions, and advanced controls using OOPSpam or Cloudflare for stronger
  protection.
tags:
  - QuForm
  - Cloudflare
---
![QuForm](/blog/assets/posts/quform.png "QuForm")

[QuForm](https://www.quform.com/) gives you built-in tools to cap entries, restrict submissions to one per user or IP, and schedule form availability. For advanced control like rate-limiting or country/language blocking, pair QuForm with **[OOPSpam](https://www.oopspam.com/)** or Cloudflare. This way, you prevent abuse and keep your forms reliable.

## **Setting Limits in QuForm**

QuForm makes it easy to [restrict how many times](https://www.quform.com/2021/10/quform-2-15-0-released) a form can be submitted. These controls live in the **Settings → General → Limits** area of the form builder.

### **Step 1: Open Your Form**

Go to **QuForm → Forms** in WordPress. Click **Edit** on the form you want to manage. In the top menu of the builder, click the **Settings** icon.

### **Step 2: Find the Limits Section**

In the **General** tab, scroll to **Limits.** This is where you define submission rules.

![Find the Limits Section](/blog/assets/posts/limit-entries.png "Find the Limits Section")

### **Step 3: Enable Submission Limits**

Choose the option that fits your needs:

* **Maximum entry limit:** Turn this on and enter the total number of submissions allowed. When the limit is reached, the form closes automatically.
* **One entry per user/IP:** Enable this if you want each logged-in user or IP address restricted to one submission.

### **Step 4: Add a Custom Message**

You can customize the message users see when the form is closed. Click **Save** to apply your limits. 

QuForm will now enforce them on your live site.

## **Advanced Rate Limiting Using OOPSpam**

QuForm’s built-in limits work well for most cases. But some scenarios, like blocking repeated attempts from spam networks or filtering by [country](https://www.oopspam.com/blog/how-to-block-countries-in-quform) — need stronger tools.

The **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) integrates with QuForm and adds:

* Rate-limits by IP or email per minute/hour
* Country allow/deny lists
* Language filters
* Proxy/VPN/TOR detection
* Logs to review blocked submissions

**Setup:**

**Install OOPSpam Anti-Spam** from the WordPress repository. Create an **[OOPSpam account](https://app.oopspam.com/Identity/Account/Login)** to get your API key.

![OOPSpam account](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account")

Enter the key under **OOPSpam → General Settings.**

![OOPSpam dashboard showing API usage, response time, and API key, with options to test data and view logs, along with navigation menu on the left.](/blog/assets/posts/oopspam-api-key.png "OOPSpam dashboard")

Toggle **QuForm spam protection**, so the plugin filters QuForm submissions.

![QuForm spam protection](/blog/assets/posts/spam-protection-for-quform.png "QuForm spam protection")

Navigate to the **Rate Limiting** **Settings** tab and turn on **Enable Rate Limiting**. This ensures all forms, including QuForm, are covered by [submission limits](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam).

![Rate Limiting Settings](/blog/assets/posts/rate-limiting-settings.png "Rate Limiting Settings")

You can configure:

* **Max submissions per IP/hour** (e.g., 3 entries per IP).
* **Max submissions per email/hour** to stop repeated entries from the same email.
* **Block duration** to decide how long users are blocked after exceeding limits.
* **Data clean-up frequency** to clear [logs](https://help.oopspam.com/wordpress/form-entries/) regularly.

Click **Save Changes** and test by submitting multiple entries. Adjust thresholds until they fit your traffic pattern.

### **Add CAPTCHAs for Extra Security**

![Add CAPTCHAs for Extra Security](/blog/assets/posts/recaptcha-set-version-v3.png "Add CAPTCHAs for Extra Security")

QuForm supports [reCAPTCHA](https://www.quform.com/2019/04/quform-2-8-0-released) v2/v3, [hCaptcha](https://www.oopspam.com/hcaptcha-alternative), and [Cloudflare Turnstile](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them). Adding one reduces automated bot entries.

* **reCAPTCHA v3:** Score-based; tune thresholds if spam sneaks through.
* **Cloudflare Turnstile:** Privacy-friendly and low-friction.
* **hCaptcha:** Good alternative with more control.

## **Final Thoughts**

QuForm lets you cap total submissions, restrict users by IP, and schedule form availability with just a few clicks. For stronger spam and abuse protection, combine QuForm with OOPSpam and modern [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) services. Add Cloudflare [WAF rules](https://developers.cloudflare.com/waf/rate-limiting-rules/) if you need network-level control.

Set up these layers once, and you’ll save time, stop spam, and protect the integrity of your forms.
