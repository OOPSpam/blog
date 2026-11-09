---
layout: post
title: How to Block VPN and Data Center IP Submissions in Meta Box Frontend Submission Forms
date: 2026-11-09T10:30:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_metabox_vpn_dc.png
description: Block VPN and data center IP submissions on Meta Box Frontend
  Submission forms with oopspam's IP Filtering or Cloudflare rules.
tags:
  - Meta Box
  - Cloudflare
---
Meta Box has no setting to block VPN or data center IP addresses. The fastest fix is the oopspam Anti-Spam plugin (that's us 👋). Install it, turn on Meta Box Frontend Submission protection, then enable **Block Cloud Providers** and, if needed, **Block VPNs** in the **IP Filtering** tab. For a manual, network-level option, create Cloudflare custom rules that block hosting provider ASNs and Tor traffic.

## **Why VPN and Data Center IPs Are a Problem for Meta Box Forms**

[Meta Box](https://metabox.io/)'s **MB Frontend Submission** extension lets visitors submit posts, listings and other content from the front end. Bots that hit these forms fill your database, your review queue and, if posts publish straight away, your live site.

Most automated abuse comes from two sources:

* **Data centers and cloud providers.** Bots run on servers at AWS, Google Cloud, DigitalOcean, Hetzner and similar hosts. Real people rarely submit a listing from a server.
* **VPNs and proxies.** Spammers use them to hide their location and switch IP addresses between attempts.

Meta Box doesn't check where a submission comes from. Blocking by IP origin closes that gap, even for a bot with a fresh IP and no spam history.

> Not sure where a suspicious IP comes from? Paste it into [IP Reputation Check](https://ipreputationcheck.com/) to see if it belongs to a VPN or data center.

## **Method 1: Block VPN and Cloud IPs with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports Meta Box Frontend Submission natively. It checks every submission on the server before Meta Box saves it. There is no [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and no change to your field groups.

### **Step 1: Install the Plugin**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

### **Step 2: Add Your API Key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. In WordPress, go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

### **Step 3: Activate Meta Box Protection**

Scroll to the **Meta Box Frontend Submission** section and turn on **Activate Spam Protection**. This covers every Meta Box frontend form on your site.

![Turn on Activate Spam Protection in the Meta Box Frontend Submission section](/blog/assets/posts/metabox-frontend-submission-section.png "Turn on Activate Spam Protection in the Meta Box Frontend Submission section")

### **Step 4: Enable IP Filtering**

Open the **IP Filtering** tab. You'll see two toggles:

* **Block Cloud Providers:** blocks submissions from 1,500+ known cloud providers, such as AWS, Google Cloud and Azure. This is the safer, high-impact setting. Turn it on first.
* **Block VPNs:** blocks submissions from known VPN services. Use it with care, because some real visitors use a personal VPN for privacy.

Click **Save Changes**.

![Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png "Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab")

### **Step 5: Turn On Trust Proxy Headers (If You Use Cloudflare or Another Proxy)**

IP filtering only works if oopspam sees the visitor's real IP address. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Step 6: Set the Spam Message and Test**

Write the message blocked visitors see in the **Meta Box Frontend Submission Spam Message** field, for example: "We couldn't accept your submission. If you're using a VPN, turn it off and try again, or email us at name@example.com."

The message only shows when the form uses Ajax. Turn on **Enable ajax submission** in the Submission Form block settings, or add `ajax="true"` to the shortcode. Without it, a blocked visitor lands on your **404 Not Found** page.

Then connect to a VPN and submit the form. The form is replaced by your spam message.

![The Meta Box Frontend Submission Spam Message shown on a blocked submission](/blog/assets/posts/metabox-frontend-spam-message.png "The Meta Box Frontend Submission Spam Message shown on a blocked submission")

Open **Form Spam Entries** in WordPress. The entry should show VPN or cloud provider as the reason. If a real visitor was blocked, mark the entry as not spam. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Review blocked Meta Box submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Review blocked Meta Box submissions in Form Spam Entries")

### **Step 7: Add Extra Layers *(Optional)***

* **Rate limiting:** [cap submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-meta-box-frontend-submission) per IP or email per hour.
* **Country filtering:** reject submissions from countries you don't serve. See [How to block countries in Meta Box Frontend Submission forms](https://www.oopspam.com/blog/how-to-block-countries-in-meta-box-frontend-submission-forms).

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

This rule applies to your whole site. To scope it to your form, add the path the form posts to. Where that is depends on how the form submits:

* **With Ajax on** (needed for oopspam's spam message), the form posts to `/wp-admin/admin-ajax.php`.
* **With Ajax off**, the form posts back to the page it sits on, for example `/submit-listing/`.

For an Ajax form, wrap the conditions in parentheses and add the path:

```
((ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
or (ip.src.country eq "T1"))
and http.request.uri.path eq "/wp-admin/admin-ajax.php"
```

For a non-Ajax form, use your page path and add `and http.request.method eq "POST"`, so blocked networks can still read the page but can't submit it.

Three things to know:

* **Other plugins use the same AJAX endpoint.** The Ajax version also blocks their requests from those networks, such as live search or cart updates. That's rarely a problem for hosting providers, but test your site after deploying.
* **Cloudflare can't target one form.** The form details travel in the request body, which custom rules don't read.
* **Use Block, not Managed Challenge.** AJAX requests can't display a challenge page, so a challenged submission simply fails.

### **Limitations**

* **Manual upkeep.** Hosting networks change, so you must update ASNs yourself.
* **No commercial VPN coverage.** Most VPN providers rent space across many networks.
* **Rule limits.** Cloudflare's Free plan allows only five custom rules.
* **False positives.** Some legitimate businesses route traffic through cloud servers.

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
    <tr><td>Scope</td><td>Meta Box forms only</td><td>Whole site, one page path or all of admin-ajax.php</td></tr>
    <tr><td>Logs with block reason</td><td>Yes, in WordPress</td><td>Cloudflare security events</td></tr>
  </tbody>
</table>

## **FAQ**

### **Does Meta Box block VPNs on its own?**

No. Meta Box doesn't check whether a submission comes from a VPN or data center. Use oopspam or Cloudflare for that.

### **Will blocking VPNs stop real visitors?**

It can. Some people use a VPN for privacy or work. Start with Block Cloud Providers, add Block VPNs only if spam continues, and review your logs for false positives.

### **Does IP filtering work if my site uses Cloudflare?**

Yes, as long as you turn on **Trust proxy headers** in oopspam's **Misc** tab. Otherwise oopspam sees Cloudflare's IP address instead of the visitor's.

### **Why does a blocked visitor see a 404 page?**

The form isn't using Ajax. Turn on **Enable ajax submission** in the Submission Form block, or add `ajax="true"` to the shortcode, so visitors see your spam message instead.

## **Final Thoughts**

Bots that spam Meta Box frontend forms mostly run on cloud servers and VPNs. oopspam blocks both with two toggles and no rule upkeep. Cloudflare adds a network-level layer for technical teams. Use one, or both for full coverage.

## Related guides

- [5 Ways to Protect Your Meta Box Frontend Submission Forms from Spam](https://www.oopspam.com/blog/5-ways-to-protect-your-meta-box-frontend-submission-forms-from-spam)
- [How to Block Countries in Meta Box Frontend Submission Forms](https://www.oopspam.com/blog/how-to-block-countries-in-meta-box-frontend-submission-forms)
- [How to Limit Form Submissions in Meta Box Frontend Submission](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-meta-box-frontend-submission)
