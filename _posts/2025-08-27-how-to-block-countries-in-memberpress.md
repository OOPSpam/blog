---
layout: post
title: How to block countries in MemberPress?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/memberpress_header.png
description: MemberPress lacks country blocking, use OOPSpam for filtering
  sign-ups by region or pair with Cloudflare to block site access from unwanted
  countries.
tags:
  - MemberPress
  - Cloudflare
---
![MemberPress](/blog/assets/posts/memberpress-homepage.png "MemberPress")

Running a membership site with [MemberPress](https://memberpress.com/) often means handling sensitive user data, subscription sign-ups, and payment forms. But what if a flood of spam registrations or unwanted traffic keeps coming from certain regions?

Unfortunately, MemberPress does not include built-in tools to block countries or filter users by their location. But you still have two ways to do it:

1. Add OOPSpam Anti-Spam to MemberPress for form-level filtering.
2. Use Cloudflare’s Web Application Firewall (WAF) to block access site-wide.

Let’s look at how both solutions work.

### **Why MemberPress Alone Isn’t Enough**

While MemberPress is excellent for memberships and access control, it does not natively support country-based restrictions for forms or logins. That means if you want to stop spam sign-ups or restrict access to certain countries, you’ll need external tools.

The good news: with OOPSpam and Cloudflare, you can block countries either at the form level (precision filtering) or at the network level (site-wide).

## **Option 1: Block Countries in MemberPress with OOPSpam**

**[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) integrates smoothly with WordPress and works alongside MemberPress to protect registration, [checkout](https://www.oopspam.com/blog/spam-protection-for-memberpress), and contact forms.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

### **What OOPSpam Brings to MemberPress**

* **Country Filtering** – Decide which countries to block or allow for form submissions.
* **Language Filtering** – Block sign-ups in specific languages.
* **Spam & Abuse Detection** – machine learning-powered filtering to stop bots and automated sign-ups.
* **Block Proxies, VPNs, and TOR** – Stops anonymous traffic sources.
* **Rate Limiting** – Control [how often](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) users can submit forms to prevent abuse.
* **Submission Logs** – See blocked vs. allowed entries with reasons for transparency.

This is the easiest way to deal with fake sign-ups, spammy membership attempts, or repeated abuse from certain regions.

### **How to Set It Up**

**Step 1: Install OOPSpam**

Go to your WordPress dashboard, open **Plugins > Add New**, search for **OOPSpam Anti-Spam**, then install and activate it.

![OOPSpam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

**Step 2: Connect Your API Key**

Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login), generate your API key, and paste it into **OOPSpam Anti-Spam > Settings** in your WordPress dashboard.

![Connect Your API Key](/blog/assets/posts/oopspam-api-key.png "Connect Your API Key")

**Step 3: Enable MemberPress Protection**

In the plugin settings, find the **MemberPress** section and toggle protection on. This ensures all MemberPress forms (registration, checkout, and login) are filtered.

![MemberPress Spam Protection](/blog/assets/posts/memberpress-spam-protection.png "MemberPress Spam Protection")

**Step 4: Block or Allow Countries**

Open the **Country Filtering** panel. Choose whether to block submissions from selected countries or allow only specific ones. Save your settings to activate the filter.

![Block or Allow Countries](/blog/assets/posts/country-filtering-settings.png "Block or Allow Countries")

**Step 5: Review Logs**

Blocked and approved [entries](https://help.oopspam.com/wordpress/form-entries/) appear in two places: inside WordPress under the **Spam & Ham Logs** (showing rejected vs. accepted entries)

![Logs](/blog/assets/posts/form-spam-entries-oopspam.png "Logs")

and in the **OOPSpam Dashboard**, which provides detailed filtering reports for deeper analysis.

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

## **Option 2: Block Countries Site-Wide with Cloudflare**

Sometimes spam goes beyond just form entries. You may face:

* [DDoS attacks](https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/)
* Brute-force login attempts
* Data scraping
* Excessive junk traffic

In these cases, Cloudflare’s Web Application Firewall ([WAF](https://developers.cloudflare.com/firewall/cf-firewall-rules/)) lets you block entire countries before they ever reach your site.

> Unlike OOPSpam, this will block all traffic from the selected countries, not just MemberPress forms.

### **How to Use Cloudflare for Country Blocking**

![How to Use Cloudflare for Country Blocking](/blog/assets/posts/cloudflare-security-rules.png "How to Use Cloudflare for Country Blocking")

**Step 1: Log into Cloudflare**

Go to [cloudflare.com](https://dash.cloudflare.com/login) and select the domain where your MemberPress site is hosted.

**Step 2: Create a security rule**

* Navigate to **Security > Security rules**
* Click **Create rule**
* Name it something like “Block Countries”
* Configure as follows:

  * **Field:** Country
  * **Operator:** *is in*
  * **Value:** Select the countries you want to block
  * **Action:** Block
* Save and deploy

From now on, visitors from those countries will not be able to access your website at all.

## **Which Should You Use?**

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
      <td>MemberPress Built-In</td>
      <td>Not Available</td>
      <td>Not an option</td>
    </tr>
    <tr>
      <td>OOPSpam Plugin</td>
      <td>Form submissions only</td>
      <td>Membership sign-up spam, checkout spam</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website</td>
      <td>Broad attacks, compliance restrictions, or region-wide bans</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

With OOPSpam Anti-Spam, you can filter registrations and form submissions at the membership level, while Cloudflare WAF gives you the ability to shut down site-wide attacks or unwanted traffic.

For most site owners, OOPSpam will be the first line of defense, giving precise and transparent filtering without disrupting normal visitors. If stronger protection is needed, combining OOPSpam with Cloudflare ensures you have both form-level control and network-level security.

Need help setting things up? Visit [OOPSpam documentation](https://www.oopspam.com/help) for more resources.
