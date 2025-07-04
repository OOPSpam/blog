---
layout: post
title: How to block countries in Fluent Forms?
date: 2025-07-04T03:41:00.000Z
author: chazie
image: /blog/assets/posts/fluentforms-country-block.jpg
description: Block countries in Fluent Forms with built-in tools, OOPSpam for
  advanced filtering, or Cloudflare for full site blocking. Choose the best
  method for you!
tags:
  - Fluent Forms
  - Cloudflare
---
![Fluent Forms](/blog/assets/posts/fluent-forms-site.png "Fluent Forms")

Spam submissions from certain regions can overwhelm your inbox, waste resources, and lead to security issues. If you're using **[Fluent Forms](https://fluentforms.com/)**, you have multiple ways to restrict or block form submissions based on a user’s location. In this guide, we'll cover:

1. Fluent Forms’ built-in country-based restriction feature.
2. OOPSpam plugin for advanced filtering and logging.
3. Cloudflare firewall rules to block entire countries at the DNS level.

## **1. Block Countries Using Fluent Forms’ Built-In Country Filter**

Fluent Forms offers a native way to restrict form submissions by country or IP address—no extra plugins required. But before you can enable these restrictions, you’ll need to configure the **Geo-Location Provider** in the global settings.

### **Step 1: Set Up Geo-Location**

Go to **Fluent Forms > Global Settings** in your WordPress dashboard. Scroll down to the **Geo-Location Provider** section and fill in the required information. Without this, Fluent Forms won’t be able to detect user IPs or geolocation.

![Fluent Forms Set Up Geo-Location](/blog/assets/posts/fluent-forms-geo-location.webp "Fluent Forms Set Up Geo-Location")

Once that’s saved, you’re ready to apply restrictions to individual forms.

### **Step 2: Open the Form’s Settings**

Select the form you want to protect. Go to **Settings & Integrations**, then click on the **Scheduling & Restrictions** tab.

Toggle on **Restrict Form Submission** to activate the restriction options. You’ll now see two checkboxes:

* IP-Based Restriction
* Country-Based Restriction

#### **Restricting by Country**

Check the **Country-Based Restriction** box. From the dropdown, select the countries you want to block or allow. You can select one or multiple countries.

![Fluent Forms Country-Based Restriction](/blog/assets/posts/fluent-forms-country-based-restriction.webp "Fluent Forms Country-Based Restriction")

Once selected, save your settings. Submissions from restricted countries will now be blocked.

## **2. Advanced Country Blocking in Fluent Forms Using OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

If spam persists even with Fluent Forms’ built-in filter or if you're seeing suspicious patterns from rotating IPs or bots—**[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) offers an advanced solution.

### **What OOPSpam Adds to Fluent Forms**

