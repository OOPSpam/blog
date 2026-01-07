---
layout: post
title: How to block countries in Bricks Forms?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/headr_bricks.jpg
description: Bricks Forms lacks country blocking, but OOPSpam adds advanced
  filtering and logs. Use Cloudflare to block access from entire countries if
  needed.
tags:
  - Bricks Forms
  - Cloudflare
  - Bricks Builder
---
![Bricks Forms](/blog/assets/posts/bricks-visual-site-builder.png "Bricks Forms")

[Bricks Builder](https://bricksbuilder.io/) is known for its clean, visual interface—but when it comes to form security, you may run into limitations. If you’re using Bricks Forms and are seeing spam entries from specific countries, here’s the honest truth:

[Bricks Forms](https://bricksbuilder.io/forms/) currently does not offer built-in country-based blocking for form submissions. But don’t worry, there’s a solution that doesn’t require complex coding or server-side tweaks.

With the help of the **[OOPSpam Anti-Spam plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** or a network-level tool like Cloudflare, you can add country-level blocking and stronger spam protection to any Bricks Form on your site.

## **1. Block Countries in Bricks Forms Using OOPSpam**

If you want to stop spam submissions coming from certain countries or allow only specific regions, **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) is the easiest and most effective tool to use. It [integrates directly with Bricks Forms](https://www.oopspam.com/blog/spam-protection-for-bricks) and adds advanced filtering without requiring extra scripts or form changes.

### **Does Bricks Forms Have Built-In Country Blocking?**

No, Bricks Forms doesn’t include a native feature to block submissions by country, IP address, or language.

Unlike form plugins with tiered geo-blocking, Bricks Forms relies on third-party spam protection for this kind of functionality. Fortunately, OOPSpam fills that gap seamlessly.

### **What OOPSpam Adds to Bricks Forms**

Here’s what you unlock when using OOPSpam with Bricks Forms:

* **Country Filtering**: Block or allow specific countries
* **Language Filtering**: Restrict submissions based on detected language
* **Spam Scoring**: machine learning-powered scoring engine that learns and adapts
* **Bot and Proxy Blocking**: Automatically [stops spam via VPNs](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricks-forms), proxies, or TOR
* **Rate Limiting**: Prevents [form abuse by limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) how often someone can submit
* **Submission Logs**: Review blocked and accepted entries, with full transparency

## **How to Set It Up**

Setting up OOPSpam with Bricks Forms takes only a few minutes.

#### **Step 1: Install the OOPSpam Plugin**

From your WordPress admin, go to **Plugins > Add New**, search for **OOPSpam Anti-Spam**, then click **Install** and **Activate**.

![OOPSpam dashboard ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam ")

#### ![](<>)**Step 2: Connect Your OOPSpam API Key**

1. Visit [OOPSpam.com](https://app.oopspam.com/Identity/Account/Register)  and create an account
2. Generate your **API key**

Return to your WordPress dashboard:

![Paste your API key into the designated field](/blog/assets/posts/oopspam-api-key.png "Paste your API key into the designated field")

* ![](<>)Go to **OOPSpam Anti-Spam > Settings**
* **Paste your API key** into the designated field

#### **Step 3: Enable Bricks Forms Protection**

![Enable Bricks Forms Protection](/blog/assets/posts/activate-spam-protection-bricks-forms.png "Enable Bricks Forms Protection")

![](<>)Inside OOPSpam settings, scroll to the **Bricks Forms** section and** toggle it on**.

This will activate spam protection on all forms created with Bricks Builder.

#### **Step 4: Configure Country Filtering**

In the **Country Filtering** section, choose one of two options:

* **Allow only** submissions from selected countries
* **Block** submissions from specific countries

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

![](<>)Select the countries, save your settings, and you're done!

Form submissions from blocked regions will be rejected silently without impacting your [site's accessibility](https://www.oopspam.com/blog/slow-bricks-builder-website).

### **Reviewing Blocked Submissions in Bricks Forms**

OOPSpam doesn't just block spam blindly. It also helps you understand why a submission was blocked.

You can review:

* Submission content
* IP address
* Spam score
* Reason for rejection
* Timestamp
* Email (if included in the form)

Blocked and accepted [entries](https://help.oopspam.com/wordpress/form-entries/) are visible in two places:

* **Form Spam Entries / Ham Entries** in your WordPress admin

![Form Spam Entries / Ham Entries in your WordPress admin](/blog/assets/posts/form-spam-entries-oopspam.png "Form Spam Entries / Ham Entries in your WordPress admin")

* ![](<>)The **OOPSpam Dashboard**, for more advanced filtering and reporting

![OOPSpam Dashboard](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard")

![](<>)This level of transparency helps you fine-tune spam filters and restore legitimate entries if needed.

## **2. Block Entire Countries from Your Website with Cloudflare**

If you need heavier protection like if you’re under a [DDoS attack](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/), or want to block scraping bots, then you may consider using Cloudflare’s Web Application Firewall ([WAF](https://www.cloudflare.com/application-services/products/waf/)) to block countries at the network level.

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

> ![](<>)⚠️ **Important Note**: This method blocks users from accessing your entire site, not just Bricks form submissions.

### **How to Block Countries in Cloudflare**

![How to Block Countries in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "How to Block Countries in Cloudflare")

#### ![](<>)**Step 1: Log In to Cloudflare**

Visit [Cloudflare.com](https://dash.cloudflare.com/login), log in, and select the domain where Bricks is installed.

#### **Step 2: Create a security rule**

* Go to **Security > Security rules**
* Click **Create rule**
* Name it something like “Block Countries"
* Configure the rule:

  * **Field**: **`Country`**
  * **Operator**: **`is in`**
  * **Value**: Select countries to block
* Action: **`Block`**
* Click **Save**

That’s it. Visitors from those countries will no longer have access to any part of your website.

### **When Should You Use Cloudflare Blocking?**

Use this only when:

* You're facing targeted attacks or massive spam
* You need to comply with geo-restrictions
* You want to reduce server load from non-converting regions

In most cases, it’s best to keep your site open and apply form-level restrictions using OOPSpam instead.

## **What’s the Best Method for Country-Based Blocking in Bricks Forms?**

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
      <td>Bricks Forms Built-In</td>
      <td>Not Available</td>
      <td>Needs third-party integration for country-level rules</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions</td>
      <td>Spam control, region filtering, submission logs</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website</td>
      <td>Site-wide protection from specific countries</td>
    </tr>
  </tbody>
</table>


## **Final thoughts**

Bricks Forms doesn’t yet support native country-based blocking, but that’s not a deal-breaker.

With OOPSpam, you can instantly add country filtering, language restrictions, and advanced spam prevention to your forms. It works seamlessly and protects your site from abuse while keeping legitimate traffic flowing.

If your security needs to go beyond spam, such as blocking entire regions from viewing your content, [Cloudflare](https://www.cloudflare.com/) gives you that extra layer of protection.

OOPSpam also works with other form builders, including [Formidable Forms](https://www.oopspam.com/blog/how-to-block-countries-in-formidable-forms), [WPForms](https://www.oopspam.com/blog/how-to-block-countries-in-wpforms), [Breakdance Forms](https://www.oopspam.com/blog/how-to-block-countries-in-breakdance-forms), [SureForms](https://www.oopspam.com/blog/how-to-block-countries-in-sureforms), and [more](https://wordpress.org/plugins/oopspam-anti-spam/#:~:text=Supported%20form%20%26%20comment%20solutions%3A).

Need help setting this up? Visit OOPSpam [documentation](https://www.oopspam.com/help) or [contact our team](https://www.oopspam.com/#contact) to get started quickly.
