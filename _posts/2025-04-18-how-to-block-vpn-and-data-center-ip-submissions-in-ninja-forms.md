---
layout: post
title: How to Block VPN and Data Center IP Submissions in Ninja Forms
date: 2025-04-18T05:15:00.000Z
author: chazie
image: /assets/posts/block-vpn-and-data-center-ip-submissions-in-ninja-forms.jpg
description: Stop spam in Ninja Forms fast. Learn how to block VPN and data
  center IP submissions using OOPSpam or Cloudflare to boost your form security
  effortlessly.
tags:
  - Ninja Forms
  - Cloudflare
  - OOPSpam
---
![Block VPN and Data Center IP Submissions in Ninja Forms](/blog/assets/posts/free-drag-drop-form-builder-for-wordpress-download-now-04-17-2025_03_10_pm.png "Ninja Forms")

[Ninja Forms](https://ninjaforms.com/) is a user-friendly, drag-and-drop form builder for WordPress—but like many form plugins, it's vulnerable to spam. If you're noticing spammy submissions from unknown sources, chances are they’re coming from IPs tied to VPN services or cloud hosting providers.

In this guide, we’ll walk through why these IPs are a common spam source and how to block them manually or automatically using the OOPSpam Anti-Spam plugin.

## **Why Block VPN and Cloud Provider IPs in Ninja Forms?**

Most spambots don't operate like average users. They rely on anonymous networks and high-powered servers to push spam through your site’s forms. This is especially true for Ninja Forms, which, by default, doesn’t block VPN or cloud-origin traffic.

Here’s why these sources are problematic:

* VPNs help spammers hide their true location and identity
* Cloud providers give them the infrastructure to send thousands of form entries at once
* Proxies allow bots to rotate IPs quickly to avoid detection

### **Blocking VPNs**

Turning on VPN blocking helps prevent submissions from people or bots trying to hide behind anonymizing tools like Tor or commercial VPN services. This is powerful, but keep in mind—some genuine users (especially remote workers or privacy-first visitors) might also be using VPNs. So, apply this with your audience in mind.

### **Blocking Cloud Providers**

This method is more effective with minimal downsides. Most bots operate from data centers (e.g., AWS, Azure, Hetzner, etc.), not from everyday user networks. Blocking these IPs can dramatically cut down bot spam without affecting your legitimate visitors.

Regular spam filters only work if an IP is already flagged. By blocking IPs from VPNs and cloud hosts outright, you can proactively defend your Ninja Forms from emerging threats.

> Want to verify if an IP is from a VPN or server farm? Tools like **[IP Reputation Check](https://ipreputationcheck.com/)** can help you investigate.

## **Method 1: Manually Block VPN and Cloud IPs Using Cloudflare Firewall**

![Manually Block VPN and Cloud IPs Using Cloudflare Firewall](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare.png "Cloudflare ")

If you're using [Cloudflare](https://www.cloudflare.com/) to protect your site, you can set firewall rules to block traffic from known hosting providers and VPN networks.

### **How to Do It**

You'll need to target [ASNs](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Numbers), which identify specific network operators—like Google Cloud or Linode. If you identify that spam is coming from a particular provider, you can block that entire ASN.

![Block ASN via Cloudflare’s dashboard](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare’s dashboard")

**Example:** To block DigitalOcean traffic, you can block **ASN AS14061** via Cloudflare’s dashboard.

### **Limitations**

While effective, this method comes with trade-offs:

* **Ongoing upkeep:** ASNs change and new IPs get added frequently.
* **Risk of false positives:** Blocking entire networks might impact some legitimate users (especially VPN users or businesses using cloud infrastructure).
* **Time-intensive:** Requires identifying the source of spam, finding the correct ASN, and applying the rules manually.

Unless you’re a developer or running a high-volume site, this method can be a bit complex.

## **Method 2: Block VPN and Cloud IPs in Ninja Forms Using the OOPSpam Plugin (One-Click Setup)**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

Want something easier and more automated? The **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) now supports Ninja Forms and gives you an instant [way to block spam](https://www.oopspam.com/blog/spam-protection-for-ninja-forms) from VPN and cloud sources.

We’ve added two helpful toggles under the IP Filtering tab:

* Block VPNs
* Block Cloud Providers

Once enabled, these options will start filtering spam in your Ninja Forms submissions automatically—no IP research or ASN rules required.

## **Why OOPSpam Works for Ninja Forms**

OOPSpam uses a real-time database that tracks IP ranges from:

* Over 2,000+ cloud data centers
* Known VPN and proxy providers
* Reputation-based scoring and behavioral trends

This means your Ninja Forms are protected from both known and emerging threats. The plugin works silently in the background, offering high accuracy with low risk of blocking genuine users.

This same protection also applies to [OOPSpam’s API](https://www.oopspam.com/docs/#introduction) and other plugin integrations.

## **How to Enable VPN and Cloud IP Blocking for Ninja Forms Using OOPSpam**

### **Step 1: Install or Update the Plugin**

In your WordPress admin dashboard:

* Go to **Plugins** > **Add New**
* Search for **OOPSpam Anti-Spam**, install it, and activate the latest version

![Search for OOPSpam Anti-Spam, install it, and activate the latest version](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam dashboard")

Visit the[ OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Login) to get your API key, then copy it.

### **Step 2: Connect Your API Key & Enable Ninja Forms Protection**

Head over to **Settings** > **OOPSpam Anti-Spam**.

* Under the **General** tab, choose “OOPSpam Dashboard” as the source
* Paste your API key in the **My API Key** field

![Paste your API key in the My API Key field](/blog/assets/posts/my-api-key-field.png "My API Key")

If Ninja Forms is installed, a dedicated section will appear.

* Toggle on **Activate Spam Protection for Ninja Forms**
* You can also set a custom message that users will see if their submission is flagged as spam

![Activate Spam Protection for Ninja Forms](/blog/assets/posts/activate-ninja-forms.png "Activate Spam Protection for Ninja Forms")

### **Step 3: Enable IP Filtering**

Navigate to the **IP Filtering** tab in the plugin settings.

![Navigate to the IP Filtering tab in the plugin settings.](/blog/assets/posts/ip-filtering-tab-block-vpn.png "Enable IP Filtering")

Here you’ll find the two critical options:

* **Block VPNs** – Prevents spam from anonymized IPs
* **Block Cloud Providers** – Blocks known data center IPs, which are commonly used by bots

Toggle them on according to your needs and click **Save Changes**.

No other configuration is required. The plugin now protects your Ninja Forms from two of the most common sources of spam.

## **Tips for Managing Spam Protection in Ninja Forms**

* If you serve international or privacy-conscious users, test the VPN blocking feature first
* Regularly review flagged entries to avoid missing important messages
* For even better spam prevention, use [OOPSpam’s](https://www.oopspam.com/) additional filters like:
* * Country-based blocking

  * Keyword detection

  * Language filters

## **Final Thoughts**

Spambots are getting smarter, but that doesn’t mean you need to spend hours blocking IPs and fighting fake submissions. With just a few clicks, you can take back control of your Ninja Forms and enjoy cleaner inboxes and better lead quality.

Whether you're collecting contact info, quote requests, or newsletter signups—blocking VPN and cloud IPs with OOPSpam gives you a solid, low-maintenance layer of protection.

*Need help getting started?* Our team is [happy to assist](https://www.oopspam.com/#contact) or guide you through how these features work with Ninja Forms and other supported form plugins like [Elementor Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-elementor-forms), [Fluent Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-fluent-forms), and [Gravity Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-gravity-forms).
