---
layout: post
title: How to block countries in Formidable Forms?
date: 2025-07-25T09:51:00.000+08:00
author: chazie
image: /blog/assets/posts/headr_formidableforms.jpg
description: Formidable Forms lacks country blocking, use OOPSpam for advanced
  filtering or pair with Cloudflare to block full site access from specific
  regions.
tags:
  - Formidable Forms
  - Cloudflare
---
![Formidable Forms](/blog/assets/posts/formidable-forms-home.png "Formidable Forms")

[Formidable Forms](https://formidableforms.com/) doesn’t offer a built-in way to block submissions by country, but you still have effective options to prevent unwanted entries.

This guide walks you through two ways to block countries:

* Using the **[OOPSpam Anti-Spam plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** for precise, form-level filtering
* Blocking entire countries with Cloudflare firewall rules

We’ll also show how Formidable Locations Add-On can help build location-specific fields, but note, it won’t block submissions on its own.

## **1. Block Countries in Formidable Forms Using OOPSpam**

![OOPSpam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam plugin")

If you’re dealing with spammy entries from specific regions, the easiest and most effective solution is to integrate your Formidable forms with **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋).

OOPSpam is a machine learning powered anti-spam plugin that adds advanced filtering, country-level controls, and detailed logging—all without affecting your site speed or user experience.

### **Does Formidable Have Built-In Country Blocking?**

![Formidable Locations add-on ](/blog/assets/posts/cascading-locations_settings.png "Formidable Locations add-on ")

No. Formidable Forms does not currently offer a native feature to block form submissions by country or IP address. That’s why using OOPSpam is the go-to solution if you want to restrict submissions from specific regions.

However, Formidable does have a Locations add-on that allows users to select a country, state, or city via dropdowns. This can guide users and create conditional logic, but doesn’t prevent submission from unwanted locations.

### **What OOPSpam Adds to Formidable Forms**

When you pair Formidable with OOPSpam, you unlock:

* **Country filtering** – Block or allow specific countries
* **Language filtering** – Exclude submissions written in unwanted languages
* **Rate limiting** – Prevent abuse by controlling [how often forms can be submitted](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)
* **Spam score evaluation** – Machine learning-based detection to catch suspicious activity
* **Block bots, proxies, TOR, VPNs** – Filter automated traffic
* **Detailed logging** – View blocked vs allowed entries with timestamps, IPs, and spam scores

### **How to Set It Up**

Here’s how to connect OOPSpam to your Formidable Forms setup:

**Step 1: Install the Plugin**

From your WordPress dashboard, go to **Plugins > Add New**.  Search for **OOPSpam Anti-Spam**, install, and activate it.

**Step 2: Add Your API Key**

Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Register) and generate your API key.

![OOPSpam dashboard showing API usage, response time, and API key, with options to test data and view logs, along with navigation menu on the left.](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Back in WordPress, go to **OOPSpam Anti-Spam > Settings** and paste the key.

![Paste the API key](/blog/assets/posts/oopspam-api-key.png "Paste the API key")

**Step 3: Enable Protection for Formidable**

Scroll to the “Formidable Forms” section and toggle on the spam protection.

![Enable Protection for Formidable](/blog/assets/posts/formidable-forms-spam-protection-update.png "Enable Protection for Formidable")

This will route all your Formidable form entries through OOPSpam’s spam detection system.

**Step 4: Block or Allow Countries**

Find the **Country Filtering** settings:

* **Option 1:** Allow submissions only from selected countries
* **Option 2:** Block submissions from selected countries

![Country Filtering settings](/blog/assets/posts/country-filtering-settings.png "Country Filtering")

Choose your preferred method, select countries, and save.

Done. OOPSpam will now [block submissions](https://www.oopspam.com/blog/spam-protection-for-formidable) from those regions without blocking visitors from browsing your site.

### **Bonus: Use Formidable’s Cascading Locations Add-On**

Want to let users self-select their country, state, or city in a form? Try the Formidable [Locations Add-On](https://formidableforms.com/knowledgebase/formidable-locations/) (Plus plan or higher). While it doesn’t block spam, it improves accuracy and user flow.

![Use Formidable’s Cascading Locations Add-On](/blog/assets/posts/cascading-locations.gif "Use Formidable’s Cascading Locations Add-On")

You can:

* Let users select their country
* Show states or provinces based on their selection
* Drill down to counties or cities, especially for U.S.-based forms

> This is ideal for lead segmentation, shipping details, or showing localized fields. But again, it’s a user-facing tool, **not a security or blocking feature**.

### **Reviewing Blocked Entries**

With OOPSpam, you’re not guessing what was blocked. You can view:

* IP address
* Submission content
* Timestamp
* Spam score and detection reason
* Email address (if submitted)

[OOPSpam logs](https://help.oopspam.com/wordpress/form-entries/) are viewable in:

**1. Form Spam Entries / Form Ham Entries** (inside WordPress Dashboard)

![Form Spam Entries / Form Ham Entries (inside WordPress Dashboard)](/blog/assets/posts/form-spam-entries-oopspam.png "Form Spam Entries / Form Ham Entries (inside WordPress Dashboard)")

**2. OOPSpam Dashboard** (online portal with advanced logs)

![OOPSpam Dashboard (online portal with advanced logs)](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard (online portal with advanced logs)")

This visibility helps you fine-tune filters, recover false positives, and improve spam protection over time.

## **2. Block Entire Countries Using Cloudflare**

If you're facing larger issues like scraping, DDoS attacks, or malicious bot traffic from specific countries, then you may want to [block entire countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) from accessing your site.

![Cloudflare](/blog/assets/posts/cloudflare-homepage.png "Cloudflare")

Cloudflare's Web Application Firewall ([WAF](https://www.cloudflare.com/application-services/products/waf/)) allows this.

> ⚠️ **Warning:** This method blocks all access from selected countries, not just form submissions.

### **How to Block Countries in Cloudflare**

![How to Block Countries in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "How to Block Countries in Cloudflare")

**Step 1: Log Into Cloudflare**

Go to [Cloudflare.com](https://dash.cloudflare.com/login), sign in, and choose the domain hosting your site.

**Step 2: Create a security rule**

1. Go to **Security > Security rules**
2. Click **Create rule**
3. Name your rule something like "Block Countries"
4. Set conditions:
5. * **Field:** **`Country`**

   * **Operator:** **`is in`**

   * **Value:** Select countries you want to block
6. Choose action: **`Block`**
7. Save and deploy

Visitors from the selected regions will now be blocked entirely from your site.

For most users, though, form-level blocking (via OOPSpam) is enough and won’t affect real users browsing your website.

## **Final thoughts**

[Formidable Forms](https://www.oopspam.com/blog/spam-protection-for-forminator) doesn’t include built-in country-blocking, but that doesn’t mean you’re stuck. With OOPSpam, you can block form submissions from unwanted countries, reduce spam, and monitor entries with full transparency.

OOPSpam works with many other form builders too, including [Forminator](https://www.oopspam.com/blog/how-to-block-countries-in-forminator), [Breakdance Forms](https://www.oopspam.com/blog/how-to-block-countries-in-breakdance-forms), [WS Form](https://www.oopspam.com/blog/how-to-block-countries-in-ws-form), [Jetpack Forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetpack-forms), and [more](https://wordpress.org/plugins/oopspam-anti-spam/#:~:text=Supported%20form%20%26%20comment%20solutions%3A).
