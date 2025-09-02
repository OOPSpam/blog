---
layout: post
title: How to block countries in Toolset Forms?
date: 2025-09-02T04:39:00.000+08:00
author: chazie
image: /blog/assets/posts/toolset_header.png
description: Toolset Forms lacks country blocking. Use OOPSpam for form-level
  filtering or Cloudflare Firewall to block countries and stop spam effectively.
tags:
  - Toolset Forms
  - Cloudflare
---
![Toolset Forms](/blog/assets/posts/toolset-forms.png "Toolset Forms")

[Toolset Forms](https://toolset.com/home/cred/) does not include built-in country blocking. To stop spam or unwanted traffic, you need two options:

1. Use [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋) for form-level filtering.
2. Use [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/) to block entire countries at the network level.

## **Option 1: Block Countries in Toolset Forms with OOPSpam**

OOPSpam Anti-Spam integrates with WordPress and adds country and language filtering to your forms. It prevents unwanted submissions while letting legitimate users through.

### **Key Features for Toolset Forms**

* Block or allow submissions from specific countries.
* Filter entries written in unwanted languages.
* [Limit form submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to reduce spam and misuse.
* Detect spam with machine learning and stop bots, proxies, VPNs, and TOR users.
* Review blocked and approved entries with clear logs.

### **How to Set It Up**

Install the OOPSpam plugin from **Plugins > Add New** in WordPress. Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate an API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Paste the API key into **OOPSpam Anti-Spam > Settings**.

![Paste the API key into OOPSpam Anti-Spam](/blog/assets/posts/oopspam-api-key.png "Paste the API key into OOPSpam Anti-Spam")

Enable protection for **Toolset Forms** in the plugin settings.

![Enable protection for Toolset Forms in the plugin settings.](/blog/assets/posts/toolset-forms-protection.png "Enable protection for Toolset Forms in the plugin settings.")

Go to **Country Filtering** and choose whether to block certain countries or allow only specific ones.

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

### **Reviewing Entries**

Blocked and approved submissions appear in two places: inside WordPress under the Spam & Ham [logs](https://help.oopspam.com/wordpress/form-entries/):

![OOPSpam WordPress under the Spam & Ham logs](/blog/assets/posts/form-spam-entries-oopspam.png "OOPSpam WordPress under the Spam & Ham logs")

and in your OOPSpam Dashboard with more detailed filtering reports:

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

This transparency lets you fine-tune settings and recover valid leads if needed.

## **Option 2: Block Entire Countries with Cloudflare**

If the problem goes beyond form spam, such as [DDoS attacks](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/), scraping, or server overload, block traffic at the network level with Cloudflare.

### **How to Do It**

![Block Entire Countries with Cloudflare](/blog/assets/posts/blocking-countries-in-cloudflare.png "Block Entire Countries with Cloudflare")

1. Log in to your [Cloudflare](https://dash.cloudflare.com/login) account.
2. Go to **Security > WAF > Firewall Rules**.
3. Create a new rule and name it “Block Countries.”
4. Set the field to **Country**, operator to **is in**, and choose the countries you want to block.
5. Set the action to **Block** and save.

Cloudflare will now block all visitors from those countries before they ever reach your site.

## **Which Method Should You Choose?**

* Use **OOPSpam** if you want precision — block only form submissions while leaving the rest of your site accessible.
* Use **Cloudflare Firewall** if you need to block all access from a region for security, compliance, or server performance.

## **Final thoughts**

Toolset Forms does not have built-in country blocking. But with [OOPSpam](https://www.oopspam.com/), you can filter submissions by region and keep your forms clean. For stronger protection, layer Cloudflare Firewall rules to block entire countries at the network level.

This combination gives you control, flexibility, and security,  without disrupting legitimate visitors.
