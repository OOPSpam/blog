---
layout: post
title: How to Block VPN and Data Center IP Submissions in Bricks Forms
date: 2025-04-30T04:54:00.000Z
author: chazie
image: /assets/posts/how-to-block-vpn-and-data-center-ip-submissions-in-bricks-forms.jpg
description: Protect your Bricks Forms from spam and fake entries. Learn how to
  block VPN and cloud traffic using OOPSpam or Cloudflare for a more secure
  WordPress site.
tags:
  - Bricks Forms
  - VPN
  - Data Center
---
![Bricks builder ](/blog/assets/posts/bricks-visual-site-builder.png "Bricks builder")

[Bricks](https://bricksbuilder.io/) builder gives developers and designers powerful tools to build fast, modern WordPress sites—including easy-to-integrate forms. But if you're using Bricks Forms, you've likely faced the issue of spam submissions. Many of these come from bots leveraging VPNs and cloud infrastructure to bypass filters.

In this guide, we’ll explain why blocking VPN and data center traffic is essential for spam protection in Bricks Forms—and how to do it either manually via Cloudflare or instantly with the OOPSpam WordPress plugin.

## **Why VPN and Cloud IP Blocking Matters in Bricks Forms**

Bots today don’t rely on old-school spam tactics. Instead, they use:

* [VPNs](https://en.wikipedia.org/wiki/Virtual_private_network) to obscure their real location
* Proxies to rapidly change identities
* Cloud servers like AWS, Hetzner, and Azure to automate and scale spam attacks

If you’re seeing odd contact form messages, fake leads, or suspicious submissions in your Bricks Forms, these IP sources are likely to blame.

### **Blocking VPNs**

VPNs allow attackers to submit forms without revealing their actual IP address. Blocking VPN traffic can reduce spam significantly—but some real users (like remote workers or people in restrictive regions) may also rely on VPNs, so use this filter mindfully.

### **Blocking Cloud Providers**

Most spam bots operate from cloud infrastructure, not from ordinary home or mobile networks. Blocking traffic from known cloud IPs is a safer and more effective option for preventing:

* Fake account signups
* Automated spam
* Suspicious lead capture entries

Where standard filters react to known spam patterns, blocking VPN and cloud IPs proactively stops new threats—before they reach your form inbox.

> You can also use tools like **[IP Reputation Check](https://ipreputationcheck.com/)** to verify if an IP is associated with VPNs or data centers.

## **Method 1: Manually Block VPN and Cloud Traffic with Cloudflare Firewall**

![Cloudflare Firewall](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare.png "Cloudflare Firewall")

If your site is using [Cloudflare](https://www.cloudflare.com/), you can manually create firewall rules to stop unwanted traffic from known networks.

### **How It Works**

Every network provider (including cloud platforms and VPN services) has a unique identifier called an [ASN](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Number). Cloudflare lets you block these ASNs.

![Cloudflare ASN Settings](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare ASN Settings")

**Example:** To stop traffic from DigitalOcean, you can block **ASN AS14061** in your Cloudflare dashboard.

### **Drawbacks**

* **Manual upkeep required:** ASNs and IP blocks change over time
* **Risk of overblocking:** You might accidentally block legitimate users using VPNs or cloud-hosted services
* **Requires technical knowledge:** You'll need to research offending networks, identify their ASNs, and apply rules

This method is best suited for developers or site managers comfortable with network-level tools.

## **Method 2: Block VPN and Cloud IPs in Bricks Forms with OOPSpam (One-Click Setup)**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

Prefer a faster, automated solution? The **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) works seamlessly with [Bricks Forms](https://bricksbuilder.io/forms/) and takes just minutes to set up.

It includes two smart toggles under IP Filtering:

* Block VPNs
* Block Cloud Providers

With these enabled, you can reduce form spam at the source—no complex rule sets, no manual filtering.

### **Why OOPSpam Works So Well with Bricks Forms**

The plugin connects to an intelligent, real-time database of:

* IPs from over 2,000+ cloud providers
* VPN and proxy networks
* Updated reputation and behavior data

This means OOPSpam not only catches known threats but also adapts to block emerging spam sources—without bloating your site or requiring constant manual input.

It integrates quietly in the background and works alongside other Bricks Builder features without conflict.

## **How to Enable VPN and Cloud IP Blocking with OOPSpam for Bricks Forms**

![OOPSpam Anti-Spam Dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam Dashboard")

### **Step 1: Install the Plugin**

From your WordPress dashboard:

* Go to **Plugins > Add New**
* Search for **OOPSpam Anti-Spam**
* Install and activate the latest version

Then go to the [OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Login) and get your API key.

### **Step 2: Configure the Plugin Settings**

![API key field](/blog/assets/posts/my-api-key-field.png "API key field")

In WordPress:

* Navigate to **Settings > OOPSpam Anti-Spam**
* Under the **General** tab, choose **OOPSpam Dashboard** as your source
* Paste your API key into the “**My API Key**” field

When Bricks Forms is detected, a spam protection panel will be shown.

* Enable **Activate Spam Protection** to help prevent spam submissions.
* You can also set a custom admin message for any entries flagged as spam.

![Activate Spam Protection on Bricks Forms](/blog/assets/posts/activate-spam-protection-bricks-forms.png "Activate Spam Protection on Bricks Forms")

### **Step 3: Enable IP Filtering**

Switch to the **IP Filtering** tab and toggle on:

* **Block VPNs** – Use this carefully if you have global or privacy-sensitive users
* **Block Cloud Providers** – Highly recommended to stop bots hosted on cloud platforms

![Enable IP Filtering](/blog/assets/posts/ip-filtering-tab-block-vpn.png "Enable IP Filtering")

Click **Save Changes** and you’re done! Your Bricks Forms are now actively protected.

## **Tips for Smarter Spam Prevention in Bricks**

* **Monitor your audience:** VPN blocking can sometimes interfere with legitimate users—review flagged entries periodically.
* **Use layered filtering:** Combine IP filtering with [OOPSpam’s](https://www.oopspam.com/) other features, such as:
* * Country restrictions

  * Keyword detection

  * [Language filters](https://www.oopspam.com/blog/how-to-automatically-block-spam-form-submissions-in-zapier-based-on-language)

  * [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)

This layered approach gives your forms the best chance at staying clean.

## **Final Thoughts**

Bricks Builder empowers you to design stunning, dynamic websites—but without the right protections, your Bricks Forms can become easy targets for spammers.

Blocking VPN and data center IPs offers a powerful way to stop spam before it starts. And with the OOPSpam plugin, you can implement this protection in minutes—no technical headaches, just reliable results.

Ready to keep your [Bricks Forms spam-free](https://www.oopspam.com/blog/spam-protection-for-bricks)? Install OOPSpam today and enjoy the peace of mind that comes with intelligent form security.