* **Machine Learning-backed Filtering**: Uses machine learning to detect and [block spam from Fluent Forms](https://www.oopspam.com/blog/spam-protection-for-fluent-forms).
* **Country Filtering**: Choose countries to block or allow.
* **Submission Logs**: View blocked entries and review spam attempts.
* **Block by Language**: Filter out submissions written in specific languages you want to exclude.
* **Block VPNs, Tor, Proxies, and Server-Based Spam**: Automatically detect and block spam coming from anonymized or automated sources—including bots, data centers, and suspicious IP networks.

### **How to Set It Up**

![OOPSpam dashboard showing API usage, response time, and API key, with options to test data and view logs, along with navigation menu on the left.](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Install the **[OOPSpam Anti-Spam plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** from the WordPress plugin directory. Once activated, go to your dashboard and open **OOPSpam Anti-Spam > Settings**.

![Paste your API key from your OOPSpam account.](/blog/assets/posts/my-api-key-field.png "Paste your API key from your OOPSpam account.")

Paste your **API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register). Then **activate spam protection**.

![activate spam protection in Fluent Forms](/blog/assets/posts/activate-fluent-forms.png "activate spam protection in Fluent Forms")

Scroll to the **Country Filtering** section. Here, you can either **block specific countries** or **allow only selected ones**. Pick the countries from the dropdown list, save your settings, and you’re done.

![OOPSpam Country Filtering section](/blog/assets/posts/country-filtering-settings.png "OOPSpam Country Filtering section")

OOPSpam will now actively [filter submissions in your Fluent Forms](https://www.oopspam.com/blog/fluentforms-block-user)—without blocking access to the rest of your website.

### **Review Blocked Submissions**

OOPSpam gives you access to **[submission logs](https://help.oopspam.com/wordpress/form-entries/)**. You’ll know which entries were blocked and why, so you can:

* Spot trends in abuse.
* Follow up with legitimate users (if needed).
* Adjust your filtering over time.

## **3. Blocking Countries from Your Website Entirely Using Cloudflare**

If your concerns go beyond form spam and into site-wide abuse, **[Cloudflare](https://www.cloudflare.com/)** can block traffic from entire countries before it ever reaches your server.

⚠️ This approach blocks the entire website—not just your Fluent Forms.

### **How to Set Up Country Blocking in Cloudflare**

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Cloudflare’s **Web Application Firewall ([WAF](https://www.cloudflare.com/lp/ppc/waf-x/))** allows you to create rules based on visitor IP geolocation. This means users from selected countries won’t be able to load your website at all.

### **How to Set It Up**

Log into your **[Cloudflare dashboard](https://dash.cloudflare.com/)** and select your site. Go to the **Security** section, then open the **WAF** tab and click on **Firewall Rules**.

![How to Set Up Country Blocking in Cloudflare WAF](/blog/assets/posts/blocking-countries-in-cloudflare.png "How to Set Up Country Blocking in Cloudflare WAF")

Create a new rule. Give it a name like “Block Countries.” Choose Country as the field, is in as the operator, and select the countries to block. Set the action to **Block**, save your changes, and deploy the rule.

Cloudflare will now block access to your entire site from those countries.

If you're looking to set up country-level blocking with Cloudflare, our article: [Blocking Countries from Accessing Your Website Using Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) walks you through the process.

### **When to Use This**

* You’re experiencing [DDoS attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack), brute-force login attempts, or content scraping from specific regions.
* You have legal or compliance reasons for limiting access to users in certain countries.
* You want to dramatically reduce server load from unwanted traffic.

*This method is [powerful but strict](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them)—so avoid it if you're only dealing with form spam.*

## **Which Country Blocking Method Is Best?**

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
      <td><span class="underline">Fluent Forms Built-In</span></td>
      <td>Form submissions only</td>
      <td>Basic filtering for non-critical forms</td>
    </tr>
    <tr>
      <td><span class="underline">OOPSpam Plugin</span></td>
      <td>Form submissions only</td>
      <td>Advanced filtering, spam detection, and visibility</td>
    </tr>
    <tr>
      <td><span class="underline">Cloudflare WAF</span></td>
      <td>Entire website</td>
      <td>Full country blocks for security or compliance</td>
    </tr>
  </tbody>
</table>

**Recommendation:**

Use Fluent Forms’ built-in country blocking for quick setup on smaller forms. Use OOPSpam if you need smarter filtering, [rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-fluent-forms), [IP filtering](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-fluent-forms), spam behavior detection, and submission logs. And use Cloudflare if your entire site is under attack or needs country-level restrictions for legal reasons.

## **Final Thoughts**

Fluent Forms gives you a solid starting point for country-based form restrictions, but for most users dealing with serious spam or abuse, OOPSpam provides the most complete solution.

If you’re looking to protect your Fluent Forms from spam by region, start with form-level filtering and add more layers only as needed.

OOPSpam integrates with [WPForms](https://www.oopspam.com/blog/how-to-block-countries-in-wpforms), Elementor Forms, Contact Form 7, [SureForms](https://www.oopspam.com/blog/how-to-block-countries-in-sureforms), and more.
