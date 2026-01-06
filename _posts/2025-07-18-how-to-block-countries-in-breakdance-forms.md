---
layout: post
title: How to block countries in Breakdance Forms?
date: 2025-07-18T12:02:00.000+08:00
author: chazie
image: /blog/assets/posts/header_breakdance.jpg
description: Breakdance Forms can't block countries by default. Use Cloudflare
  or OOPSpam for advanced filtering by country, IP, VPN, and language plus full
  spam protection logs.
tags:
  - Breakdance Forms
  - Cloudflare
---
![Breakdance ](/blog/assets/posts/breakdance-home.png "Breakdance ")

Breakdance Forms doesn’t include a built-in feature to block countries or IP addresses, but you can easily do it using the OOPSpam WordPress plugin. With OOPSpam, you can filter form submissions based on country, IP, language, and other criteria—all without writing any code.

Here’s how to get started.

### **What Breakdance Forms Offers**

[Breakdance Forms](https://breakdance.com/) provides a sleek drag-and-drop form builder, but it doesn’t offer geolocation or filtering features. You won’t find an option to block countries, restrict IPs, or detect spam from VPNs or proxies. 

That’s where **[OOPSpam](https://www.oopspam.com/)** comes in.

## **Add Country Blocking with OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

To enable country or IP-based filtering in Breakdance Forms, start by installing the **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** plugin (that’s us 👋). 

Once installed, head to **OOPSpam Anti-Spam > Settings** in your dashboard. 

![Paste in your API key from your OOPSpam account.](/blog/assets/posts/oopspam-api-key.png "Paste in your API key from your OOPSpam account.")

Paste in your **API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register).

![OOPSpam account](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account")

Once [Breakdance Forms](https://www.oopspam.com/blog/spam-protection-for-breakdance) is installed, the **spam protection settings** will become available. You’ll also have the option to add a custom message that appears when a submission is flagged and blocked as spam.

![Spam protection settings - Breakdance Forms](/blog/assets/posts/settings-‹-oopspam-—-wordpress-04-25-2025_09_43_pm.png "Spam protection settings - Breakdance Forms")

You can now:

* Block submissions by country
* Only allow selected countries
* Block spam sent from [VPNs](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-breakdance-forms), proxies, Tor, or servers
* Filter by language
* [Rate limit](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) form submissions to prevent abuse

All of this is done without slowing down your site.

### **How to Set Up Country Blocking**

First, enable **Country Filtering** in the plugin settings. Choose the countries you want to block or allow from the dropdown menu. Save your changes.

![Country Blocking](/blog/assets/posts/country-filtering-settings.png "Country Blocking")

From that point on, your Breakdance forms will follow those country rules.

### **Block VPNs, IPs, Language & More**

Under the OOPSpam settings tab, you can block more than just countries:

* Block by language (e.g. only allow English or Spanish submissions)
* Block traffic coming from VPNs, proxies, Tor, and automated scripts
* Set rate limits to slow down or block repeated form abuse

![IP Filtering settings](/blog/assets/posts/ip-filtering-oopspam.png "IP Filtering settings")

These features help reduce spam from anonymous sources and bad actors.

### **View Your Logs**

You can review which [form entries](https://help.oopspam.com/wordpress/form-entries/) were blocked or accepted:

* **Form Spam Entries** and **Form Ham Entries** inside the **WordPress Dashboard** — these show blocked and allowed form submissions, respectively.

![Form Spam Entries and Form Ham Entries inside the WordPress Dashboard](/blog/assets/posts/form-spam-entries-oopspam.png "Form Spam Entries and Form Ham Entries inside the WordPress Dashboard")

* Full submission logs inside the **OOPSpam Dashboard** — this offers additional detail and filtering options.

![Full submission logs inside the OOPSpam Dashboard](/blog/assets/posts/screenshot-1.png "Full submission logs inside the OOPSpam Dashboard")

This helps you monitor activity and make sure legitimate users aren’t being blocked.

#### **Why OOPSpam Over Other Plugins?**

Unlike simple [CAPTCHA ](https://www.oopspam.com/blog/best-captcha-alternatives)or honeypot methods, OOPSpam uses machine learning, IP reputation, and behavior analysis to stop spam before it reaches your inbox. It works behind the scenes with Breakdance Forms without any complex setup.

## **Block Countries at the Server Level with Cloudflare (Optional)**

If you’re experiencing attacks or high traffic from specific countries across your entire website, not just form submissions—[Cloudflare](https://www.cloudflare.com/) lets you [block countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) at the DNS level.

![Cloudflare ](/blog/assets/posts/cloudflare-homepage.png "Cloudflare ")

This method stops users from even loading your site based on IP geolocation.

![Cloudflare WAF](/blog/assets/posts/cloudflare-security-rules.png "Cloudflare WAF")

To do this:

1. Log in to your [Cloudflare account](https://dash.cloudflare.com/).
2. Choose your website and go to **Security > Security rules**.
3. Create a new Security Rule.
4. Set the Field to Country, the Operator to is in, and select the countries you want to block.
5. Set the Action to Block, then save and deploy the rule.

> Cloudflare’s country blocking applies to your entire site. If you're only trying to block spam on forms, OOPSpam is the better choice.

## **Final thoughts**

Breakdance doesn’t include native IP or country filtering, but with OOPSpam, you can add those protections and more in just a few clicks. If you’re dealing with spam or want more control over who submits your forms, this integration is a reliable and simple solution.

Visit [OOPSpam documentation](https://www.oopspam.com/help) for setup guides or support. OOPSpam integrates with [WS Form](https://www.oopspam.com/blog/how-to-block-countries-in-ws-form), [Jetpack Forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetpack-forms), [Contact Form 7](https://www.oopspam.com/blog/how-to-block-countries-in-contact-form-7), [Fluent Forms](https://www.oopspam.com/blog/how-to-block-countries-in-fluent-forms), and more.
