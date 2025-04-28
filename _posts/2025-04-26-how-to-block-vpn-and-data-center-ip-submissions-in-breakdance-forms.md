---
layout: post
title: How to Block VPN and Data Center IP Submissions in Breakdance Forms
date: 2025-04-28T06:01:00.000Z
author: chazie
image: /blog/assets/posts/how-to-block-vpn-and-data-center-ip-submissions-in-breakdance-forms.jpg
description: Protect your Breakdance Forms from spam. Discover how to block VPN
  and data center traffic using OOPSpam for cleaner submissions and stronger
  form security.
tags:
  - Breakdance Forms
  - VPN
  - Data Center
---
![Breakdance page](/blog/assets/posts/breakdance-.png "Breakdance page")

[Breakdance](https://breakdance.com/) builder makes creating custom websites and forms incredibly easy—but it also means your forms can attract spam submissions if you're not properly protected. Many of these unwanted entries come from users hiding behind VPNs or bots operating through cloud servers.

In this guide, we’ll explain why blocking [VPN](https://en.wikipedia.org/wiki/Virtual_private_network) and cloud provider IPs matters for your Breakdance Forms—and show you two ways to do it: manually with Cloudflare or automatically with the OOPSpam WordPress plugin.

## **Why You Need to Block VPN and Cloud Provider IPs in Breakdance Forms**

Spam bots today don't just come from shady corners of the web. They take advantage of:

* VPNs to disguise their true location
* Proxies to switch identities and avoid detection
* Cloud servers like AWS, Azure, and Google Cloud to automate mass spam submissions

This kind of traffic can flood your Breakdance Forms with:

* Fake lead submissions
* Junk inquiries
* Security threats

### **Blocking VPNs**

Blocking VPN IPs can help prevent anonymous form submissions. However, keep in mind that some real users (like remote employees or privacy-minded visitors) may also use VPNs. It’s a powerful setting but one that should be considered carefully depending on your site's audience.

### **Blocking Cloud Providers**

This is a much safer and more effective move. Bots almost always run from cloud servers. Ordinary users rarely submit forms directly from these data center networks. Blocking cloud traffic helps eliminate a major portion of spam without negatively affecting genuine visitors.

While many spam filters react based on past activity, blocking by origin (VPNs or data centers) provides proactive protection—catching new threats before they ever reach your Breakdance Forms.

> You can also use tools like **[IP Reputation Check](https://ipreputationcheck.com/)** to verify whether a suspicious IP is linked to a VPN or cloud server.

## **Method 1: Manually Block VPN and Cloud IPs via Cloudflare Firewall**

![Manually Block VPN and Cloud IPs via Cloudflare Firewall](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare.png "Manually Block VPN and Cloud IPs via Cloudflare Firewall")

If you are using [Cloudflare](https://www.cloudflare.com/) on your site, you can set up manual firewall rules to block traffic from specific networks.

### **How It Works**

Network providers and cloud hosts have unique [ASNs](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Numbers). You can use these ASNs to block entire groups of IP addresses associated with specific providers.

![Block ASN inside Cloudflare firewall settings.](/blog/assets/posts/cloudflare_was_asn.png "Block ASN inside Cloudflare firewall settings")

**Example:** To block unwanted traffic coming from DigitalOcean servers, you would block **ASN AS14061** inside your Cloudflare firewall settings.

### **Limitations**

* **Ongoing maintenance:** IPs and ASNs can change over time, requiring you to update your rules regularly.
* **Risk of blocking real users:** Businesses using cloud services or VPNs might be mistakenly blocked.
* **Requires technical effort:** Researching ASNs and setting up rules can be complex if you're not experienced.

This method is better suited for tech-savvy site owners or stores handling high volumes of traffic.

## **Method 2: Block VPN and Cloud IPs Instantly in Breakdance Forms Using OOPSpam**

![OOPSpam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam WordPress plugin")

Prefer a quicker, automated solution? The **[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) is a perfect match for Breakdance Forms, giving you a hands-off way to protect your site.

The plugin recently introduced two smart filtering options under IP Filtering:

* Block VPNs
* Block Cloud Providers

With just a flip of a switch, you can block harmful traffic from VPN users and cloud-hosted bots without managing IP lists manually.

### **Why OOPSpam is Ideal for Breakdance Users**

OOPSpam doesn’t just flag submissions—it actively filters traffic based on an up-to-date database of:

* 2,000+ cloud providers
* Known VPN and proxy IP ranges
* Real-time reputation monitoring for early threat detection

This ensures your [Breakdance Forms are protected](https://www.oopspam.com/blog/spam-protection-for-breakdance) from both known and emerging threats, with minimal effort on your part.

OOPSpam's IP filtering also extends to other forms and [API integrations](https://www.oopspam.com/docs/#introduction) if you have more than just Breakdance Forms on your site.

## **How to Set Up VPN and Cloud IP Blocking with OOPSpam for Breakdance Forms**

Setting this up is very straightforward:

### **Step 1: Install or Update the OOPSpam Plugin**

![OOPSpam Dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

* Go to **Plugins > Add New** in your WordPress dashboard
* Search for **OOPSpam Anti-Spam**, install it, and activate

Then, sign up at the [OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Login) and retrieve your API key.

### **Step 2: Configure Your Settings**

In your WordPress Admin:

* Navigate to **Settings > OOPSpam Anti-Spam**
* Under the **General** tab, select **OOPSpam Dashboard** as your source
* Paste your API key into the “**My API Key**” field

![Configure Your Settings](/blog/assets/posts/my-api-key-field.png "Configure Your Settings")

When Breakdance Forms is installed, spam protection settings will be shown.

* You can enter a custom message that will display to users if their form is rejected as spam.
* *(Optional)* Use the **Don't protect these forms** field to exclude specific form IDs from spam filtering.

![When Breakdance Forms is installed, spam protection settings will be shown.](/blog/assets/posts/settings-‹-oopspam-—-wordpress-04-25-2025_09_43_pm.png "Breakdance Forms spam protection settings ")

### **Step 3: Enable IP Filtering**

Go to the **IP Filtering** tab:

* Toggle **Block VPNs** if you want to filter anonymous submissions (optional)
* Toggle **Block Cloud Providers** to stop bots operating from data centers (highly recommended)

![Enable IP Filtering](/blog/assets/posts/ip-filtering-tab-block-vpn.png "Enable IP Filtering")

After adjusting your settings, hit **Save Changes**. [OOPSpam](https://www.oopspam.com/) now filters incoming form traffic silently in the background.

## **Tips for Balancing Spam Blocking and User Access**

* If you serve international or remote visitors, monitor the effect of VPN blocking carefully.
* Regularly check blocked submissions to ensure no legitimate users are impacted.
* Combine IP filtering with OOPSpam's other smart features like:
* * Country-based blocking

  * Language filtering

  * Keyword detection

  * [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)

This layered approach gives you maximum spam protection with minimal disruption to real users.

## **Final thoughts**

Breakdance Forms offer flexibility and design freedom—but to keep your forms clean and useful, you need smart protection against today's spam threats.

Blocking VPN and cloud provider IPs gives you a powerful edge, helping you stay ahead of spam before it even reaches your form submissions. With OOPSpam, it’s fast, reliable, and effortless.

Ready to clean up your Breakdance Forms and improve user experience? Get started with OOPSpam today—and if you need help with setup, our team is [happy to assist](https://www.oopspam.com/#contact)!
