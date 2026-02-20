---
layout: post
title: How to Block VPN and Data Center IP Submissions in Paid Memberships Pro?
date: 2026-02-19T13:09:00.000+08:00
author: chazie
image: /blog/assets/posts/meta_pmp.jpg
description: Block VPN and data center IP spam in Paid Memberships Pro using
  OOPSpam, Cloudflare, and built-in checkout spam protection. Stop fake signups.
tags:
  - Paid Memberships Pro
  - OOPSpam
  - Cloudflare
---
![Paid Memberships Pro](/blog/assets/posts/paid-memberships-pro-home.png "Paid Memberships Pro (PMPro)")

[Paid Memberships Pro](https://www.paidmembershipspro.com/) does not block VPN or data center IPs by default. But it does have a built-in checkout protection feature that most site owners overlook. Combined with OOPSpam and Cloudflare, you get solid coverage against fake registrations and automated abuse.

## **What Makes Membership Checkouts a Target**

Automated bots treat membership checkout forms the same way they treat any signup form, as an entry point. They register fake accounts, test stolen payment credentials, and submit garbage data at scale. VPNs and cloud servers let them do this anonymously and repeatedly.

Paid Memberships Pro processes the checkout. It does not evaluate the IP reputation behind the request. That is the gap you need to fill.

## **Method 1: OOPSpam Anti-Spam**

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

[OOPSpam](https://www.oopspam.com/) (that's us 👋) filters submissions at the form level before Paid Memberships Pro processes them. It checks every checkout attempt against a real-time database of VPN ranges and over 1,500 cloud providers.

**Step 1: Install the Plugin**

In WordPress, go to Plugins → Add New. Search for "**[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**", install, and activate.

**Step 2: Add Your API Key**

Create a [free account](https://app.oopspam.com/Identity/Account/Login) at the OOPSpam dashboard. Copy the API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Go to Settings → OOPSpam Anti-Spam, paste the key, and save.

![OOPSpam Anti-Spam Settings ](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam Settings ")

**Step 3: Enable Protection**

Open the General tab. Turn on Activate Spam Protection. OOPSpam detects Paid Memberships Pro automatically.

![Enable Protection](/blog/assets/posts/paid-memberships-pro-spam-protection-settings.png "Enable Protection")

**Step 4: Configure IP Filtering**

Go to the IP Filtering tab and enable:

* **Block Cloud Providers** – Blocks checkout attempts from data centers and hosting servers. Recommended for all membership sites.
* **Block VPNs** – Blocks anonymous submissions through VPN services. Enable carefully if your members include remote workers or privacy-focused users.

![Configure IP Filtering](/blog/assets/posts/ip-filtering-oopspam.png "Configure IP Filtering")

Save changes. Nothing else needs to be configured inside Paid Memberships Pro.

### **Manual Moderation**

For targeted abuse that slips through automated filters, use **OOPSpam's Manual Moderation**. Block specific IPs, email addresses, or keywords. Whitelist known members to prevent false positives.

![Manual Moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "Manual Moderation")

## **Method 2: Cloudflare Security Rules**

[Cloudflare](https://www.cloudflare.com/) blocks traffic by [ASN](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) (Autonomous System Number) before it reaches WordPress. Every cloud provider has a known ASN. Blocking it stops all traffic from that network.

![Cloudflare Security Rules](/blog/assets/posts/security-cloudflare-block-asn.png "Cloudflare Security Rules")

This is site-wide, not checkout-specific.

**Create an ASN Rule:**

1. [Log in](https://dash.cloudflare.com/login) to Cloudflare and select your site
2. Go to Security → Security Rules → Custom Rules
3. Click Create Rule
4. Set the field to AS Num. Example: **(ip.geoip.asnum eq 16509)** for AWS
5. Set the action to **Managed Challenge** to start, or **Block** if confident
6. Name and deploy the rule

Reserve this method for sustained attacks from specific networks. ASN blocking can cut off legitimate members on corporate VPNs or cloud-hosted connections, so review impact before going broad.

## **Method 3: Paid Memberships Pro Built-in Checkout Protection**

![Paid Memberships Pro Built-in Checkout Protection](/blog/assets/posts/pmpro-checkout-spam-protection-settings.png "Paid Memberships Pro Built-in Checkout Protection")

Paid Memberships Pro includes a native [checkout spam protection setting](https://www.paidmembershipspro.com/documentation/admin/security-settings/) that automatically rate-limits suspicious IPs.

When enabled, it blocks any IP address from completing checkout if it has more than 10 failures within 15 minutes. This directly targets automated bots running credential stuffing or card testing attacks through your membership forms.

**Enable It:**

* Go to your Paid Memberships Pro Settings → Security.
* Under the Spam Protection section, find **Checkout Spam Protection** and set it to **Yes – Enable Spam Protection**.

Save changes. That is all it takes.

## **Final Takeaway**

Paid Memberships Pro gives you a head start with its built-in checkout spam protection. Enable it first, it is free and requires no setup beyond a single toggle. Then layer OOPSpam on top for IP-level filtering and use Cloudflare only if attacks persist at scale.
