---
layout: post
title: How to Block VPN and Data Center IP Submissions in MetForm?
date: 2026-01-06T11:36:00.000+08:00
author: chazie
image: /blog/assets/posts/metform_block_vpn.jpg
description: Learn how to block VPN and data center IP submissions in MetForm
  using OOPSpam and Cloudflare rules. Stop hidden bots and protect your form
  leads.
tags:
  - MetForm
  - Cloudflare
---
![MetForm](/blog/assets/posts/metform.png "MetForm")

[MetForm](https://wpmet.com/plugin/metform/) cannot block VPN or data-center IPs by itself. To stop anonymous network abuse, you must add a security layer, either at the form level ([OOPSpam](https://www.oopspam.com/)) or at the network edge (Cloudflare Firewall).

Below are the simplest and most reliable methods for MetForm users.

## **Why MetForm Needs Help Blocking VPN and Data Center IPs**

Attackers hide behind [VPNs](https://en.wikipedia.org/wiki/Virtual_private_network) and cloud-server IPs because they want anonymity. MetForm does not detect these sources by default. Modern spam networks use:

* Cloud data centers (AWS, Google Cloud, Azure, OVH, Hetzner)
* Proxy/VPN services
* TOR nodes
* Rotating IP abuse tools

Bot operators also mix in residential proxies and human-assisted form spam. Simple [CAPTCHAs](https://www.oopspam.com/blog/best-captcha-alternatives) are not enough. A layered defense is required: IP intelligence, behavioral filters, and [rate-limits](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-metform).

### **Effective Ways to Block VPN & Data Center IPs in MetForm**

You have two practical methods:

* Use **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** plugin
* Use [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/cf-firewall-rules/) (for Cloudflare users)

Both approaches filter hidden bot traffic and protect your form leads.

## **Method 1: Block VPN & Data Center IPs with OOPSpam (Recommended)**

OOPSpam (that’s us 👋) offers the simplest and most automated way to block VPNs and data-center traffic in MetForm. It works directly inside WordPress and silently filters submissions before they reach your inbox.

> **Use this if:** you want a plug-and-play solution without maintaining manual firewall rules.

### **Enable OOPSpam Protection for MetForm**

Go to **Plugins → Add New.** Search **OOPSpam Anti-Spam**,install and activate.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

[Create an account](https://app.oopspam.com/Identity/Account/Login) on the OOPSpam dashboard and **copy your API key**.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Go to **WordPress Admin → OOPSpam → General Settings** and **paste your key**.

![OOPSpam General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings")

Turn on **MetForm Spam Protection** and click **Save Changes.**

![MetForm Spam Protection](/blog/assets/posts/activate-spam-protection-for-metform.png "MetForm Spam Protection")

### **Enable VPN & Cloud-Server Blocking**

Inside OOPSpam settings and open the **IP Filtering** tab:

* Turn on **Block VPNs**
* Turn on **Block Cloud Providers**
* Save

![ OOPSpam settings IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png " OOPSpam settings IP Filtering tab")

OOPSpam will now:

* Detect VPN traffic
* Detect server farm IPs (AWS, Google Cloud, etc.)
* Filter proxy/TOR submissions
* Apply ML-based spam scoring
* Provide [logs](https://help.oopspam.com/wordpress/form-entries/) for review

OOPSpam works automatically, so you don’t have to maintain IP lists or tune firewall rules. When you need control, you can switch to manual moderation and add your own allow/block IP rules. This keeps routine filtering hands-off while giving you moderation options when cases are borderline.

![Manual moderation](/blog/assets/posts/manual-moderation.png "Manual moderation")

## **Method 2: Block VPN & Data Center IPs with Cloudflare Firewall**

[Cloudflare](https://www.cloudflare.com/) blocks suspicious traffic before it reaches your site. This is useful if you already use Cloudflare and want network-level filtering.

### **Create Firewall Rules**

![Create Firewall Rules](/blog/assets/posts/cloudflare_was_asn.png "Create Firewall Rules")

1. [Log in](https://dash.cloudflare.com/login) to Cloudflare
2. Select your website
3. Go to **Security → Security rules**
4. Click **Create Rule**
5. Name the rule: Example: **Block AWS ASN 16509**
6. Rule condition example:
7. * **Field:** AS Num
   * **Operator:** equals
   * **Value:** 16509 (AWS ASN)

**Expression preview example:** (ip.geoip.asnum eq 16509)

1. **Action:** Block (or Challenge first if testing)
2. Save

This rule blocks requests from AWS data-center IPs, a common source of automated spam traffic.

> Cloudflare gives powerful edge-level control. However, it requires tuning. If you want automatic VPN & data-center filtering with no manual rules, OOPSpam is easier.

## **Best Practice: Use Both Layers if Possible**

For the best results:

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    border: 2px solid black;
    padding: 10px;
    text-align: left;
  }
  th {
    background-color: #f9f9f9;
    font-weight: bold;
  }
  td:first-child {
    font-weight: bold;
  }
</style>

<table>
  <thead>
    <tr>
      <th>Layer</th>
      <th>Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Cloudflare WAF</td>
      <td>Blocks anonymous networks before they reach WordPress</td>
    </tr>
    <tr>
      <td>OOPSpam</td>
      <td>Advanced form-level filtering + ML scanning + rate limiting</td>
    </tr>
  </tbody>
</table>

This combination [stops automated abuse](https://www.oopspam.com/blog/4-ways-to-protect-your-metform-from-spam) and human-assisted spam.

## **Final thoughts**

As bots adopt anonymous networks and automation tools, advanced filtering is necessary. Use OOPSpam for reliable plug-and-play protection, and add Cloudflare Firewall Rules if you need deeper control at the network edge. This simple configuration protects your forms, keeps your inbox clean, and preserves legitimate leads.
