---
layout: post
title: How to Block VPN and Data Center IP Submissions in eForm
date: 2026-11-04T15:00:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_eform_vpn_dc.png
description: Block VPN and data center IP submissions in eForm with oopspam's
  IP Filtering or Cloudflare rules. Stop survey, quiz and form spam in
  minutes.
tags:
  - eForm
  - Cloudflare
---
eForm has no setting to block VPN or data center IP addresses. The fastest fix is the oopspam Anti-Spam plugin (that's us 👋). Install it, turn on eForm protection, then enable **Block VPNs** and **Block Cloud Providers** in the **IP Filtering** tab. For a manual, network-level option, create Cloudflare custom rules that block hosting provider ASNs and Tor traffic.

## **Why VPN and Data Center IPs Are a Problem for eForm**

[eForm](https://eform.live/) powers quizzes, surveys, cost estimators, payment forms and registrations. Bots that fill these forms skew results, take leaderboard spots and create fake accounts.

Most automated abuse comes from two sources:

* **Data centers and cloud providers.** Bots run on servers at AWS, Google Cloud, DigitalOcean, Hetzner and similar hosts. Real people rarely take a survey from a server.
* **VPNs and proxies.** Spammers use them to hide their location and switch IP addresses between attempts.

eForm's [per-IP submission limit](https://eform.live/fsqm/form-submission-related/limiting-eform-submissions/) helps against one IP submitting many times. It doesn't help when a bot switches to a fresh cloud or VPN IP for every entry. Blocking by IP origin closes that gap.

> Not sure where a suspicious IP comes from? Paste it into [IP Reputation Check](https://ipreputationcheck.com/) to see if it belongs to a VPN or data center.

## **Method 1: Block VPN and Cloud IPs with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports eForm natively from version 1.2.87. It checks every submission on the server before eForm saves it. There is no [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and no change to your forms.

### **Step 1: Install the Plugin**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

### **Step 2: Add Your API Key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. In WordPress, go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

### **Step 3: Activate eForm Protection**

Scroll to the **eForm Form Builder** section and check **Activate Spam Protection**. This covers every eForm form on your site.

![Turn on Activate Spam Protection in the eForm Form Builder section](/blog/assets/posts/eform-forms-section.png "Turn on Activate Spam Protection in the eForm Form Builder section")

### **Step 4: Enable IP Filtering**

Open the **IP Filtering** tab. You'll see two toggles:

* **Block Cloud Providers:** blocks submissions from 1,500+ known cloud providers, such as AWS, Google Cloud and Azure. This is the safer, high-impact setting. Turn it on first.
* **Block VPNs:** blocks submissions from known VPN services. Use it with care, because some real visitors use a personal VPN for privacy.

Click **Save Changes**.

![Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png "Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab")

### **Step 5: Turn On Trust Proxy Headers (If You Use Cloudflare or Another Proxy)**

IP filtering only works if oopspam sees the visitor's real IP address. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Step 6: Test Your Form**

Connect to a VPN and submit an eForm form. The visitor sees the spam message on the form. Set a custom message in the **eForm Spam Message** field if you want to explain the block, for example "Please turn off your VPN and try again."

![Custom spam message shown on a blocked eForm submission](/blog/assets/posts/eform-spam-message.png "Custom spam message shown on a blocked eForm submission")

Then open **Form Spam Entries** in WordPress. The entry should show VPN or cloud provider as the reason. If a real visitor was blocked, mark the entry as not spam. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Review blocked eForm submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Review blocked eForm submissions in Form Spam Entries")

### **Step 7: Add Extra Layers *(Optional)***

* **Rate limiting:** [cap submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-eform) per IP or email per hour.
* **Country filtering:** reject submissions from countries you don't serve. See [How to block countries in eForm](https://www.oopspam.com/blog/how-to-block-countries-in-eform).

## **Method 2: Block VPN and Cloud IPs with Cloudflare**

If your site runs behind [Cloudflare](https://www.cloudflare.com/), you can block traffic at the network edge with custom rules that target [ASNs](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) (Autonomous System Numbers). An ASN identifies the network that owns an IP range, such as a cloud host.

![Create a Cloudflare custom rule to block hosting provider ASNs](/blog/assets/posts/security-cloudflare-block-asn.png "Create a Cloudflare custom rule to block hosting provider ASNs")

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/), go to **Security > Security Rules**.
2. Click **Create rule**, then select **Custom rules**.
3. Name the rule, for example "Block hosting providers."
4. Click **Edit expression** and add the ASNs you want to block:

    ```
    (ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
    or (ip.src.country eq "T1")
    ```

    This covers DigitalOcean (14061), AWS (16509, 14618), Google Cloud (396982), Linode/Akamai (63949), Hetzner (24940), OVH (16276) and Vultr (20473). **T1** is Cloudflare's label for [Tor traffic](https://developers.cloudflare.com/fundamentals/reference/http-headers/).

5. Choose **Block**, then click **Deploy**.

This rule applies to your whole site. eForm sends submissions to WordPress's shared AJAX endpoint, `/wp-admin/admin-ajax.php`, so you can scope the rule to form traffic by wrapping the conditions in parentheses and adding the path:

```
((ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
or (ip.src.country eq "T1"))
and http.request.uri.path eq "/wp-admin/admin-ajax.php"
```

Two things to know:

* **Other plugins use the same endpoint.** The rule also blocks their AJAX requests from those networks, such as live search or cart updates. That's rarely a problem for hosting providers, but test your site after deploying.
* **Use Block, not Managed Challenge.** AJAX requests can't display a challenge page, so a challenged submission simply fails without a clear message.

### **Limitations**

* **Manual upkeep.** Hosting networks change, so you must update ASNs yourself.
* **No commercial VPN coverage.** Most VPN providers rent space across many networks.
* **Rule limits.** Cloudflare's Free plan allows only five custom rules.
* **False positives.** Some legitimate businesses route traffic through cloud servers.

Cloudflare works best alongside oopspam, not instead of it. See Cloudflare's [custom rules documentation](https://developers.cloudflare.com/waf/custom-rules/) for more options.

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

  .post table.oopspam-table {
    display: table;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th></th>
      <th>oopspam</th>
      <th>Cloudflare</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Setup time</td><td>About 5 minutes</td><td>15 to 30 minutes</td></tr>
    <tr><td>Maintenance</td><td>Automatic</td><td>Manual ASN updates</td></tr>
    <tr><td>VPN detection</td><td>Yes</td><td>Tor only (T1)</td></tr>
    <tr><td>Data center blocking</td><td>Yes, 1,500+ cloud providers</td><td>Only ASNs you add</td></tr>
    <tr><td>Scope</td><td>eForm submissions only</td><td>Whole site, unless scoped</td></tr>
    <tr><td>Logs with block reason</td><td>Yes, in WordPress</td><td>Cloudflare security events</td></tr>
  </tbody>
</table>

## **FAQ**

### **Does eForm block VPNs on its own?**

No. eForm can limit submissions per IP address, but it doesn't check whether that IP belongs to a VPN or data center. Use oopspam or Cloudflare for that.

### **Will blocking VPNs stop real visitors?**

It can. Some people use a VPN for privacy or work. Start with Block Cloud Providers, add Block VPNs only if spam continues, and review your logs for false positives.

### **Does IP filtering work if my site uses Cloudflare?**

Yes, as long as you turn on **Trust proxy headers** in oopspam's **Misc** tab. Otherwise oopspam sees Cloudflare's IP address instead of the visitor's.

## **Final Thoughts**

Bots that spam eForm mostly run on cloud servers and VPNs. oopspam blocks both with two toggles and no rule maintenance. Cloudflare adds a network-level layer for technical teams. Use one, or both for full coverage.

## Related guides

- [6 Ways to Protect Your eForm from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-eform-from-spam)
- [How to Block Countries in eForm](https://www.oopspam.com/blog/how-to-block-countries-in-eform)
- [How to Limit Form Submissions in eForm](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-eform)
