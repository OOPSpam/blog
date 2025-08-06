---
layout: post
title: How to block countries in Elementor Forms?
date: 2025-08-05T21:06:00.000+08:00
author: chazie
image: /blog/assets/posts/header_elementor.jpg
description: Elementor Forms lack native country blocking, use OOPSpam for
  advanced form filtering or apply site-wide blocks with Elementor Hosting or
  Cloudflare.
tags:
  - Elementor Forms
  - Elementor Hosting
  - Cloudflare
---
![Elementor Forms](/blog/assets/posts/elementor-website-builder.png "Elementor Forms")

Getting spam or unwanted traffic from specific countries? If you're using [Elementor Forms](https://elementor.com/pages/form-builder/), there are two ways to block form submissions based on visitor location, even though Elementor doesn’t offer built-in geoblocking on its forms alone. In this guide, we’ll walk you through both:

* Blocking form spam using OOPSpam Anti-Spam
* Blocking entire countries using Cloudflare or Elementor Hosting’s built-in traffic controls

Let’s go through both methods step-by-step.

## **1. Block Countries in Elementor Forms Using OOPSpam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

If your Elementor forms are getting spammed, especially from certain countries, **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) is the easiest and most precise solution. It adds reliable spam filtering, country-based blocking, and [submission logs](https://help.oopspam.com/wordpress/form-entries/) without affecting your website’s accessibility.

### **Does Elementor Support Native Country Filtering?**

No, Elementor Forms do not include a built-in country or IP blocking feature. That means you’ll need an external anti-spam plugin to filter form submissions based on location.

### **Why OOPSpam Works Great With Elementor Forms**

Once **[OOPSpam](https://www.oopspam.com/)** is activated, it works in the background to scan every form submission before it reaches your inbox. You get:

* **Country Filtering** – Block or allow form entries from specific countries.
* **Language Filtering** – Exclude spam in specific languages.
* **Machine Learning-Powered Spam Detection** – Automatically detects suspicious or bot-like entries.
* **Block Proxies, VPNs & Bots** – Reduce abuse from [anonymized traffic sources](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-elementor-forms).
* **Rate Limiting** – [Limit how often](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-elementor-forms) your form can be submitted.
* **Submission Logs** – Review blocked vs. accepted entries in real time.

### **How to Set Up OOPSpam with Elementor**

#### **Step 1: Install the OOPSpam Plugin**

From your WordPress Dashboard, go to **Plugins > Add New**, search for **“OOPSpam Anti-Spam”**, then install and activate it.

![OOPSpam dashboard displaying API usage, average response time, and API key.](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

Create an account on [OOPSpam.com](https://app.oopspam.com/Identity/Account/Register) and **generate your API key**.

#### **Step 2: Connect Your API Key**

![Connect Your API Key](/blog/assets/posts/oopspam-api-key.png "Connect Your API Key")

Back in your WordPress admin, go to **OOPSpam Anti-Spam > Settings**, and **paste the API key** into the designated field.

#### **Step 3: Enable Elementor Support**

Scroll to the **Elementor Forms** section in the plugin settings and **activate spam protection**.

![Activate spam protection in Elementor Forms](/blog/assets/posts/elementor-spam-protection-settings.png "Activate spam protection in Elementor Forms")

Once activated, all Elementor Forms on your site will start [filtering submissions](https://www.oopspam.com/blog/spam-protection-for-elementor-forms) based on your OOPSpam rules.

#### **Step 4: Block Countries**

Go to the **Country Filtering** section. You’ll see two options:

* Allow submissions only from these countries
* Block submissions from these countries

![ Country Filtering section](/blog/assets/posts/country-filtering-settings.png " Country Filtering section")

Choose your preferred method and **select the countries**. Don’t forget to save.

That’s it! Spammy form entries from restricted countries will be filtered silently without [affecting your site](https://www.oopspam.com/blog/slow-elementor-website) access.

### **Review Blocked Submissions from Elementor**

With OOPSpam, you’ll always know what’s been filtered and why. You can check:

* Submission content
* IP address
* Spam score and detection reason
* Timestamp
* Email or form field values

Access this via:

* WordPress Admin > OOPSpam > Form Spam Entries / Form Ham Entries

![Form Spam Entries / Form Ham Entries](/blog/assets/posts/form-spam-entries-oopspam.png "Form Spam Entries / Form Ham Entries")

* OOPSpam Dashboard (for enhanced filtering and export)

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

This gives you clarity and control, especially helpful if you’re trying to fine-tune [Elementor forms spam filters](https://www.oopspam.com/blog/elementor-forms-block-user) or rescue false positives.

## **2. Block Entire Countries from Your Elementor Website**

If you're using [Elementor Hosting](https://elementor.com/hosting/), you also get built-in geoblocking tools at the hosting level.

![Elementor Hosting](/blog/assets/posts/elementor-hosting.png "Elementor Hosting")

> ⚠️ **Note:** This method blocks access to your entire site, not just form submissions. It’s best for broader security concerns or compliance needs.

### **How to Block Countries in Elementor Hosting** 

![How to Block Countries in Elementor Hosting ](/blog/assets/posts/click-the-pencil-icon-1-768x309.png "How to Block Countries in Elementor Hosting ")

1. Go to your **My Elementor Dashboard**
2. Hover over the website card and click **“Manage this site”**
3. In the side panel, click **“Advanced”**
4. Switch to the **Security** tab
5. Find **“Limit traffic by country”** and click the pencil ✏️ icon
6. Choose your approach:

![Choose your approach](/blog/assets/posts/choose-between-768x590.png "Choose your approach")

* Allow all countries
* Block selected countries
* Allow only selected countries

7. Use the dropdown to select countries to block or allow

![Use the dropdown to select countries to block or allow](/blog/assets/posts/click-save-1.png "Use the dropdown to select countries to block or allow")

8. Click **Save**

Blocked users will see a **403 Forbidden** message and won’t be able to access your website.

### **When to Use This Method?**

Use Elementor’s native geoblocking when:

* You’re under attack from a specific region
* You don’t serve users in certain countries (e.g., for eCommerce restrictions)
* You want to prevent access for compliance reasons

## **Alternative: Use Cloudflare Firewall Rules (Optional)**

If your site is behind [Cloudflare](https://www.cloudflare.com/), you can also block countries using its **Web Application Firewall**.

![Use Cloudflare Firewall Rules](/blog/assets/posts/blocking-countries-in-cloudflare.png "Use Cloudflare Firewall Rules")

Steps:

1. Log in to [Cloudflare.com](https://dash.cloudflare.com/login)
2. Choose your domain > go to **Security > WAF > Firewall Rules**
3. Create a new rule
4. Set **Field** = Country, **Operator** = is in, and choose the countries
5. Choose **Action** = Block
6. Save and deploy

> Just like Elementor Hosting’s tool, this blocks all traffic from those countries site-wide.

### **What’s the Best Way to Block Countries in Elementor?**

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
      <td>Elementor Native (Hosting)</td>
      <td>Entire website access</td>
      <td>Geoblocking for security or business restrictions</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions only</td>
      <td>Spam filtering and per-form country blocking</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website access</td>
      <td>Advanced use cases like scraping or DDoS protection</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

Elementor Forms don’t offer native country filtering but you’re not stuck. With OOPSpam Anti-Spam, you get advanced, form-level spam protection and region-based filtering without blocking legitimate traffic to your site.

Pair it with Elementor Hosting's built-in geoblocking or Cloudflare rules if you need stricter site-wide controls.

Need help setting this up? You can check OOPSpam’s [documentation](https://www.oopspam.com/help), or [contact our team](https://www.oopspam.com/#contact) anytime.
