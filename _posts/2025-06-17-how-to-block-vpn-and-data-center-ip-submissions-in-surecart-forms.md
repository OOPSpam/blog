---
layout: post
title: How to Block VPN and Data Center IP Submissions in SureCart Forms
date: 2025-06-17T09:58:00.000Z
author: chazie
image: /blog/assets/posts/surecart_vpn.jpg
description: Stop spam in SureCart forms by blocking VPNs and data center IPs.
  Learn how to enable powerful filtering with OOPSpam in just a few clicks.
tags:
  - SureCart
---
![SureCart ](/blog/assets/posts/surecart-homepage.png "SureCart ")

If you're running a SureCart-powered store and noticing spammy checkouts or fake submissions, there's a good chance VPNs or cloud-hosted IPs are behind them. This guide explains why those sources are a problem and how you can block them automatically using OOPSpam.

## **Why Are VPN and Cloud IPs a Problem in SureCart?**

Spambots and fake buyers love exploiting forms that aren’t protected. On [SureCart](https://surecart.com/), this can show up as:

* [Fake orders](https://www.oopspam.com/blog/5-ways-to-stop-fake-orders-in-surecart) or test checkouts
* Abused coupon codes
* Repeated support form submissions

Much of this activity comes from two key sources:

* **VPNs**: Used to hide true locations or rotate identities
* **Cloud Providers**: Bots often run on AWS, Google Cloud, or similar platforms

Blocking these IPs won’t stop *every* spammer, but it will eliminate a major source of anonymous traffic that’s hard to trace.

Let’s break this down further:

* **Blocking VPNs:** Many spam scripts use commercial VPN services or tools like Tor to spoof locations and avoid detection. Blocking them helps reduce this loophole—but keep in mind: some real users (remote workers, privacy-focused buyers) may also use VPNs.
* **Blocking Cloud Provider IPs:** Data centers are where most automated spam lives. If an IP belongs to a known server farm, it’s more likely bot traffic. Blocking these is a safer move, especially on eCommerce forms like SureCart where conversions matter.

Traditional spam filters rely on whether an IP has been flagged in the past. But with OOPSpam’s cloud and VPN blocking, you also catch new IPs *before* they show a spammy history.

You can use tools like **[IP Reputation Check](https://ipreputationcheck.com/)** to determine whether a specific IP address is associated with a VPN or data center.

## **Manual Option: Blocking VPN and Cloud IPs with Cloudflare WAF**

![Blocking VPN and Cloud IPs with Cloudflare WAF](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare.png "Blocking VPN and Cloud IPs with Cloudflare WAF")

If you’re using [Cloudflare](https://www.cloudflare.com/), you can block traffic at the network level by targeting [ASNs](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Numbers).

**Example:** You might block DigitalOcean’s ASN (AS14061) if you’re seeing form abuse from its servers.

![Cloudflare WAF](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare WAF")

However, this approach comes with limitations:

* **Maintenance required**: ASNs change. You'll need to keep updating them.
* **Risk of false positives**: Some businesses run legit services on cloud providers.
* **Time-consuming**: You’ll need to track down abusive networks yourself.

This method works, but it’s more suited for technical teams or larger operations with dedicated security resources.

## **Better Option: Use OOPSpam’s One-Click IP Filtering**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

For SureCart users, there’s an easier way. The **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) supports SureCart and includes powerful IP filtering built right in.

We added two toggles under the **IP Filtering** tab:

* Block VPNs
* Block Cloud Providers

With just a few clicks, you can filter out traffic from thousands of spam-heavy networks without maintaining ASN lists or worrying about rule conflicts.

### **What Makes It Effective?** 

OOPSpam uses a constantly updated IP reputation database, which includes:

* Over 1,500+ data centers and cloud IPs
* Known proxy and VPN ranges
* Real-time flagging for newly detected threats

These filters work silently in the background, keeping your SureCart submissions clean and trustworthy.

## **How to Enable IP Filtering for SureCart in OOPSpam**

You can set it up in minutes:

### **Step 1: Install and Activate OOPSpam Plugin** 

In your WordPress dashboard, search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)** under Plugins. Click install, then activate it to get started.

### **Step 2: Add Your API Key** 

![API Key ](/blog/assets/posts/oopspam-dashboard-api.png "API Key ")

Navigate to **Settings > OOPSpam Anti-Spam**. Under the General tab, choose **OOPSpam Dashboard** as the data source. Paste in your API key, which you can generate from your [OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Login).

![OOPSpam Dashboard](/blog/assets/posts/my-api-key-field.png "OOPSpam Dashboard")

### **Step 3: Activate SureCart Protection**

Once SureCart is detected, a dedicated section will appear under the plugin settings. Turn on **Activate Spam Protection**. You can also write a custom message that users will see if their submission is marked as spam.

![Activate SureCart Protection](/blog/assets/posts/surecart-active-spam-protection.png "Activate SureCart Protection")

### **Step 4: Go to the IP Filtering Tab** 

Open the **IP Filtering** tab in the plugin settings. To block anonymous or high-risk traffic, enable the **Block VPNs** toggle. To protect against automated bot activity, enable **Block Cloud Providers**  to block bots from over 1500+ data centers (highly recommended)

![IP Filtering Tab ](/blog/assets/posts/ip-filtering-settings-oopspam.png "IP Filtering Tab ")

Click **Save Changes** and you’re done!

There’s no need to touch your SureCart settings. **[OOPSpam](https://www.oopspam.com/)** works directly with your form submissions, filtering in the background without disrupting the checkout process.

## **Balancing Spam Blocking with Real User Access**

Before enabling both toggles, think about your audience:

* Selling globally? Some users may rely on VPNs for access.
* Have repeat issues from certain countries or networks? Consider enabling **country blocking** in OOPSpam too.
* Monitor spam logs occasionally to adjust filters if needed.

## **Final thoughts**

Spam through SureCart checkouts and support forms isn’t just annoying, it costs time, ad budget, and customer trust. Blocking VPN and cloud IPs is one of the most effective ways to stop it before it reaches your inbox.

OOPSpam makes that process simple. You don’t have to manage complex firewall rules or monitor IP reputation yourself. Just enable two toggles—and your SureCart store has a smarter, quieter defense.

Need help setting it up or want to see how these filters work with your other tools?[ Let us know](https://www.oopspam.com/#contact)!
