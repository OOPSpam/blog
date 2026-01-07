---
layout: post
title: How to block countries in Jetpack Forms?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/header_jetpack.jpg
description: Jetpack Forms can’t block countries by default, but OOPSpam adds
  advanced filtering, logs, and spam protection. Use Cloudflare for full
  country-level blocks.
tags:
  - Jetpack Forms
  - Cloudflare
---
![Jetpack Forms](/blog/assets/posts/jetpack-home.png "Jetpack Forms")

Spam form submissions from certain countries can clog your inbox, disrupt workflows, and open the door to abuse. If you're using [Jetpack Forms](https://jetpack.com/) on your WordPress site, you may be wondering whether there's a built-in way to block countries or filter submissions by location.

The short answer is: Jetpack Forms does not currently include any native country-blocking or IP-based filtering feature.

But that doesn't mean you're out of options. You can still control regional spam effectively using the right tools. In this guide, we’ll walk you through:

* Why Jetpack Forms alone can't block countries
* How to add country filtering using the OOPSpam Anti-Spam plugin
* How to block traffic from entire countries using Cloudflare

### **Country Blocking Is Not Available Natively in Jetpack Forms**

Jetpack Forms are built to be simple and easy to use. However, they do not offer any settings for restricting form submissions based on geolocation, IP address, or user language.

If you're experiencing spam from specific regions or need stricter control over who can submit your forms, you'll need to extend Jetpack’s capabilities using a plugin like **[OOPSpam](https://www.oopspam.com/)**.

## **1. Use OOPSpam to Block Countries in Jetpack Forms**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

**[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) is a machine learning-powered spam filtering plugin that works seamlessly with Jetpack Forms. It gives you fine-tuned control over who can submit your forms, based on country, language, source behavior, and more.

### **What OOPSpam Adds to Jetpack Forms**

* **Country Filtering** – Block or allow submissions from specific countries
* **Spam Behavior Detection** – Uses machine learning to spot spammy content and automated submissions
* **Language-Based Filtering** – Reject submissions written in specific languages
* **Protection from VPNs, Proxies, and Servers** – Block anonymized traffic or spam sent from data centers
* **Submission Logging** – Review both blocked and accepted form entries

These are features Jetpack Forms doesn’t offer on its own.

### **How to Set It Up**

First, install the **OOPSpam Anti-Spam** plugin from the WordPress Plugin Directory. Once activated, go to **OOPSpam Anti-Spam > Settings** from your WordPress dashboard.

![Enter your API key](/blog/assets/posts/oopspam-api-key.png "Enter your API key")

Enter your **API key**, which you’ll get from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register).

![OOPSpam account](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account")

Next, enable **Spam Protection** by toggling it on. 

![enable Jetpack Forms Spam Protection by toggling it on](/blog/assets/posts/jetpack-form-activate-spam-protection.png "enable Jetpack Forms Spam Protection by toggling it on")

Then scroll to the **Country Filtering** section. Here, you can choose whether to **allow only selected countries** or **block specific ones**. 

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Choose your settings from the dropdown, save your preferences, and you’re done!

From this point forward, OOPSpam will begin [filtering submissions from Jetpack Forms](https://www.oopspam.com/blog/4-ways-to-stop-spam-on-jetpack-forms) in real time, without affecting access to your website content.

### **View Blocked Submissions**

Unlike Jetpack, which doesn’t offer any insight into spam handling, OOPSpam gives you full visibility into your form activity. You can access two levels of [logs](https://help.oopspam.com/wordpress/form-entries/):

* Inside your [WordPress](https://www.oopspam.com/wordpress) admin, you’ll see **Form Spam Entries** (blocked) and **Form Ham Entries** (clean).
* In your OOPSpam dashboard, you’ll get detailed logs with submission content, IP, spam score, timestamp, and more.

Here's what the log view looks like in your OOPSpam account:

![Submission logs ](/blog/assets/posts/screenshot-1.png "Submission logs ")

This allows you to:

* Understand what types of spam are being blocked
* Spot patterns in spam behavior
* Rescue any leads that were mistakenly blocked

## **2. Block Entire Countries From Accessing Your Site Using Cloudflare**

If you're dealing with broader abuse, not just form spam and need to block visitors from specific countries from reaching your site at all, [Cloudflare](https://www.cloudflare.com/) provides a DNS-level solution.

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Cloudflare’s Web Application Firewall ([WAF](https://developers.cloudflare.com/waf/)) lets you block traffic based on IP geolocation before it ever reaches your WordPress environment.

> **Important:** This blocks your entire site for users from the selected countries. It does not just affect Jetpack Forms.

### **How to Set It Up**

Log in to your **[Cloudflare dashboard](https://dash.cloudflare.com/)** and select the website you'd like to protect. Go to the **Security** section and open the **Security rules** tab.

![Cloudflare’s Web Application Firewall (WAF)](/blog/assets/posts/cloudflare-security-rules.png "Cloudflare’s Web Application Firewall (WAF)")

Click **Create rule**.

* Name the rule something like “Block Countries”
* Choose **`Country`** as the field
* Set the operator to **`is in`**
* Select the countries you want to block
* Choose **`Block`** as the action

Save and deploy your rule. Any visitors from those countries will now be denied access to your site.

### **When to Use This**

Consider using [Cloudflare country blocking](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) if:

* You're under attack from bots, [scrapers](https://en.wikipedia.org/wiki/Web_scraping), or brute-force login attempts
* You have compliance obligations limiting who can access your services
* You want to reduce hosting costs by limiting unwanted traffic from certain regions

Keep in mind, though, that this is a broad solution. If your main issue is form spam, OOPSpam is a better and safer starting point.

## **What’s the Best Way to Block Countries?**

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    border: 2px solid black;
    padding: 10px;
    text-align: left;
  }
  th {
    background-color: #f9f9f9;
    font-weight: bold;
  }
  td:first-child {
    font-weight: bold;
  }
  .underline {
    text-decoration: underline;
  }
</style>

<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>What It Blocks</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="underline">Jetpack Forms (default)</span></td>
      <td>No country filtering</td>
      <td>Lightweight use, no custom filtering</td>
    </tr>
    <tr>
      <td><span class="underline">OOPSpam Plugin</span></td>
      <td>Form submissions only</td>
      <td>Advanced, real-time filtering, logs, and country control</td>
    </tr>
    <tr>
      <td><span class="underline">Cloudflare WAF</span></td>
      <td>Entire website</td>
      <td>Full country bans for legal or security reasons</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

Jetpack Forms is a simple tool, but when it comes to spam protection, you’ll need more than the basics. For most users dealing with spam from specific regions, OOPSpam provides the most flexible and effective solution.

* You get advanced filtering by country, language, rate limiting, and spam patterns
* You can block bots and VPNs while keeping your site accessible
* You gain insight into blocked entries through logs

OOPSpam integrates smoothly with, [WPForms](https://www.oopspam.com/blog/how-to-block-countries-in-wpforms), [Contact Form 7](https://www.oopspam.com/blog/how-to-block-countries-in-contact-form-7), [Fluent Forms](https://www.oopspam.com/blog/how-to-block-countries-in-fluent-forms), [SureForms](https://www.oopspam.com/blog/how-to-block-countries-in-sureforms), and more.
