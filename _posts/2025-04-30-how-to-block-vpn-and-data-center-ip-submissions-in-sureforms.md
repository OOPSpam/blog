---
layout: post
title: How to Block VPN and Data Center IP Submissions in SureForms
date: 2025-04-30T04:15:00.000Z
author: chazie
image: /blog/assets/posts/how-to-block-vpn-and-data-center-ip-submissions-in-sureforms.jpg
description: Keep your SureForms free from spam. Learn how to block VPN and
  cloud provider IPs using OOPSpam for a more secure and cleaner form submission
  experience.
tags:
  - SureForms
  - VPN
  - Data Center
---
![SureForms Page ](/blog/assets/posts/sureforms-ai-form-builder.png "SureForms Page")

[SureForms](https://sureforms.com/) makes it easy to build clean, responsive forms on WordPress—but unfortunately, even the best-designed forms can become prime targets for spam. A large portion of unwanted submissions comes from bots operating through VPNs and cloud servers.

In this blog, we’ll explain why it’s critical to block VPN and cloud-based IP traffic in SureForms—and show you how to do it manually using Cloudflare or effortlessly with the OOPSpam plugin.

## **Why Spam in SureForms Often Comes from VPNs and Cloud Servers**

Today’s spammers aren’t just random users—they operate with tools that allow them to bypass filters and flood your forms. They use:

* [VPN](https://en.wikipedia.org/wiki/Virtual_private_network) services to hide their real location and IP address
* Proxies to rotate identities and avoid detection
* Cloud servers (AWS, DigitalOcean, Google Cloud, etc.) to automate spam on a massive scale

If you’re getting fake leads, suspicious signups, or strange form submissions in SureForms, VPNs and cloud IPs are very likely to blame.

### **Blocking VPNs**

Blocking traffic from known VPN providers can help prevent anonymous spam submissions. However, remember that some legitimate users, like remote workers and privacy-conscious visitors, also rely on VPNs. Use this setting carefully if your site serves a global audience.

### **Blocking Cloud Providers**

Most bots operate directly from cloud data centers—not from everyday home users. Blocking cloud provider IPs is a highly effective, low-risk step to stop a huge volume of automated spam without harming genuine users.

Standard spam protection often reacts *after* detecting patterns. Blocking VPN and cloud provider IPs allows you to prevent spam traffic from reaching your SureForms entirely.

> You can also check any IP address against services like **[IP Reputation Check](https://ipreputationcheck.com/)** to confirm whether it belongs to a VPN or cloud server.

## **Method 1: Manually Block VPN and Cloud IPs Using Cloudflare Firewall Rules**

![Block VPN and Cloud IPs Using Cloudflare Firewall Rules](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare-1-.png "Manually Block VPN and Cloud IPs Using Cloudflare Firewall Rules")

If your WordPress site uses [Cloudflare](https://www.cloudflare.com/), you can manually block spammy traffic by setting up firewall rules.

### **How It Works**

Cloudflare allows you to block entire networks using [ASN](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Numbers). An ASN represents a large group of IPs managed by one provider (like AWS, OVH, Linode, etc.).

![Cloudflare ASN Settings](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare ASN Settings")

**Example:** If you see spam originating from DigitalOcean, you can block **ASN AS14061** inside Cloudflare’s firewall settings.

### **Downsides to Manual Blocking**

* **Maintenance required:** ASN assignments and IP addresses can change over time.
* **Risk of false positives:** You may block real visitors if they happen to use a cloud network for legitimate reasons.
* **Technical expertise needed:** Researching, identifying, and blocking specific ASNs requires time and technical skill.

For large, high-traffic websites, this method might make sense. For smaller sites or those without technical staff, a plugin-based solution is far easier.

## **Method 2: Block VPN and Cloud IPs Automatically with OOPSpam for SureForms**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

For an easier, hands-off solution, the **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) offers built-in VPN and cloud IP blocking that works seamlessly with SureForms.

Two simple toggle switches under the IP Filtering settings make it effortless:

* Block VPNs
* Block Cloud Providers

Once enabled, OOPSpam automatically filters out most spam traffic—no manual IP management required.

### **Why OOPSpam Works with SureForms**

Unlike traditional spam plugins that rely solely on detecting bad behavior, OOPSpam uses an updated real-time database that covers:

* Over 2,000+ cloud data centers
* IP ranges used by popular VPN and proxy services
* Ongoing threat intelligence updates

This ensures you aren’t just stopping spam you already know about—you’re also blocking new threats that other plugins might miss.

Best of all, **[OOPSpam](https://www.oopspam.com/)** operates silently in the background without slowing down your forms or WordPress site.

## **How to Set Up VPN and Cloud IP Blocking for SureForms with OOPSpam**

![OOPSpam Anti-Spam Dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

### **Step 1: Install the Plugin**

In your WordPress dashboard:

* Go to **Plugins > Add New**
* Search for **OOPSpam Anti-Spam**, then install and activate it

After installation, sign up at the [OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Login) and get your API key.

### **Step 2: Connect Your API Key**

![Connect Your API Key](/blog/assets/posts/my-api-key-field.png "Connect Your API Key")

* Navigate to **Settings > OOPSpam Anti-Spam**
* Under the **General** tab, select **OOPSpam Dashboard** as your source
* Paste your API key into the **My API Key** field

If SureForms is active, you’ll see a spam protection section ready to configure.

* Switch **ON** Activate Spam Protection to start blocking spam entries.
* You can customize the message that appears when a submission is flagged as spam.

![Activate Spam Protection on SureForms ](/blog/assets/posts/activate-sureforms.png "Activate Spam Protection on SureForms ")

### **Step 3: Enable IP Filtering**

Move to the **IP Filtering** tab:

* Turn on **Block VPNs** if you want to stop submissions from anonymized IPs (use thoughtfully)
* Turn on **Block Cloud Providers** to block traffic from bot-heavy data centers (recommended for most sites)

![Enable IP Filtering](/blog/assets/posts/ip-filtering-tab-block-vpn.png "IP Filtering tab")

Click **Save Changes**, and you're done! SureForms will now filter spam traffic based on origin.

## **Tips for Balancing Spam Protection and User Access**

* **Monitor submissions:** Occasionally check filtered entries to avoid blocking legitimate users accidentally.
* **Combine defenses:** Pair IP blocking with OOPSpam’s additional features like:
* * [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)

  * Country-specific blocking

  * Language-based filters

  * Keyword detection

A layered defense system [gives your SureForms maximum protection](https://www.oopspam.com/blog/5-ways-to-stop-spam-on-sureforms) against evolving spam tactics.

## **Final Thoughts**

SureForms gives you complete design freedom for your WordPress forms—but protecting those forms is just as important as building them.

Blocking VPNs and cloud IPs lets you take a proactive approach to spam protection, keeping bots away from your lead forms, contact pages, and signup flows. With OOPSpam, you can set this up in just a few minutes—without diving into complex firewall settings.

Want help optimizing your SureForms security? [Get in touch](https://www.oopspam.com/#contact) with us—we’re happy to guide you through the setup or recommend the best configurations for your site!
