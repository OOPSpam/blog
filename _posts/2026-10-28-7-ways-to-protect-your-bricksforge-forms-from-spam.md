---
layout: post
title: 7 Ways to Protect Your Bricksforge Forms from Spam
date: 2026-10-28T23:31:00.000+08:00
author: chazie
hub: wordpress-forms
image: /blog/assets/posts/social-media-meta.png
description: "Stop spam on Bricksforge Pro Forms with 7 reliable methods:
  oopspam, honeypots, Turnstile, reCAPTCHA, validation rules, and duplicate
  limits."
tags:
  - Bricksforge Forms
---
![Bricksforge Pro Forms](/blog/assets/posts/bricksforge-pro.png "Bricksforge Pro Forms")

The best way to stop spam on Bricksforge Pro Forms is to layer protections. Use a server-side spam filter such as[ oopspam Anti-Spam](https://www.oopspam.com/), which supports Pro Forms natively. Add a honeypot, one CAPTCHA (Turnstile, reCAPTCHA v3 or hCaptcha), validation rules, and duplicate limits. Built-in tools stop simple bots. A server-side filter stops AI-written and human spam.

[Bricksforge](https://bricksforge.io/) is an add-on for the[ Bricks](https://bricksbuilder.io/) site builder for WordPress. Its[ Pro Forms](https://docs.bricksforge.io/en/elements/pro-forms/) element adds nestable fields, multi-step flows, and database actions to Bricks forms. This guide ranks 7 ways to protect them.

### **Why do Bricksforge Pro Forms get spam?**

Pro Forms can create posts, register users, call webhooks, and take Stripe or Mollie payments. One spam submission can create a fake account, publish a junk post, or pollute your CRM.

Bot traffic keeps rising. Bad bots made up 37% of internet traffic in 2024, up from 32% in 2023, according to the[ 2025 Imperva Bad Bot Report](https://www.imperva.com/blog/2025-imperva-bad-bot-report-how-ai-is-supercharging-the-bot-threat/). Automated traffic passed human traffic for the first time in a decade, at[ 51%](https://cpl.thalesgroup.com/about-us/newsroom/2025-imperva-bad-bot-report-ai-internet-traffic). AI now helps bots write realistic messages and solve CAPTCHAs.

Three facts shape your defense:

* **Bots skip the browser.** Attackers can post straight to your form endpoint, so a [client-side widget](https://developers.cloudflare.com/use-cases/solutions/protect-sensitive-forms-fraud-abuse/) alone is not enough. You need server-side checks.
* **Humans spam too.** Paid spammers pass any [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives). Content, IP, and email checks stop them.
* **Friction costs leads.** Visible challenges lower conversions and can hurt accessibility.

## **1. Add a server-side spam filter**

A server-side filter checks each submission after it reaches your server. Bots cannot skip it by blocking JavaScript, and visitors see no challenge. It is the only layer in this list that catches human spammers and AI-written messages.

**[oopspam Anti-Spam](https://www.oopspam.com/wordpress)** added native Pro Forms support in version 1.2.87. It also covers native Bricks Forms.

It scores message content and checks IP and email reputation. Optional rules add rate limits, country and language filters, VPN blocking, and disposable email detection. Each blocked entry is logged with a reason. It is a paid API after 40 free checks a month, and submissions are sent to its API for analysis.

### **How to set up oopspam with Bricksforge Pro Forms**

Setup takes about five minutes. No changes inside the Bricks builder are needed.

1. In WordPress, go to **Plugins > Add New**, search for **oopspam Anti-Spam**, then install and activate it. Make sure you run version 1.2.87 or later.

![oopspam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam Anti-Spam")

2. [Create an oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Create an oopspam account and copy your API key from the dashboard.](/blog/assets/posts/oopspam-dashboard-api.png "Create an oopspam account and copy your API key from the dashboard.")

3. Go to **Settings > oopspam Anti-Spam**. Paste the key into **My API Key** and select **oopspam Dashboard** as the key source.

![Go to Settings > oopspam Anti-Spam. Paste the key into My API Key and select oopspam Dashboard as the key source.](/blog/assets/posts/oopspam-api-key.png "Go to Settings > oopspam Anti-Spam. Paste the key into My API Key and select oopspam Dashboard as the key source.")

4. Find the **Bricksforge Forms** section and check **Activate Spam Protection**. Do the same for **[Bricks Forms](https://www.oopspam.com/blog/3-ways-to-protect-your-bricks-forms-from-spam)** if you also use native Bricks forms.

![Find the Bricksforge Forms section and check Activate Spam Protection. ](/blog/assets/posts/bricksforge-forms-section.png "Find the Bricksforge Forms section and check Activate Spam Protection. ")

5. ***Optional:*** set the sensitivity level, enable rate limiting, and add country, language, VPN, or disposable email filters.

![Set the sensitivity level, enable rate limiting, and add country, language, VPN, or disposable email filters.](/blog/assets/posts/oopspam-settings.png "Set the sensitivity level, enable rate limiting, and add country, language, VPN, or disposable email filters.")

6. If your site runs behind Cloudflare or another proxy, enable **Trust proxy headers** so oopspam sees real visitor IPs.

![Enable Trust proxy headers](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers")

7. Submit a test entry. Check **Spam Entries** and **Valid Entries** to confirm it was logged.

![Submit a test entry. Check Spam Entries and Valid Entries to confirm it was logged.](/blog/assets/posts/bricksforge-forms-spam.png "Submit a test entry. Check Spam Entries and Valid Entries to confirm it was logged.")

If a real message gets blocked, open **[Spam Entries](https://help.oopspam.com/wordpress/form-entries/)** to see the reason. Mark it as not spam, add the sender to your allowed list, or lower the sensitivity.

![If a real message gets blocked, open Spam Entries to see the reason.](/blog/assets/posts/oopspam-logs-bulk-actions.png "If a real message gets blocked, open Spam Entries to see the reason.")

## **2. Turn on a honeypot field**

A [honeypot](https://www.oopspam.com/blog/honeypot-spam-protection-for-wordpress-how-it-works-when-it-fails-and-better-alternatives) is a hidden field that real visitors never see. Bots fill in every field they find, so a filled honeypot marks the submission as spam. Pro Forms lists honeypot fields among its [built-in protections](https://docs.bricksforge.io/en/elements/pro-forms/#:~:text=virus%20scanning%20integration-,Spam%20Protection%20Layers,-Pro%20Forms%20offers).

![Turn on a honeypot field](/blog/assets/posts/honeypot.png "Turn on a honeypot field")

* It is free and invisible.
* Its weakness: bots that run JavaScript can detect hidden fields and skip them. Never rely on a honeypot alone.

## **3. Enable Cloudflare Turnstile**

[Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile) verifies visitors without puzzles. It runs quick browser checks in the background and only shows a widget when needed. It is free and privacy friendly.

![Enable Cloudflare Turnstile](/blog/assets/posts/cloudflare-turnstile-image.png "Enable Cloudflare Turnstile")

* Create a widget in the Cloudflare dashboard and copy the site key and secret key.
* Add the keys and enable Turnstile in your Pro Forms spam protection settings.
* Best for: conversion-sensitive forms like contact, quote, and lead forms.

## **4. Set strict validation rules**

Validation stops junk data before any action runs. Pro Forms runs validation on the server, so bots cannot skip it. Use the field settings and the Validation group:

* Mark key fields as **Required**.
* Set **Max Length** on text and textarea fields to block bulk link dumps.
* Turn on **Strip HTML** to remove injected tags.
* Add a **Custom (Regex)** rule, for example** `^[^0-9]*$`** to forbid numbers in a name field.
* Use **File** field limits: allowed types and max size.

## **5. Use Google reCAPTCHA v3**

[reCAPTCHA v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website) scores each visitor from 0.0 to 1.0 based on behavior. It shows no checkbox. Low scores are treated as bots.

![Use Google reCAPTCHA v3](/blog/assets/posts/google-recaptcha-v3.png "Use Google reCAPTCHA v3")

* It is invisible, but it loads a Google script on your pages.
* It sends visitor data to Google, which matters for GDPR.
* AI-driven bots increasingly pass behavior-based scoring.

## **6. Use hCaptcha for privacy-focused sites**

![Use hCaptcha for privacy-focused sites](/blog/assets/posts/hcaptcha-bricks.jpg "Use hCaptcha for privacy-focused sites")

Pro Forms also supports [hCaptcha](https://www.oopspam.com/hcaptcha-alternative). Bricksforge positions it as the privacy-focused option with GDPR compliance. It can show a visible challenge, so expect some friction. Pick one CAPTCHA provider per form; stacking several adds friction without much gain.

## **7. Limit duplicates and submission volume**

Repeat submissions flood inboxes and databases. The **[Create Submission](https://docs.bricksforge.io/en/elements/pro-forms/#:~:text=within%20the%20document.-,Create%20Submission,-The%20Create%20Submission)** action in Pro Forms includes **Prevent Duplicates** and **Maximum Submissions**. Prevent Duplicates compares a field you choose, such as email, and blocks repeats with a custom message.

These controls cap totals. They do not limit submissions per hour. For time-based limits, use the [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) settings in oopspam.

![Use the rate limiting settings in oopspam](/blog/assets/posts/rate-limiting-settings.png "Use the rate limiting settings in oopspam")

### **Comparison**

Built-in tools block bots and bad data. Only a server-side filter catches human spam.

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
    text-align: center;
    vertical-align: middle;
  }

  .oopspam-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th>Method</th>
      <th>Stops bots</th>
      <th>Stops human spam</th>
      <th>Visitor friction</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>oopspam Anti-Spam</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>None</td>
      <td>40 free checks/month, then paid</td>
    </tr>
    <tr>
      <td>Honeypot</td>
      <td>Simple bots</td>
      <td>No</td>
      <td>None</td>
      <td>Free</td>
    </tr>
    <tr>
      <td>Cloudflare Turnstile</td>
      <td>Most bots</td>
      <td>No</td>
      <td>Low</td>
      <td>Free</td>
    </tr>
    <tr>
      <td>reCAPTCHA v3</td>
      <td>Most bots</td>
      <td>No</td>
      <td>None</td>
      <td>Free tier</td>
    </tr>
    <tr>
      <td>hCaptcha</td>
      <td>Most bots</td>
      <td>No</td>
      <td>Medium</td>
      <td>Free tier</td>
    </tr>
    <tr>
      <td>Validation rules</td>
      <td>Bad data only</td>
      <td>Partly</td>
      <td>None</td>
      <td>Free</td>
    </tr>
    <tr>
      <td>Duplicate limits</td>
      <td>Repeat posts</td>
      <td>Partly</td>
      <td>None</td>
      <td>Free</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

No single tool stops all spam. Built-in Pro Forms tools block simple bots and bad data. A server-side filter handles AI-written messages, human spammers, and bots that post straight to your endpoint. Use them together.
