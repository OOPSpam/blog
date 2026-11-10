---
layout: post
title: 5 Ways to Protect Your JetFormBuilder Forms from Spam
date: 2026-11-10T10:00:00.000+04:00
author: daniella
hub: wordpress-forms
image: /blog/assets/posts/meta_jetformbuilder_protect_spam.png
description: "Stop spam on JetFormBuilder forms with 5 methods: CAPTCHA,
  honeypot, CSRF protection, response limits and oopspam."
tags:
  - JetFormBuilder
---
The best way to stop spam on JetFormBuilder is to layer protections. Start with the free built-in tools: add a CAPTCHA, and turn on honeypot and CSRF protection. Add the Limit Form Responses addon if you need submission caps. Then add a server-side spam filter such as oopspam Anti-Spam (that's us 👋), which supports JetFormBuilder natively and catches what the built-in tools miss.

[JetFormBuilder](https://jetformbuilder.com/) is a block-based form builder for WordPress by Crocoblock. It powers contact forms, applications, bookings and forms that create posts or users. Every public form attracts bots, and every spam entry costs you time in your inbox and in Form Records. This guide covers 5 ways to protect JetFormBuilder forms, ordered by setup effort: free built-in options first, then a paid addon, then a server-side filter that catches what they miss.

## **Why Do JetFormBuilder Forms Get Spam?**

JetFormBuilder forms are public by design, so bots find them like any other form. Three facts shape your defense:

* **The submission is one request.** A bot can send it without loading your page or running its scripts. Checks that run only in the browser don't stop it, so you need a server-side check.
* **Humans spam too.** Paid spammers solve any [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives). Content, IP and email checks stop them.
* **Some forms do more than send email.** A JetFormBuilder form can create posts, register users or trigger webhooks. A spam entry then creates junk content or fake accounts, not just a junk message.

## **1. Add a CAPTCHA**

JetFormBuilder supports four CAPTCHA providers: Google reCAPTCHA v3, hCaptcha, Friendly Captcha and Cloudflare Turnstile ([Captcha Settings docs](https://jetformbuilder.com/features/captcha-settings/)).

1. Get a **Site Key** and **Secret Key** from your provider, such as the [Cloudflare Turnstile dashboard](https://developers.cloudflare.com/turnstile/get-started/) or the [reCAPTCHA admin console](https://www.google.com/recaptcha/admin).
2. To reuse the keys on every form, go to **JetFormBuilder > Settings**, open the **Captcha Settings** tab, paste the keys into your provider's section and click **Save**.
3. Open your form, go to the **JetForm** tab in the sidebar and unfold **Captcha Settings**. Change **Captcha Provider** from **Without protection** to your provider. Turn on **Use Global Settings** to use the saved keys, or paste keys into **Site Key** and **Secret Key** for this form only.
4. Save the form. The CAPTCHA appears before the submit button. To place it elsewhere, click the **Add ... block** button (for example, **Add Turnstile block**) and move the block.

![Choose a Captcha Provider in the form's Captcha Settings](/blog/assets/posts/jetformbuilder-captcha-settings.png "Choose a Captcha Provider in the form's Captcha Settings")

reCAPTCHA v3 lets you tune the **Score Threshold** (default 0.5). reCAPTCHA sends visitor data to Google, which matters under GDPR. Turnstile, hCaptcha and Friendly Captcha are lighter on privacy. Compare options in [reCAPTCHA v2 vs v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website).

## **2. Turn On Honeypot Protection**

A honeypot adds a hidden field that real visitors never see. Bots that fill every field fill it too, and the submission is blocked ([Crocoblock guide](https://crocoblock.com/blog/wordpress-captcha-contact-form-security/)).

Open your form, go to the **JetForm** tab in the sidebar and unfold **Validation**. Turn on **Enable Honeypot protection**, then save the form.

![Turn on Enable Honeypot protection in the form's Validation settings](/blog/assets/posts/jetformbuilder-validation-settings.png "Turn on Enable Honeypot protection in the form's Validation settings")

A honeypot costs nothing and adds no friction. Smarter bots skip hidden fields, so treat it as a first filter, not your only one.

## **3. Turn On CSRF Protection and Form Safety**

In the same **Validation** section, two more toggles harden the form:

* **Enable csrf protection** checks that the submission came from your own form, not a forged request from another site.
* **Enable form safety** adds a WordPress nonce to each form. If your site uses full-page caching that you can't turn off for the form page, leave this off. A cached nonce expires and real visitors get errors.

These stop replayed and forged requests. They don't stop a bot that loads your page first and submits it like a browser.

## **4. Limit Responses with the Limit Form Responses Addon**

The [Limit Form Responses](https://jetformbuilder.com/addons/limit-form-responses/) addon caps how many times a form can be submitted. It needs JetFormBuilder Pro. In the free version, the **Limit Form Responses** panel in the JetForm sidebar shows an upgrade notice instead of settings.

It offers two limits, which you can use separately or together:

* **Limit Form Responses:** caps the total number of successful submissions. Set the **Limit** and a **Closed Message** that replaces the form once it's full.
* **Restrict users from multiple responses:** caps how often one visitor can submit. Choose **Restrict Users By** (IP address, cookie, session or logged-in user), set **Maximum Submissions** and a **Reset Interval**, and write a **Restricted Message**.

![Restrict users from multiple responses by IP address in Limit Form Responses (image: JetFormBuilder)](/blog/assets/posts/jetformbuilder-restrict-multiple-responses.png "Restrict users from multiple responses by IP address in Limit Form Responses (image: JetFormBuilder)")

It works well for votes, surveys and one-time applications. It doesn't judge content, so a spammer who rotates IPs or clears cookies gets through.

We cover limits in detail in [How to limit form submissions in JetFormBuilder](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-jetformbuilder).

## **5. Add a Server-Side Spam Filter**

A server-side filter checks each submission after it reaches your server. Bots can't skip it, and visitors see no challenge. It's the only layer here that catches human spammers, AI-written messages and junk with real-looking details.

**[oopspam Anti-Spam](https://www.oopspam.com/wordpress)** supports JetFormBuilder natively. It scores message content and checks IP and email reputation. Optional rules add rate limits, country and language filters, VPN blocking and disposable email detection. Every blocked submission is logged with a reason.

### **How to Set Up oopspam with JetFormBuilder**

Setup takes about five minutes. You don't need to edit your forms.

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Find the **JetFormBuilder** section and turn on **Activate Spam Protection**. This covers every JetFormBuilder form on your site. Two optional settings help with special cases:

* **Content field mapping:** by default, oopspam checks every field of the form. To check only the message, add the **Form ID** and **Field ID**, then click **Add Pair**. The Form ID is the form's numeric ID, for example `123`. The Field ID is the field name as set in the JetFormBuilder form, for example `message`. If you add several Field IDs for one form, their values are checked together.
* **Don't protect these forms:** enter the JetFormBuilder form IDs you want to skip, separated by commas.

![Turn on Activate Spam Protection in the JetFormBuilder section](/blog/assets/posts/jetformbuilder-section.png "Turn on Activate Spam Protection in the JetFormBuilder section")

***Optional:*** set the sensitivity level and turn on rate limiting, country, language, VPN or disposable email filters. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers** so oopspam sees real visitor IPs.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Set the Message Visitors See**

When oopspam blocks a submission, JetFormBuilder shows the **JetFormBuilder Spam Message** from oopspam's settings in its own form message box. Write one that helps real visitors, for example: "Our spam detection classified your submission as spam. Please contact us at name@example.com."

Keep it under 240 characters. JetFormBuilder replaces longer form-status messages with a generic one.

Submit a test entry with spammy text. The form shows your spam message instead of the success message.

![The JetFormBuilder Spam Message shown on a blocked submission](/blog/assets/posts/jetformbuilder-spam-message.png "The JetFormBuilder Spam Message shown on a blocked submission")

### **Review Blocked Submissions**

If your form saves records, blocked attempts appear in **JetFormBuilder > Form Records** with your spam message as the status, next to accepted entries marked **success**. oopspam also logs each one in **[Form Spam Entries](https://help.oopspam.com/wordpress/form-entries/)** with the reason. If a real submission gets blocked, mark it as not spam there, add the sender to your allowed list, or lower the sensitivity.

![Blocked and accepted submissions in JetFormBuilder Form Records](/blog/assets/posts/jetformbuilder-form-records.png "Blocked and accepted submissions in JetFormBuilder Form Records")

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
      <th>Visitor friction</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>CAPTCHA (reCAPTCHA v3, hCaptcha, Friendly Captcha, Turnstile)</td><td>Most bots</td><td>No</td><td>Low</td><td>Free</td></tr>
    <tr><td>Honeypot</td><td>Simple bots</td><td>No</td><td>None</td><td>Free, built in</td></tr>
    <tr><td>CSRF protection and form safety</td><td>Forged and replayed requests</td><td>No</td><td>None</td><td>Free, built in</td></tr>
    <tr><td>Limit Form Responses addon</td><td>Repeat submissions from one IP, cookie or session</td><td>Repeat submissions only</td><td>None until the limit</td><td>Paid addon</td></tr>
    <tr><td>oopspam (server-side filter)</td><td>Yes</td><td>Yes</td><td>None</td><td>Free plan, then paid</td></tr>
  </tbody>
</table>

## **FAQ**

### **Does JetFormBuilder have built-in spam protection?**

Yes. It supports reCAPTCHA v3, hCaptcha, Friendly Captcha and Cloudflare Turnstile, plus honeypot and CSRF protection in each form's Validation settings. These stop many bots, but not human spammers or AI-written messages.

### **Does oopspam work with JetFormBuilder?**

Yes. oopspam Anti-Spam supports JetFormBuilder natively. Turn on **Activate Spam Protection** in the **JetFormBuilder** section of the plugin settings.

### **Where do blocked JetFormBuilder submissions show up?**

If your form saves records, in **JetFormBuilder > Form Records** with your spam message as the status. oopspam also logs them in **Form Spam Entries** with the reason they were blocked.

### **Can I block countries or VPNs in JetFormBuilder?**

Not with JetFormBuilder alone. Use oopspam's country filtering and IP filtering. See [How to block countries in JetFormBuilder forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetformbuilder-forms) and [How to block VPN and data center IP submissions in JetFormBuilder forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-jetformbuilder-forms).

### **Should I use a CAPTCHA and oopspam together?**

You can, but most sites don't need both. oopspam works without adding a challenge to your forms. Keep the honeypot on, and add a CAPTCHA only if a specific form still gets bot spam.

## **Final Thoughts**

No single tool stops all spam. JetFormBuilder's CAPTCHA, honeypot and CSRF options handle simple bots for free, and the Limit Form Responses addon caps repeat entries. A server-side filter like oopspam catches the rest, including human spam, without adding friction to your forms.

## Related guides

- [How to Block Countries in JetFormBuilder Forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetformbuilder-forms)
- [How to Block VPN and Data Center IP Submissions in JetFormBuilder Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-jetformbuilder-forms)
- [How to Limit Form Submissions in JetFormBuilder](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-jetformbuilder)
