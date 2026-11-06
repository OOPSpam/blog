---
layout: post
title: How to Limit Form Submissions in Spectra Forms
date: 2026-11-06T15:45:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_spectra_limit_submissions.png
description: Spectra can't limit submissions per IP, email or hour. Add rate
  limiting to Spectra Forms and Spectra Pro Register with oopspam or
  Cloudflare.
tags:
  - Spectra
  - Cloudflare
---
Spectra has no setting to limit form submissions. The Form block and the Spectra Pro Register block accept as many entries as anyone sends, from the same IP or email. To cap how often one visitor can submit, add rate limiting with the oopspam Anti-Spam plugin (that's us 👋), which sets hourly limits per IP and per email for both blocks. Cloudflare's rate limiting rules add a coarser limit at the network edge.

[Spectra](https://wpspectra.com/) adds a **Form** block for contact and lead forms, and Spectra Pro adds a **Register** block for user sign-ups. Without a limit, one bot can send hundreds of messages or create hundreds of accounts in minutes. This guide covers each option, step by step.

## **What Spectra Has Built In**

Spectra's [Form block](https://wpspectra.com/docs/forms-block/) has no submission limit of any kind: no cap per IP, per email, per hour or in total. The [Register block](https://wpspectra.com/docs/registration-form-block/) can't limit sign-ups either, though two things make floods less harmful:

* **WordPress refuses duplicate accounts.** A second sign-up with the same username or email fails, so one address can only create one account. A bot just uses a new address each time.
* **Registration can be switched off.** The Register block only works while **Anyone can register** is on under **Settings > General > Membership**. Turn it off when you don't need open sign-ups.

For real rate limiting, add it on top.

## **Method 1: Rate Limit Submissions per IP and Email with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports Spectra Forms and Spectra Pro Register natively. It checks each submission on the server and blocks visitors who go over your hourly limit, on both blocks.

### **How to Set It Up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Scroll to the **Spectra Forms and Spectra Pro Register** section and turn on **Activate Spam Protection**.

![Turn on Activate Spam Protection in the Spectra Forms and Spectra Pro Register section](/blog/assets/posts/spectra-forms-section.png "Turn on Activate Spam Protection in the Spectra Forms and Spectra Pro Register section")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**. Then set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears the table it uses to track submissions.

Click **Save Changes**.

![Turn on rate limiting and set limits per IP and email](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn on rate limiting and set limits per IP and email")

A good starting point is 3 submissions per hour per IP and per email, a 24-hour block and a 48-hour clean-up. Registration needs even less: a real person signs up once.

If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, all visitors share the proxy's IP and could hit the limit together.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Set the Failure Message and Test**

When oopspam blocks a Form block submission, Spectra shows the form's own **failure message**. Select the Form block, open its **General** settings and edit the **Error Message Text** so real visitors know what to do, for example: "We couldn't send your message. Please try again later or email us at name@example.com."

The Register block shows oopspam's **Spectra Spam Message** instead, so set that too.

Then submit the form a few more times than your limit allows. The blocked attempt shows your failure message.

![The Spectra failure message shown on a blocked submission](/blog/assets/posts/spectra-forms-failure-message.png "The Spectra failure message shown on a blocked submission")

Check **Form Spam Entries** in WordPress to see blocked attempts and the reason ([form entries guide](https://help.oopspam.com/wordpress/form-entries/)).

### **Add More Filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other filters:

* **VPN and data center blocking:** see [How to block VPN and data center IP submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-spectra-forms).
* **Country filtering:** see [How to block countries in Spectra Forms](https://www.oopspam.com/blog/how-to-block-countries-in-spectra-forms).
* **Disposable email blocking:** see [How to block disposable email addresses in WordPress forms](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms). Throwaway addresses are how bots get around per-email limits and WordPress's one-account-per-email rule.

## **Method 2: Add a Cloudflare Rate Limiting Rule**

If your site runs behind [Cloudflare](https://www.cloudflare.com/), a [rate limiting rule](https://developers.cloudflare.com/waf/rate-limiting-rules/) can stop bursts of requests at the network edge, before they reach WordPress. Both Spectra blocks post to `/wp-admin/admin-ajax.php`, so that's the path to limit.

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/), go to **Security > Security Rules**.
2. Click **Create rule**, then select **Rate limiting rules**.
3. Name the rule, for example "Limit form submissions."
4. Under **When incoming requests match**, set **URI Path** to **equals** `/wp-admin/admin-ajax.php`.
5. Set the rate, for example 5 requests per 10 seconds per IP.
6. Choose **Block** as the action, then click **Deploy**.

![Spectra Form submissions go to admin-ajax.php with the action uagb_process_forms](/blog/assets/posts/spectra-form-submit-network.png "Spectra Form submissions go to admin-ajax.php with the action uagb_process_forms")

Three things to know:

* **It's short-term only on the Free plan.** You get one rate limiting rule, a 10-second counting period and a 10-second block. That stops fast floods, not a bot that sends one entry a minute.
* **It counts all AJAX traffic.** Other plugins use `admin-ajax.php` too, such as live search or cart updates. Set the limit high enough that normal browsing never hits it, and test after deploying.
* **It doesn't know about emails.** Cloudflare counts by IP only, so it can't stop one email address from submitting again from a new IP.

Use Cloudflare for burst protection and oopspam for the hourly per-IP and per-email limits.

## **Which Method Should You Use?**

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
      <th>Goal</th>
      <th>Best method</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Stop one visitor from flooding a contact form</td><td>oopspam rate limiting per IP</td></tr>
    <tr><td>Stop repeat submissions from one email address</td><td>oopspam rate limiting per email</td></tr>
    <tr><td>Stop fake sign-ups on the Register block</td><td>oopspam rate limiting, plus disposable email blocking</td></tr>
    <tr><td>Stop very fast bursts before they reach WordPress</td><td>Cloudflare rate limiting rule</td></tr>
    <tr><td>Close registration when you don't need it</td><td>Turn off Anyone can register in WordPress</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can Spectra limit form submissions on its own?**

No. The Form block has no submission limits, and the Register block only relies on WordPress refusing duplicate usernames and emails. Use oopspam or Cloudflare to add limits.

### **Does rate limiting work on the Spectra Pro Register block?**

Yes. oopspam's rate limits apply to both the Form block and the Register block once **Activate Spam Protection** is on.

### **Will rate limiting block real visitors?**

Rarely, if your limits are sensible. Three submissions per hour is plenty for most contact forms. Review **Form Spam Entries** for false positives.

### **Why don't visitors see my Spectra Spam Message?**

On the Form block, Spectra always shows the block's own **Error Message Text** when a submission is blocked, so edit that message in the Form block's settings. The Spectra Pro Register block does show the Spectra Spam Message.

## **Final Thoughts**

Spectra doesn't limit submissions, so add the limit yourself. oopspam's hourly per-IP and per-email limits cover both the Form block and the Register block. A Cloudflare rate limiting rule adds burst protection at the edge. Together they keep your forms open to real people and closed to floods.

## Related guides

- [5 Ways to Protect Your Spectra Forms from Spam](https://www.oopspam.com/blog/5-ways-to-protect-your-spectra-forms-from-spam)
- [How to Block Countries in Spectra Forms](https://www.oopspam.com/blog/how-to-block-countries-in-spectra-forms)
- [How to Block VPN and Data Center IP Submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-spectra-forms)
