---
layout: post
title: How to block countries in Piotnet Forms?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/pionet_header.png
description: Discover how to block countries in Piotnet Forms using OOPSpam for
  form-level filtering or Cloudflare Firewall Rules for site-wide protection.
tags:
  - Piotnet Forms
  - Cloudflare
---
![Piotnet Forms](/blog/assets/posts/piotnet-forms.png "Piotnet Forms")

If you’re using [Piotnet Forms](https://piotnetforms.com/), there’s no native option to block countries directly. But you still have reliable solutions to filter unwanted traffic and keep your forms clean.

This guide explains how you can achieve country-based blocking with OOPSpam Anti-Spam (for form-level filtering) or Cloudflare Firewall Rules (for site-wide blocking).

### **No Built-In Country Blocking in Piotnet Forms**

Unlike some enterprise-level tools, Piotnet Forms does not provide a built-in feature to block submissions by country or IP address. That means if you need geographic filtering, you’ll need to connect a third-party plugin or service.

The two most effective approaches are:

* **OOPSpam Anti-Spam** – adds advanced spam detection, geo-filtering, and logs directly within your WordPress dashboard.
* **Cloudflare Firewall Rules** – blocks traffic from entire countries before they even reach your site.

Let’s break down how each works.

## **1. Block Countries in Piotnet Forms Using OOPSpam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

If you’re mainly dealing with spam entries (especially from certain countries), [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋) is the most effective way. It integrates seamlessly with Piotnet Forms, giving you precise control at the form level without blocking legitimate site visitors.

### **What OOPSpam Adds to Piotnet Forms**

When paired with Piotnet Forms, OOPSpam offers:

* **Country Filtering** – choose which countries to block or allow.
* **Language Filtering** – exclude submissions written in specific languages.
* **Machine Learning Spam Protection** – detects bots and junk based on behavior, not just keywords.
* **Block Proxies, VPNs, and TOR** – prevent anonymous or automated spam attempts.
* **Rate Limiting** – [limit how often](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) a form can be submitted to stop abuse.
* **Detailed Submission Logs** – see exactly what was blocked and why.

This gives you control over spam without impacting genuine users outside the blocked regions.

### **How to Set It Up**

Here’s how to connect OOPSpam with Piotnet Forms:

**Step 1: Install OOPSpam**

From your WordPress dashboard, go to **Plugins > Add New**. Search for **OOPSpam Anti-Spam**.

Install and activate the plugin.

**Step 2: Connect Your API Key**

Sign up at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![Connect Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Connect Your API Key")

Go back to WordPress > **OOPSpam Anti-Spam > Settings**. Paste your API key in the designated field.

![Paste your API key in the designated field.](/blog/assets/posts/oopspam-api-key.png "Paste your API key in the designated field.")

**Step 3: Enable Piotnet Forms Protection**

Scroll down to the **Piotnet Forms** section and toggle **spam protection on**.

![Enable Piotnet Forms Protection](/blog/assets/posts/piotnet-forms-spam-protection.png "Enable Piotnet Forms Protection")

* **Spam Message** – add a custom message shown when a submission is blocked.
* **Main Content Field ID (optional)** – if you use multiple fields, enter the field IDs here.
* **Don’t Protect These Forms** – exclude specific forms by entering their IDs.

This ensures all your Piotnet Forms are now filtered through [OOPSpam](https://www.oopspam.com/)’s system.

**Step 4: Set Country Filters**

Under **Country Filtering**, choose one of two options:

* Allow only from selected countries
* Block submissions from selected countries

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Select your target regions and save.

Now, submissions from blocked countries won’t make it through your Piotnet Forms, but users can still browse your site normally.

### **Reviewing Blocked Submissions in Piotnet Forms**

OOPSpam provides full transparency through [logs](https://help.oopspam.com/wordpress/form-entries/). You can check:

* Submission content
* IP address
* Spam score & reason for blocking
* Timestamp
* Email & metadata

Logs are available in two places:

* **WordPress dashboard** – see *Form Spam Entries* and *Form Ham Entries*.

![WordPress dashboard](/blog/assets/posts/form-spam-entries-oopspam.png "WordPress dashboard – see Form Spam Entries and Form Ham Entries.")

* **OOPSpam dashboard** – with deeper filtering, search, and export options.

![OOPSpam dashboard](/blog/assets/posts/screenshot-1.png "OOPSpam dashboard – with deeper filtering, search, and export options.")

This makes it easy to:

* Recover legitimate leads if mistakenly blocked
* Identify spam trends from specific regions
* Fine-tune your filtering rules over time

## **2. Block Entire Countries from Your Website with Cloudflare**

If your issue goes beyond spam, like brute force logins, scraping, or [DDoS attacks](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/), you may want to block traffic at the network level using [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/cf-firewall-rules/).

> Unlike OOPSpam, this blocks visitors from an entire country across your whole website, not just Piotnet Forms.

### **How to Set Up Country Blocking in Cloudflare**

![How to Set Up Country Blocking in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "How to Set Up Country Blocking in Cloudflare")

1. **Log Into Cloudflare**
2. * Go to cloudflare.com, [log in](https://dash.cloudflare.com/login), and select your website.
3. **Create a security rule**
4. * Go to **Security > Security rules**.

   * Click **Create rule**.

   * Name it (e.g. “Block Countries”).

   * Set conditions:

   * **Field:** Country
   * **Operator:** is in
   * **Value:** Select the countries you want blocked

   * Action: **Block**

   * Save and deploy.

From that point, traffic from those [countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) won’t even reach your server.

### **When to Use Cloudflare Blocking**

This method is best when:

* You’re under attack from a specific region
* You need to comply with regulations restricting access
* You want to reduce junk traffic and server load

## **Final thoughts**

Piotnet Forms doesn’t include country blocking by default, but with the right tools, you can manage it effectively.

* Use OOPSpam Anti-Spam for precise, form-level filtering with country rules and detailed logs.
* Use Cloudflare Firewall for wider protection when your entire site is under attack or needs compliance controls.

Together, they give you flexible, layered defense against unwanted traffic.

OOPSpam integrates with many other form builders as well, including [MailPoet](https://www.oopspam.com/blog/how-to-block-countries-in-mailpoet), [GiveWP Donation Forms](https://www.oopspam.com/blog/how-to-block-countries-in-givewp-donation-forms), [Paid Memberships Pro](https://www.oopspam.com/blog/how-to-block-countries-in-paid-memberships-pro), [Elementor Forms](https://www.oopspam.com/blog/how-to-block-countries-in-elementor-forms), and [more](https://wordpress.org/plugins/oopspam-anti-spam/#:~:text=Supported%20form%20%26%20comment%20solutions%3A), so if you switch platforms in the future, you won’t lose protection.
