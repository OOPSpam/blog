---
layout: post
title: How to block countries in Contact Form 7?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/cf7-block-countries.jpg
description: Block countries in Contact Form 7 using OOPSpam for smart filtering
  and logs, or Cloudflare for full-site blocking. Stop regional spam before it
  reaches you.
tags:
  - Contact Form 7
  - Cloudflare
---
![Contact Form 7](/blog/assets/posts/using-contact-form-7.png "Contact Form 7")

Spam submissions from specific countries can flood your inbox, waste resources, and compromise user experience. If you're using [Contact Form 7](https://contactform7.com/), it's important to know that while it’s one of the most popular form plugins for WordPress, it does not offer built-in country or IP blocking out of the box.

But that doesn’t mean you’re stuck. You can still protect your forms by integrating with tools that bring smart spam filtering and regional blocking features to the table.

In this guide, I’ll show you how to:

* Use OOPSpam for advanced, intelligent country filtering in Contact Form 7.
* Set up Cloudflare firewall rules to block access to your entire site from specific countries.

### **Contact Form 7 Has No Built-In Country Blocking (But Here's What You Can Do)**

By default, Contact Form 7 does not include any native options for blocking form submissions by country or IP address. There's no setting in the form builder that lets you restrict submissions based on geolocation, language, or source.

If you’re experiencing spam from a specific country or region, you’ll need an anti-spam plugin like **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) to extend Contact Form 7's capabilities.

## **1. Block Countries in Contact Form 7 Using OOPSpam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

**[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** is one of the tools you can use to [protect Contact Form 7 from spam](https://www.oopspam.com/spam-filter-for-contactform7)—especially when it comes from rotating IPs, bots using VPNs, or anonymized servers. It offers real-time, machine learning-backed filtering with advanced options for country-based restrictions.

### **What OOPSpam Adds to Contact Form 7**

* **Country Filtering**: Block or allow submissions from specific countries.
* **Machine Learning-Based Filtering**: Detects spam using machine learning and behavior patterns.
* **Submission Logs**: Review blocked or allowed entries (spam vs. ham).
* **Block by Language**: Filter out submissions written in unwanted languages.
* **Block VPNs, Tor, Proxies, and Server-Based Spam**: Automatically block anonymized or bot-driven sources.

These features are not possible with Contact Form 7 alone—but become available instantly through OOPSpam integration.

### **How to Set It Up**

![OOPSpam dashboard ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard ")

First, install the **OOPSpam Anti-Spam plugin** from the WordPress Plugin Directory. Once activated, open your WordPress dashboard and go to **OOPSpam Anti-Spam > Settings**.

![Enter your API key](/blog/assets/posts/oopspam-api-key.png "Enter your API key")

Enter your **API key** (you can get this from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register)). Once added, **Activate** **Spam Protection**.

![Activate Spam Protection in Contact Form 7](/blog/assets/posts/activate-contact-form-7.png "Activate Spam Protection in Contact Form 7")

Scroll down to the **Country Filtering** section. You can choose to either **block selected countries** or **allow only specific ones**.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Pick the countries from the dropdown list, save your settings, and you’re all set. OOPSpam now filters every submission through Contact Form 7 in real time—without affecting your site's accessibility.

### **Review Blocked Submissions**

Unlike [Contact Form 7](https://www.oopspam.com/blog/oopspam-supports-contact-form-7), which offers no built-in spam reporting, **OOPSpam gives you full visibility into your [submission logs](https://help.oopspam.com/wordpress/form-entries/)**—both directly in your WordPress dashboard and in the OOPSpam web dashboard.

In your WordPress admin, you can view:

* **Form Spam Entries**: Submissions flagged and blocked by the system.
* **Form Ham Entries**: Legitimate submissions that passed all checks.

Each log entry shows you:

* Submission content
* IP address
* Email address (if collected)
* Spam score
* Filtering reasons
* Timestamp and response metadata

For deeper insights, you can also visit your OOPSpam dashboard, where logs are displayed in a more detailed format. Here’s an example:

![OOPSpam submission logs](/blog/assets/posts/screenshot-1.png "OOPSpam submission logs")

These insights help you catch patterns, fine-tune your filtering rules, and make data-backed decisions on how to handle future submissions.

## **2. Block Countries From Your Entire Site Using Cloudflare**

If the spam you’re receiving is not limited to Contact Form 7 and your entire website is being targeted, you can use [Cloudflare](https://www.cloudflare.com/) to block traffic from specific countries before it ever reaches your server.

If the spam you're receiving isn't limited to Contact Form 7—and your entire site is being targeted—you can block countries before they reach your server using [Cloudflare](https://www.cloudflare.com/).

Cloudflare’s **Web Application Firewall ([WAF](https://developers.cloudflare.com/waf/))** allows you to restrict site access by IP geolocation. This method is ideal for wide-scale abuse or legal compliance needs.

⚠️ **Important:** This blocks the entire website, not just your form submissions.

### **How to Set Up Country Blocking in Cloudflare**

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Log in to your **[Cloudflare dashboard](https://dash.cloudflare.com/)** and select your website. Navigate to the **Security** section, then open the **Security rules** tab.

Create a new rule and give it a name like **"Block Countries."**

![Cloudflare dashboard](/blog/assets/posts/cloudflare-security-rules.png "Cloudflare dashboard")

Set the rule to:

* **Field**: **`Country`**
* **Operator**: **`is in`**
* **Value**: Choose the countries you want to block

Set the **Action** to **`Block`** and save your changes.

To learn how to block specific countries using Cloudflare, take a look at our article: [Blocking Countries from Accessing Your Website Using Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare)*.*

From now on, traffic from those countries will be denied access to your entire site, including Contact Form 7.

### **When Should You Use Cloudflare?**

* Your site is receiving brute-force attacks, scraper bots, or [DDoS traffic](https://en.wikipedia.org/wiki/Denial-of-service_attack).
* You need to comply with geo-based legal restrictions.
* You're managing large-scale traffic and want to reduce load from unwanted regions.

*This method is powerful, but also extreme—so it’s best used for [serious threats](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) or compliance rather than routine spam. Use Cloudflare only if you want to block access to your entire website by region.*

## **Which Method Is Best for Blocking Countries?**

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
      <th>Logging</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="underline">Contact Form 7 (default)</span></td>
      <td>Nothing</td>
      <td>No</td>
      <td>Not suitable for country-level filtering</td>
    </tr>
    <tr>
      <td><span class="underline">OOPSpam Plugin</span></td>
      <td>Form submissions only</td>
      <td>Yes</td>
      <td>Advanced spam filtering, country/language/IP control</td>
    </tr>
    <tr>
      <td><span class="underline">Cloudflare Firewall</span></td>
      <td>Entire website</td>
      <td>No</td>
      <td>Full website restriction by country</td>
    </tr>
  </tbody>
</table>

## **Final Thoughts**

Contact Form 7 doesn’t include country-based filtering on its own, but that doesn’t mean you can’t protect your forms. OOPSpam fills in the gaps by offering machine learning-based spam detection, [rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-contact-form-7), [IP filtering](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-contact-form-7), country blocking, and full submission logging.

OOPSpam also supports [WPForms](https://www.oopspam.com/blog/how-to-block-countries-in-wpforms), [Fluent Forms](https://www.oopspam.com/blog/how-to-block-countries-in-fluent-forms), Elementor Forms, [SureForms](https://www.oopspam.com/blog/how-to-block-countries-in-sureforms), and more.
