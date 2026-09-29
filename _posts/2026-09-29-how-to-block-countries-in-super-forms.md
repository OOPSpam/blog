---
layout: post
title: How to Block Countries in Super Forms?
date: 2026-09-29T15:42:00.000+08:00
author: chazie
image: /blog/assets/posts/blockcountriesinsuperforms.jpg
description: Super Forms has no built-in country blocking. Learn how to block
  countries with OOPSpam form-level filtering and Cloudflare site-level rules.
tags:
  - Super Forms
---
[Super Forms](https://super-forms.com/) does not list a built-in country blocking setting in its documentation. To block form submissions by country, use the OOPSpam Anti-Spam plugin, which filters Super Forms entries by country from your WordPress dashboard. To block visitors from your entire site, add a Cloudflare security rule. Combine both for layered protection. Neither method is fully accurate, because VPNs and proxies can hide a visitor's real location.

## **Method 1: Use OOPSpam for Form-Level Country Filtering**

**[OOPSpam](https://www.oopspam.com/)** checks each Super Forms submission and rejects it if it comes from a [country you block](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide). Your site stays visible to visitors worldwide. Only form submissions are filtered.

### **How to set it up**

In WordPress, go to **Plugins > Add New**, search for **OOPSpam Anti-Spam**, then install and activate it.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

Create a free account at[ oopspam.com](https://app.oopspam.com/Identity/Account/Login) and copy your API key from the dashboard.

![Create a free account at oopspam.com and copy your API key from the dashboard.](/blog/assets/posts/oopspam-dashboard-api.png "Create a free account at oopspam.com and copy your API key from the dashboard.")

Open the **OOPSpam settings** in WordPress, paste your API key in the **General** tab, and save.

![Open the OOPSpam settings in WordPress, paste your API key in the General tab, and save.](/blog/assets/posts/oopspam-api-key.png "Open the OOPSpam settings in WordPress, paste your API key in the General tab, and save.")

Find the **Super Forms** section and check **Activate Spam Protection**.

![Find the Super Forms section and check Activate Spam Protection.](/blog/assets/posts/super-forms_activate-spam-protection.png "Find the Super Forms section and check Activate Spam Protection.")

Set up **Country Filtering** and choose one approach:

![Set up Country Filtering and choose one approach](/blog/assets/posts/country-filtering-settings.png "Set up Country Filtering and choose one approach")

* **Country Allowlist:** accept submissions only from the countries you select. Everyone else is blocked.
* **Country Blocklist:** reject submissions from the countries you select.
* **Trusted Countries:** submissions from these countries skip all spam checks and override the blocklist. Use this only for your core market or internal users.

*Optional:* edit **Super Forms Spam Message** to explain the block, for example "We're unable to process submissions from your region. Please contact name@example.com."

![Super Forms Spam Message](/blog/assets/posts/super-forms-spam-message.png "Super Forms Spam Message")

Save your settings.

Test the form in an Incognito window. Then check the OOPSpam [spam and ham logs](https://help.oopspam.com/wordpress/form-entries/) to confirm what was blocked.

![OOPSpam spam and ham logs](/blog/assets/posts/logs-screenshot-2.png "OOPSpam spam and ham logs")

### **Which country setting should you use?**

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
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
      <th>Setting</th>
      <th>Use it when</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Country Blocklist</td>
      <td>Spam comes from a few known regions and you accept everyone else</td>
    </tr>
    <tr>
      <td>Country Allowlist</td>
      <td>Your customers are in a few countries and you want a strict rule</td>
    </tr>
    <tr>
      <td>Trusted Countries</td>
      <td>You want your home market to bypass all checks</td>
    </tr>
  </tbody>
</table>

### **Add more filters**

* **Language Allowlist:** accept only messages written in the languages you choose. It works best when the form has a message field. 
* **Rate limiting:** stop [repeated submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) from the same IP or email.
* **IP filtering:** block bad IPs, VPNs, and data center traffic.

## **Method 2: Block Countries at the Edge With Cloudflare**

[Cloudflare](https://www.cloudflare.com/) blocks requests by country before they reach WordPress. This blocks visitors from the whole site, not just the form. Use it for region-limited businesses or high-volume attacks.

![Method 2: Block Countries at the Edge With Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Method 2: Block Countries at the Edge With Cloudflare")

1. Log into your[ Cloudflare dashboard](https://dash.cloudflare.com/) and select your site.
2. Go to **Security > Security rules**.
3. Click **Create rule** and name it "Block Countries."
4. Set the field to **Country**, the operator to **is in**, and select the countries.
5. Set the action to **Block** and save.

### **What to Know Before You Block**

* VPNs and proxies can hide a visitor's real country, so country rules will not stop every submission.
* Country blocking alone rarely solves spam long term. Pair it with content and IP filtering.
* Blocking a country can also block real customers. Review the OOPSpam logs after setup and adjust.

## **Final thoughts**

Super Forms has no native country filter, so use an external tool. OOPSpam is the most direct option because it filters at the form level and leaves your site open. Add Cloudflare if you need a hard block across the whole site.
