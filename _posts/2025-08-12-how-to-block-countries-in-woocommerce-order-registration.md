---
layout: post
title: How to block countries in WooCommerce Order & Registration?
date: 2025-08-12T10:31:00.000+08:00
author: chazie
image: /blog/assets/posts/header_woo.png
description: WooCommerce lets you block orders by country. Use OOPSpam for added
  spam protection, or Cloudflare to block full site access from selected
  regions.
tags:
  - WooCommerce
  - Cloudflare
---
![WooCommerce](/blog/assets/posts/woocommerce-homepage.png "WooCommerce")

If you’re selling online with [WooCommerce](https://woocommerce.com/), you may need to block orders or customer registrations from certain countries. This could be for compliance, fraud prevention, or logistical reasons. WooCommerce includes built-in settings to control which countries you sell to — plus, you can use additional tools like [OOPSpam Anti-Spam](https://www.oopspam.com/) and Cloudflare for extra protection against fake registrations and spam.

Here’s how to set it up effectively.

## **Built-In Country Blocking in WooCommerce**

Unlike some form builders, WooCommerce includes native country restriction options right in its settings. You can:

* Sell to all countries
* Sell to all countries except for…
* Sell only to specific countries

These rules apply to both the checkout process and account registration. Customers outside your allowed list will not be able to complete purchases, and their countries won’t appear as options in the billing/shipping dropdowns.

## **1. Block Countries in WooCommerce Using General Settings**

If your goal is to stop receiving orders from certain countries (or only allow certain ones), WooCommerce’s “Selling location(s)” setting is the quickest way.

### **How to Set It Up**

**Step 1: Open WooCommerce General Settings**

![Open WooCommerce General Settings](/blog/assets/posts/woocommerce-general-settings.png "Open WooCommerce General Settings")

In your WordPress admin dashboard, go to:

**WooCommerce > Settings > General**

**Step 2: Choose Your Selling Locations**

![Choose Your Selling Locations](/blog/assets/posts/woocommerce-choose-your-selling-locations.png "Choose Your Selling Locations")

Find the **Selling location(s)** dropdown. You have three options:

* Sell to all countries
* Sell to all countries, except for…
* Sell to specific countries

**Step 3A: Allow Only Specific Countries**

![Allow Only Specific Countries](/blog/assets/posts/woocommerce-allow-only-specific-countries.png "Allow Only Specific Countries")

If you want to only sell to certain countries:

1. Select **Sell to specific countries**
2. In the “Sell to specific countries” field, search for and add the countries you want to allow
3. Under **Shipping location(s)**, choose **Ship to countries you sell to**

**Step 3B: Block Certain Countries**

![Block Certain Countries](/blog/assets/posts/woocommerce-block-certain-countries.png "Block Certain Countries")

If you want to sell to all except a few countries:

1. Select **Sell to all countries, except for…**
2. In the “Sell to all countries except for” field, search for and add the countries you want to block

**Step 4: Save Changes**

Click **Save changes** at the bottom of the page

**Step 5: Test Your Settings**

Go to your checkout page and confirm that only your allowed countries appear in the dropdown or that blocked countries are excluded.

### **Pros & Cons of the Built-In Method**

* Easy to set up — no extra plugins required
* Works site-wide for both orders and registrations
* Cannot block specific products by country without custom code or plugins
* Doesn’t [prevent spam](https://www.oopspam.com/woocommerce) from contact or registration forms — only checkout-related actions

## **2. Filter Orders and Registrations with OOPSpam Anti-Spam**

While WooCommerce’s built-in settings handle location-based selling rules, they don’t protect you from [spam orders](https://www.oopspam.com/blog/spam-protection-for-woocommerce), fake signups, or abusive form submissions. This is where **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) comes in.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

### **What OOPSpam Adds to WooCommerce**

* **Country Filtering** – Block or allow form and checkout submissions from specific countries
* **Language Filtering** – Stop spam written in certain languages
* **Machine Learning Spam Detection** – Identify bot and human spam automatically
* **Block Proxies, VPNs, TOR Traffic** – Reduce [anonymous abuse](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-traffic-in-your-woocommerce-shop)
* **Rate Limiting** – Control how often your [forms can be submitted](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)
* **Detailed Submission Logs** – See exactly what was blocked and why

### **How to Set Up OOPSpam with WooCommerce**

**Step 1: Install the Plugin**

From your WordPress dashboard:

Plugins > Add New > Search: OOPSpam Anti-Spam

Install and activate.

**Step 2: Get Your API Key**

Go to [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login), sign up, and copy your API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

**Step 3: Enable WooCommerce Protection**

Go to: **OOPSpam Anti-Spam > Settings** and paste your API key.

![Paste your API key](/blog/assets/posts/oopspam-api-key.png "Paste your API key")

**Step 4: Block Countries**

Under **Country Filtering**, choose one of two modes:

* Allow only selected countries
* Block selected countries

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Select the countries from the dropdown and save.

**Step 5: Enable WooCommerce Spam Protection**

If WooCommerce is installed, toggle **Activate Spam Protection** ON, add a custom spam message, and optionally enable **[Block orders from unknown origin](https://www.oopspam.com/blog/how-to-stop-failed-orders-with-unknown-origin-in-woocommerce)** and **Honeypot protection** for extra filtering.

![Enable WooCommerce Spam Protection](/blog/assets/posts/activate-woocomerce.png "Enable WooCommerce Spam Protection")

### **Reviewing Blocked Activity**

You can see [logs](https://help.oopspam.com/wordpress/form-entries/) for blocked orders or signups via:

* WordPress Dashboard → OOPSpam → Form Spam Entries / Form Ham Entries

![Form Spam Entries / Form Ham Entries](/blog/assets/posts/form-spam-entries-oopspam.png "Form Spam Entries / Form Ham Entries")

* OOPSpam.com Dashboard (with additional details)

![OOPSpam.com Dashboard](/blog/assets/posts/screenshot-1.png "OOPSpam.com Dashboard")

This transparency lets you fine-tune your rules and rescue legitimate entries if needed.

## **3. Block Entire Countries from Your WooCommerce Site with Cloudflare (Optional)**

If you’re dealing with fraud, scraping, or server attacks, you may want to block certain countries entirely using [Cloudflare’s Firewall Rules](https://developers.cloudflare.com/firewall/cf-firewall-rules/).

> ⚠️ This method blocks access to your entire site, not just [WooCommerce checkout](https://www.oopspam.com/blog/card-testing-attacks-a-new-threat-vector-through-woocommerce-block-based-checkout).

### **How to Set It Up in Cloudflare**

![Cloudflare](/blog/assets/posts/blocking-countries-in-cloudflare.png "Cloudflare")

1. Log in to[ Cloudflare.com](https://www.cloudflare.com)
2. Choose your site
3. Go to **Security > WAF > Firewall Rules**
4. Click **Create Firewall Rule**
5. Set:

   * **Field**: **`Country`**
   * **Operator**: **`is in`**
   * **Value**: Select countries to block
6. Choose **Action** = **`Block`**
7. Save and deploy

## **Which Method Should You Use?**

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
      <td>WooCommerce Built-In</td>
      <td>Orders &amp; registrations</td>
      <td>Simple selling restrictions by country</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Spammy orders &amp; registrations</td>
      <td>Extra protection against bots and targeted abuse</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website access</td>
      <td>High-security needs, legal compliance, or attack prevention</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

WooCommerce gives you native tools to control which countries can place orders, perfect for quick compliance and fraud prevention. But for advanced filtering and anti-spam protection, pairing it with OOPSpam Anti-Spam is the best approach.

If you need site-wide blocking, Cloudflare firewall rules are an option, but use them carefully to avoid blocking legitimate visitors.

Need help setting this up? You can check OOPSpam’s [documentation](https://www.oopspam.com/help) or [contact our support team](https://www.oopspam.com/#contact) for guidance.
