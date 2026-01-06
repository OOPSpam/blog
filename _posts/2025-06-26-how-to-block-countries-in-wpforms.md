---
layout: post
title: How to block countries in WPForms?
date: 2025-06-26T01:30:00.000Z
author: chazie
image: /blog/assets/posts/wpforms-blockcontries.jpg
description: Learn how to block countries in WPForms using the built-in country
  filter, OOPSpam for WordPress, or Cloudflare DNS rules.
tags:
  - Cloudflare
  - WPForms
---
![WPForms homepage](/blog/assets/posts/wpforms-home.png "WPForms homepage")

If you're dealing with spam or form abuse from specific regions, blocking countries in [WPForms](https://wpforms.com/) is a practical step. There are several ways to do this, depending on how strict you want the block to be and whether you still want access to visitor data. Below, I’ll walk you through three methods: WPForms’ built-in feature, OOPSpam for more intelligent and flexible filtering, and [DNS-level blocking via Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare).

## **1. Using WPForms Built-in Country Filter**

WPForms Pro includes a built-in feature to filter form submissions by country. It uses IP geolocation to detect where the submission is coming from. This is the most direct method for blocking countries at the form level. No extra plugins or services are needed.

### **How to Enable Country Blocking in WPForms**

You’ll find the country filter setting within the **Spam Protection & Security** section of the form builder.

To enable it, open your form in the [WPForms builder](https://www.oopspam.com/blog/spam-protection-for-wpforms). Then go to **Settings** and select **Security and Spam Protection**.

![Enable Country Blocking in WPForms](/blog/assets/posts/country_filter.png "Enable Country Blocking in WPForms")

1. Toggle on **Enable Country Filter**. A new set of dropdowns will appear below it.
2. Choose whether to **Allow** or **Deny** entries from selected countries.
3. Use the second dropdown to select the countries.
4. Set a custom message in the **Country Filter Message** box for blocked users.

### **What This Does**

It blocks form submissions based on IP geolocation. If someone from a blocked country tries to submit, the form will not go through. It does not block access to the website. Visitors can still browse your site.

### **Limitations**

IP-based blocking can be bypassed using VPNs. This feature also doesn’t keep logs of blocked attempts.

## **2. Blocking Countries in WPForms Using OOPSpam**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

If you need a more intelligent solution that offers logging, pattern detection, and flexible control beyond static country lists, **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) is a strong alternative. It's especially useful if your forms are getting spammed from rotating IPs, VPNs, or legitimate-looking sources.

### **Why use OOPSpam instead of relying only on WPForms?**

* **Real-time filtering:** Uses machine learning and updated IP/email reputation databases.
* **Country filtering:** Lets you allow or block submissions by country.
* **Logging:** Keeps logs of blocked entries—so you can review leads from blocked countries.
* **Abuse detection:** Flags bot-like behavior and suspicious patterns.

## **How to Block Countries in WPForms Using OOPSpam**

Install and activate the **OOPSpam WordPress plugin** from the plugin directory. 

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Then go to **OOPSpam Anti-Spam > Settings** in your dashboard. Paste your **OOPSpam API key** from your [OOPSpam account](https://app.oopspam.com/Identity/Account/Register). 

![Paste your OOPSpam API key](/blog/assets/posts/my-api-key-field.png "Paste your OOPSpam API key")

Toggle on **Activate Spam Protection** and configure any additional settings, such as sensitivity or keyword filtering, based on your needs.

![WPForms Activate Spam Protection](/blog/assets/posts/wpforms_activate-spam-protection.png "WPForms Activate Spam Protection")

Scroll to the **Country Filtering** section. Choose whether to **allow only selected countries** or **block specific ones**. Select countries from the dropdown list and save your settings.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

That’s it! Your [WPForms](https://www.oopspam.com/blog/wpforms-block-user) will now block submissions from the countries you selected.

### **Review Blocked Submissions**

One major advantage of using **[OOPSpam](https://www.oopspam.com/)** is the ability to review blocked entries. This is helpful if you want your forms open globally but still need to catch abuse. You can even choose to manually reach out if a legitimate lead was filtered.

## **3. Blocking Countries at the DNS Level Using Cloudflare**

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

If you want to prevent users from specific countries from accessing your entire site, Cloudflare provides a DNS-level solution through its Web Application Firewall ([WAF](https://developers.cloudflare.com/waf/)). This method restricts access based on the visitor's IP location, and it's ideal for broad security and compliance requirements.

> **Note:** [DNS-level blocking](https://en.wikipedia.org/wiki/DNS_blocking) means your entire site will be inaccessible to users in those countries—not just form submissions.

### **How to Block Countries in Cloudflare**

Log in to your [Cloudflare dashboard](https://dash.cloudflare.com/). Choose your site and go to **Security > Security rules**. Under Security rules, create a new rule. 

![How to Block Countries in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "How to Block Countries in Cloudflare")

1. **Name Your Rule**: Use something like "Block Countries" for easy identification.
2. **Set the Field** to **`Country`**, and choose **`is in`** from the operator dropdown.
3. **Select the Countries** to block using the dropdown menu. Add multiple countries by clicking **OR** and adding additional entries.
4. Set the **Action** to **`Block`**.
5. Click **Save** to apply your rule.

If you want detailed guidance on setting up Cloudflare-level blocks, see our related article: [Blocking Countries from Accessing Your Website Using Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare)

This setup blocks requests before they ever reach your WordPress environment, which can be useful for sites with strict region-based access policies.

> If your goal is just to stop spam submissions, this might be too strict. Use [Cloudflare only when necessary](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them).

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
      <td>WPForms Built-In</td>
      <td>Form submissions only</td>
      <td>No</td>
      <td>Basic regional spam control</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions only</td>
      <td>Yes</td>
      <td>Advanced filtering, logging, and abuse protection</td>
    </tr>
    <tr>
      <td>Cloudflare</td>
      <td>Entire website</td>
      <td>No</td>
      <td>Total site restriction by country</td>
    </tr>
  </tbody>
</table>

Use OOPSpam for most use cases. It provides country filtering, [rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wpforms), IP filtering, logging, and spam behavior detection without blocking access to your site. WPForms’ built-in filter is helpful for quick setup, while Cloudflare is ideal if you need full restriction.

## **Final thoughts**

There’s no one-size-fits-all solution to country blocking in WPForms. 

If you want a basic filter, WPForms Pro offers a good start. If you need more accurate and flexible filtering, OOPSpam provides a better long-term setup. It gives you country filtering, machine learning-backed spam detection, and logs in one plugin. Cloudflare is best for fully blocking traffic from certain regions, but use it carefully to avoid blocking legitimate users.

Start with form-level blocking and monitor the results. Then scale up protection based on the type of abuse you’re facing.

Need help setting this up or want to block countries in other form builders? OOPSpam supports Fluent Forms, Contact Form 7, Elementor Forms, and more.
