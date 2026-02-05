---
layout: post
title: How to Block VPN and Data Center IP Submissions in Beaver Builder Contact Form?
date: 2026-02-06T00:50:00.000+08:00
author: chazie
image: /blog/assets/posts/bb_meta.jpg
description: Learn how to block VPN and data center IP spam in Beaver Builder
  Contact Form using OOPSpam or Cloudflare security rules. Simple, effective
  steps.
tags:
  - Beaver Builder
  - Cloudflare
  - Beaver Builder Contact Form
---
![Beaver Builder ](/blog/assets/posts/beaver-builder-blog-header.png "Beaver Builder ")

[Beaver Builder](https://www.wpbeaverbuilder.com/) Contact Form does not include VPN or data center IP blocking. To stop modern spam, you must add a third-party layer. The two most effective options are OOPSpam (form-level) and Cloudflare Security Rules (network-level).

If you are seeing fake leads, junk messages, or automated submissions that bypass CAPTCHA, this guide shows exactly how to fix it.

## **Why Beaver Builder Contact Form Gets Hit by VPN and Cloud Spam**

Beaver Builder Contact Form supports basic validation and [reCAPTCHA](https://docs.wpbeaverbuilder.com/beaver-builder/layouts/modules/contact-form/add-a-google-recaptcha-checkbox-to-a-form/), but it does not check IP reputation. It cannot tell whether a submission comes from:

* A real residential user
* A VPN or proxy
* A cloud data center (AWS, Google Cloud, Azure, DigitalOcean)

Modern spam relies heavily on cloud infrastructure and rotating IPs. [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) alone is no longer enough.

That is why IP-based filtering must happen outside the form itself.

### **The Two Ways to Block VPN and Data Center Traffic**

You have two practical options. They solve the problem at different layers.

* **Method 1:** Block spam inside WordPress using OOPSpam 
* **Method 2:** Block traffic earlier using Cloudflare security rules

You can use either method alone, or both together for stronger protection.

## **Method 1: Using OOPSpam Anti-Spam**

[OOPSpam](https://www.oopspam.com/) (that’s us 👋) integrates directly with WordPress and filters submissions before they reach your inbox or database. It uses a real-time threat database that includes:

* Known VPN and proxy networks
* IP ranges from over 1,500+ cloud infrastructure providers
* Continuously updated reputation signals

This means it blocks both known and emerging abuse patterns.

### **Step-by-Step: Enable OOPSpam for Beaver Builder Contact Form**

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

#### **Step 1: Install the Plugin**

Start by logging in to your WordPress dashboard. Go to **Plugins**, then **Add New**, and search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**. Install the plugin and activate it once the installation is complete.

#### **Step 2: Get and Connect Your API Key**

Next, [create a free account](https://app.oopspam.com/Identity/Account/Login) in the OOPSpam dashboard and copy your API key. 

![Get and Connect Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Get and Connect Your API Key")

Return to your WordPress dashboard, navigate to **Settings → OOPSpam Anti-Spam**, and paste the API key into the **My API Key** field.

![OOPSpam Anti-Spam WordPress dashboard](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam WordPress dashboard")

#### **Step 3: Activate Protection for Beaver Builder**

After connecting the API key, open the **General** tab in the OOPSpam settings and make sure **Activate Spam Protection** is turned on.

![Activate Protection for Beaver Builder](/blog/assets/posts/beaver-builder-protection.png "Activate Protection for Beaver Builder")

Once the plugin detects the Beaver Builder Contact Form, the form-specific protection options will automatically become available.

### **Step 4: Enable IP Filtering**

![Enable IP Filtering](/blog/assets/posts/ip-filtering-oopspam.png "Enable IP Filtering")

Go to the **IP Filtering** tab and enable:

* **Block Cloud Providers.** Strongly recommended. This stops most bot-driven spam.
* **Block VPNs.** Use with caution if your audience relies on privacy tools.

Click **Save Changes**. No changes are required inside Beaver Builder itself.

## **Using Manual Moderation When Spam Is Targeted**

Not all spam is fully automated. Some submissions are slow, repetitive, and written to appear legitimate. These often rotate IPs and bypass simple rules. OOPSpam includes a **Manual Moderation** section for these cases.

![Manual Moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "Manual Moderation")

Manual moderation allows you to:

* Block specific IP addresses tied to repeat abuse
* Block known spam email addresses
* Block keywords or phrases that consistently appear in junk messages
* Allow trusted IPs or emails so they are never filtered

This approach is effective when spam is targeted but does not justify blocking entire networks.

## **Method 2: Blocking VPN and Cloud Traffic Using Cloudflare Security Rules**

If your site already runs on [Cloudflare](https://www.cloudflare.com/), you can block VPN and cloud traffic even earlier. This reduces server load and stops attacks upstream.

> **Important:** Cloudflare rules are not form-specific unless scoped carefully.

### **How Cloudflare ASN Blocking Works**

Cloudflare allows you to match traffic by [ASN (Autonomous System Number)](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/). Each major cloud provider operates known ASNs.

**Example:** Amazon AWS → ASN 16509

Blocking an ASN blocks traffic from that entire network.

![Blocking VPN and Cloud Traffic Using Cloudflare Security Rules](/blog/assets/posts/security-cloudflare-block-asn.png "Blocking VPN and Cloud Traffic Using Cloudflare Security Rules")

### **Step-by-Step: Create a Cloudflare ASN Rule**

1. [Log in](https://dash.cloudflare.com/login) to your Cloudflare dashboard
2. Select your website
3. Go to **Security → Security Rules → Custom Rules**
4. Click **Create Rule**
5. Set the condition to match **AS Num.** Example: **`(ip.src.asnum eq 16509)`**
6. Choose an action:
7. * **Managed Challenge** (recommended starting point)

   * **Block** (use only when confident)
8. Name the rule clearly and deploy it

### **When This Method Makes Sense**

Cloudflare ASN blocking is effective when:

* You are seeing high-volume, infrastructure-based attacks
* Spam persists even after form-level filtering
* You understand the risk of blocking legitimate users on hosted networks

**Warning:** This method can block real users on corporate networks or privacy-focused VPNs if applied broadly.

## **Final Takeaway**

Beaver Builder Contact Form is clean and fast, but it was not designed to fight modern infrastructure-based spam on its own.

If you want reliable protection:

* Use OOPSpam to block VPN and cloud IPs at the form level
* Use Cloudflare rules only when you need network-wide control

That combination keeps your inbox clean without breaking legitimate submissions.
