---
layout: post
title: How to Block VPN and Data Center IP Submissions in MailPoet?
date: 2026-02-03T00:08:00.000+08:00
author: chazie
image: /blog/assets/posts/mp_meta.jpg
description: Learn how to block VPN and data center IP spam in MailPoet using
  OOPSpam or Cloudflare. Keep fake subscribers out and protect deliverability.
tags:
  - MailPoet
  - Cloudflare
---
![MailPoet](/blog/assets/posts/mailpoet-home.png "MailPoet")

Spam signups from VPNs, proxies, and cloud servers weaken MailPoet lists. They inflate subscriber counts, reduce engagement, and hurt sender reputation. These submissions often look legitimate and pass basic form checks.

[MailPoet](https://www.mailpoet.com/) is built for email delivery, not traffic analysis. It does not identify VPNs or cloud infrastructure. Blocking this type of spam requires a third-party filter that evaluates submissions in real time, before MailPoet saves the subscriber.

## **What VPN and Data Center IP Spam Looks Like in MailPoet**

Most MailPoet spam comes from rotating networks, not a single IP. VPNs, proxies, Tor exit nodes, and cloud providers constantly change IP addresses, making rate limits and [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) ineffective.

MailPoet treats this traffic as normal users due to limited network visibility. Over time, lists grow while engagement drops, and email providers begin trusting your domain less.

## **Method 1: Automatically Block VPN and Cloud IPs Using OOPSpam**

[OOPSpam](https://www.oopspam.com/) (that’s us 👋) is a form-focused anti-spam solution that evaluates each submission in real time. It connects your WordPress forms to a continuously updated threat database that identifies VPNs, proxies, Tor networks, and cloud infrastructure.

Spam is filtered before MailPoet saves the subscriber.

### **How to Enable OOPSpam for MailPoet**

Install and activate **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)** from the WordPress plugin repository. 

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

[Create an account](https://app.oopspam.com/Identity/Account/Login) at OOPSpam.com and generate an API key. 

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Then open **Settings → OOPSpam Anti-Spam** in WordPress and paste your key.

![General Settings OOPSpam Anti-Spam](/blog/assets/posts/oopspam-api-key.png "General Settings OOPSpam Anti-Spam")

Ensure **Activate Spam Protection** is turned ON for MailPoet. Once MailPoet is detected, protection becomes available automatically.

![MailPoet Activate Spam Protection](/blog/assets/posts/enable-spam-protection-for-mailpoet.png "MailPoet Activate Spam Protection")

### **Enable IP Filtering (Critical Step)**

This is the step that blocks VPN and cloud traffic.

![Enable IP Filtering](/blog/assets/posts/ip-filtering-oopspam.png "Enable IP Filtering")

Open the **IP Filtering** tab inside OOPSpam settings

* Enable **Block Cloud Providers** (strongly recommended)
* Enable **Block VPNs** only if your audience does not rely heavily on privacy tools

Save changes.

From this point forward, OOPSpam filters submissions automatically in the background. No additional MailPoet configuration is required.

## **Using Manual Moderation When Spam Is Targeted**

Not all spam is automated. Some abuse is slow, repetitive, and intentionally written to appear legitimate. These submissions often rotate IPs and avoid obvious spam keywords.

OOPSpam includes a **Manual Moderation** section for these cases.

![Manual Moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "Manual Moderation tab")

Manual moderation allows you to:

* Block specific IP addresses or email addresses tied to repeat abuse
* Block keywords or phrases that consistently appear in spam
* Allow trusted IPs or email addresses so they are never filtered

This approach is effective when spam is persistent but limited and does not justify blocking entire networks.

## **Method 2: Block VPN and Cloud Traffic Using Cloudflare Security Rules**

If your site runs on [Cloudflare](https://www.cloudflare.com/), you can block VPN and cloud traffic at the network edge using ASN-based rules. An [ASN](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) represents a network operator, such as a cloud provider.

For example, Amazon Web Services uses ASN 16509.

![Block VPN and Cloud Traffic Using Cloudflare Security Rules](/blog/assets/posts/security-cloudflare-block-asn.png "Block VPN and Cloud Traffic Using Cloudflare Security Rules")

### **How to Create a Cloudflare ASN Rule**

1. [Log in](https://dash.cloudflare.com/login) to your Cloudflare dashboard and select your website
2. Go to **Security → Security Rules → Custom rules**
3. Create a new rule and match traffic by **AS Num**
4. Use an expression such as **`(ip.src.asnum eq 16509)`**
5. Choose **Managed Challenge** as a starting action. Use **Block** only when confident
6. Name the rule clearly and deploy it

> Cloudflare rules apply to your entire site. They are not limited to MailPoet forms. This can block corporate users, privacy-focused visitors, and legitimate automation. This method should be used only when attacks are severe or persistent.

## **Final Recommendation**

MailPoet alone cannot block VPN or data center IP spam. To protect your list, submissions must be filtered before they are saved. OOPSpam provides precise, MailPoet-safe protection at the form level. Cloudflare offers network-level control when attacks escalate.

Clean lists protect deliverability and early filtering saves time. Blocking spam before it enters MailPoet is always easier than removing it later.
