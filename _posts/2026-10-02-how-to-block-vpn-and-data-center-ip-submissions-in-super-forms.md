---
layout: post
title: How to Block VPN and Data Center IP Submissions in Super Forms
date: 2026-10-02T19:08:00.000+08:00
author: chazie
image: /blog/assets/posts/howtoblockvpn_superforms.jpg
description: Super Forms has no built-in VPN or data center filter. Block them
  with OOPSpam IP Filtering or Cloudflare ASN rules. Step-by-step setup.
tags:
  - Super Forms
---
[Super Forms](https://super-forms.com/) does not list a built-in setting to block VPN or data center IPs. To block them, use the OOPSpam Anti-Spam plugin and turn on Block Cloud Providers and Block VPNs. For site-wide control, add a Cloudflare rule that challenges or blocks cloud provider ASNs. Start by blocking cloud providers, and enable VPN blocking only if your audience does not rely on VPNs.

## **Method 1: Block VPN and Cloud IPs With OOPSpam**

**[OOPSpam](https://www.oopspam.com/)** checks each Super Forms submission against a database of known VPN services and cloud provider IP ranges. It blocks matches before they reach your inbox or entries.

### **How to set it up**

In WordPress, go to **Plugins > Add New**, search for **OOPSpam Anti-Spam**, then install and activate it.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

Create a free account at[ oopspam.com](https://app.oopspam.com/Identity/Account/Login) and copy your API key from the dashboard.

![Create a free account at oopspam.com and copy your API key from the dashboard.](/blog/assets/posts/oopspam-dashboard-api.png "Create a free account at oopspam.com and copy your API key from the dashboard.")

Open the OOPSpam settings in WordPress, paste your API key, and save.

![Open the OOPSpam settings in WordPress, paste your API key, and save.](/blog/assets/posts/oopspam-api-key.png "Open the OOPSpam settings in WordPress, paste your API key, and save.")

Find the **Super Forms** section and check **Activate Spam Protection**.

![Find the Super Forms section and check Activate Spam Protection.](/blog/assets/posts/super-forms_activate-spam-protection.png "Find the Super Forms section and check Activate Spam Protection.")

Optional: edit **Super Forms Spam Message** so blocked visitors know how to reach you, for example *"We couldn't process your submission. Please email name@example.com."*

Open the **IP Filtering** tab and enable:

* **Block Cloud Providers:** blocks submissions from over 1,500 known cloud provider IP ranges. Real visitors rarely submit forms from cloud servers, so this is safe for most sites.
* **Block VPNs:** blocks submissions from known VPN services. Use it only if your audience is unlikely to use VPNs for privacy or work.

![Open the IP Filtering tab ](/blog/assets/posts/ip-filtering-oopspam.png "Open the IP Filtering tab ")

Save your changes, then submit a test entry and check the OOPSpam [spam and ham logs](https://help.oopspam.com/wordpress/form-entries/).

### **If your site uses Cloudflare**

![Trust proxy headers](/blog/assets/posts/trust-proxy-headers.png "Trust proxy headers")

Open the OOPSpam **Miscellaneous** settings and enable **Trust proxy headers**. This lets the plugin see the visitor's real IP instead of Cloudflare's. Only enable it if you trust your proxy service. Also keep the **Do not analyze IP addresses** privacy setting off, because IP filtering needs the visitor's IP.

### **Handle false positives with Manual Moderation**

![Manual Moderation](/blog/assets/posts/manual-moderation.png "Manual Moderation")

In the **Manual Moderation** tab, add one item per line to block or allow specific IPs. It supports single IPs, ranges, and CIDR notation such as **`192.168.1.0/24`**. Allowed IPs and emails bypass the spam check, so use them for trusted partners or staff on a VPN.

## **Method 2: Block Cloud Providers With Cloudflare**

[Cloudflare](https://www.cloudflare.com/) filters requests by ASN (Autonomous System Number) before they reach WordPress. Each cloud provider operates under known ASNs. This applies site-wide, not just to your form.

![Block Cloud Providers With Cloudflare](/blog/assets/posts/security-cloudflare-block-asn.png "Block Cloud Providers With Cloudflare")

1. Log into your[ Cloudflare dashboard](https://dash.cloudflare.com/) and select your site.
2. Go to **Security > Security rules > Custom rules**.
3. Click **Create rule** and name it "Block Data Center IPs."
4. Set the field to **AS Num**. For example, **`ip.geoip.asnum eq 16509`** matches AWS.
5. Set the action to **Managed Challenge** first. Switch to **Block** only when you are confident in the rule.
6. Save and deploy.

Repeat for other providers such as Google Cloud, Microsoft Azure, and DigitalOcean. 

### **What to Know Before You Block**

* Blocking cloud providers is usually safe. Blocking VPNs can turn away real users who use one for privacy or work.
* Broad ASN rules can catch legitimate corporate traffic. Start with Managed Challenge and review your Cloudflare logs.
* IP filtering does not stop spam from residential IPs. Pair it with content filtering and [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam).

## **Final thoughts**

Super Forms has no native VPN or data center filter, so add one. Set up OOPSpam first, starting with Block Cloud Providers. Add Block VPNs if your audience allows it. Add Cloudflare ASN rules only if attacks continue at scale.
