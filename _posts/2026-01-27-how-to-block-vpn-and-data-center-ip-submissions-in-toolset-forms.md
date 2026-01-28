---
layout: post
title: How to Block VPN and Data Center IP Submissions in Toolset Forms?
date: 2026-01-28T01:59:00.000+08:00
author: chazie
image: /blog/assets/posts/ts_meta.jpg
description: Learn how to block VPN and data center spam in Toolset Forms using
  OOPSpam or Cloudflare. Clear steps, low false positives, and best practices.
tags:
  - Toolset
  - Toolset Forms
  - Cloudflare
---
![Toolset Forms](/blog/assets/posts/toolset-forms.png "Toolset Forms")

[Toolset Forms](https://toolset.com/home/cred/) do not have a built-in way to block VPN or data center IP addresses. If spam is getting through, you must add a third-party protection layer. The accurate option is form-level filtering using OOPSpam. Cloudflare security rules are also effective, but they apply to your entire site and require more caution.

This guide explains why Toolset Forms are targeted, what VPN and data center spam looks like today, and how to block it using the right tools without breaking legitimate submissions.

## **Why Toolset Forms are targeted by modern spam**

Toolset Forms are flexible and widely used. That makes them attractive to attackers.

[Toolset](https://toolset.com/) relies on basic protections such as reCAPTCHA and form validation. These tools help stop simple bots, but they do not analyze where traffic comes from. Toolset does not know if a submission originates from a residential user, a VPN, or a cloud server.

Spam tactics have changed. Many attacks now come from cloud infrastructure and proxy networks that are designed to look legitimate. [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) alone is no longer enough.

## **Method 1: Form-level filtering with OOPSpam**

[OOPSpam](https://www.oopspam.com/) (that’s us 👋) integrates directly with Toolset and evaluates each submission in real time. Instead of blocking entire networks, it checks the visitor’s IP against known VPN and cloud provider databases at the moment the form is submitted.

If a submission is flagged, it never reaches your database.

## **Step-by-step: Blocking VPN and cloud IPs with OOPSpam**

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

### **Step 1: Install the plugin**

Log in to your WordPress dashboard. Go to Plugins, then Add New. Search for “**[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**.” Install and activate the plugin.

### **Step 2: Create an API key**

Open the OOPSpam dashboard. [Create an account](https://app.oopspam.com/Identity/Account/Login) and generate an API key. This key allows your site to access IP reputation checks.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

### **Step 3: Connect the API key in WordPress**

Go to Settings, then OOPSpam Anti-Spam. Paste your API key into the “**My API Key**” field and save your changes.

![Connect the API key in WordPress](/blog/assets/posts/oopspam-api-key.png "Connect the API key in WordPress")

Once connected, Toolset Forms protection options become available.

### **Step 4: Enable protection for Toolset Forms**

In the OOPSpam settings, locate the Toolset Forms section below. Turn on spam protection so submissions are checked before Toolset processes them.

![Enable protection for Toolset Forms](/blog/assets/posts/toolset-forms-protection.png "Enable protection for Toolset Forms")

### **Step 5: Enable IP filtering**

Open the IP Filtering tab. Turn on:

* **Block VPNs** – Use with caution if your audience includes privacy-conscious users.
* **Block Cloud Providers** – Recommended to stop automated, server-based spam.

![Enable IP filtering](/blog/assets/posts/ip-filtering-oopspam.png "Enable IP filtering")

Save your changes. Filtering now runs automatically in the background.

## **When to be careful with VPN blocking**

You may want to disable VPN blocking if your audience includes:

* International users
* Privacy-conscious visitors
* Developers or remote teams

OOPSpam lets you control these settings independently. Use that flexibility to avoid false positives.

## **Using Manual Moderation when spam is targeted**

Not all spam is automated. Some abuse is slow, repetitive, and intentionally human-like. These submissions often [pass CAPTCHA](https://www.oopspam.com/blog/bypassing-captcha) and IP filtering.

![Manual Moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "Manual Moderation")

OOPSpam includes a **Manual Moderation** section for these cases. It allows you to fine-tune protection when patterns appear.

Manual Moderation lets you respond to specific behavior instead of blocking entire networks. This keeps legitimate users unaffected.

In **OOPSpam → Manual Moderation**, you can:

* **Block specific IP addresses or IP ranges** – Stop repeat spam from known abusive sources.
* **Block email addresses** – Prevent known offenders from submitting forms again.
* **Block keywords or phrases** – Filter messages that match common spam or abusive patterns.
* **Allow safe IPs or email addresses** – Ensure trusted users are never blocked.

Changes apply immediately. Toolset Forms do not need to be reconfigured.

This approach is useful when spam is persistent but does not justify aggressive blocking.

## **Method 2: Blocking VPN and cloud traffic with Cloudflare**

If your site runs on [Cloudflare](https://www.cloudflare.com/), you can block VPN and data center traffic at the network edge.

Cloudflare uses ASN-based rules. An ASN identifies the organization that owns an IP range. Blocking an ASN blocks traffic from that entire network.

> This method is powerful, but it is not form-specific.

### **How to create a Cloudflare ASN rule**

![How to create a Cloudflare ASN rule](/blog/assets/posts/security-cloudflare-block-asn.png "How to create a Cloudflare ASN rule")

1. [Log in](https://dash.cloudflare.com/login) to your Cloudflare dashboard and select your website. 
2. Go to Security, then Security Rules, then Custom rules. Create a new rule.
3. Set the condition to match traffic by AS Number. For example, Amazon AWS uses ASN 16509: **`(ip.src.asnum eq 16509)`**
4. Choose an action. Start with ‘Managed Challenge’. Use ‘Block’ only when you are confident it will not affect legitimate users.
5. Name the rule clearly and deploy it.

## **Final takeaway**

Toolset Forms do not block VPN or data center IPs by default. That is expected.

If you want reliable protection, you must add the right layer in the right place. Form-level filtering with OOPSpam gives you control without collateral damage. Network-level blocking should be reserved for extreme cases.

This layered approach blocks modern spam without harming real users.
