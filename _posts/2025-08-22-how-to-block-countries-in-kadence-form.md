---
layout: post
title: How to block countries in Kadence Form?
date: 2025-08-22T05:20:00.000+08:00
author: chazie
image: /blog/assets/posts/kadence_header.png
description: Learn how to block countries in Kadence Forms using OOPSpam
  Anti-Spam and Cloudflare for stronger spam protection and cleaner form
  submissions.
tags:
  - Kadence Form
  - Cloudflare
---
![Kadence ](/blog/assets/posts/kadence-wp.png "Kadence")

Seeing unwanted or spam submissions from certain countries through your [Kadence Forms](https://www.kadencewp.com/)? While Kadence Blocks offers a flexible form builder, it currently does not include built-in support for blocking submissions by country. The form block doesn’t provide IP-based or geo-location filtering natively.

That said, you can still manage this with the right tools. By integrating with a plugin like [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋), you can enable country-level filtering for your forms. For broader protection, you can also apply server-level country blocks using Cloudflare.

### **No Built-In Country Blocking in Kadence Forms**

Kadence Forms are part of the [Kadence Blocks](https://www.kadencewp.com/kadence-blocks/) plugin suite, offering lightweight yet functional form-building capabilities. However, as of now, there’s no native setting to filter or restrict form entries by country, IP, or language.

That means you’ll need to turn to an external solution to [block spam](https://www.oopspam.com/blog/spam-protection-for-kadence-form) and filter submissions from specific regions. Let’s explore how to do that using [OOPSpam](https://www.oopspam.com/) and Cloudflare.

## **1. Block Countries in Kadence Forms Using OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

If you’re getting spam submissions, especially from specific countries, OOPSpam Anti-Spam is the easiest way to fix it. This plugin offers advanced spam filtering and integrates smoothly with Kadence Forms.

It doesn’t require you to modify your forms, add hidden fields, or write code. Once installed, you just toggle Kadence Forms protection on, select which countries to block, and you’re done!

### **What OOPSpam Adds to Kadence Forms**

Here’s what you unlock by using OOPSpam with Kadence:

* **Country Filtering** – Block or allow form submissions from specific countries
* **Language Filtering** – Reject submissions written in certain languages
* **Spam Scoring with Machine Learning**– Detects patterns of spam using behavior-based filtering
* **Block VPNs, Proxies, TOR Traffic** – Stops [anonymized or bot-generated entries](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-kadence-forms)
* **Rate Limiting** – Prevents abusive [repeated submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)
* **Detailed Logs** – See exactly which entries were blocked and why

### **How to Set It Up**

Follow these steps to connect OOPSpam to your Kadence Forms:

**Step 1: Install the OOPSpam Plugin**

In your WordPress dashboard:

* Go to **Plugins > Add New**
* Search for “OOPSpam Anti-Spam”
* Click **Install Now**, then **Activate**

**Step 2: Add Your API Key**

Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![OOPSpam dashboard displaying API usage, average response time, and API key.](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

Go to **OOPSpam Anti-Spam > Settings** in your WordPress dashboard and paste the API key in the appropriate field.

![Paste the API key in the appropriate field](/blog/assets/posts/oopspam-api-key.png "Paste the API key in the appropriate field")

**Step 3: Enable Kadence Protection**

Scroll to the **Kadence Forms** section and toggle on spam protection.

![Enable Kadence Protection](/blog/assets/posts/activate-kadence-form.png "Enable Kadence Protection")

**Step 4: Block or Allow Countries**

In the **Country Filtering** section:

* Choose whether to **block specific countries** or **allow only selected countries**
* Select your target regions and save changes

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Your forms will now be protected automatically, no manual adjustments needed per form.

### **Reviewing Blocked Entries**

OOPSpam gives you access to detailed submission [logs](https://help.oopspam.com/wordpress/form-entries/), allowing you to:

* View spam scores
* See timestamps and IP addresses
* Identify which country the submission came from
* Understand why it was blocked

These logs are visible in both your WordPress dashboard 

![WordPress dashboard](/blog/assets/posts/form-spam-entries-oopspam.png "WordPress dashboard")

and the OOPSpam online dashboard.

![OOPSpam online dashboard](/blog/assets/posts/screenshot-1.png "OOPSpam online dashboard")

## **2. Block Countries Entirely Using Cloudflare**

If you're seeing issues beyond form spam, like [DDoS attacks](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/), brute-force login attempts, or scraper bots, you may want to block entire countries from accessing your website.

This method is handled via your CDN or hosting firewall, such as [Cloudflare](https://www.cloudflare.com/).

> This blocks all traffic from selected countries, not just form submissions.

### **How to Block Countries with Cloudflare**

![How to Block Countries with Cloudflare](/blog/assets/posts/blocking-countries-in-cloudflare.png "How to Block Countries with Cloudflare")

**Step 1: Log In to Cloudflare**

Visit [Cloudflare.com](https://dash.cloudflare.com/login), log in, and select your domain.

**Step 2: Create a Firewall Rule**

1. Navigate to **Security > WAF > Firewall Rules**
2. Click **Create Firewall Rule**
3. Name your rule (e.g., “Block Countries”)
4. Set these conditions:

   * **Field:** Country
   * **Operator:** is in
   * **Value:** Select the countries you want to block
5. Action: **Block**
6. Save the rule

Once saved, users from the [blocked countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) will be fully restricted from accessing any part of your site, including Kadence Forms.

### **When to Use This Method**

* You’re under attack from a specific region
* You need to comply with regional restrictions
* You want to reduce server load from low-quality traffic sources

## **What’s the Best Way to Block Countries in Kadence Forms?**

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
      <td>Kadence Forms Built-In</td>
      <td>Not Available</td>
      <td>No native functionality for country filtering</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions</td>
      <td>Preventing unwanted entries while preserving access</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website</td>
      <td>Blocking site-wide access from specific countries</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

Kadence Forms don’t have a built-in way to block countries. OOPSpam Anti-Spam fills the gap by offering advanced spam filtering, country and language blocking, and detailed logs, all without altering your forms. 

For broader protection, Cloudflare lets you block entire regions from reaching your site altogether. Together, they give you the flexibility to filter traffic and protect your forms from abuse, without sacrificing legitimate engagement.

Need help getting started? Check out the OOPSpam [documentation](https://www.oopspam.com/help) or [contact the team](https://www.oopspam.com/#contact) for setup support.
