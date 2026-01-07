---
layout: post
title: How to block countries in Beaver Builder Contact Form?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/beaver_header.png
description: Beaver Builder Contact Form lacks country blocking. Use OOPSpam for
  form-level filtering or Cloudflare Firewall to block traffic site-wide.
tags:
  - Beaver Builder
  - Cloudflare
---
![Beaver Builder](/blog/assets/posts/beaver-builder-wordpress.png "Beaver Builder")

[Beaver Builder](https://www.wpbeaverbuilder.com/) Contact Form does not support country blocking by default. To stop spam or unwanted traffic, you can use [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋)  to filter submissions by region or set up [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/) to block visitors from entire countries before they reach your site.

## **Option 1: Block Countries in Beaver Builder Contact Form with OOPSpam**

[OOPSpam](https://www.oopspam.com/) works directly with Beaver Builder forms. It lets you choose which countries can submit your forms and [blocks spam entries](https://www.oopspam.com/blog/spam-protection-for-beaver-builder) from regions you don’t want.

### **Key Features**

* Country filtering to allow or block submissions.
* Language filtering for entries in unwanted languages.
* Set [submission frequency](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) rules to stop abuse.
* Machine based-based spam detection that catches bots and automated submissions.
* Blocking of proxies, VPNs, and TOR traffic.
* Submission [logs](https://help.oopspam.com/wordpress/form-entries/) that show what was blocked and why.

### **How to Set It Up**

Install the **OOPSpam Anti-Spam** plugin from your WordPress dashboard. Create an account at[ OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate an API key.

![OOPSpam Anti-Spam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam dashboard")

Go to **OOPSpam Anti-Spam > Settings** in WordPress and paste your API key.

![Paste your API key](/blog/assets/posts/oopspam-api-key.png "Paste your API key")

Enable protection for **Beaver Builder Contact Form** in the settings.

![Beaver Builder Contact Form Enable protection](/blog/assets/posts/beaver-builder-protection.png "Beaver Builder Contact Form Enable protection")

Open the **Country Filtering** panel and decide whether to block specific countries or allow only selected ones. Save your changes.

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

### **Reviewing Submissions**

You can see blocked and approved entries inside WordPress under **Spam & Ham logs**. 

![WordPress under Spam & Ham logs](/blog/assets/posts/form-spam-entries-oopspam.png "WordPress under Spam & Ham logs")

For more detail, visit your **OOPSpam Dashboard** to view filtering reports, reasons for blocking, and patterns over time.

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam dashboard logs")

## **Option 2: Block Entire Countries with Cloudflare**

If your problem is bigger than spam, such as brute force logins, DDoS attacks, or scraping, you can block traffic at the network level with Cloudflare.

![Block Entire Countries with Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Block Entire Countries with Cloudflare")

### **How to Do It**

1. [Log in](https://dash.cloudflare.com/login) to your Cloudflare account.
2. Go to **Security > Security rules**.
3. Create a new rule and name it “Block Countries.”
4. Set the field to **Country**, the operator to **is in**, and select the countries to block.
5. Set the action to **Block** and save.

Visitors from those countries will now be denied access to your entire site.

## **Final thoughts**

Beaver Builder Contact Form alone cannot stop submissions from specific countries. The easiest fix is to use OOPSpam to filter form entries by region. This gives you targeted control over who can submit your forms.

If the issue extends beyond form spam and affects your whole site, Cloudflare Firewall can block traffic from unwanted countries at the server level.

Together, these tools give you both form-level control and site-wide security.
