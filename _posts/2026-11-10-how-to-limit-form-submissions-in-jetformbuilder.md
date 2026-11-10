---
layout: post
title: How to Limit Form Submissions in JetFormBuilder
date: 2026-11-10T10:45:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_jetformbuilder_limit_submissions.png
description: Free JetFormBuilder can't limit submissions. Cap them with the
  Limit Form Responses addon, oopspam rate limiting per IP and email, or
  Cloudflare.
tags:
  - JetFormBuilder
  - Cloudflare
---
Free JetFormBuilder has no submission limit. To cap submissions, use the paid Limit Form Responses addon, which limits total responses and repeat submissions per IP, cookie or session. For hourly limits per IP and per email that also catch spam, use the oopspam Anti-Spam plugin (that's us 👋). Cloudflare's rate limiting rules add a coarser limit at the network edge.

[JetFormBuilder](https://jetformbuilder.com/) powers contact forms, applications, votes and registrations. Without a limit, one bot can send hundreds of entries in minutes, and each one lands in your inbox and Form Records. This guide covers each option, step by step.

## **Method 1: Use the Limit Form Responses Addon**

[Limit Form Responses](https://jetformbuilder.com/addons/limit-form-responses/) is a JetFormBuilder addon that needs JetFormBuilder Pro. In the free version, the **Limit Form Responses** panel in the JetForm sidebar shows an upgrade notice instead of settings.

To install it, go to **JetFormBuilder > Addons**, find **Limit Form Responses** and click **Install Addon**. Then open your form, go to the **JetForm** tab and unfold **Limit Form Responses**. It offers two limits, which you can use separately or together.

**Limit the total number of responses.** Turn on **Limit Form Responses** and set the **Limit**, the total number of successful submissions the form accepts. Write a **Closed Message** to show instead of the form once it's full. Use this for event sign-ups, job applications or giveaways with a fixed number of places.

![Set a total limit and Closed Message in Limit Form Responses (image: JetFormBuilder)](/blog/assets/posts/jetformbuilder-limit-form-responses.png "Set a total limit and Closed Message in Limit Form Responses (image: JetFormBuilder)")

**Limit responses per visitor.** Turn on **Restrict users from multiple responses**, then set:

* **Restrict Users By:** how a visitor is identified, by **IP address**, cookie, session or logged-in user.
* **Maximum Submissions:** how many times one visitor can submit.
* **Reset Interval:** when the count starts over, or **Never**.
* **Restricted Message:** the text shown instead of the form once a visitor has used up their submissions.

An **Error Message** field sets the text shown if someone still tries to submit past the limit.

![Restrict users from multiple responses by IP address (image: JetFormBuilder)](/blog/assets/posts/jetformbuilder-restrict-multiple-responses.png "Restrict users from multiple responses by IP address (image: JetFormBuilder)")

The addon suits votes, surveys and one-time applications. It has gaps for spam: cookies and sessions reset when a bot clears them, an IP limit fails when a bot rotates IPs, and it can't limit by email address.

## **Method 2: Rate Limit Submissions per IP and Email with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports JetFormBuilder natively. It checks each submission on the server and blocks visitors who go over your hourly limit, before JetFormBuilder runs its actions.

### **How to Set It Up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Scroll to the **JetFormBuilder** section and turn on **Activate Spam Protection**.

![Turn on Activate Spam Protection in the JetFormBuilder section](/blog/assets/posts/jetformbuilder-section.png "Turn on Activate Spam Protection in the JetFormBuilder section")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**. Then set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears the table it uses to track submissions.

Click **Save Changes**.

![Turn on rate limiting and set limits per IP and email](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn on rate limiting and set limits per IP and email")

A good starting point is 3 submissions per hour per IP and per email, a 24-hour block and a 48-hour clean-up.

If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, all visitors share the proxy's IP and could hit the limit together.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Set the Spam Message and Test**

Write the message blocked visitors see in the **JetFormBuilder Spam Message** field, for example: "You've sent several submissions in a short time. Please try again later or email us at name@example.com." Keep it under 240 characters, or JetFormBuilder replaces it with a generic message.

Then submit the form a few more times than your limit allows. The blocked attempt shows your spam message in the form's message box.

![The JetFormBuilder Spam Message shown on a blocked submission](/blog/assets/posts/jetformbuilder-spam-message.png "The JetFormBuilder Spam Message shown on a blocked submission")

Check **Form Spam Entries** in WordPress to see blocked attempts and the reason ([form entries guide](https://help.oopspam.com/wordpress/form-entries/)). If your form saves records, they also appear in **JetFormBuilder > Form Records** with your spam message as the status.

![Blocked and accepted submissions in JetFormBuilder Form Records](/blog/assets/posts/jetformbuilder-form-records.png "Blocked and accepted submissions in JetFormBuilder Form Records")

### **Add More Filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other filters:

* **VPN and data center blocking:** see [How to block VPN and data center IP submissions in JetFormBuilder forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-jetformbuilder-forms).
* **Country filtering:** see [How to block countries in JetFormBuilder forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetformbuilder-forms).
* **Disposable email blocking:** see [How to block disposable email addresses in WordPress forms](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms). Throwaway addresses are how bots get around per-email limits.

## **Method 3: Add a Cloudflare Rate Limiting Rule**

If your site runs behind [Cloudflare](https://www.cloudflare.com/), a [rate limiting rule](https://developers.cloudflare.com/waf/rate-limiting-rules/) can stop bursts of requests at the network edge, before they reach WordPress.

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/), go to **Security > Security Rules**.
2. Click **Create rule**, then select **Rate limiting rules**.
3. Name the rule, for example "Limit form submissions."
4. Under **When incoming requests match**, set **URI Path** to **equals** the path of your form's page, for example `/contact/`. JetFormBuilder posts each submission back to that page with a generated query string, which you can ignore.
5. Set the rate, for example 5 requests per 10 seconds per IP.
6. Choose **Block** as the action, then click **Deploy**.

![A JetFormBuilder submission posts to the form's page with a generated query string](/blog/assets/posts/jetformbuilder-submit-network.png "A JetFormBuilder submission posts to the form's page with a generated query string")

Three things to know:

* **It's short-term only on the Free plan.** You get one rate limiting rule, a 10-second counting period and a 10-second block. That stops fast floods, not a bot that sends one entry a minute.
* **It may count more than submissions.** JetFormBuilder posts back to the form's page, so page views count too, not only submissions. Set the limit high enough that normal browsing never hits it, and test after deploying.
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
    <tr><td>Close a form after a set number of responses</td><td>Limit Form Responses addon</td></tr>
    <tr><td>Allow one vote or application per visitor</td><td>Limit Form Responses addon, by IP or logged-in user</td></tr>
    <tr><td>Stop one visitor from flooding a form</td><td>oopspam rate limiting per IP</td></tr>
    <tr><td>Stop repeat submissions from one email address</td><td>oopspam rate limiting per email</td></tr>
    <tr><td>Stop fast bursts before they reach WordPress</td><td>Cloudflare rate limiting rule</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can JetFormBuilder limit submissions without an addon?**

No. The free plugin has no submission limits. You need the paid Limit Form Responses addon, or a plugin like oopspam.

### **What's the difference between the addon and oopspam's rate limiting?**

The addon caps total responses and repeat submissions per IP, cookie, session or logged-in user, with an optional reset interval. oopspam caps submissions per IP and per email per hour, blocks for a set time, and also runs its spam checks on every submission.

### **What limit should I set?**

Start with 3 submissions per hour per IP and per email. Raise it if real users submit several entries in one session.

### **Will rate limiting block visitors on a shared network?**

It can, since people in one office or school may share an IP. Keep the per-IP limit a little higher than the per-email limit, and review **Form Spam Entries** for false positives.

## **Final Thoughts**

JetFormBuilder needs an addon or a plugin to limit submissions. The Limit Form Responses addon fits votes and one-time forms. oopspam adds hourly limits per IP and per email alongside its other spam checks. Cloudflare adds burst protection at the network edge.

## Related guides

- [5 Ways to Protect Your JetFormBuilder Forms from Spam](https://www.oopspam.com/blog/5-ways-to-protect-your-jetformbuilder-forms-from-spam)
- [How to Block Countries in JetFormBuilder Forms](https://www.oopspam.com/blog/how-to-block-countries-in-jetformbuilder-forms)
- [How to Block VPN and Data Center IP Submissions in JetFormBuilder Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-jetformbuilder-forms)
