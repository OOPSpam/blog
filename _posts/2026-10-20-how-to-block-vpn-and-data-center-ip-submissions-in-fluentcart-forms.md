---
layout: post
title: How to Block VPN and Data Center IP Submissions in FluentCart Forms
date: 2026-10-20T13:14:00.000+08:00
author: chazie
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_fluentcart_vpn_dc.jpg
description: Block VPN and data center IP orders in FluentCart with oopspam’s IP
  Filtering or Cloudflare WAF rules. Stop card testing and fake checkouts in
  minutes.
tags:
  - FluentCart
---
![FluentCart ](/blog/assets/posts/fluentcart-homepage.png "FluentCart ")

FluentCart does not block VPN or data center IPs on its own. The fastest fix is the oopspam Anti-Spam plugin. Install it, turn on FluentCart protection, then enable Block VPNs and Block Cloud Providers under the IP Filtering tab. For a manual, network-level option, create Cloudflare WAF custom rules that block hosting provider ASNs and Tor traffic.

## **Why VPN and Data Center IPs Are a Problem in FluentCart**

[FluentCart](https://fluentcart.com/) is a self-hosted eCommerce plugin for WordPress from the WPManageNinja team. Every order and every failed attempt hits your own server and database. Bots cost you hosting resources, gateway fees, and chargebacks.

Most automated abuse comes from two sources:

* **Data centers and cloud providers.** Bots run on servers at AWS, Google Cloud, DigitalOcean, Linode, Hetzner, and similar hosts. Real shoppers rarely buy from a server.
* **VPNs, proxies, and Tor.** Fraudsters use these to hide their location and rotate identities between attempts.

The biggest threat is [card testing](https://www.oopspam.com/blog/how-to-protect-your-store-from-fake-orders-card-testing-and-checkout-spam). Fraudsters run stolen card numbers through small checkouts to find the ones that work. These scripts rely heavily on infrastructure IPs.

FluentCart already includes Cloudflare Turnstile, Stripe 3D Secure, and duplicate-order protection. These [stop simple bots](https://www.oopspam.com/blog/5-ways-to-stop-fake-orders-in-fluentcart). They do not check where an IP comes from. A fresh data center IP with no spam history passes straight through. Blocking by IP origin closes that gap.

> Not sure where a suspicious IP comes from? Paste it into [IP Reputation Check](https://ipreputationcheck.com/) to see if it belongs to a VPN or data center.

## **Method 1: Block VPN and Cloud IPs with oopspam**

The[ oopspam Anti-Spam plugin](https://www.oopspam.com/) supports FluentCart natively. It screens every order in the background, with no [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and no changes to your checkout. Its IP database covers known VPN and proxy ranges and thousands of data center networks, and it updates automatically.

### **Step 1: Install the Plugin**

In your WordPress dashboard, go to **Plugins > Add New**. Search for **[oopspam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate it.

![Step 1: Install the oopspam Anti-Spam Plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Step 1: Install the oopspam Anti-Spam Plugin")

### **Step 2: Add Your API Key**

Create a free account on the[ oopspam Dashboard](https://app.oopspam.com/Identity/Account/Register) and copy your API key. 

![Step 2: Add Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Step 2: Add Your API Key")

In WordPress, go to **Settings > oopspam Anti-Spam**. Under the **General** tab, select oopspam Dashboard as the source and paste your key into the **My API Key** field.

![Select oopspam Dashboard as the source and paste your key into the My API Key field.](/blog/assets/posts/oopspam-api-key.png "Select oopspam Dashboard as the source and paste your key into the My API Key field.")

### **Step 3: Activate FluentCart Protection**

Scroll to the **FluentCart** section and turn on **Activate Spam Protection**. You can also set a custom message for blocked buyers.

![Step 3: Activate FluentCart Protection](/blog/assets/posts/fluentcart-protection.png "Step 3: Activate FluentCart Protection")

### **Step 4: Enable IP Filtering**

![Step 4: Enable IP Filtering](/blog/assets/posts/ip-filtering-oopspam.png "Step 4: Enable IP Filtering")

Open the **IP Filtering** tab. You will see two toggles:

* **Block Cloud Providers:** Blocks orders from hosting platforms and data centers. This is the safer, high-impact setting. Turn it on.
* **Block VPNs:** Blocks orders from commercial VPNs, proxies, and Tor. Use it with care, since some real buyers use personal VPNs for privacy.

Click **Save Changes**. oopspam now filters FluentCart orders automatically.

### **Step 5: Add Extra Layers *(Optional)***

![Rate Limiting](/blog/assets/posts/enabled-rate-limiting-settings.png "Rate Limiting")

Card testers often combine tactics. Two more oopspam settings help:

* **Rate Limiting:** [Cap checkout attempts](https://www.oopspam.com/blog/how-to-rate-limit-orders-in-fluentcart) per IP or email within a set time window. This stops rapid-fire card testing.
* **Country Blocking:** Reject orders from countries you do not sell or ship to.

## **Method 2: Block VPN and Cloud IPs with Cloudflare Firewall**

If your store runs behind[ Cloudflare](https://www.cloudflare.com/), you can block traffic at the network edge before it reaches WordPress. You do this with WAF custom rules that target [ASNs](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) (Autonomous System Numbers). An ASN identifies the network that owns an IP range, such as a cloud host.

![Method 2: Block VPN and Cloud IPs with Cloudflare Firewall](/blog/assets/posts/security-cloudflare-block-asn.png "Method 2: Block VPN and Cloud IPs with Cloudflare Firewall")

### **How to Set It Up**

1. In the Cloudflare dashboard, go to **Security > Security Rules > Custom rules** and click **Create rule**.
2. Name the rule, for example “Block hosting providers on checkout.”
3. Click **Edit expression** and add the ASNs you want to block. Example:

```
(ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
or (ip.src.country eq "T1")
```

This covers DigitalOcean (14061), AWS (16509, 14618), Google Cloud (396982), Linode/Akamai (63949), Hetzner (24940), OVH (16276), and Vultr (20473). The country code **T1** is Cloudflare’s label for Tor exit nodes.

1. To protect only your store, scope the rule to your checkout. Add a condition such as `and http.request.uri.path contains "/checkout"`. Check your browser’s network tab to confirm which URL FluentCart sends order requests to, and include it.
2. Choose an action. **Block** stops the request. **Managed Challenge** filters bots while letting most humans through. Managed Challenge is the safer choice for checkout pages.
3. Click **Deploy**.

### **Limitations**

* **Manual upkeep.** Hosting networks change. You must track and update ASNs yourself.
* **No commercial VPN coverage.** Most VPN providers rent space across many networks. ASN rules miss much of that traffic.
* **Rule limits.** Cloudflare’s Free plan allows only five custom rules.
* **False positives.** Some legitimate businesses route traffic through cloud servers.

This method suits developers and teams with time to maintain rules. It works best alongside oopspam, not instead of it. Cloudflare cuts server load. oopspam handles order-level checks, like email reputation, that a firewall cannot see.

## **oopspam vs Cloudflare: Quick Comparison**

<style>
  .oopspam-table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  .oopspam-table th,
  .oopspam-table td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
  }

  .oopspam-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th></th>
      <th>oopspam</th>
      <th>Cloudflare WAF</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Setup time</td>
      <td>About 5 minutes</td>
      <td>15 to 30 minutes</td>
    </tr>
    <tr>
      <td>Maintenance</td>
      <td>Automatic</td>
      <td>Manual ASN updates</td>
    </tr>
    <tr>
      <td>VPN detection</td>
      <td>Yes</td>
      <td>Tor only (T1)</td>
    </tr>
    <tr>
      <td>Data center blocking</td>
      <td>Yes, thousands of networks</td>
      <td>Only ASNs you add</td>
    </tr>
    <tr>
      <td>Checks email reputation</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Requires Cloudflare</td>
      <td>No</td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## **Balance Security with Real Buyers**

* **Start with Block Cloud Providers.** It carries the lowest risk.
* **Enable Block VPNs only if fake orders continue.** Privacy-focused buyers and remote workers may use VPNs.
* **Review your logs weekly.** [oopspam logs](https://help.oopspam.com/wordpress/form-entries/) blocked entries in WordPress. Release any false positives and adjust settings.
* **Watch your payment dashboard.** A spike in small declined charges is the clearest sign of card testing.

## **Final Thoughts**

Fake FluentCart orders cost money, server resources, and customer trust. Most of them come from VPNs and data centers. Blocking those sources stops a large share of card testing before it reaches your payment gateway.

oopspam is the simplest fix: two toggles and no rule maintenance. Cloudflare adds a strong network-level layer for technical teams. Use one, or use both for full coverage.
