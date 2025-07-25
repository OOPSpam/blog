---
layout: post
title: How to block countries in Forminator?
date: 2025-07-22T11:38:00.000+08:00
author: chazie
image: /blog/assets/posts/header_forminator.jpg
description: Forminator can’t block countries by default, use OOPSpam for
  advanced form filtering or Cloudflare to block site access from specific
  regions entirely.
tags:
  - Forminator
  - Cloudflare
---
![Forminator](/blog/assets/posts/forminator-wordpress.png "Forminator")

Getting spam from certain countries? If you’re using [Forminator](https://wordpress.org/plugins/forminator/), there’s no built-in way to block submissions by country but you still have options. Here’s how to do it effectively.

### **No Built-In Country Blocking in Forminator**

Forminator does not include a native feature to block form submissions based on country or IP address. That means you’ll need an external tool to do it.

You can still achieve country-based filtering by integrating **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋), a plugin that works seamlessly with Forminator and provides real-time spam detection, country-based filtering, and detailed submission logs.

## **1. Block Countries in Forminator Forms Using OOPSpam**

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

If you’re dealing with spammy form entries, especially from specific regions, **[OOPSpam](https://www.oopspam.com/)** is the most straightforward way to stop it. It brings advanced filtering capabilities right into your WordPress dashboard and works smoothly with Forminator.

### **What OOPSpam Adds to Forminator**

Here’s what you get when you pair OOPSpam with your Forminator forms:

* **Country Filtering**: Choose specific countries to block or allow.
* **Language Filtering**: Exclude submissions written in certain languages.
* **Machine Learning-Based Spam Protection**: Automatically filters spam based on behavior and content patterns.
* **Block Proxies, VPNs, TOR, and Bot Traffic**: Stops automated or anonymized spam sources.
* **Rate limiting** – control [how often a form can be submitted](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to prevent abuse
* **Detailed Logs**: Review both blocked and accepted submissions for transparency and tuning.

### **How to Set It Up**

Follow these steps to connect [OOPSpam with Forminator](https://www.oopspam.com/integrations/spam-protection-for-formidable):

**Step 1: Install the Plugin**

Go to your WordPress dashboard and navigate to **Plugins > Add New**. Search for “**OOPSpam Anti-Spam**” plugin (that’s us 👋) and install it. Activate the plugin once installed.

**Step 2: Connect Your API Key**

Create an account on [OOPSpam.com](https://app.oopspam.com/Identity/Account/Register) and **generate your API key**.

![Generate your API key](/blog/assets/posts/oopspam-dashboard-api.png "Generate your API key")

![](<>)Then return to your WordPress dashboard and go to **OOPSpam Anti-Spam > Settings**.

![Paste your API key in the designated field.](/blog/assets/posts/oopspam-api-key.png "Paste your API key in the designated field.")

![](<>)Paste your **API key** in the designated field.

**Step 3: Enable Forminator Protection**

Scroll to the “Forminator” section and activate [spam protection for Forminator](https://www.oopspam.com/blog/spam-protection-for-formidable). This ensures all Forminator forms are now filtered using OOPSpam’s rules.

![Enable Forminator Protection](/blog/assets/posts/formidable-forms-spam-protection.png "Enable Forminator Protection")

![](<>)**Step 4: Block Countries**

Head to the **Country Filtering** section. You’ll see two dropdown options:

* Allow submissions only from these countries
* Block submissions from these countries

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

![](<>)Choose one approach, select the countries accordingly, and save your settings.

OOPSpam will now automatically block form submissions coming from those regions without blocking access to your site as a whole.

### **Reviewing Blocked Submissions in Forminator**

One of OOPSpam’s biggest advantages over traditional filtering tools is its transparency. You get a [submission log](https://help.oopspam.com/wordpress/form-entries/) that shows you exactly what was blocked and why. You’ll be able to see:

* Submission content
* IP address
* Spam score and filtering reason
* Timestamp of entry
* Email address (if submitted)

You can track which form submissions were blocked or allowed in two places:

**1. Form Spam Entries** and **Form Ham Entries** in your WordPress Dashboard — showing rejected and approved submissions.

![WordPress Dashboard ](/blog/assets/posts/form-spam-entries-oopspam.png "WordPress Dashboard ")

![](<>)**2. OOPSpam Dashboard logs** — providing more detailed information and filtering tools for a deeper review.

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

![](<>)This makes it easier to spot patterns of abuse, fine-tune your filtering over time, and manually recover legitimate leads if necessary.

## **2. Block Entire Countries from Your Website with Cloudflare**

If you’re facing broader security issues beyond just form spam such as DDoS attacks, brute-force login attempts, or scraping—then it may make sense to block countries at the network level using [Cloudflare](https://www.cloudflare.com/).

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

> ![](<>)⚠️ **Important:** This method blocks users from accessing your entire website, not just Forminator forms.

### **How to Set Up Country Blocking in Cloudflare**

To do this, you’ll need access to Cloudflare’s Web Application Firewall ([WAF](https://www.cloudflare.com/application-services/products/waf/)).

**Step 1: Log Into Cloudflare**

Head over to [cloudflare.com](https://dash.cloudflare.com/login) and log in to your account. Select the site where your Forminator forms are hosted.

**Step 2: Create a Firewall Rule**

![Cloudflare WAF](/blog/assets/posts/blocking-countries-in-cloudflare.png "Cloudflare WAF")

* ![](<>)Go to **Security > WAF > Firewall Rules**
* Click **Create Firewall Rule**
* Name it something like “Block Countries”
* Set the rule to:

  1. **Field**: `Country`
  2. **Operator**: `is in`
  3. **Value**: Select countries to block
* Choose **Action**: `Block`
* Save and deploy the rule

Visitors from the selected countries will now be completely blocked from your site.

### **When to Use This**

Use Cloudflare’s country blocking only when:

* You’re under attack from a specific region
* You need to comply with legal or regulatory restrictions
* You want to reduce server load caused by junk traffic

Otherwise, it’s best to stick to form-level filtering (via OOPSpam), which is more precise and less intrusive.

## **What’s the Best Method for Country-Based Blocking in Forminator?**

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
  .italic {
    font-style: italic;
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
      <td>Forminator Built-In</td>
      <td class="italic">Not Available</td>
      <td>Not an option, requires external solution</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions only</td>
      <td>Reliable spam protection and country filtering per form</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website access</td>
      <td>Security threats, scraping, or compliance-related blocking</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

Forminator doesn’t offer built-in country blocking, but OOPSpam fills that gap with advanced filtering, regional restrictions, and detailed logging without disrupting your site.

Pair it with Cloudflare firewall rules for broader protection when needed. And yes, OOPSpam integrates with many other form builders too, including [WS Form](https://www.oopspam.com/blog/how-to-block-countries-in-ws-form), [Breakdance Forms](https://www.oopspam.com/blog/how-to-block-countries-in-breakdance-forms), [Jetpack Forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetpack-forms), [SureForms](https://www.oopspam.com/blog/how-to-block-countries-in-sureforms), and [more](https://wordpress.org/plugins/oopspam-anti-spam/).

Need help getting started? [Reach out](https://www.oopspam.com/#contact) to our team or check the [documentation](https://www.oopspam.com/help).
