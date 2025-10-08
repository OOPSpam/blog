---
layout: post
title: How to Limit Form Submissions in Forminator Forms?
date: 2025-10-08T13:18:00.000+08:00
author: chazie
image: /blog/assets/posts/formf_rt.jpg
description: Limit unwanted or repeated submissions in Forminator Forms with
  OOPSpam Anti-Spam and Cloudflare’s firewall rules. Keep entries clean and
  fair.
tags:
  - Forminator Forms
  - Cloudflare
---
![Forminator Forms](/blog/assets/posts/forminator-wordpress.png "Forminator Forms")

[Forminator](https://wordpress.org/plugins/forminator/) is a flexible plugin for building contact forms, polls, and quizzes. It’s feature-rich, but there’s one limitation: it doesn’t let you set a cap on how many times a form can be submitted.

That means if you’re running a competition, accepting registrations, or trying to reduce repetitive spam, you’ll need outside help. The best way to add this control is by using OOPSpam Anti-Spam and Cloudflare’s rate limiting.

## **Why Forminator Needs Submission Controls**

Open forms without restrictions can quickly be exploited. Automated scripts and bots can overwhelm your site with repeated entries. Even genuine users may submit multiple times, skewing results or filling your inbox with duplicates.

Adding submission limits ensures:

* Clean data for surveys and polls
* Fair access for contests and signups
* Better site performance under heavy traffic

## **Using OOPSpam with Forminator**

Forminator supports [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and [Honeypot](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field:~:text=Final%20thoughts-,Honeypot%3A%20filter%20spam%20with%20a%20hidden%20field,-It%20is%20the) protection, but these are often bypassed. To truly control form activity, you need a plugin that gives you [direct control](https://www.oopspam.com/blog/spam-protection-for-forminator) over submission behavior. That’s where OOPSpam Anti-Spam comes in.

Instead of relying on visual tests for users, [OOPSpam](https://www.oopspam.com/) (that’s us 👋) works quietly in the background, analyzing requests before they reach your inbox.

### **Key Capabilities**

* Set [maximum submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) per IP or per email address within a chosen timeframe.
* Apply [country](https://www.oopspam.com/blog/how-to-block-countries-in-forminator) allow/deny lists to control geographic access.
* Block traffic from VPNs, proxies, or TOR networks.
* Use language-based filters to stop irrelevant or abusive content.
* Review detailed [logs](https://help.oopspam.com/wordpress/form-entries/) to see which entries were blocked.

### **How to Set It Up**

Install and activate **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** from the WordPress plugin directory. [Sign up](https://app.oopspam.com/Identity/Account/Login) for an OOPSpam account and copy your API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

In WordPress, go to **OOPSpam → General Settings** and paste your API key.

![OOPSpam to General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam to General Settings")

Activate **Spam Protection** so Forminator submissions are filtered.

![Activate Spam Protection so Forminator](/blog/assets/posts/formidable-forms-spam-protection.png "Activate Spam Protection so Forminator")

Open and enable **Rate Limiting Settings** and configure:

![Enable Rate Limiting settings](/blog/assets/posts/rate-limiting-settings.png "Enable Rate Limiting settings")

* **Max submissions per IP/hour** – Sets how many times a single IP address can submit in an hour.
* **Max submissions per email/hour** – Limits how many entries can come from the same email within an hour.
* **Block duration** – Decides how long a user is prevented from submitting once they hit the limit (e.g., 24 hours).
* **Automatic cleanup of old logs** – Regularly clears stored submission records to keep your site fast and optimized.

Save your **changes**. From now on, repeat entries beyond your thresholds are automatically blocked.

## **Adding Firewall Rules with Cloudflare**

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

If your website uses [Cloudflare](https://www.cloudflare.com/), you can strengthen protection even further. Unlike plugin-based filters, Cloudflare blocks abusive requests before they even reach your WordPress site.

This is done through [Rate Limiting Rules](https://developers.cloudflare.com/waf/rate-limiting-rules/) in Cloudflare’s Web Application Firewall (WAF).

### **Example Setup**

* **Rule:** Monitor POST requests to /wp-admin/admin-ajax.php (the endpoint Forminator uses).
* **Condition:** Allow up to 3 submissions per 10 minutes per IP.
* **Action:** Block or Challenge requests that exceed the rule.

By handling traffic at the network level, Cloudflare prevents brute-force spam from using your server resources.

## **Combining Both for Best Results**

OOPSpam and Cloudflare work well together:

* OOPSpam gives you fine-grained control over how many times users or bots can submit, with country and proxy filtering.
* Cloudflare ensures bad traffic doesn’t even touch your server, cutting off brute-force or automated attacks at the edge.

Together, they help you get accurate entries, fewer duplicates, and a more stable website.

## **Final Thoughts**

Forminator doesn’t include submission limits by default, but you don’t have to leave your forms wide open. By combining OOPSpam’s filtering with Cloudflare’s firewall rules, you can prevent repeated entries, block abuse, and maintain reliable form data.

This way, you keep control of your forms while making the experience smoother for genuine visitors.
