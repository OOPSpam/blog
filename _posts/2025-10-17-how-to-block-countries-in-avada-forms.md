---
layout: post
title: How to block countries in Avada Forms?
date: 2025-10-17T09:01:00.000+08:00
author: chazie
image: /blog/assets/posts/avada_header.png
description: Block unwanted submissions in Avada Forms using OOPSpam and
  Cloudflare WAF for advanced, country-based spam protection without hurting
  user experience.
tags:
  - Avada Forms
  - Cloudflare WAF
---
![Avada Forms](/blog/assets/posts/avada-for-wordpress.png "Avada Forms")

[Avada Forms](https://avada.com/feature/form-builder/) doesn’t include built-in country blocking. To stop spam and unwanted submissions, you can use [OOPSpam](https://www.oopspam.com/) for form-level country filtering and intelligent spam control or use Cloudflare WAF for site-level blocking. The best practice is to combine both: OOPSpam for precision and Cloudflare for broad protection.

## **Why You Might Need Country Blocking**

Blocking certain countries can reduce spam, fake leads, or automated submissions. Avada Forms usually sends data through `/wp-admin/admin-ajax.php` or a custom submission path. Because it lacks a built-in geo filter, you’ll need an external tool to restrict submissions by country.

You can either:

* Filter countries at the form level using OOPSpam.
* Restrict countries at the edge level using Cloudflare’s WAF (Web Application Firewall).

## **Method 1: Use OOPSpam for Form-Level Country Filtering** 

OOPSpam integrates seamlessly with Avada Forms. It uses machine learning and reputation checks to identify spam and lets you block or allow countries directly from WordPress. This gives you accurate, invisible protection without disrupting real users.

### **How to Set It Up**

Install and activate [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/). Get it from the WordPress Plugin Directory. 

Create an OOPSpam account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

In WordPress, go to **Settings → OOPSpam Anti-Spam → General**, and paste your API key.

![ OOPSpam Anti-Spam General Settings ](/blog/assets/posts/oopspam-api-key.png " OOPSpam Anti-Spam General Settings ")

Activate spam protection so OOPSpam checks Avada Forms submissions automatically.

![Activate spam protection on Avada Forms](/blog/assets/posts/spam-protection-for-avada-forms.png "Activate spam protection on Avada Forms")

Set up Country Filtering under the General Settings tab:

![Country Filtering settings](/blog/assets/posts/country-filtering-settings.png "Country Filtering settings")

**Trusted Countries (always bypasses spam checks)** 

Submissions from these countries skip all spam checks. Use this only for your core market or internal users.

**Country Allowlist (only accept from these countries)** 

Only allows submissions from selected countries. Everyone else is blocked. Leave empty if you don’t want a strict region rule.

**Country Blocklist (reject submissions from these countries)** 

Rejects submissions from listed countries. Trusted countries always override the blocklist.

### **Turn on extra filters:**

* **Rate Limiting** — Stop rapid, [repeated submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam).
* **IP Filtering** — Block bad IP addresses and VPNs.
* **Contextual Detection** — Identify hidden or AI-generated spam.

After setting up your filters, test and monitor your Avada Form by submitting it in Incognito mode. Then, check the Spam & Ham [logs](https://help.oopspam.com/wordpress/form-entries/) in WordPress to confirm that unwanted submissions are being blocked. 

![Spam & Ham logs in WordPress ](/blog/assets/posts/form-spam-entries-oopspam.png "Spam & Ham logs in WordPress")

You can also review the OOPSpam Dashboard to see which submissions were filtered, along with the reasons and traffic patterns.

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

### **Benefits of OOPSpam for Avada Forms**

* Filters spam by country, language, content, IP reputation, and submission speed.
* Uses machine learning detection to stop human-assisted and advanced spam.
* Provides transparent logs to see what was blocked and why.
* Works silently, users don’t have to complete [CAPTCHAs](https://www.oopspam.com/blog/best-captcha-alternatives).
* Integrates well with Avada’s Turnstile, reCAPTCHA, and Honeypot fields.

## **Method 2: Use Cloudflare WAF to Block Countries at the Edge**

Cloudflare’s Web Application Firewall ([WAF](https://developers.cloudflare.com/firewall/)) lets you block or challenge requests by country before they reach WordPress. This is best for region-limited sites or when you’re facing high-volume spam attacks.

### **How to Set It Up**

![Cloudflare WAF to Block Countries](/blog/assets/posts/blocking-countries-in-cloudflare.png "Cloudflare WAF to Block Countries")

1. [Log in](https://dash.cloudflare.com/) to your **Cloudflare Dashboard**.
2. Go to **Security → WAF → Firewall Rules**.
3. Click **Create a new rule** and name it **“Block Countries.”**
4. Set the field to **Country**, choose the operator **“is in,”** and select the countries you want to block.
5. Choose **Block** as the action and click **Save** to apply the rule.

> **Best Practice:** Combine Cloudflare’s edge filtering with OOPSpam’s form-level detection for maximum protection.

### **Keep Core Avada Protections Active**

Avada Forms includes essential [anti-spam tools](https://www.oopspam.com/blog/4-ways-to-protect-your-avada-forms-from-spam) that should stay on:

* **Honeypot Field** — Catches basic bots using hidden fields.
* **reCAPTCHA Field** — Verifies human activity using Google’s API (v2 or v3).
* **Turnstile Field** — Privacy-friendly Cloudflare verification with no puzzles.

> Don’t stack multiple CAPTCHA types. Use one verification field plus OOPSpam for server-side defense.

## **Final Takeaway**

The best way to block countries in Avada Forms is to use OOPSpam for precision and Cloudflare WAF for extra perimeter security. 

* OOPSpam filters unwanted submissions intelligently by country, IP, and content.
* [Cloudflare](https://www.cloudflare.com/) stops malicious requests before they reach your site.

Together, they create a layered defense, your Avada Forms stay clean, your site stays visible, and only legitimate users can submit.
