---
layout: post
title: How to block countries in SureCart?
date: 2025-07-11T10:04:00.000Z
author: chazie
image: /blog/assets/posts/header_surecart.jpg
description: Block countries in SureCart using shipping zones, conditional
  blocks, OOPSpam for advanced spam filtering, or Cloudflare for full-site
  protection by region.
tags:
  - SureCart
  - Cloudflare
---
![SureCart](/blog/assets/posts/surecart-homepage.png "SureCart")

Spam orders and fraudulent submissions from certain regions can impact revenue, disrupt operations, and create unnecessary admin work. Fortunately, if you're using SureCart, you have several [ways to block or restrict orders](https://www.oopspam.com/blog/5-ways-to-stop-fake-orders-in-surecart) and form submissions based on the user's country.

This guide explains:

* How to block countries using SureCart's built-in tools
* How to enhance protection using the OOPSpam Anti-Spam plugin
* How to block entire countries at the DNS level using Cloudflare

## **1. Blocking Countries Using SureCart's Built-In Features**

[SureCart](https://surecart.com/) can restrict countries using either the Shipping Zones settings or Conditional Blocks on checkout forms.

Here are your options:

### **Restricting Purchases via Shipping Zones** 

You can stop customers from completing a purchase if their country isn't included in your shipping setup.

To do this:

Head to **SureCart > Settings > Shipping**. Choose an existing shipping zone or create a new one. Then, set the countries that are eligible for shipping in that zone. Any customer from a country outside these zones won't be able to proceed with checkout.

![SureCart Restricting Purchases via Shipping Zones ](/blog/assets/posts/surecart-restricting-purchases-via-shipping-zones.webp "SureCart Restricting Purchases via Shipping Zones ")

This is ideal for blocking orders from unsupported or high-risk countries.

### **Using Conditional Blocks in Checkout Forms** 

You can use conditional logic to show or hide parts of your checkout form depending on the customer's location.

Open **SureCart > Checkout Forms**, then select the form you want to edit. Add a Conditional block to the form. In the configuration panel, set the condition to look at the **Shipping Country**. Choose the countries you want to include or exclude.

![SureCart Using Conditional Blocks in Checkout Forms ](/blog/assets/posts/surecart-using-conditional-blocks-in-checkout-forms.webp "SureCart Using Conditional Blocks in Checkout Forms ")

You can now display a custom message, hide payment options, or even block checkout entirely based on the customer's location. This is useful if you only want to restrict access to specific payment gateways or discounts for certain regions.

## **2. Advanced Country Blocking in SureCart Using OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

If you're facing bot attacks, spam orders, or automated abuse from specific regions, the **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** plugin is a robust option.

**[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) integrates with SureCart to help filter out unwanted form submissions and purchases before they reach your inbox or payment processor.

### **What OOPSpam Adds to SureCart**

* **Country Filtering**: Block or allow submissions based on the user's country.
* **Language Filtering**: Reject messages written in specific languages.
* **Block VPNs, Proxies, Tor, and Bots**: Detect and stop abuse from anonymized or server-based sources.
* **Submission Logs**: Review blocked and accepted entries to understand what was filtered and why.

### **How to Set It Up**

Install the **OOPSpam Anti-Spam** plugin from your WordPress dashboard. Once active, go to **OOPSpam Anti-Spam > Settings**.

![OOPSpam API key](/blog/assets/posts/oopspam-api-key.png "OOPSpam API key")

Paste your **API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register) to activate protection. 

![OOPSpam account dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account dashbaord")

Then, scroll to the **Country Filtering section** and choose the countries you want to block or allow.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Next, **Activate Spam Protection** by switching the toggle to the "**on**" position.

![SureCart Activate Spam Protection](/blog/assets/posts/surecart-active-spam-protection.png "SureCart Activate Spam Protection")

Once saved, OOPSpam will filter submissions in the background, blocking unwanted entries while keeping the rest of your website accessible.

### **Monitoring and Logs**

Unlike SureCart's built-in shipping or form controls, OOPSpam offers [detailed logs](https://help.oopspam.com/wordpress/form-entries/) for each blocked or accepted submission. Each entry includes:

* [Country](https://www.oopspam.com/blog/filter-spam-by-country) and IP address
* Spam score
* Language detected
* Reason for blocking

In your [WordPress](https://www.oopspam.com/wordpress) admin panel, you’ll find sections for **Form Spam Entries** (blocked) and **Form Ham Entries** (clean).

Over in your OOPSpam dashboard, you’ll see detailed logs that include submission content, IP address, spam score, timestamp, and other useful data.

Here’s an example of what the log view looks like in your OOPSpam account:

![Monitoring and Logs](/blog/assets/posts/screenshot-1.png "Monitoring and Logs")

You can analyze these logs to identify trends or fine-tune your settings further.

## **3. Blocking Countries Entirely Using Cloudflare**

If your goal is to prevent access to your entire website from [specific countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) not just SureCart checkouts—Cloudflare can help.

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Cloudflare's Web Application Firewall ([WAF](https://www.cloudflare.com/lp/ppc/waf-x/)) lets you block website visitors based on their country.

Here’s how: Log into your **[Cloudflare dashboard](https://dash.cloudflare.com/)** and select your website. Go to the **Security** section and open the **WAF** tab. Click on **Firewall Rules**.

**Create a new rule.** Give it a name (like "Block Countries"). Set the field to **`Country`**, operator to **`is in`**, and then choose the countries to block. Set the action to **`Block`**, save the rule, and deploy.

![Cloudflare WAF](/blog/assets/posts/blocking-countries-in-cloudflare.png "Cloudflare WAF")

This blocks all requests from those countries, including visits to your homepage, blog, and product pages.

## **When to Use Each Method**

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
      <td>SureCart Shipping Zones & Conditional Blocks</td>
      <td>Checkout form elements or orders</td>
      <td>Regional sales restrictions or legal compliance</td>
    </tr>
    <tr>
      <td>OOPSpam Anti-Spam</td>
      <td>Form submissions & orders</td>
      <td>Spam filtering, language or IP blocking</td>
    </tr>
    <tr>
      <td>Cloudflare WAF</td>
      <td>Entire website access</td>
      <td>DDoS protection or full country bans</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

SureCart gives you flexible tools to restrict purchases based on country, but it doesn't filter out spam or bot activity. For a deeper layer of protection, OOPSpam integrates directly with SureCart and can block spammy or suspicious entries based on location, [rate limiting](https://www.oopspam.com/blog/how-to-rate-limit-orders-in-surecart), [IP filtering](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-surecart-forms), language, and more.

If you're dealing with targeted abuse or bot attacks, consider adding OOPSpam and optionally Cloudflare rules for broader security.
