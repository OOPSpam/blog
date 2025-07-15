---
layout: post
title: How to block countries in WS Form?
date: 2025-07-15T10:42:00.000+08:00
author: chazie
image: /blog/assets/posts/header_wsform.jpg
description: WS Form can’t block countries by default, but OOPSpam adds advanced
  filtering and logs. Use IP blocklists or Cloudflare for broader spam and
  traffic control.
tags:
  - WS Form
  - Cloudflare
---
![WS Form](/blog/assets/posts/ws-form-pro.png "WS Form")

Spam entries from certain countries can quickly overwhelm your forms and lead to wasted time, fake leads, or even malicious attacks. If you're using [WS Form](https://wsform.com/), there are two main ways to restrict form submissions by location: using WS Form's built-in IP Blocklist feature and integrating the OOPSpam Anti-Spam plugin for advanced country-level filtering. Here's how each method works.

## **Does WS Form Have Built-In Country Blocking?**

WS Form doesn't include a direct country-blocking feature out of the box. However, it does allow you to block specific IP addresses using its IP Blocklist. This can be useful for blocking repeat offenders or known spam IPs, but isn’t ideal for wide-scale geographic restrictions like blocking entire countries.

If you're looking for true country-level control, skip to the OOPSpam section below. But if you're just trying to block a few problem IPs, here’s how to do it in WS Form:

### **How to Block IPs in WS Form**

Open your form in the WS Form editor and go to **Form Settings**. Navigate to the **Spam** tab. Enable the **IP Blocklist** setting.

![How to Block IPs in WS Form](/blog/assets/posts/wsform_ip_blocklist_enable.webp "How to Block IPs in WS Form")

You’ll see a section to add IP addresses. Click the **plus (+) icon** to add IPs one at a time. You can enter IPv4 or IPv6 addresses. Repeat this for every IP you want to block.

> **Keep in mind:** This method only blocks IPs you already know. It does not detect or block new spam sources based on geography or behavior.

## **1. Block Countries Using OOPSpam Anti-Spam Plugin**

![OOPSpam Anti-Spam Plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam Plugin")

For more comprehensive protection, the **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋)  gives you advanced [filtering options for WS Form](https://www.oopspam.com/blog/wsform-block-user), including:

* **Country Filtering**: Block or allow submissions based on the country of origin.
* **Language Filtering**: Reject submissions written in specific languages.
* **VPN, Tor, Proxy Blocking**: Automatically filter spam from anonymized or server-based sources.
* **Submission Logs**: View blocked and allowed submissions to monitor spam activity.

WS Form works seamlessly with **[OOPSpam](https://www.oopspam.com/)** once it's installed and configured.

### **How to Set Up Country Blocking in WS Form with OOPSpam**

Start by installing the **OOPSpam WordPress plugin** from the Plugin Directory. After activation, head to **OOPSpam Anti-Spam > Settings** in your dashboard. 

![Paste in your API key](/blog/assets/posts/oopspam-api-key.png "Paste in your API key")

Paste in your **API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register).

![OOPSpam account](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account")

Scroll to the **Country Filtering** section. Choose whether you want to **allow only selected countries** or **block specific ones**. Then select the countries from the dropdown menu and save your settings.

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Toggle **Activate Spam Protection** to turn it on.

![Toggle Activate Spam Protection to turn it on](/blog/assets/posts/activate-ws-form.png "Toggle Activate Spam Protection to turn it on")

That’s it! OOPSpam will now apply these [filters to your WS Form](https://www.oopspam.com/blog/spam-protection-for-wsform) submissions.

### **Why OOPSpam Works Better Than Manual Blocking**

Unlike IP-based blocklists, OOPSpam dynamically evaluates every submission using machine learning and multiple data points:

* It detects spam patterns even from rotating IPs or proxy networks.
* It maintains an internal threat database to identify abusive traffic.
* It applies language, region, and source checks in real time.

All this means you get better protection without constantly updating blocklists.

### **Monitor What’s Blocked (or Allowed)**

Within your [WordPress](https://www.oopspam.com/wordpress) admin area, you'll find two sections: **Form Spam Entries** (blocked) and **Form Ham Entries** (clean).

![Monitor What’s Blocked (or Allowed)](/blog/assets/posts/form-spam-entries-oopspam.png "Monitor What’s Blocked (or Allowed)")

Meanwhile, your OOPSpam dashboard provides in-depth logs, showing details like submission content, IP address, spam score, timestamp, and more.

Below is a preview of how the [log view](https://help.oopspam.com/wordpress/form-entries/) appears in your OOPSpam account:

![The log view appears in your OOPSpam account](/blog/assets/posts/screenshot-1.png "The log view appears in your OOPSpam account")

This visibility helps you spot patterns, fine-tune your filters, and ensure legitimate leads aren’t being rejected.

## **2. Block Countries at the Server Level with Cloudflare (Optional)**

If you're experiencing attacks or high traffic from [certain countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) across your entire website, not just on forms—[Cloudflare](https://www.cloudflare.com/) offers DNS-level country blocking.

![Cloudflare ](/blog/assets/posts/cloudflare-homepage.png "Cloudflare ")

This method prevents visitors from even loading your website based on their IP geolocation.

![Log into your Cloudflare account](/blog/assets/posts/blocking-countries-in-cloudflare.png "Log into your Cloudflare account")

To do this:

* Log into your [Cloudflare account](https://dash.cloudflare.com/).
* Choose your website and go to **Security > WAF**.
* Create a new **Firewall Rule**.
* Set the **Field** to "Country," the **Operator** to "is in," and select the countries you want to block.
* Set the **Action** to "Block," then save and deploy the rule.

> Cloudflare's country blocks affect your entire website. If you're only targeting form spam, stick with OOPSpam.

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
  .underline {
    text-decoration: underline;
  }
</style>

<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Blocks</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>WS Form IP <span class="underline">Blocklist</span></td>
      <td>Individual IP addresses</td>
      <td>Blocking known spam IPs manually</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions by region</td>
      <td>Advanced filtering, full control, and visibility</td>
    </tr>
    <tr>
      <td>Cloudflare <span class="underline">WAF</span></td>
      <td>Entire website by country</td>
      <td>Site-wide blocks for legal, compliance, or attack mitigation</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

While [WS Form](https://www.oopspam.com/integrations/spam-protection-for-ws-form) doesn't natively support country-based restrictions, pairing it with **OOPSpam Anti-Spam** gives you tools to filter spam by region, language, [rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-ws-form), [IP filtering](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-ws-form), and behavior.

Use the IP Blocklist if you already know which IPs you want to block. For automated filtering that actually keeps spam out without blocking legitimate users, OOPSpam is the way to go.

And if you need to block access to your entire site from specific regions, Cloudflare can add that extra layer of protection.
