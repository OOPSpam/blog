---
layout: post
title: How to block countries in Ninja Forms?
date: 2025-08-26T22:13:00.000+08:00
author: chazie
image: /blog/assets/posts/ninaj_header.png
description: Ninja Forms doesn’t block countries by default, use OOPSpam for
  region-based spam filtering or Cloudflare to block full site access from
  select areas.
tags:
  - Ninja Forms
  - Cloudflare
---
![Ninja Forms](/blog/assets/posts/free-drag-drop-form-builder-for-wordpress-download-now-04-17-2025_03_10_pm.png "Ninja Forms")

If you’re using [Ninja Forms](https://ninjaforms.com/), you may have noticed there’s no built-in option to block form entries by country or IP address. That doesn’t mean you’re stuck with spam, you can still filter unwanted submissions with the right tools.

Below, I’ll walk you through two effective ways to block countries in Ninja Forms:

1. Using OOPSpam Anti-Spam for country-based form filtering
2. Using Cloudflare Firewall Rules to block entire countries from your website

### **No Built-In Country Blocking in Ninja Forms**

Ninja Forms is a powerful form builder, but it doesn’t provide native functionality for blocking submissions based on country or IP location.

That means if spam is coming from specific regions, you’ll need an external solution to handle it. The most flexible and non-intrusive method is to integrate Ninja Forms with **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋). This plugin works seamlessly with Ninja Forms, adding real-time spam detection, country and language filtering, and detailed submission logs to your WordPress dashboard.

## **1. Block Countries in Ninja Forms Using OOPSpam**

If spam entries are draining your time, OOPSpam is the easiest way to shut them down. It brings [advanced filtering tools](https://www.oopspam.com/integrations/spam-protection-for-ninjaforms) into WordPress and connects directly with Ninja Forms.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

### **What OOPSpam Adds to Ninja Forms**

When [paired with Ninja Forms](https://www.oopspam.com/anti-spam-filter-for-ninja-forms), OOPSpam gives you:

* **Country Filtering** – Block or allow submissions from selected countries
* **Language Filtering** – Stop entries written in unwanted languages
* **Machine Learning-Powered Spam Protection** – Machine learning filters spam by patterns and behavior
* **Block Proxies, VPNs, TOR, and Bots** – [Prevent submissions](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-ninja-forms) from anonymized networks
* **Rate Limiting** – Control [how many times](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-ninja-forms) a form can be submitted
* **Detailed Submission Logs** – See which entries were blocked or approved, with reasons

### **How to Set It Up**

Here’s a step-by-step guide to enable country-based blocking in Ninja Forms:

**Step 1: Install the OOPSpam Plugin**

![OOPSpam ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam ")

In your WordPress dashboard, go to **Plugins > Add New** and search for **“OOPSpam Anti-Spam”.** Install and activate the plugin.

**Step 2: Connect Your API Key**

![Connect Your API Key](/blog/assets/posts/oopspam-api-key.png "Connect Your API Key")

* Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login)
* Generate your API key
* In WordPress, go to **OOPSpam Anti-Spam > Settings**
* Paste your API key into the designated field

**Step 3: Enable Ninja Forms Protection**

![Enable Ninja Forms Protection](/blog/assets/posts/activate-ninja-forms.png "Enable Ninja Forms Protection")

Scroll to the **Ninja Forms** section in OOPSpam settings and turn on **[spam protection for Ninja Forms](https://www.oopspam.com/blog/spam-protection-for-ninja-forms)**. This ensures every form submission goes through OOPSpam’s filters.

**Step 4: Block or Allow Countries**

![Block or Allow Countries](/blog/assets/posts/country-filtering-settings.png "Block or Allow Countries")

Go to **Country Filtering** inside OOPSpam settings and choose either:

* Allow only these countries
* Block these countries

Select the countries from the dropdown list and **Save.**

Now, **[OOPSpam](https://www.oopspam.com/)** will automatically block form entries from the selected regions, without preventing visitors from browsing your site.

### **Reviewing Blocked Submissions in Ninja Forms**

One major advantage of OOPSpam is transparency. You can review exactly what was blocked and why. You’ll see:

* Submission content
* Email address (if provided)
* IP address & country
* Spam score and reason
* Timestamp

Blocked and approved [entries](https://help.oopspam.com/wordpress/form-entries/) appear in two places:

* **Ninja Forms Spam & Ham Logs** – Shows rejected vs. allowed submissions

![Ninja Forms Spam & Ham Logs](/blog/assets/posts/form-spam-entries-oopspam.png "Ninja Forms Spam & Ham Logs")

* **OOPSpam Dashboard** – Provides more detailed filtering reports for deeper analysis

![OOPSpam Dashboard logs ](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

This makes it easy to detect abuse patterns, fine-tune filters, and recover valid leads if necessary.

## **2. Block Entire Countries from Your Website with Cloudflare**

If your issue goes beyond Ninja Forms spam, like [DDoS attacks](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/), brute force logins, or scraping, then blocking at the network level may be more effective.

This is where Cloudflare’s Web Application Firewall ([WAF](https://developers.cloudflare.com/firewall/cf-firewall-rules/)) comes in.

> ⚠️ **Note:** Unlike OOPSpam, this method blocks visitors from accessing your entire website, not just Ninja Forms submissions.

### **How to Set Up Country Blocking in Cloudflare**

![Set Up Country Blocking in Cloudflare](/blog/assets/posts/blocking-countries-in-cloudflare.png "Set Up Country Blocking in Cloudflare")

**Step 1: Log Into Cloudflare**

Go to [cloudflare.com](https://dash.cloudflare.com/login) and log in. Select the site where Ninja Forms is installed.

**Step 2: Create a Firewall Rule**

* Navigate to **Security > WAF > Firewall Rules**
* Click **Create Firewall Rule**
* Name it (e.g., “Block Countries”)
* Configure the rule:
* * **Field:** Country

  * **Operator:** *is in*

  * **Value:** Select the countries to block

  * **Action:** Block
* Save and deploy

Now, visitors from those countries will be completely denied access to your site.

### **When to Use Cloudflare Blocking**

Cloudflare is best for:

* Protecting your site during region-based attacks
* Meeting legal or compliance requirements
* Reducing junk traffic that overwhelms servers

## **Final thoughts**

Ninja Forms doesn’t come with built-in country blocking. But with OOPSpam, you can easily filter submissions by region, stop spam, and review detailed logs, without disrupting normal site visitors.

For broader protection, layer OOPSpam with Cloudflare Firewall Rules. Together, they give you flexible control over who can interact with your site.

And the best part? OOPSpam works not only with Ninja Forms but also with other builders like [Piotnet Forms](https://www.oopspam.com/blog/how-to-block-countries-in-piotnet-forms), [Kadence Form](https://www.oopspam.com/blog/how-to-block-countries-in-kadence-form), [MailPoet](https://www.oopspam.com/blog/how-to-block-countries-in-mailpoet), [Elementor Forms](https://www.oopspam.com/blog/how-to-block-countries-in-elementor-forms), and [more](https://wordpress.org/plugins/oopspam-anti-spam/#:~:text=Supported%20form%20%26%20comment%20solutions%3A).
