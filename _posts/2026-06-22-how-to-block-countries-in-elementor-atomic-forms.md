---
layout: post
title: How to Block Countries in Elementor Atomic Forms
date: 2026-06-22T13:33:00.000+08:00
author: chazie
image: /blog/assets/posts/social-media-meta.png
description: Learn how to block countries in Elementor Atomic Forms using
  OOPSpam for form-level filtering and Cloudflare WAF for edge-level protection.
tags:
  - Elementor Atomic Forms
---
Elementor [Atomic Forms](https://elementor.com/help/atomic-form-element/) does not include built-in country blocking. To stop spam and unwanted submissions from specific regions, use OOPSpam for form-level country filtering or Cloudflare WAF for site-level blocking. The best practice is to combine both: OOPSpam for precision and Cloudflare for broad, edge-level protection.

## **Why You Might Need Country Blocking**

Blocking certain countries can reduce spam, fake leads, and automated submissions, especially if your real audience is concentrated in a specific region. Atomic Forms is part of Elementor's newer Editor V4 system and does not yet have a native geo filter, so you need an external tool to restrict submissions by country.

You can either:

* Filter countries at the form level using [OOPSpam](https://www.oopspam.com/) (that's us 👋).
* Restrict countries at the edge level using Cloudflare's WAF (Web Application Firewall).

## **Method 1: Use OOPSpam for Form-Level Country Filtering**

OOPSpam integrates directly with [Elementor Atomic Forms](https://www.oopspam.com/blog/3-ways-to-protect-your-elementor-atomic-forms-from-spam). It uses reputation checks and intelligent detection to identify spam and lets you block or allow countries right from your WordPress dashboard. This gives you accurate, invisible protection without disrupting real users or adding extra steps to your form.

### **How to Set It Up**

Install and activate **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)** from the WordPress Plugin Directory.

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

Create an OOPSpam account at[ OOPSpam.com](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![Create an OOPSpam account at OOPSpam.com and generate your API key](/blog/assets/posts/oopspam-dashboard-api.png "Create an OOPSpam account at OOPSpam.com and generate your API key")

In WordPress, go to **Settings > OOPSpam Anti-Spam > General**, and paste your API key.

![OOPSpam Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam Settings")

In the OOPSpam settings, find the **Elementor Atomic Forms** section and toggle on **Activate Spam Protection** so submissions are checked automatically.

![Elementor Atomic Forms section and toggle on Activate Spam Protection](/blog/assets/posts/elementor-atomic-forms-spam-protection.png "Elementor Atomic Forms section and toggle on Activate Spam Protection")

Set up country filtering under the General Settings tab:

![Set up country filtering under the General Settings tab](/blog/assets/posts/country-filtering-settings.png "Set up country filtering under the General Settings tab")

* **Trusted Countries (always bypasses spam checks):** Submissions from these countries skip all spam checks. Use this only for your core market or internal users.
* **Country Allowlist (only accept from these countries):** Only allows submissions from selected countries. Everyone else is blocked. Leave this empty if you do not want a strict region rule.
* **Country Blocklist (reject submissions from these countries):** Rejects submissions from listed countries. Trusted countries always override the blocklist.

**Turn On Extra Filters**

![Turn On Extra Filters](/blog/assets/posts/rate-limiting-settings.png "Turn On Extra Filters")

* **Rate Limiting:** Stop rapid, [repeated submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-elementor-atomic-forms) from the same IP or email.
* **IP Filtering:** Block bad IP addresses, VPNs, and data center traffic.
* **Contextual Detection:** Identify hidden or AI-generated spam in message fields.

After setting up your filters, test your Atomic Form by submitting it in Incognito mode. Then check the Spam and Ham [logs](https://help.oopspam.com/wordpress/form-entries/) in WordPress to confirm unwanted submissions are being blocked. You can also review the OOPSpam Dashboard to see which [submissions](https://help.oopspam.com/report/) were filtered and why.

![Logs in OOPSpam Dashboard](/blog/assets/posts/sc_reported-532356c6.png "Logs in OOPSpam Dashboard")

### **Benefits of OOPSpam for Atomic Forms**

* Filters spam by country, language, content, IP reputation, and submission speed.
* Uses intelligent detection to stop advanced, human-like spam.
* Provides transparent logs so you can see exactly what was blocked.
* Works silently in the background, with no [CAPTCHAs](https://www.oopspam.com/blog/best-captcha-alternatives) for users to complete.

## **Method 2: Use Cloudflare WAF to Block Countries at the Edge**

Cloudflare's Web Application Firewall ([WAF](https://developers.cloudflare.com/firewall/)) lets you block or challenge requests [by country](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) before they ever reach your WordPress site. This is best for region-limited sites or when you are facing high-volume spam attacks that need to be stopped before they hit your server.

**How to Set It Up**

![Use Cloudflare WAF to Block Countries at the Edge](/blog/assets/posts/cloudflare-security-rules.png "Use Cloudflare WAF to Block Countries at the Edge")

1. [Log in](https://dash.cloudflare.com/) to your **Cloudflare Dashboard**.
2. Go to **Security > Security Rules**.
3. Click **Create a new rule** and name it "Block Countries."
4. Set the field to **Country**, choose the operator **is in**, and select the countries you want to block.
5. Choose **Block** as the action and click **Save** to apply the rule.

### **A Note on Error Messages**

When OOPSpam blocks a submission, Atomic Forms shows a default error message rather than a custom one. You can make this clearer for legitimate users:

![A Note on Error Messages](/blog/assets/posts/atomic-forms-error-message.png "A Note on Error Messages")

1. Select the Atomic Form in the Elementor editor.
2. In the left panel, go to **General > Content > States** and select **Error**.
3. Click on the error message text on the canvas.
4. Edit it to something more specific, such as "We're unable to process submissions from your region."

## **Final Takeaway**

The best way to block countries in Elementor Atomic Forms is to use OOPSpam for precision and Cloudflare WAF for extra perimeter security. Together, they create a layered defense. Your Atomic Forms stay clean, your site remains accessible to real visitors, and only legitimate users get through.
