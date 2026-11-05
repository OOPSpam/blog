---
layout: post
title: 6 Ways to Protect Your WP Booking System from Spam
date: 2026-11-05T14:00:00.000+04:00
author: daniella
hub: wordpress-forms
image: /blog/assets/posts/meta_wpbs_protect_spam.png
description: "Stop spam bookings in WP Booking System with 6 methods: the
  security token, Pending status, validated fields, reCAPTCHA, custom rules
  and oopspam."
tags:
  - WP Booking System
---
The best way to stop spam in WP Booking System is to layer protections. Start with the free built-in tools: keep booking pages out of the cache so the security token works, set new bookings to Pending, use validated and required fields, and add the Captcha field. Developers can add custom validation rules. Then add a server-side spam filter such as oopspam Anti-Spam (that's us 👋), which supports WP Booking System natively and catches what the built-in tools miss.

[WP Booking System](https://www.wpbookingsystem.com/) is a booking calendar plugin for WordPress. Holiday rentals, B&Bs, tour operators and appointment-based businesses use it to take bookings and payments. Spam costs more here than on a contact form. A fake booking can mark real dates as unavailable, send confirmation emails to fake addresses and bury real requests. This guide covers 6 ways to protect WP Booking System, ordered by setup effort: free built-in options first, then a server-side filter that catches what they miss.

## **Why Does WP Booking System Get Spam?**

WP Booking System's own docs say making a booking is too complex for spam bots ([reCAPTCHA guide](https://www.wpbookingsystem.com/documentation/setting-up-recaptcha/)). That's true for simple bots that click through the calendar. It isn't true for bots that skip the browser. Three facts shape your defense:

* **The booking is one request.** The form sends each booking to `/wp-admin/admin-ajax.php` with the action `wpbs_submit_form`. A bot that loads the page once can send that request directly, without touching the calendar. You need a server-side check.
* **Humans spam too.** Paid spammers solve any [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives). Content, IP and email checks stop them.
* **Friction costs bookings.** Every extra challenge on a booking form loses some real guests.

## **1. Keep the Built-In Security Token Working**

WP Booking System adds a security token to every booking request. It runs automatically, with nothing to configure, and stops bots that replay old requests.

Two things to know:

* **Caching can break the token.** If a caching plugin serves an old copy of the page, the token can expire and real guests may see an error. Exclude your booking pages from page caching.
* **There is no honeypot.** WP Booking System doesn't add a hidden trap field. Treat the token as a baseline, not your only defense.

## **2. Set New Bookings to Pending**

Edit your form and open **Form Options > General Options**. Set **Default Booking Status** to **Pending** ([docs](https://www.wpbookingsystem.com/documentation/form-options/general-options/)). Pending is the default. The only other option, Accepted, confirms every booking straight away, so check that nobody changed it.

Pending doesn't stop spam, but it stops spam from becoming a confirmed booking. Before you accept a booking, check three things: the email address looks real, the message makes sense, and the dates fit your normal guests.

![Default Booking Status set to Pending in the form's General Options](/blog/assets/posts/wpbs-default-booking-status.png "Default Booking Status set to Pending in the form's General Options")

## **3. Use Validated and Required Fields**

The [form builder](https://www.wpbookingsystem.com/documentation/form-builder/) has fields that check their own input:

* **Email** checks for a valid address.
* **Phone** checks for a valid number. Turn on **Enable Phone Number Stylised UI** under **Settings > Form** for live validation.
* **Number** accepts numbers only, which suits guest counts.
* **Consent** is always required.

Mark every field you need as **Required**. Validated fields stop junk and half-empty bookings. They don't stop a bot that fills in valid-looking data.

## **4. Add the Captcha Field (Google reCAPTCHA)**

WP Booking System has a **Captcha** field that uses Google reCAPTCHA v2 Tickbox or v3 ([setup guide](https://www.wpbookingsystem.com/documentation/setting-up-recaptcha/)).

1. Sign in to the [reCAPTCHA admin console](https://www.google.com/recaptcha/admin) and click **+** to register your site.
2. Add a label, choose **v2 Tickbox** or **v3**, add your domain and click **Submit**.
3. Copy the **Site Key** and **Secret Key**.
4. In WordPress, go to **WP Booking System > Settings > Form**. Under **Google reCAPTCHA**, choose **reCAPTCHA v2 Tickbox** or **reCAPTCHA v3** to match your keys, paste the **Site Key** and **Secret Key**, then click **Save Settings**.
5. Edit your form. In the **Form Builder** tab, click **Captcha** under **Advanced Form Elements**, then click **Save Form**.

![Choose the reCAPTCHA version and add your keys under WP Booking System > Settings > Form](/blog/assets/posts/wpbs-recaptcha-settings.png "Choose the reCAPTCHA version and add your keys under WP Booking System > Settings > Form")

![Add the Captcha field to your form in the Form Builder tab](/blog/assets/posts/wpbs-captcha-field.png "Add the Captcha field to your form in the Form Builder tab")

WP Booking System itself suggests skipping reCAPTCHA until you actually get spam bookings, because every challenge adds friction for real guests.

reCAPTCHA adds a Google script to your page and sends visitor data to Google, which matters under GDPR. AI-driven bots also pass it more often than they used to. Compare versions in [reCAPTCHA v2 vs v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website).

## **5. Add Custom Validation Rules (for Developers)**

WP Booking System lets developers add their own checks in the theme's `functions.php` ([custom validation rules](https://www.wpbookingsystem.com/documentation/custom-validation-rules/)). Both filters run after the form is submitted and can return an error:

* `wpbs_field_validation` checks one field, on all forms, one form or one field.
* `wpbs_form_validation` checks several fields together.

Use them for rules your business knows best, such as rejecting messages that contain links or email domains you never see from real guests. Each rule is code you maintain, so keep the list short.

## **6. Add a Server-Side Spam Filter**

A server-side filter checks each booking after it reaches your server. Bots can't skip it, and guests see no challenge. It's the only layer here that catches human spammers and AI-written messages.

**[oopspam Anti-Spam](https://www.oopspam.com/wordpress)** supports WP Booking System natively. It scores message content and checks IP and email reputation. Optional rules add rate limits, country and language filters, VPN blocking and disposable email detection. Every blocked booking is logged with a reason.

### **How to Set Up oopspam with WP Booking System**

Setup takes about five minutes. You don't need to edit your forms.

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Find the **WP Booking System** section and turn on **Activate Spam Protection**. In **WP Booking System Spam Message**, write what guests see when a booking is blocked, for example "Our spam detection classified your submission as spam. Please contact us via name@example.com." Two optional settings help with special cases:

* **Content field mapping:** by default, oopspam checks the text and textarea fields of your booking forms. To check only specific fields on a form, add its Form ID and the Field IDs that hold the message, then click **Add Pair**. The Form ID shows at the top of the **Edit Form** page, and the Field ID is the number next to each field in the form builder.
* **Don't protect these forms:** enter the form IDs to skip, separated by commas.

![Turn on Activate Spam Protection and set the WP Booking System Spam Message](/blog/assets/posts/wpbs-forms-section.png "Turn on Activate Spam Protection and set the WP Booking System Spam Message")

***Optional:*** set the sensitivity level and turn on rate limiting, country, language, VPN or disposable email filters. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers** so oopspam sees real visitor IPs.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

Submit a test booking. A blocked guest sees your spam message above the form.

![Custom spam message shown on a blocked WP Booking System booking](/blog/assets/posts/wpbs-spam-message.png "Custom spam message shown on a blocked WP Booking System booking")

If a real booking gets blocked, open **[Form Spam Entries](https://help.oopspam.com/wordpress/form-entries/)** to see the reason. Mark it as not spam, add the sender to your allowed list, or lower the sensitivity.

![Review blocked bookings in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Review blocked bookings in Form Spam Entries")

## **Comparison**

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
      <th>Method</th>
      <th>Blocks bots</th>
      <th>Blocks human spam</th>
      <th>Guest friction</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Security token</td><td>Replayed requests</td><td>No</td><td>None</td><td>Free, built in</td></tr>
    <tr><td>Pending status</td><td>Stops spam getting confirmed</td><td>Stops spam getting confirmed</td><td>None</td><td>Free, built in</td></tr>
    <tr><td>Validated fields</td><td>Junk input</td><td>No</td><td>None</td><td>Free, built in</td></tr>
    <tr><td>Captcha field (reCAPTCHA)</td><td>Most bots</td><td>No</td><td>Low to medium</td><td>Free</td></tr>
    <tr><td>Custom validation rules</td><td>What you code</td><td>What you code</td><td>None</td><td>Developer time</td></tr>
    <tr><td>oopspam (server-side filter)</td><td>Yes</td><td>Yes</td><td>None</td><td>Free plan, then paid</td></tr>
  </tbody>
</table>

## **FAQ**

### **Does WP Booking System have built-in spam protection?**

Yes, some. It has a security token on every request, a Captcha field for Google reCAPTCHA and fields that validate their input. It has no honeypot, and none of these stop human spammers or AI-written messages.

### **Do spam bots really get through a booking calendar?**

Yes. The booking is sent as a single request to `admin-ajax.php`, so a bot can post it without clicking through the calendar.

### **Does oopspam work with WP Booking System?**

Yes. oopspam Anti-Spam supports WP Booking System natively. Turn on **Activate Spam Protection** in the WP Booking System section of the plugin settings.

### **Can I block countries or VPNs in WP Booking System?**

Not with WP Booking System alone. Use oopspam's country filtering and IP filtering. See [How to block countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system) and [How to block VPN and data center IP submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system).

### **Should I use reCAPTCHA and oopspam together?**

You can, but most sites don't need both. oopspam works without adding a challenge to your booking form. Add reCAPTCHA only if a specific form still gets bot spam.

## **Final Thoughts**

No single tool stops all spam. WP Booking System's token, Pending status and validated fields handle simple bots and junk input. A server-side filter like oopspam catches the rest, including human spam, without adding friction to your booking form.

## Related guides

- [How to Block Countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system)
- [How to Block VPN and Data Center IP Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system)
- [How to Limit Form Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wp-booking-system)
