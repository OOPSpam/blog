---
layout: post
title: How to Block VPN and Data Center IP Submissions in Kadence Forms
date: 2025-04-23T03:53:00.000Z
author: chazie
image: /assets/posts/how-to-block-vpn-and-data-center-ip-submissions-in-kadence-forms.jpg
description: Keep your Kadence Forms free from spam. Learn how to block VPN and
  data center traffic easily using Cloudflare or the oopspam plugin to protect
  your website.
tags:
  - Kadence
  - Kadence Forms
---
![Kadence Forms](/blog/assets/posts/kadence-forms-page-sample.jpg "Kadence Forms")

[Kadence Forms](https://www.kadencewp.com/) offers a lightweight, flexible way to add forms to your WordPress site—but like any form plugin, it’s not immune to spam. If you’re noticing an increase in fake submissions or suspicious activity, VPNs and cloud servers could be the hidden culprits.

This guide will show you why these sources are an issue and how to block them effectively—either manually using Cloudflare or automatically with the oopspam Anti-Spam plugin.

## **Why Block VPN and Cloud Provider IPs in Kadence Forms?**

Spambots have gotten smarter over the years. They now rely heavily on:

* VPN services to hide their true location
* Proxies to rotate their identities
* Cloud hosting to automate and scale their spam attacks

Blocking this type of traffic before it reaches your Kadence Forms can make a major difference in reducing:

* Junk submissions
* Fake leads
* Wasted admin time cleaning up spam

### **Blocking VPNs**

[VPNs](https://en.wikipedia.org/wiki/Virtual_private_network) allow spammers to mask their real IP addresses, making it harder for you to spot fraudulent activity. Blocking VPN IPs can dramatically cut down spam, but be aware—some real users, like remote workers or privacy-conscious visitors, may also use VPNs.

### **Blocking Cloud Providers**

This step is even more crucial. Most automated spam comes directly from servers hosted on cloud platforms like AWS, Google Cloud, Azure, and DigitalOcean. Since legitimate users typically don’t submit forms directly from a cloud data center, blocking these IPs is both safer and more effective.

While traditional spam filters mainly react to known threats, IP blocking from data centers proactively stops new attacks before they even hit your inbox.

> Want to confirm if an IP address belongs to a VPN or a cloud server? Use a tool like **[IP Reputation Check](https://ipreputationcheck.com/)** for quick verification.

## **Method 1: Manually Block VPN and Cloud IPs Using Cloudflare Firewall**

![Cloudflare WAF](/blog/assets/posts/cloud-based-waf-security-web-application-firewall-cloudflare.png "Cloudflare ")

If your website uses [Cloudflare](https://www.cloudflare.com/), you can set up custom firewall rules to block unwanted traffic based on their network origins.

### **How to Do It**

Each network provider (like a VPN company or cloud host) is assigned an [ASN](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)) (Autonomous System Number). With Cloudflare’s firewall, you can block traffic from specific ASNs.

![Cloudflare’s firewall ASN blocking](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare’s firewall")

**Example:** If you notice spam originating from DigitalOcean, you can block **ASN AS14061** via Cloudflare’s dashboard.

### **Challenges to Consider**

* **Manual maintenance:** ASNs and IP ranges change frequently, so you'll need to monitor and update the list regularly.
* **Risk of false positives:** You might inadvertently block legitimate users, especially businesses that use cloud infrastructure.
* **Time-consuming:** You’ll need to research, identify, and apply blocks manually, which isn’t ideal for every site owner.

This method is best suited for users with technical expertise or websites facing persistent, high-volume spam attacks.

## **Method 2: Automatically Block VPN and Cloud IPs in Kadence Forms Using the oopspam Plugin**

![oopspam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "The oopspam WordPress plugin")

Looking for an easier way? The **[oopspam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) integrates perfectly with Kadence Forms, allowing you to block VPNs and cloud server IPs with just a couple of clicks.

We recently introduced two new toggles under IP Filtering:

* Block VPNs
* Block Cloud Providers

By enabling these, you automatically filter spam submissions without needing to monitor or manage IP addresses yourself. 

Unlike simple reCAPTCHA-based solutions, oopspam uses a real-time, constantly updated IP database to keep your forms protected:

* Covers IPs from 2,000+ cloud data centers
* Tracks known VPN and proxy services
* Adapts to new IP ranges and reputation changes daily

This means you’re not just blocking known spammers—you’re actively preventing new threats that haven’t even been reported yet.

Plus, if you're using the [oopspam API](https://www.oopspam.com/docs/#introduction) elsewhere across your site, these protections extend beyond Kadence Forms too.

## **How to Enable VPN and Cloud Blocking for Kadence Forms with oopspam**

Setting this up is simple:

### **Step 1: Install or Update the oopspam Plugin**

![Sign up at the oopspam Dashboard and copy your API key.](/blog/assets/posts/oopspam-dashboard-api.png "oopspam Dashboard")

* Go to your WordPress dashboard
* Navigate to **Plugins > Add New**
* Search for **oopspam Anti-Spam**, install it, and activate the latest version

Sign up at the[ oopspam Dashboard](https://app.oopspam.com/Identity/Account/Login) and copy your API key.

### **Step 2: Configure the Plugin Settings**

Inside your WordPress Admin:

* Go to **Settings > oopspam Anti-Spam**
* Under the **General** tab, select "oopspam Dashboard" as the source
* Paste your API key into the “**My API Key**” field

![Paste API key into the “My API Key” field](/blog/assets/posts/my-api-key-field.png "My API Key field")

If Kadence Forms is installed, a specific spam protection section will be available.

* Switch **ON** "Activate Spam Protection" for Kadence Forms.
* You can also customize the message that appears when a form submission is marked as spam.

![Switch ON "Activate Spam Protection" for Kadence Forms.](/blog/assets/posts/activate-kadence-form.png "Activate Spam Protection for Kadence Forms")

### **Step 3: Turn on IP Filtering**

Next, click the **IP Filtering** tab:

![Turn on IP Filtering](/blog/assets/posts/ip-filtering-tab-block-vpn.png "IP Filtering tab")

* Enable **Block VPNs** if you want to filter out traffic from anonymized sources (optional depending on your audience)
* Enable **Block Cloud Providers** for broad protection against bot attacks from data centers (strongly recommended)

After toggling your settings, click **Save Changes**—and you’re done! 

oopspam will now silently [protect your Kadence Forms](https://www.oopspam.com/blog/spam-protection-for-kadence-form) without needing any further setup.

## **Best Practices for Managing Spam Protection**

* **Consider your audience:** If you expect remote workers or international users, monitor the VPN blocking setting closely.
* **Review flagged entries:** Occasionally check submissions marked as spam to catch any false positives.
* **Use a layered approach:** Combine IP blocking with [oopspam’s](https://www.oopspam.com/) additional tools like language, country blocking, and keyword detection for maximum protection.

## **Final Thoughts**

Spam submissions waste your time and clog your database—but protecting your Kadence Forms doesn’t have to be complicated. By blocking VPN and cloud provider IPs, you stop a huge portion of spam before it ever reaches your site.

Using oopspam, you can implement this protection quickly and effortlessly—keeping your website running smoothly and your form entries clean and genuine.

Have questions about setup or want help with integrating oopspam for Kadence Forms or other builders like [Elementor Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-elementor-forms), [Ninja Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-ninja-forms), or [Fluent Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-fluent-forms)? [Reach out to us](https://www.oopspam.com/#contact) here—we’re happy to assist.
