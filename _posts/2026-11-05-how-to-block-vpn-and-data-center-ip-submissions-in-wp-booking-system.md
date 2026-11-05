---
layout: post
title: How to Block VPN and Data Center IP Submissions in WP Booking System
date: 2026-11-05T12:30:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_wpbs_vpn_dc.png
description: Block VPN and data center IP bookings in WP Booking System with
  oopspam's IP Filtering or Cloudflare rules. Stop fake bookings in minutes.
tags:
  - WP Booking System
  - Cloudflare
---
WP Booking System has no setting to block VPN or data center IP addresses. The fastest fix is the oopspam Anti-Spam plugin (that's us 👋). Install it, turn on WP Booking System protection, then enable **Block Cloud Providers** and, if needed, **Block VPNs** in the **IP Filtering** tab. For a manual, network-level option, create Cloudflare custom rules that block hosting provider ASNs and Tor traffic.

## **Why VPN and Data Center IPs Are a Problem for WP Booking System**

[WP Booking System](https://www.wpbookingsystem.com/) takes bookings for rentals, rooms, tours and appointments. A fake booking costs real money: it can mark dates as unavailable, trigger confirmation emails to fake addresses and waste time on follow-up.

Most automated abuse comes from two sources:

* **Data centers and cloud providers.** Bots run on servers at AWS, Google Cloud, DigitalOcean, Hetzner and similar hosts. Real guests rarely book a holiday from a server.
* **VPNs and proxies.** Spammers use them to hide their location and switch IP addresses between attempts.

WP Booking System doesn't check where a booking comes from. Blocking by IP origin closes that gap, even for a bot with a fresh IP and no spam history.

> Not sure where a suspicious IP comes from? Paste it into [IP Reputation Check](https://ipreputationcheck.com/) to see if it belongs to a VPN or data center.

## **Method 1: Block VPN and Cloud IPs with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports WP Booking System natively. It checks every booking on the server before WP Booking System saves it. There is no [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and no change to your forms.

### **Step 1: Install the Plugin**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

### **Step 2: Add Your API Key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. In WordPress, go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

### **Step 3: Activate WP Booking System Protection**

Scroll to the **WP Booking System** section and check **Activate Spam Protection**. This covers every WP Booking System form on your site.

![Turn on Activate Spam Protection in the WP Booking System section](/blog/assets/posts/wpbs-forms-section.png "Turn on Activate Spam Protection in the WP Booking System section")

### **Step 4: Enable IP Filtering**

Open the **IP Filtering** tab. You'll see two toggles:

* **Block Cloud Providers:** blocks bookings from 1,500+ known cloud providers, such as AWS, Google Cloud and Azure. This is the safer, high-impact setting. Turn it on first.
* **Block VPNs:** blocks bookings from known VPN services. Use it with care. Travelers often book from a work VPN or a privacy VPN on hotel Wi-Fi.

Click **Save Changes**.

![Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png "Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab")

### **Step 5: Turn On Trust Proxy Headers (If You Use Cloudflare or Another Proxy)**

IP filtering only works if oopspam sees the guest's real IP address. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Step 6: Test Your Form**

Connect to a VPN and submit a booking. The guest sees the spam message on the form. Set a custom message in the **WP Booking System Spam Message** field if you want to explain the block, for example "Please turn off your VPN and try again, or email us to book."

![Custom spam message shown on a blocked WP Booking System booking](/blog/assets/posts/wpbs-spam-message.png "Custom spam message shown on a blocked WP Booking System booking")

Then open **Form Spam Entries** in WordPress. The booking should show VPN or cloud provider as the reason. If a real guest was blocked, mark the entry as not spam. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Review blocked bookings in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Review blocked bookings in Form Spam Entries")

### **Step 7: Add Extra Layers *(Optional)***

* **Rate limiting:** [cap bookings](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wp-booking-system) per IP or email per hour.
* **Country filtering:** reject bookings from countries you don't serve. See [How to block countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system).

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

This rule applies to your whole site. WP Booking System sends bookings to WordPress's shared AJAX endpoint, `/wp-admin/admin-ajax.php`, with the action `wpbs_submit_form`. To scope the rule to that endpoint, wrap the conditions in parentheses and add the path:

```
((ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
or (ip.src.country eq "T1"))
and http.request.uri.path eq "/wp-admin/admin-ajax.php"
```

Three things to know:

* **Other requests use the same endpoint.** WP Booking System also uses it for price calculation, date checks and coupons, and other plugins use it too. The rule blocks all of them from those networks. That's rarely a problem for hosting providers, but test your booking flow after deploying.
* **Cloudflare can't target the booking action alone.** The action name travels in the request body, which custom rules don't read.
* **Use Block, not Managed Challenge.** AJAX requests can't display a challenge page, so a challenged booking simply fails without a clear message.

### **Limitations**

* **Manual upkeep.** Hosting networks change, so you must update ASNs yourself.
* **No commercial VPN coverage.** Most VPN providers rent space across many networks.
* **Rule limits.** Cloudflare's Free plan allows only five custom rules.
* **False positives.** Some companies route staff traffic through cloud servers, so a business traveler may be blocked.

Cloudflare works best alongside oopspam, not instead of it. See Cloudflare's [custom rules documentation](https://developers.cloudflare.com/waf/custom-rules/) for more options.

## **oopspam vs Cloudflare: Quick Comparison**

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
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
    <tr><td>Scope</td><td>Bookings only</td><td>Whole site, or all of admin-ajax.php</td></tr>
    <tr><td>Logs with block reason</td><td>Yes, in WordPress</td><td>Cloudflare security events</td></tr>
  </tbody>
</table>

## **FAQ**

### **Does WP Booking System block VPNs on its own?**

No. WP Booking System doesn't check whether a booking comes from a VPN or data center. Use oopspam or Cloudflare for that.

### **Will blocking VPNs stop real guests?**

It can. Travelers often use a VPN on public Wi-Fi or for work. Start with Block Cloud Providers, add Block VPNs only if spam continues, and review your logs for false positives.

### **Does IP filtering work if my site uses Cloudflare?**

Yes, as long as you turn on **Trust proxy headers** in oopspam's **Misc** tab. Otherwise oopspam sees Cloudflare's IP address instead of the guest's.

## **Final Thoughts**

Bots that send fake bookings mostly run on cloud servers and VPNs. oopspam blocks both with two toggles and no rule upkeep. Cloudflare adds a network-level layer for technical teams. Use one, or both for full coverage.

## Related guides

- [6 Ways to Protect Your WP Booking System from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-wp-booking-system-from-spam)
- [How to Block Countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system)
- [How to Limit Form Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wp-booking-system)
