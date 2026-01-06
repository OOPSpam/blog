---
layout: post
title: How to block countries in GiveWP Donation Forms?
date: 2025-08-15T01:01:00.000+08:00
author: chazie
image: /blog/assets/posts/givewp_header.png
description: GiveWP lacks native country blocking, use OOPSpam for
  location-based spam control or pair with Cloudflare to block access from
  specific regions.
tags:
  - GiveWP
  - Cloudflare
---
![GiveWP ](/blog/assets/posts/givewp-wordpress.png "GiveWP ")

Running a donation form shouldn’t come with the hassle of spam entries, especially from countries you don’t even serve. Unfortunately, [GiveWP](https://givewp.com/) doesn’t offer a built-in feature to block countries from accessing or submitting donation forms. But that doesn’t mean you’re out of options.

With the help of tools like OOPSpam Anti-Spam and Cloudflare, you can take back control and filter submissions based on location, language, and more.

### **No Built-In Country Blocking in GiveWP**

GiveWP is a feature-rich platform for building donation forms and managing donor data, but it currently lacks built-in tools for geographic submission control. That means you can’t restrict donations by country directly within the form settings.

However, there are two main workarounds:

* Use a third-party plugin like [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋) to block submissions based on country or language
* Use Cloudflare’s Web Application Firewall (WAF) to block access to your entire website from selected countries

GiveWP has an [open feature request](https://wordpress.org/support/topic/set-default-country-in-form/) for the ability to [limit countries in the billing address](https://givewp.featureos.app/p/ability-to-limit-countries-in-the-billing-address-block?b=forms) dropdown. This indicates that native country-blocking functionality may be introduced in the future. If this feature would help your workflow, you can upvote the request on GiveWP’s official feature request platform to show your support. You’re also encouraged to submit your own request if you believe this feature is critical to your use case.

Let’s walk through the available solutions for now.

## **1. Block Countries in GiveWP Forms Using OOPSpam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

If your goal is to block spam entries or limit submissions based on geography, OOPSpam Anti-Spam is the most practical way to do it within WordPress. It integrates smoothly with GiveWP and doesn’t require custom code or form modifications.

### **What OOPSpam Adds to GiveWP**

By connecting [OOPSpam to your GiveWP](https://www.oopspam.com/blog/spam-protection-for-givewp) donation forms, you gain:

* **Country Filtering** – Block or allow specific countries
* **Language Filtering** – Prevent submissions written in undesired languages
* **Machine Learning-Based Spam Detection** – Filters out bots and suspicious patterns
* **Rate Limiting** – Prevents abuse by [limiting how often](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) the form can be submitted
* **Proxy, VPN, and TOR Blocking** – Stops anonymized spam sources
* **Detailed Logs** – Gives full visibility into every blocked or accepted submission

It’s an ideal setup for nonprofit sites looking to streamline donations and protect from bad actors.

### **How to Set It Up**

Follow these steps to connect OOPSpam with GiveWP:

**Step 1: Install the Plugin**

From your WordPress admin dashboard:

* Go to **Plugins > Add New**
* Search for **OOPSpam Anti-Spam**
* Click **Install** and then **Activate**

**Step 2: Connect Your API Key**

![Connect Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Connect Your API Key")

Sign up at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![Paste the API key](/blog/assets/posts/oopspam-api-key.png "Paste the API key")

Back in WordPress, go to **OOPSpam Anti-Spam > Settings**.Paste the API key into the designated field.

**Step 3: Enable Spam Protection for GiveWP**

In the settings panel, scroll to the **GiveWP** section and **toggle on spam protection**.

![Enable Spam Protection for GiveWP](/blog/assets/posts/spam-protection-for-givewp.png "Enable Spam Protection for GiveWP")

This ensures all donation forms created through GiveWP are now filtered through OOPSpam.

**Step 4: Block or Allow Specific Countries**

Under the **Country Filtering** section:

* Choose to either block submissions from specific countries or
* Only allow submissions from your preferred list of countries

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Once selected, save your settings. **[OOPSpam](https://www.oopspam.com/)** will handle the rest.

### **Reviewing Blocked Submissions in GiveWP**

Transparency is one of OOPSpam’s strengths. You get clear, actionable insights with every filtered submission:

* IP address
* Spam score
* Submission content
* Detection reason
* Timestamp
* Email address (if submitted)

You can access this information in two places:

* Spam and Ham logs inside your WordPress dashboard

![Spam and Ham logs inside your WordPress dashboard](/blog/assets/posts/form-spam-entries-oopspam.png "Spam and Ham logs inside your WordPress dashboard")

* The OOPSpam Dashboard, which provides advanced submission history and spam trend tracking

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

This is especially useful for reviewing false positives or fine-tuning filters over time.

## **2. Block Entire Countries Using Cloudflare**

If you're experiencing broader abuse, like scraping, [DDoS attacks](https://en.wikipedia.org/wiki/Denial-of-service_attack), or fraudulent access attempts, it may be worth taking it one step further by blocking countries at the server level.

With Cloudflare’s Web Application Firewall ([WAF](https://developers.cloudflare.com/firewall/cf-firewall-rules/)), you can block traffic from specific countries before they even reach your site.

> ⚠️ **Note**: This blocks all website visitors from selected regions, not just form submissions.

### **How to Set Up Country Blocking in Cloudflare**

![How to Set Up Country Blocking in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "How to Set Up Country Blocking in Cloudflare")

**Step 1: Log Into Cloudflare**

Go to [Cloudflare.com](https://www.cloudflare.com), log in, and select your website.

**Step 2: Create a security rule**

1. Navigate to **Security > Security rules**
2. Click **Create rule**
3. Name the rule (e.g., "Block Countries")
4. Set the rule criteria:

   * **Field**: Country
   * **Operator**: is in
   * **Value**: Choose countries to block
5. Action: **Block**
6. Save and deploy the rule

Visitors from those countries will now be blocked from accessing any part of your website, including donation pages.

### **When to Use Cloudflare Blocking**

Use Cloudflare’s geo-blocking when:

* Your site is under attack from a specific country or region
* You need to comply with international regulations
* You want to reduce server load from unqualified or abusive traffic

## **What’s the Best Method for Country-Based Blocking in GiveWP?**

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
      <td>GiveWP Built-In</td>
      <td>Not Available</td>
      <td>No native country-blocking support</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions</td>
      <td>Donation filtering, spam reduction</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire site access</td>
      <td>Site-wide control, compliance, DDoS defense</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

While GiveWP doesn’t offer built-in tools to block countries, there are effective workarounds.

* OOPSpam Anti-Spam gives you country-based filtering, spam scoring, and full [submission logs](https://help.oopspam.com/wordpress/form-entries/), all without blocking legitimate visitors.
* Cloudflare provides network-level country blocking when you need complete access control.

Combining both tools can give you peace of mind while keeping your donation forms open to the regions you serve best. OOPSpam works not only with [GiveWP forms](https://givewp.com/documentation/core/campaigns/give-forms/) but also with other form builders like [Elementor](https://www.oopspam.com/blog/how-to-block-countries-in-elementor-forms), [Gravity](https://www.oopspam.com/blog/how-to-block-countries-in-gravity-forms), [Bricks](https://www.oopspam.com/blog/how-to-block-countries-in-bricks-forms), [Formidable](https://www.oopspam.com/blog/how-to-block-countries-in-formidable-forms), [Forminator](https://www.oopspam.com/blog/how-to-block-countries-in-forminator), and [more](https://wordpress.org/plugins/oopspam-anti-spam/#:~:text=Supported%20form%20%26%20comment%20solutions%3A).
