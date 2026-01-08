---
layout: post
title: How to Block VPN and Data Center IP Submissions in Formidable Forms
date: 2026-01-07T01:20:00.000+08:00
author: chazie
image: /blog/assets/posts/header_ff_block.jpg
description: Learn how to block VPN and data center IP submissions in Formidable
  Forms using OOPSpam and Cloudflare, with clear steps and best practices.
tags:
  - Formidable Forms
---
![Formidable Forms](/blog/assets/posts/formidable-forms-home.png "Formidable Forms")

[Formidable Forms](https://formidableforms.com/) does not have a built-in way to block VPN or data center IP submissions. If you want to stop this type of spam reliably, you must add a third-party layer. The two options are [OOPSpam](https://www.oopspam.com/) and Cloudflare Security Rules. This guide shows you exactly how to use both, step by step, with Formidable Forms in mind.

## **Why VPN and Data Center Spam Gets Through Formidable Forms**

Formidable Forms is for building and managing forms. It supports validation, conditional logic, and custom hooks. What it does not do is classify incoming IP addresses.

Formidable Forms cannot tell whether a submission comes from:

* A VPN exit node
* A cloud provider like AWS or Google Cloud
* A proxy or hosting network

That type of detection requires constantly updated IP databases and reputation scoring. Without that data, Formidable Forms can only block IPs you already know.

This is why VPN-based and data center spam keeps getting through.

## **Method 1: Automatically Block VPN and Cloud IPs in Formidable Forms With OOPSpam**

[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) (that’s us 👋) integrates with Formidable Forms and evaluates each submission before it is saved. It checks the IP against known VPN networks, cloud providers, and proxy infrastructure.

[Spam is filtered](https://www.oopspam.com/blog/spam-protection-for-formidable) before it reaches your Formidable entries.

### **Why OOPSpam Works Well With Formidable Forms**

It solves the [exact gap Formidable Forms has](https://www.oopspam.com/integrations/spam-protection-for-formidable). OOPSpam uses:

* IPs from thousands of cloud infrastructure providers
* Known VPN and proxy networks
* Continuously updated threat signals
* Reputation-based scoring

This means it blocks both known and emerging spam sources. You do not need to maintain IP lists manually.

### **Step-by-Step: Enable VPN and Data Center Blocking With OOPSpam**

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

**Step 1: Install the plugin**

Go to **WordPress Dashboard → Plugins → Add New** and search for **OOPSpam Anti-Spam.** Install and activate the plugin.

**Step 2: Get your API key**

![OOPSpam API key](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam API key")

[Create an account](https://app.oopspam.com/Identity/Account/Login) on the OOPSpam website and generate an API key from the dashboard.

**Step 3: Connect OOPSpam to WordPress**

![Connect OOPSpam to WordPress](/blog/assets/posts/oopspam-api-key.png "Connect OOPSpam to WordPress")

Go to **OOPSpam Anti-Spam → Settings.** In the **General** tab, paste your API key and click **Save Changes.**

**Step 4: Enable Formidable Forms protection**

![Enable Formidable Forms protection](/blog/assets/posts/formidable-forms-spam-protection-update.png "Enable Formidable Forms protection")

Stay in the **General** tab and scroll to the **Formidable Forms** section. Turn ON spam protection for Formidable Forms.

**Step 5: Enable IP filtering**

![Enable IP filtering](/blog/assets/posts/ip-filtering-oopspam.png "Enable IP filtering")

Open the **IP Filtering** tab and turn ON:

* **Block VPNs -** Use this with caution if your users commonly use VPNs.
* **Block Cloud Providers -** This is strongly recommended. Most automated spam comes from data centers.

Click **Save Changes.**

Once enabled, Formidable Forms submissions from VPNs and cloud providers are blocked automatically.

### **Optional: Use OOPSpam Manual Moderation for Extra Control**

Some spam is persistent but not fully automated. Manual moderation gives you precision without turning off automation.

![OOPSpam Manual Moderation](/blog/assets/posts/manual-moderation.png "OOPSpam Manual Moderation")

In **OOPSpam → Manual Moderation**, you can:

* Block specific IP addresses
* Block email addresses used repeatedly for spam
* Block keywords that appear in abusive submissions
* Allow safe IPs or email addresses to prevent false positives

This is useful when you want control over borderline submissions without affecting normal users.

## **Method 2: Block VPN and Cloud Traffic With Cloudflare Security Rules**

If your site uses [Cloudflare](https://www.cloudflare.com/), you can block VPN and data center traffic at the network level. This stops requests before WordPress loads. 

> **Warning:** This method is powerful, but aggressive. Cloudflare rules affect your entire website. They do not apply only to forms.

### **Step-by-Step: Create a Cloudflare Security Rule**

![Create a Cloudflare Security Rule](/blog/assets/posts/security-cloudflare-block-asn.png "Create a Cloudflare Security Rule")

You block traffic by cloud provider ASN.

1. Log in to your [Cloudflare dashboard](https://developers.cloudflare.com/fundamentals/user-profiles/login/)
2. Select your website
3. Go to **Security → Security Rules**
4. Create a new **Custom Rule**
5. Match traffic by ASN

**Example for AWS:** `(ip.src.asnum eq 16509)`

1. Choose an action:
2. * **Block** to stop traffic completely

   * **Managed Challenge** to reduce false positives
3. Name the rule clearly
4. Deploy the rule

You can repeat this process for other cloud providers if needed.

## **Final Takeaway**

Blocking VPN and data center spam in Formidable Forms requires an extra layer. For most Formidable Forms users, OOPSpam Anti-Spam is the fastest and safest solution. Cloudflare is a strong complement when used carefully.
