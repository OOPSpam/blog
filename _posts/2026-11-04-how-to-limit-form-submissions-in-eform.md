---
layout: post
title: How to Limit Form Submissions in eForm?
date: 2026-11-04T15:30:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_eform_limit_submissions.png
description: Limit eForm submissions per email, IP, user, cookie or in total,
  set dates and intervals, and add hourly rate limiting with oopspam.
tags:
  - eForm
---
eForm has some of the most complete built-in submission limits of any WordPress form builder. Under **Form Settings > Submission Limitation**, you can cap entries per email, IP address, registered user, browser cookie or in total, and set opening and expiration dates. These are lifetime counts. To limit how often anyone can submit per hour, add rate limiting with the oopspam Anti-Spam plugin (that's us 👋).

[eForm](https://eform.live/) is a WordPress form builder by WPQuark for quizzes, surveys, cost estimators, payments and registrations. Submission limits keep a survey to one answer per person, close a contest after a set number of entries, and stop one visitor from flooding a form. This guide covers each option, step by step.

## **Method 1: Use eForm's Number-Based Limits**

Edit your form, click **Config**, then go to **Form Settings > Submission Limitation** ([docs](https://eform.live/fsqm/form-submission-related/limiting-eform-submissions/)). Enter a number in any of these fields. **0** means no limit. You can combine them:

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
      <th>Setting</th>
      <th>What it limits</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Submission Limit Per Email</td><td>Entries per email address</td><td>Needs the Email element (Other Form Element &gt; Email, stored in DB) on the form</td></tr>
    <tr><td>Submission Limit Per IP Address</td><td>Entries per IP address</td><td>Works with IPv4 and IPv6</td></tr>
    <tr><td>Submission Limit Per Registered User</td><td>Entries per logged-in user</td><td>Only counts logged-in users</td></tr>
    <tr><td>Cookie based Submission Limit</td><td>Entries per browser</td><td>Cookie lasts 365 days; from eForm 3.5.2</td></tr>
    <tr><td>Total Submission Limit</td><td>All entries for the form</td><td>The form stops accepting entries once reached</td></tr>
  </tbody>
</table>

Each limit has its own message. Edit **IP Limitation Message**, **Message Shown to Registered Users**, **Message Shown to Exceeded Cookie Limit** and **Message Shown if Total Limit is enabled** to suit your form. The total limit message can show how many places are left: `%1$d` is the number of submissions left and `%2$d` is the number already filled in. Click **Save**.

![Set submission limits per email, IP address, registered user and in total under Form Settings > Submission Limitation in eForm](/blog/assets/posts/eform-submission-limitation.png "Set submission limits per email, IP address, registered user and in total under Form Settings > Submission Limitation in eForm")

Which to use:

* **One answer per person on a public survey:** per email plus per cookie. A cookie stops casual repeats, and the email limit stops someone switching browsers.
* **Contests and giveaways:** per email plus a total limit.
* **Member-only forms:** per registered user.

Per-IP limits are useful against bots, but they can block real people who share an IP, such as an office or a school. Use a higher number, such as 3 to 5, rather than 1.

## **Method 2: Limit by Login, Time Interval or Date**

### **Allow Only Logged-In Users**

In **Submission Limitation**, turn on **Only Logged In user can submit**. Then choose **What to do when user not logged in**: show eForm's login form, or redirect to a **Redirection URL**. Login-only forms stop almost all anonymous spam.

The opposite setting, **Only Logged Out user can submit**, keeps a form for new visitors only, such as a registration form.

### **Set a Submission Interval**

For logged-in users, set **Submission Interval (Minutes)**. Users must wait that long before they can submit again. Edit the **Interval Message** to explain the wait. The placeholder `%1$s` shows the time left.

### **Set Opening and Expiration Dates**

Set a **Form Opening Date** to start accepting entries later, or a **Form Expiration Date** to close the form automatically. Edit the **Expiration Message** to tell late visitors the form is closed. This is the easiest way to run a time-limited campaign or close an old survey.

![Login, submission interval and expiration settings in eForm Submission Limitation](/blog/assets/posts/eform-login-interval-date.png "Login, submission interval and expiration settings in eForm Submission Limitation")

> **Limits of the built-in options:** the number-based limits are lifetime counts, and the interval only works for logged-in users. eForm has no per-hour limit for anonymous visitors, and bots that rotate IPs, emails and cookies get past count-based limits.

## **Method 3: Rate Limit Submissions per IP and Email with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports eForm natively from version 1.2.87. It checks each submission on the server and blocks visitors who go over your hourly limit. It works for anonymous visitors too.

### **How to Set It Up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Scroll to the **eForm Form Builder** section and check **Activate Spam Protection**.

![Turn on Activate Spam Protection in the eForm Form Builder section](/blog/assets/posts/eform-forms-section.png "Turn on Activate Spam Protection in the eForm Form Builder section")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**. Then set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears the table it uses to track submissions.

Click **Save Changes**.

![Turn on rate limiting and set limits per IP and email](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn on rate limiting and set limits per IP and email")

A good starting point is 3 submissions per hour per IP and per email, a 24-hour block and a 48-hour clean-up. Raise the numbers for quizzes people retake.

If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, all visitors share the proxy's IP and could hit the limit together.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Test It**

Submit your form a few more times than your limit allows. The blocked attempt shows your spam message on the form. Set a custom message in the **eForm Spam Message** field to tell real visitors how to reach you.

![Custom spam message shown on a blocked eForm submission](/blog/assets/posts/eform-spam-message.png "Custom spam message shown on a blocked eForm submission")

Check **Form Spam Entries** in WordPress to see blocked attempts and the reason ([form entries guide](https://help.oopspam.com/wordpress/form-entries/)).

### **Add More Filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other filters:

* **VPN and data center blocking:** see [How to block VPN and data center IP submissions in eForm](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-eform).
* **Country filtering:** see [How to block countries in eForm](https://www.oopspam.com/blog/how-to-block-countries-in-eform).
* **Disposable email blocking:** see [How to block disposable email addresses in WordPress forms](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms). This also strengthens eForm's per-email limit, since throwaway addresses can't be used to get around it.

## **Which Method Should You Use?**

<table>
  <thead>
    <tr>
      <th>Goal</th>
      <th>Best method</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>One answer per person</td><td>eForm per email + cookie limit</td></tr>
    <tr><td>Close a form after a fixed total</td><td>eForm Total Submission Limit</td></tr>
    <tr><td>Time-limited campaign</td><td>eForm opening or expiration date</td></tr>
    <tr><td>Members only</td><td>Only Logged In user can submit</td></tr>
    <tr><td>Stop floods on a public form</td><td>oopspam rate limiting</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can eForm limit submissions per IP address?**

Yes. Use **Submission Limit Per IP Address** in **Form Settings > Submission Limitation**. It's a lifetime count, not per hour. For hourly limits, use oopspam rate limiting.

### **Can I limit eForm submissions per hour?**

Only for logged-in users, with **Submission Interval (Minutes)**. For anonymous visitors, use oopspam's per-IP and per-email hourly limits.

### **Why does the per-email limit need the Email element?**

eForm compares the email stored with each submission. That only works when the form uses the **Email** element under Other Form Element, which saves the address in the database.

### **Will rate limiting block real visitors?**

Rarely, if your limits are sensible. Three submissions per hour is plenty for most forms. Review **Form Spam Entries** for false positives.

## **Final Thoughts**

Use eForm's built-in limits for the business rule: one entry per person, a total cap or a closing date. Use oopspam rate limiting to stop floods from anonymous visitors and bots. Together they keep your eForm forms open to real people and closed to abuse.

## Related guides

- [6 Ways to Protect Your eForm from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-eform-from-spam)
- [How to Block Countries in eForm](https://www.oopspam.com/blog/how-to-block-countries-in-eform)
- [How to Block VPN and Data Center IP Submissions in eForm](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-eform)
