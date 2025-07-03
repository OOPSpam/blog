---
layout: post
title: How to block countries in SureForms?
date: 2025-07-01T02:18:00.000Z
author: chazie
image: /blog/assets/posts/sureforms-block-countries.jpg
description: Learn how to block countries in SureForms using OOPSpam for
  advanced spam control or Cloudflare for full site protection.
tags:
  - SureForms
  - Cloudflare
---
![SureForms homepage](/blog/assets/posts/sureforms-ai-form-builder.png "SureForms homepage")

Are you getting spam or suspicious submissions from certain countries through your SureForms? While [SureForms](https://sureforms.com/) doesn't offer built-in geolocation blocking, you can still protect your forms by using smarter tools and external services.

This guide outlines two effective ways to block form submissions by country—using OOPSpam for advanced filtering, applying Cloudflare firewall rules for site-wide access control, and clarifying what SureForms actually offers and what it doesn’t.

## **Can You Block Countries in SureForms Directly?**

Short answer: **No.**

Even in the Pro (Premium) version, SureForms does not offer country-based blocking or IP filtering. There is no setting to allow or deny submissions based on geolocation.

### **What SureForms Does Offer:**

* Automatic country code detection for phone number fields — adjusts input format based on the user's location.
* Premium fields like file uploads, date pickers, sliders, and signatures.

However, these are form enhancements — not security or anti-spam tools.

### **What It Does *Not* Offer:**

* No geolocation-based blocking
* No IP filtering

To stop regional [spam in SureForms](https://www.oopspam.com/blog/5-ways-to-stop-spam-on-sureforms), you’ll need an advanced tool like **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋).

## **1. Block Countries in SureForms Using OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

OOPSpam works alongside SureForms to offer intelligent, real-time spam filtering, including country-based blocking and much more.

### **Why Use OOPSpam?**

* **Country Filtering**: Block or allow submissions from specific countries.
* **Machine Learning-Powered Spam Detection**: Uses behavior patterns and machine learning—not just static filters.
* **Detailed Logs**: Review every blocked submission.
* **Advanced Filtering**: Catch rotating IPs, bots using VPNs, suspicious email domains, and abusive patterns.
* **No Code Needed**: Easy plugin setup, works directly with SureForms.

### **How to Set Up OOPSpam with SureForms**

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Start by installing the **[OOPSpam Anti-Spam plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** from the WordPress Plugin Directory. Once it’s activated, head to your **WordPress dashboard** and open the **OOPSpam Anti-Spam settings**.

![Paste in your OOPSpam API key](/blog/assets/posts/my-api-key-field.png "Paste in your OOPSpam API key")

Paste in your **OOPSpam API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register). 

![SureForms activate spam protection](/blog/assets/posts/activate-sureforms.png "SureForms activate spam protection")

Then, activate spam protection by **toggling it on**.

![Country Filtering](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Scroll down to the **Country Filtering** section. You can either **block certain countries** or **allow only** the ones you select. Choose the countries from the dropdown and save your changes.

That’s it! From now on, submissions to your SureForms will be filtered using your chosen country restrictions without affecting the rest of your website.

### **Review Blocked Submissions**

One of the biggest advantages of using OOPSpam is transparency. You can see:

* Which countries are being blocked.
* The reason a submission was flagged.
* Whether it’s worth reaching out manually (for example, if a legitimate user was mistakenly blocked).

This visibility helps you strike a balance between protection and accessibility—especially if you run a global website but want to minimize spam from certain regions.

## **2. Block Countries from Accessing Your Entire Site with Cloudflare**

If your issue isn’t limited to form spam, and you want to block all access to your site from certain countries—Cloudflare’s Web Application Firewall ([WAF](https://www.cloudflare.com/lp/ppc/waf-x/)) is a solution. It stops users from ever reaching your site based on their country of origin.

⚠️ **Note:** This blocks the entire website, not just your SureForms submissions.

### **How to Set Up Country Blocking in Cloudflare**

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Log into your [Cloudflare dashboard ](https://dash.cloudflare.com/)and select the website you want to protect. 

![Cloudflare dashboard](/blog/assets/posts/blocking-countries-in-cloudflare.png "Cloudflare dashboard")

1. Go to the **Security** tab and open the **WAF** (Web Application Firewall) section.
2. Find the **Rules** **list** and click to **create a new firewall rule**. Give your rule a clear name—for example, “Block Specific Countries.”
3. Next, set the condition. Choose Country as the field, is in as the operator, and then select the countries you want to block from the list.
4. For the action, select **Block**. Once everything is set, save and deploy the rule.

Requests from those countries will now be denied before they ever reach your WordPress site—including your SureForms.

For a step-by-step guide on setting up country-level blocks with Cloudflare, check out our article: [Blocking Countries from Accessing Your Website Using Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare)

### **When to Use This**

* You're receiving malicious traffic or [DDoS attempts](https://en.wikipedia.org/wiki/Denial-of-service_attack) from specific regions.
* You have compliance requirements restricting site access.
* You're okay with losing access for all visitors from those countries.

> This method is [overkill for basic form spam](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) and may block legitimate users—use Cloudflare only when broader restriction is absolutely necessary.

## **Which Method Should You Choose?**

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
  td:first-child u {
    font-weight: bold;
  }
</style>

<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>What It Blocks</th>
      <th>Logging</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><u>SureForms<br>(native)</u></td>
      <td>Not Available</td>
      <td>N/A</td>
      <td>N/A — does not offer country blocking</td>
    </tr>
    <tr>
      <td><u>OOPSpam Plugin</u></td>
      <td>Form submissions only</td>
      <td>Yes</td>
      <td>Advanced spam protection, logs, flexible rules</td>
    </tr>
    <tr>
      <td><u>Cloudflare WAF</u></td>
      <td>Entire website</td>
      <td>No</td>
      <td>Full country bans for security or compliance needs</td>
    </tr>
  </tbody>
</table>

**Recommended Option:**

Use OOPSpam for most cases. It provides country filtering, rate limiting, spam pattern detection, and submission logging without restricting general access to your site. It’s ideal for forms created with SureForms and other builders.

## **Final thoughts**

While SureForms lacks native country blocking, you can still regain control over your forms by integrating with OOPSpam. It’s a reliable, more flexible approach than basic [IP filtering](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-sureforms) and doesn’t compromise your website’s accessibility.

* Want to block only form spam? Use OOPSpam.
* Want to block entire regions from visiting your site? Use Cloudflare.

Start with form-level protection using SureForms and OOPSpam. Monitor the results. Then scale up to stricter solutions like Cloudflare if necessary.
