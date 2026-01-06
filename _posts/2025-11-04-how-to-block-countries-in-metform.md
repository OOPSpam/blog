---
layout: post
title: How to block countries in MetForm?
date: 2025-11-04T07:26:00.000+08:00
author: chazie
image: /blog/assets/posts/metform_block_countries.jpg
description: Block countries in MetForm with simple steps. Use OOPSpam for
  form-level filtering or Cloudflare for site-wide blocking. Stop spam without
  hurting SEO.
tags:
  - Cloudflare
  - MetForm
---
![MetForm](/blog/assets/posts/metform.png "MetForm")

[MetForm](https://wpmet.com/plugin/metform/) does not have built-in country blocking. To block countries, you must use a third-party tool like [OOPSpam](https://www.oopspam.com/) or your firewall (Cloudflare). Blocking by country protects your forms from spam and unwanted regions. It also keeps your site fast, secure, and focused on real leads.

This guide shows the fastest way to do it, without breaking your website or hurting SEO.

## **Best Method: Block Countries Only on MetForm Forms**

If your goal is to [protect form submissions](https://www.oopspam.com/blog/4-ways-to-protect-your-metform-from-spam) but keep your website public worldwide, use **OOPSpam Anti-Spam**  (that’s us 👋). It integrates directly with MetForm.

### **Why this method works best**

* Stops spam before it reaches your inbox
* Keeps your website accessible for SEO
* Lets you allow only specific countries (or block specific countries)
* Adds extra protection: VPN blocking, TOR blocking, rate-limiting, logs

This gives you precision control and avoids hurting real users.

### **How to Block Countries in MetForm Using OOPSpam**

Follow these steps:

In WordPress dashboard, go to **Plugins → Add New.** Search **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**,install and activate.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

[Sign up at **OOPSpam.com**](https://app.oopspam.com/Identity/Account/Login) and get your API key.

![OOPSpam Dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

Go to **OOPSpam Anti-Spam → Settings** and paste your API key.

![OOPSpam Anti-Spam → Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam → Settings")

Enable **MetForm Spam Protection.**

![MetForm Spam Protection](/blog/assets/posts/activate-spam-protection-for-metform.png "MetForm Spam Protection")

### **Set Up Country Filtering**

Under **OOPSpam → Settings**, find **Country Filtering**.

![OOPSpam Country Filtering](/blog/assets/posts/country-filtering-settings.png "OOPSpam Country Filtering")

You’ll see three options:

* **Trusted Countries** — always allow submissions and skip spam checks. Use this for markets where your service operates or for low-risk regions. Trusted countries skip spam filtering to reduce false positives and ensure legitimate users never get blocked.
* **Country Allowlist** — accept submissions only from selected countries. Leave empty if you don’t want strict country-only access.
* **Country Blocklist** — block submissions from selected countries. Trusted countries override the blocklist.

Select the countries you want to allow or block, then **Save changes**.

OOPSpam will now filter MetForm submissions using IP geolocation, spam signals, and behavior analysis.

## **Add Extra Protection (Recommended)**

Turn on these inside OOPSpam:

* VPN/Proxy/TOR blocking
* Language filtering
* [Rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-metform)
* [Logs](https://help.oopspam.com/wordpress/form-entries/)
* Contextual spam detection (ML-based)

These features stop advanced bots and human-farm spam that [bypass basic CAPTCHAs](https://www.oopspam.com/blog/bypassing-captcha).

Also consider adding Cloudflare Turnstile for modern bot defense. It works with MetForm and gives better accuracy than traditional CAPTCHAs.

## **Option 2: Block Countries Across Your Entire Site**

Use this only if you must block countries for legal, compliance, or high-volume attack reasons.

![Block Countries Across Your Entire Site (Cloudflare)](/blog/assets/posts/cloudflare-security-rules.png "Block Countries Across Your Entire Site (Cloudflare)")

### **Cloudflare steps**

1. Log in to Cloudflare
2. Go to **Security → Security rules**
3. Click **Create rule**
4. Condition: **Country → is in → \[select countries]**
5. Action: **Block**
6. Save

### **Hosting firewall alternative**

Some hosts (like SiteGround) offer [country blocking](https://world.siteground.com/blog/you-can-now-block-country-traffic-to-protect-your-website/) inside their security panel.

> **Warning:** This blocks users and crawlers from entire regions. Use carefully to avoid hurting traffic and SEO.

## **When to Choose Each Method**

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
      <th>Best For</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Form-level (OOPSpam)</td>
      <td>Lead quality, spam control, SEO safety</td>
      <td><b>Recommended</b></td>
    </tr>
    <tr>
      <td>Cloudflare / Hosting Firewall</td>
      <td>Compliance or blocking entire regions</td>
      <td>May reduce global visibility</td>
    </tr>
  </tbody>
</table>

## **Final Thoughts**

MetForm cannot block countries on its own. If your goal is clean leads and reduced spam without hurting SEO, choose OOPSpam form-level country rules. If your priority is compliance or blocking entire regions entirely, use [Cloudflare WAF geo-blocking](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare).
