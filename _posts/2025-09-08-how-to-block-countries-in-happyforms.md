---
layout: post
title: How to block countries in HappyForms?
date: 2025-09-08T01:05:00.000+08:00
author: chazie
image: /blog/assets/posts/happyforms_header.png
description: HappyForms doesn’t include country blocking by default. Use OOPSpam
  to filter form submissions by region or Cloudflare Firewall to block traffic
  site-wide.
tags:
  - HappyForms
  - Cloudflare
---
![HappyForms](/blog/assets/posts/happyforms.jpg "HappyForms")

### **Can HappyForms Block Countries on Its Own?**

No. [HappyForms](https://happyforms.io/) is designed for building user-friendly forms and managing submissions, not filtering traffic by geography. If spam or abuse comes from certain countries, you’ll need additional tools like [OOPSpam](https://www.oopspam.com/) or Cloudflare.

## **Block Spam Submissions by Country using OOPSpam**

The fastest way to add country-level blocking to HappyForms is with the [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋). It works silently in the background, preventing unwanted entries before they’re delivered to you.

### **What OOPSpam Can Do**

* Block or allow submissions by country.
* Filter text by language to reduce irrelevant entries.
* [Limit](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-happyforms) abuse with [frequency](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) controls.
* Detect bots with machine learning-powered spam checks.
* Block VPN, proxy, and TOR traffic for stronger protection.
* Log every submission so you know what was blocked and why.

## **How to Enable Country Filtering in HappyForms**

Install and activate the **OOPSpam Anti-Spam** plugin. Create an account at **[OOPSpam.com](https://app.oopspam.com/Identity/Account/Login)** and generate your API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

In WordPress, go to **Settings > OOPSpam Anti-Spam** and paste the key.

![OOPSpam Anti-Spam and paste the key](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam and paste the key")

Enable spam protection for **HappyForms**.

![Enable spam protection for HappyForms](/blog/assets/posts/spam-protection-for-happyforms.png "Enable spam protection for HappyForms")

Use **Country Filtering** under the **General Settings** tab in OOPSpam to select which countries to block or allow.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Blocking")

Save and review results in the **Spam & Ham** [logs](https://help.oopspam.com/wordpress/form-entries/) inside WordPress.

![Spam & Ham logs inside WordPress](/blog/assets/posts/form-spam-entries-oopspam.png "Spam & Ham logs inside WordPress")

You can also check the **OOPSpam Dashboard**, which shows filtering reports, reasons for blocking, and submission patterns over time.

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

With this setup, only legitimate submissions from approved regions will make it through.

## **Block Entire Countries from Your Website with Cloudflare**

If spam isn’t your only concern and you’re also dealing with brute force logins, scraping, or DDoS attacks, use [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/). This blocks visitors from [entire countries](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) before they even reach your site.

### **Cloudflare Setup in 5 Steps**

![Block Entire Countries from Your Website with Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Cloudflare WAF")

1. [Log in](https://dash.cloudflare.com/login) to **Cloudflare**.
2. Go to **Security > Security rules**.
3. Create a new rule called ‘**Block Countries**’.
4. Set the field to **Country**, operator **is in**, then select the countries to block.
5. Choose **Block** as the action and save.

From then on, traffic from those countries won’t reach your forms or any part of your site.

## **Final Takeaway**

* **OOPSpam** – Best if you want [form-level filtering in HappyForms](https://www.oopspam.com/blog/5-ways-to-protect-your-happyforms-from-spam) while keeping your site accessible.
* **Cloudflare** – Best if you need site-wide blocking against unwanted or abusive traffic.

HappyForms is great for building forms but isn’t designed for security. Pair it with OOPSpam and Cloudflare for complete spam protection. Together, they keep your forms open to genuine users while blocking spam and abuse at multiple levels.
