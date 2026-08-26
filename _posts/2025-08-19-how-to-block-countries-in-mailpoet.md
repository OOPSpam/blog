---
layout: post
title: How to block countries in MailPoet?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/mailpoet_header.png
description: MailPoet lacks built-in country blocking, use OOPSpam to filter
  signups, segment by region with WooCommerce, or block access entirely via
  Cloudflare.
tags:
  - MailPoet
  - WooCommerce
  - Cloudflare
---
![MailPoet ](/blog/assets/posts/mailpoet-home.png "MailPoet ")

If you’re using [MailPoet](https://www.mailpoet.com/) to send emails or manage subscriptions, you might want to block signups or email delivery from certain countries. While MailPoet doesn’t offer a built-in way to do this, there are effective ways to manage it. This guide covers several methods, including plugin-based filtering, subscriber segmentation, and server-level [country blocking](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide).

### **Does MailPoet Have Built-In Country Blocking?**

Not directly. MailPoet doesn’t allow you to prevent users from certain countries from accessing subscription forms or signing up.

However, there are multiple ways to work around this limitation:

* Segment subscribers by country using WooCommerce data
* Filter form submissions using OOPSpam Anti-Spam
* Block entire countries from your site using Cloudflare firewall rules
* Combine segmentation and plugins for a more advanced setup

Let’s walk through each of these in detail.

## **1. Segment Subscribers by Country in MailPoet (WooCommerce Integration)**

![MailPoet and WooCommerce](/blog/assets/posts/woocommerce-mailpoet.png "MailPoet and WooCommerce")

If you're running [WooCommerce](https://www.mailpoet.com/woocommerce-email-marketing/) alongside MailPoet, you can segment subscribers by country using data collected at checkout or registration.

### **How It Works**

MailPoet offers country-based conditions for WooCommerce users. With this feature, you can create subscriber segments using filters like:

* "Country is"
* "Country is not"
* "Country is any of"
* "Country is none of"

By selecting “is in country”, you can segregate your customers by location. You can select from the conditions “any of” or “none of” to include or exclude countries.

This lets you:

* Target campaigns to specific countries
* Exclude subscribers from regions where your products or services aren’t available
* Refine your audience based on billing address country data

> This method filters who receives your emails, not who can submit a form. It requires WooCommerce installed and integrated with MailPoet. It also doesn’t stop subscriptions from users in those regions.*

## **2. Block Country Submissions in MailPoet Forms with OOPSpam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

If you want to prevent unwanted signups at the form level, the best way is to use a third-party plugin like [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋).

OOPSpam adds real-time spam filtering and allows you to block form submissions based on country, language, or suspicious behavior. It integrates with multiple form plugins, including MailPoet's subscription forms.

### **What OOPSpam Adds to MailPoet**

When connected, you gain:

* **Country Filtering** – Block or allow submissions based on location
* **Language Filtering** – Block form entries written in specific languages
* **Machine Learning-Powered Spam Protection** – Catch spammy patterns using machine learning
* **Proxy, VPN, and TOR Blocking** – Prevent anonymized or fake traffic
* **Rate Limiting** – [Limit](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) how often a form can be submitted
* **Submission Logs** – See what was blocked, when, and why

### **How to Set It Up**

**Step 1: Install the Plugin**

From your WordPress dashboard: Go to **Plugins > Add New**, search for **OOPSpam Anti-Spam**, then install and activate it.

**Step 2: Connect Your API Key**

Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login), generate your API key

![Generate your API key](/blog/assets/posts/oopspam-dashboard-api.png "Generate your API key")

and paste it into **OOPSpam > Settings** in WordPress.

![Paste it into OOPSpam > Settings in WordPress](/blog/assets/posts/oopspam-api-key.png "Paste it into OOPSpam > Settings in WordPress")

**Step 3: Enable Spam Protection for MailPoet**

Scroll to the **MailPoet** section in OOPSpam settings and toggle it on.

![Enable Spam Protection for MailPoet](/blog/assets/posts/enable-spam-protection-for-mailpoet.png "Enable Spam Protection for MailPoet")

**Step 4: Configure Country Rules**

Choose whether to:

* Block submissions from specific countries, or
* Allow only submissions from selected countries

![Configure Country Rules](/blog/assets/posts/country-filtering-settings.png "Configure Country Rules")

Save your settings, and OOPSpam will handle filtering at the form level.

### **Reviewing Blocked Submissions**

[OOPSpam](https://www.oopspam.com/) gives you detailed [logging](https://help.oopspam.com/wordpress/form-entries/), including:

* IP address
* Spam score
* Detection reason
* Country of origin
* Timestamp

You can monitor form activity and fine-tune your rules as needed, all from your dashboard

![OOPSpam Dashboard logs](/blog/assets/posts/form-spam-entries-oopspam.png "OOPSpam Dashboard logs")

or the OOPSpam online portal.

![OOPSpam online portal](/blog/assets/posts/screenshot-1.png "OOPSpam online portal")

## **3. Block Countries from Accessing Your Site with Cloudflare**

If you're experiencing broader abuse (e.g., fake signups, bot traffic, [scraping](https://en.wikipedia.org/wiki/Web_scraping)), a more aggressive option is to block entire countries from accessing your website using Cloudflare.

> This method stops traffic before it even hits your MailPoet forms, but it affects your entire site.

### **How to Block Countries with Cloudflare**

![Block Countries with Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Block Countries with Cloudflare")

1. Log in to[ Cloudflare](https://www.cloudflare.com) and choose your domain
2. Navigate to **Security > Security rules**
3. Click **Create rule**
4. Name it “Block Countries”
5. Set the criteria:

   * **Field**: Country
   * **Operator**: is in
   * **Value**: Select the countries to block
6. Action: **Block**
7. Save the rule

Traffic from those countries will now be blocked across your entire site, including all MailPoet forms and pages.

### **When to Use Cloudflare**

* You’re under sustained bot attacks from a region
* You must comply with legal restrictions
* You want to reduce server load from irrelevant traffic

Cloudflare doesn’t give you form-level visibility like OOPSpam, but it’s effective for broad access control.

## **4. Combine MailPoet Segmentation + Plugins for Stronger Control**

For the most control, consider combining: [OOPSpam](https://www.oopspam.com/) to prevent signups from unwanted countries and MailPoet segmentation to prevent email delivery to unwanted countries.

This dual approach allows you to:

* Block form submissions from specific countries
* Exclude certain regions from future email campaigns
* Fine-tune your targeting without sacrificing user experience

### **Important Considerations**

* IP-based blocking isn’t perfect: Users can use VPNs or proxies to mask their location
* Manual upkeep: IP and country-based lists may need regular updates
* Always test thoroughly to make sure you’re not blocking real subscribers

## **What’s the Best Method for Country Blocking in MailPoet?**

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
      <th>What It Controls</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>MailPoet Segmentation (Woo)</td>
      <td>Email audience</td>
      <td>Targeted campaigns by country</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions</td>
      <td>Blocking fake or unwanted signups</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire site access</td>
      <td>Network-level blocking and compliance</td>
    </tr>
    <tr>
      <td>Combination (OOPSpam + Segments)</td>
      <td>Both form + email delivery</td>
      <td>End-to-end control for filtering and targeting</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

MailPoet doesn’t include built-in country-blocking for subscriptions, but that doesn’t mean you’re stuck. Using OOPSpam Anti-Spam, you can block form submissions from specific countries or languages. Pair it with MailPoet’s WooCommerce segmentation and Cloudflare’s firewall for full control over who can access your forms and receive your emails.
