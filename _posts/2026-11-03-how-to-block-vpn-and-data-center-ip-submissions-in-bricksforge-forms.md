---
layout: post
title: How to Block VPN and Data Center IP Submissions in Bricksforge Forms
date: 2026-11-03T15:00:00.000+04:00
last_modified_at: 2026-11-04T10:21:00.000Z
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_bricksforge_vpn_dc.jpg
description: Block VPN and data center IP submissions in Bricksforge Pro Forms
  with oopspam's IP Filtering or Cloudflare rules. Stop bot spam in minutes.
tags:
  - Bricksforge Forms
  - Cloudflare
---
Bricksforge Pro Forms has no setting to block VPN or data center IP addresses. The fastest fix is the oopspam Anti-Spam plugin (that's us 👋). Install it, turn on Bricksforge Forms protection, then enable **Block VPNs** and **Block Cloud Providers** in the **IP Filtering** tab. For a manual, network-level option, create Cloudflare custom rules that block hosting provider ASNs and Tor traffic.

## **Why VPN and Data Center IPs Are a Problem for Bricksforge Forms**

[Bricksforge](https://bricksforge.io/) is an add-on for the [Bricks](https://bricksbuilder.io/) site builder. Its [Pro Forms](https://docs.bricksforge.io/en/elements/pro-forms/) element can create posts, register users, call webhooks and take Stripe or Mollie payments. One bot submission can publish a junk post, create a fake account or push garbage into your CRM.

Most automated form abuse comes from two sources:

* **Data centers and cloud providers.** Bots run on servers at AWS, Google Cloud, DigitalOcean, Hetzner and similar hosts. Real visitors rarely fill in a contact form from a server.
* **VPNs and proxies.** Spammers use them to hide their location and switch IP addresses between attempts.

Pro Forms already includes reCAPTCHA v3, hCaptcha, Cloudflare Turnstile, honeypot fields and duplicate limits. These [stop simple bots](https://www.oopspam.com/blog/7-ways-to-protect-your-bricksforge-forms-from-spam). None of them check where an IP address comes from. A fresh data center IP with no spam history passes straight through. Blocking by IP origin closes that gap.

> Not sure where a suspicious IP comes from? Paste it into [IP Reputation Check](https://ipreputationcheck.com/) to see if it belongs to a VPN or data center.

## **Method 1: Block VPN and Cloud IPs with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports Bricksforge Pro Forms natively from version 1.2.87. It checks every submission on the server before Bricksforge runs any action, so a blocked entry never creates a post, user or webhook call. There is no [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) and no change to your forms.

### **Step 1: Install the Plugin**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it. Make sure you run version 1.2.87 or later.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

### **Step 2: Add Your API Key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

In WordPress, go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

### **Step 3: Activate Bricksforge Forms Protection**

Scroll to the **Bricksforge Forms** section and check **Activate Spam Protection**. This covers every Pro Form on your site. If you also use the native Bricks Form element, turn on the **Bricks Forms** section too.

![Check Activate Spam Protection in the Bricksforge Forms section](/blog/assets/posts/bricksforge-forms-section.png "Check Activate Spam Protection in the Bricksforge Forms section")

### **Step 4: Enable IP Filtering**

Open the **IP Filtering** tab. You'll see two toggles:

* **Block Cloud Providers:** blocks submissions from 1,500+ known cloud providers, such as AWS, Google Cloud and Azure. This is the safer, high-impact setting. Turn it on first.
* **Block VPNs:** blocks submissions from known VPN services. Use it with care, because some real visitors use a personal VPN for privacy.

Click **Save Changes**. oopspam now filters your Pro Forms automatically.

![Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png "Turn on Block VPNs and Block Cloud Providers in the IP Filtering tab")

### **Step 5: Turn On Trust Proxy Headers (If You Use Cloudflare or Another Proxy)**

IP filtering only works if oopspam sees the visitor's real IP address. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, every submission appears to come from the proxy's own network.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Step 6: Test Your Form**

Connect to a VPN, or open your site from a cloud server, and submit a Pro Form. The visitor sees the spam message on the form. Set a custom message in oopspam if you want to explain the block.

![Spam message shown on a blocked Bricksforge Pro Form submission](/blog/assets/posts/bricksforge-forms-spam.png "Spam message shown on a blocked Bricksforge Pro Form submission")

Then open **Form Spam Entries** in WordPress. The entry should show VPN or cloud provider as the reason. If a real visitor was blocked, mark the entry as not spam. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Review blocked Bricksforge submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Review blocked Bricksforge submissions in Form Spam Entries")

### **Step 7: Add Extra Layers *(Optional)***

Spammers often combine tactics. Two more oopspam settings help:

* **Rate Limiting:** [cap submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-bricksforge-forms) per IP or email within a set time window.
* **Country Filtering:** reject submissions from countries you don't serve. See [How to block countries in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-countries-in-bricksforge-forms).

![Rate limiting settings in oopspam](/blog/assets/posts/enabled-rate-limiting-settings.png "Rate limiting settings in oopspam")

## **Method 2: Block VPN and Cloud IPs with Cloudflare**

If your site runs behind [Cloudflare](https://www.cloudflare.com/), you can block traffic at the network edge before it reaches WordPress. You do this with custom rules that target [ASNs](https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/) (Autonomous System Numbers). An ASN identifies the network that owns an IP range, such as a cloud host.

![Create a Cloudflare custom rule to block hosting provider ASNs](/blog/assets/posts/security-cloudflare-block-asn.png "Create a Cloudflare custom rule to block hosting provider ASNs")

### **How to Set It Up**

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/), go to **Security > Security Rules**.
2. Click **Create rule**, then select **Custom rules**.
3. Name the rule, for example "Block hosting providers on forms."
4. Click **Edit expression** and add the ASNs you want to block. Example:

    ```
    (ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
    or (ip.src.country eq "T1")
    ```

    This covers DigitalOcean (14061), AWS (16509, 14618), Google Cloud (396982), Linode/Akamai (63949), Hetzner (24940), OVH (16276) and Vultr (20473). The country code **T1** is Cloudflare's label for [Tor traffic](https://developers.cloudflare.com/fundamentals/reference/http-headers/).

5. To protect only your forms, scope the rule to the URL Pro Forms submit to: `/wp-json/bricksforge/v1/form_submit`. Scoping to the page URL isn't enough, because bots can post straight to this endpoint. Wrap the ASN rule in parentheses and add the path, so the path applies to every condition:

    ```
    ((ip.src.asnum in {14061 16509 14618 396982 63949 24940 16276 20473})
    or (ip.src.country eq "T1"))
    and http.request.uri.path eq "/wp-json/bricksforge/v1/form_submit"
    ```

    You can confirm the path in your browser's developer tools: submit a test form and check the **Network** tab.

    ![Pro Forms submit to /wp-json/bricksforge/v1/form_submit, shown in the browser Network tab](/blog/assets/posts/bricksforge-form-submit-network.png "Pro Forms submit to /wp-json/bricksforge/v1/form_submit, shown in the browser Network tab")

6. Choose an action. **Block** stops the request. **Managed Challenge** filters bots while letting most humans through.
7. Click **Deploy**.

See Cloudflare's [custom rules documentation](https://developers.cloudflare.com/waf/custom-rules/) for more options.

### **Limitations**

* **Manual upkeep.** Hosting networks change. You must track and update ASNs yourself.
* **No commercial VPN coverage.** Most VPN providers rent space across many networks, so ASN rules miss much of that traffic.
* **Rule limits.** Cloudflare's Free plan allows only five custom rules.
* **False positives.** Some legitimate businesses route traffic through cloud servers.

This method suits developers who have time to maintain rules. It works best alongside oopspam, not instead of it. Cloudflare cuts server load. oopspam handles submission-level checks, like message content and email reputation, that a firewall can't see.

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
      <th>Cloudflare</th>
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
      <td>Yes, 1,500+ cloud providers</td>
      <td>Only ASNs you add</td>
    </tr>
    <tr>
      <td>Checks content and email reputation</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Logs with block reason</td>
      <td>Yes, in WordPress</td>
      <td>Cloudflare security events</td>
    </tr>
    <tr>
      <td>Requires Cloudflare</td>
      <td>No</td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## **Balance Security with Real Visitors**

* **Start with Block Cloud Providers.** It carries the lowest risk, because real people rarely submit forms from a server.
* **Turn on Block VPNs only if spam continues.** Privacy-focused visitors and remote workers may use VPNs.
* **Review your logs weekly.** Release any false positives and adjust your settings.
* **Watch high-impact forms closely.** Registration, post-creation and payment forms deserve stricter rules than a newsletter signup.

## **FAQ**

### **Does Bricksforge block VPNs on its own?**

No. Pro Forms has CAPTCHA, honeypot and duplicate controls, but no IP origin checks. You need a plugin such as oopspam or a firewall such as Cloudflare.

### **Will blocking VPNs stop real visitors?**

It can. Some people use a VPN for privacy or work. Start with Block Cloud Providers, then add Block VPNs only if spam continues, and review your logs for false positives.

### **What's the difference between a VPN IP and a data center IP?**

A data center IP belongs to a hosting company such as AWS or DigitalOcean, where bots usually run. A VPN IP belongs to a VPN service that people use to hide their location. Many VPNs run on data center networks, so the two often overlap.

### **Does IP filtering work if my site uses Cloudflare?**

Yes, as long as you turn on **Trust proxy headers** in oopspam's **Misc** tab. Otherwise oopspam sees Cloudflare's IP address instead of the visitor's.

### **Does oopspam slow down my forms?**

No. oopspam checks submissions on the server after the visitor clicks submit. It adds no CAPTCHA and no script to your page.

## **Final Thoughts**

Bots that spam Bricksforge forms mostly run on cloud servers and VPNs. Blocking those sources stops a large share of fake submissions before Pro Forms creates a post, user or webhook call.

oopspam is the simplest fix: two toggles and no rule maintenance. Cloudflare adds a network-level layer for technical teams. Use one, or use both for full coverage.

Using the native Bricks Form element? See [How to block VPN and data center IP submissions in Bricks Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricks-forms).

## Related guides

- [7 Ways to Protect Your Bricksforge Forms from Spam](https://www.oopspam.com/blog/7-ways-to-protect-your-bricksforge-forms-from-spam)
- [How to Block Countries in Bricksforge Forms?](https://www.oopspam.com/blog/how-to-block-countries-in-bricksforge-forms)
- [How to Limit Form Submissions in Bricksforge Forms?](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-bricksforge-forms)
