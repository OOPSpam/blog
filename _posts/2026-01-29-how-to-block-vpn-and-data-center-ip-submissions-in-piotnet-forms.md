---
layout: post
title: How to Block VPN and Data Center IP Submissions in Piotnet Forms?
date: 2026-01-30T04:29:00.000+08:00
author: chazie
image: /blog/assets/posts/pn_meta.jpg
description: Learn how to block VPN and data center IP submissions in Piotnet
  Forms using OOPSpam and Cloudflare, with clear steps and practical warnings.
tags:
  - Piotnet Forms
  - Cloudflare
---
![Piotnet Forms](/blog/assets/posts/piotnet-forms.png "Piotnet Forms")

[Piotnet Forms](https://piotnetforms.com/) does not have built-in VPN or data center IP blocking. If your forms are being abused, the most reliable solution is to add a third-party spam layer like OOPSpam. For advanced cases, you can also block infrastructure traffic at the network edge using Cloudflare security rules. This guide shows exactly how to do both, and when each method makes sense.

## **Why This Matters for Piotnet Forms Users**

Spam doesn’t just come from basic bots anymore. Many attacks now come from VPNs, proxies, and cloud servers that appear legitimate.

Piotnet Forms focuses on form logic and design. It does not check IP reputation. That means it cannot tell whether a submission comes from a real user or from a data-center script.

If [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and [honeypots](https://www.oopspam.com/blog/ways-to-stop-spam#:~:text=Final%20thoughts-,Honeypot,-%3A%20filter%20spam%20with) are failing, VPN and cloud traffic is usually the cause.

## **Method 1: Automatically Block VPN and Cloud IPs With OOPSpam**

This is the safest option for most sites. [OOPSpam](https://www.oopspam.com/) (that’s us 👋) filters submissions before they are saved. It checks each submission against a live threat database that includes known VPNs, proxies, cloud networks, and abuse patterns. This lets Piotnet Forms evaluate where traffic comes from, not just what users type.

### **Step 1: Install and configure OOPSpam**

Install **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)** from the WordPress plugin directory and activate it.

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

After activation, [create a free account](https://app.oopspam.com/Identity/Account/Login) in the OOPSpam dashboard. Copy your API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

In WordPress, go to **Settings → OOPSpam Anti-Spam.** Open the **General** tab and paste your API key into the **My API Key** field.

![Settings of OOPSpam Anti-Spam](/blog/assets/posts/oopspam-api-key.png "Settings of OOPSpam Anti-Spam")

Save your settings.

### **Step 2: Make sure Piotnet Forms protection is active**

Once active, OOPSpam automatically applies to supported form plugins, including Piotnet Forms. In the OOPSpam settings, confirm that spam protection is turned on. 

![Make sure Piotnet Forms protection is active](/blog/assets/posts/piotnet-forms-spam-protection.png "Make sure Piotnet Forms protection is active")

No additional configuration is required inside the Piotnet Forms editor.

**Step 3: Enable IP filtering (the critical step)**

![Enable IP filtering](/blog/assets/posts/ip-filtering-oopspam.png "Enable IP filtering")

Open the **IP Filtering** tab in OOPSpam settings. You will see two important toggles:

* **Block Cloud Providers –** Turn this on first. This blocks submissions from known cloud infrastructure providers commonly used for automated attacks.
* **Block VPNs –** Enable this only if it fits your audience. VPN blocking can affect privacy-focused users or corporate networks.

Click **Save Changes**. Once enabled, OOPSpam filters submissions automatically in the background.

### **When OOPSpam alone is enough**

OOPSpam is usually sufficient if:

* Spam comes in waves or patterns
* Submissions look human but repeat similar behavior
* CAPTCHA and honeypots are already failing
* You want form-specific protection without affecting the whole site

For many Piotnet Forms users, this is the only step needed.

## **Using Manual Moderation When Spam Is Targeted**

OOPSpam includes a **Manual Moderation** section for handling targeted abuse. It allows you to respond to repeat patterns while keeping normal users unaffected.

![OOPSpam Manual Moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "OOPSpam Manual Moderation")

From the Manual Moderation tab, you can:

* Block specific IP addresses that repeatedly submit spam
* Block email addresses linked to known offenders
* Block keywords or phrases that commonly appear in abusive messages
* Allow trusted IPs or email addresses so they are never filtered

This approach is useful when spam is persistent but does not justify blocking VPNs or entire cloud networks.

## **Method 2: Block VPN and Cloud Traffic Using Cloudflare Security Rules**

If your site runs on [Cloudflare](https://www.cloudflare.com/), you can block or challenge traffic at the network edge. This happens before WordPress loads and before Piotnet Forms is reached.

This method uses [ASN-based](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) rules. An ASN represents a network operator, such as Amazon AWS.

> Cloudflare rules apply to your entire website, not just Piotnet Forms. Unless you scope rules carefully, they can block real users accessing normal pages.

**Step-by-step: Create a Cloudflare ASN rule**

![Cloudflare ASN rule](/blog/assets/posts/security-cloudflare-block-asn.png "Cloudflare ASN rule")

1. [Log in](https://dash.cloudflare.com/login) to Cloudflare and select your website.
2. Go to **Security → Security Rules → Custom rules**
3. Create a new rule
4. Match traffic by **AS Num**
5. Example for Amazon AWS: **`(ip.src.asnum eq 16509)`**
6. Choose an action:
7. * **Managed Challenge** (recommended starting point)

   * **Block** (use only if you are confident)
8. Name the rule clearly and deploy it

### **When Cloudflare rules make sense**

Use Cloudflare ASN rules if:

* You are seeing very high-volume abuse
* Spam continues even after form-level filtering
* Infrastructure traffic is overwhelming your server
* You understand the risk of blocking legitimate users

For most Piotnet Forms sites, Cloudflare rules should be a secondary layer, not the first one.

## **Final Recommendations**

If you are using Piotnet Forms and dealing with spam from VPNs or data centers, start simple.

Enable OOPSpam. Turn on **Block Cloud Providers**. Monitor results. Add **Block VPNs** only if needed.

Use Cloudflare rules only when form-level protection is not enough. This layered approach keeps Piotnet Forms usable for real users while stopping the traffic that does not belong there.
