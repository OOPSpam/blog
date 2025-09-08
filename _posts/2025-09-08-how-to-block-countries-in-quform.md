---
layout: post
title: How to block countries in QuForm?
date: 2025-09-08T02:15:00.000+08:00
author: chazie
image: /blog/assets/posts/quform_header.png
description: QuForm doesn’t include country blocking by default. Use OOPSpam to
  filter form submissions by region or Cloudflare Firewall to block traffic
  site-wide.
tags:
  - QuForm
  - Cloudflare Firewall
---
![QuForm](/blog/assets/posts/quform.png "QuForm")

### **The Problem: QuForm Doesn’t Block Countries**

Out of the box, [QuForm](https://www.quform.com/) doesn’t give you a way to block submissions by country. Its focus is on building custom, flexible forms—not stopping bad traffic.

That means if spam or abuse is coming from specific regions, you’ll need to add another layer of protection.

## **The Quick Fix: OOPSpam Anti-Spam**

[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋) integrates with QuForm to give you country-level control. It filters form submissions before they reach your inbox or database, letting you stop abuse at the source.

### **What You Gain with OOPSpam**

* Country filtering to allow or block submissions.
* Language filtering to stop unwanted text.
* [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to prevent form floods.
* Machine learning-powered spam detection that blocks bots.
* Proxy, VPN, and TOR blocking for stronger protection.
* Submission logs so you know what’s being stopped.

## **How to Set It Up**

Install and activate the **OOPSpam Anti-Spam** plugin in WordPress. Create an account at **[OOPSpam.com](https://app.oopspam.com/Identity/Account/Login)** and get your API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

In WordPress, go to **Settings > OOPSpam Anti-Spam** and paste in the key.

![OOPSpam Anti-Spam and paste in the key](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam and paste in the key")

Enable spam protection for **QuForm**.

![Spam protection for QuForm](/blog/assets/posts/spam-protection-for-quform.png "Spam protection for QuForm")

Under the **General Settings tab**, use **Country Filtering** to choose which countries to block or allow.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Save your settings and monitor results in the **Spam & Ham** [logs](https://help.oopspam.com/wordpress/form-entries/).

![Spam & Ham logs in WordPress](/blog/assets/posts/form-spam-entries-oopspam.png "Spam & Ham logs in WordPress")

For deeper insights, check the **OOPSpam Dashboard**, where you’ll see detailed filtering reports, reasons for blocking, and spam patterns over time.

![OOPSpam dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam dashboard logs")

## **The Bigger Solution: Cloudflare Firewall**

If spam is just part of the problem and you’re dealing with brute force logins, scraping, or DDoS attempts, you’ll want a network-level solution.

[Cloudflare Firewall](https://developers.cloudflare.com/firewall/cf-firewall-rules/) lets you block visitors from entire [countries](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) before they ever reach your WordPress site.

### **Quick Setup in Cloudflare**

![Quick Setup in Cloudflare WAF](/blog/assets/posts/blocking-countries-in-cloudflare.png "Quick Setup in Cloudflare WAF")

1. [Log in](https://dash.cloudflare.com/login) to **Cloudflare**.
2. Go to **Security > WAF > Firewall Rules**.
3. Create a new rule named ‘**Block Countries**’.
4. Set the field to **Country**, operator **is in**, then select the countries.
5. Choose **Block** as the action and save.

From now on, traffic from those regions will never reach your forms or your site.

## **Final thoughts**

* **Use OOPSpam** – When you want to block spam submissions in QuForm only.
* **Use Cloudflare** – When you need site-wide blocking against traffic from entire countries.

QuForm is excellent for building powerful forms, but it isn’t built for country-level security. Pairing it with [OOPSpam](https://www.oopspam.com/) or Cloudflare keeps your forms open for real users while shutting out spam and abuse.
