---
layout: post
title: How to Limit Form Submissions in Bricksforge Forms?
date: 2026-11-03T16:00:00.000+04:00
last_modified_at: 2026-11-04T10:21:00.000Z
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_bricksforge_limit_submissions.jpg
description: Limit Bricksforge Pro Forms submissions with Maximum Submissions
  and Prevent Duplicates, or add per-IP and per-email rate limiting with
  oopspam.
tags:
  - Bricksforge Forms
---
Bricksforge Pro Forms has two built-in submission limits in the **Submissions** group of the Create Submission action. **Maximum Submissions** caps how many entries are stored, and **Prevent Duplicates** rejects a repeat value in a field such as email. Neither limits how often one visitor can submit. To cap submissions per IP or email per hour, add rate limiting with the oopspam Anti-Spam plugin (that's us 👋).

[Bricksforge](https://bricksforge.io/) is an add-on for the [Bricks](https://bricksbuilder.io/) site builder. Its [Pro Forms](https://docs.bricksforge.io/en/elements/pro-forms/) element can create posts, register users, call webhooks and take payments, so a flood of submissions does more damage than a full inbox. This guide covers three methods, step by step.

## **Method 1: Close a Form After a Fixed Number of Entries**

Use this for a giveaway, event registration or beta signup with a fixed number of places. It takes two settings: **Maximum Submissions** to set the cap, and a **Submit Button Condition** to close the form when the cap is reached.

> **Important:** Maximum Submissions on its own doesn't close the form. Once the limit is reached, visitors can still submit and see a success message, but Bricksforge stops saving their entries under **Submissions**. Always pair it with the submit button condition below.

### **Step 1: Turn On the Form Submissions Extension**

The Submissions settings need the **Form Submissions** extension ([docs](https://docs.bricksforge.io/en/extensions/form-submissions)). In WordPress, go to **Bricks > Bricksforge > Extensions** and activate **Form Submissions**. Saved entries then appear under **Bricks > Form Submissions**, where you can review, export or delete them.

### **Step 2: Set Maximum Submissions**

1. Open your page in the Bricks editor and select the **Pro Forms** element.
2. Under **Actions**, add **Create Submission**.
3. Open the **Submissions** group.
4. Enter a **Form Title**. It identifies the form in the submissions table.
5. Set **Maximum Submissions** to the number of entries you want to store, for example 100. If you leave it empty, all submissions are stored.

![Set Form Title and Maximum Submissions in the Bricksforge Submissions group](/blog/assets/posts/bricksforge-maximum-submissions.png "Set Form Title and Maximum Submissions in the Bricksforge Submissions group")

### **Step 3: Hide the Submit Button When the Limit Is Reached**

1. In the Pro Forms element, open the **Submit Button** group.
2. Turn on **Submit Button Conditions**.
3. Under **If**, add **Submission Limit Reached**.
4. Under **Then**, choose **Hide Submit Button** or **Disable Submit Button**.
5. Optional: if you disable the button, enter **Alternative Button Text**, such as "Registration closed". It replaces the button label while the condition applies.
6. Save the page.

![Hide the submit button when the Bricksforge submission limit is reached](/blog/assets/posts/bricksforge-submit-button-conditions.png "Hide the submit button when the Bricksforge submission limit is reached")

> **Note:** Maximum Submissions counts every stored entry, including spam. A bot can use up your places and lock out real visitors. Pair this method with spam filtering (Method 3).

## **Method 2: Block Repeat Entries with Prevent Duplicates**

Use this to stop the same person from submitting twice, for example one entry per email address in a contest. It lives in the same **Submissions** group, so the Form Submissions extension must be active.

1. In the **Submissions** group of the Pro Forms element, turn on **Prevent Duplicates**.
2. Under **For Field**, add an item.
3. In **Form Field ID**, enter the ID of the field to compare, such as your email field's ID.
4. In **Notice**, write the message visitors see when a duplicate is detected, for example "This email address is already in use."
5. Save the page.

If a stored submission already has the same value in that field, Pro Forms rejects the new one and shows your notice. You can add more than one field.

![Turn on Prevent Duplicates and set the email Form Field ID and Notice in Bricksforge](/blog/assets/posts/bricksforge-prevent-duplicates.png "Turn on Prevent Duplicates and set the email Form Field ID and Notice in Bricksforge")

> **Limits of the built-in options:** both are count-based and only work on stored submissions. Maximum Submissions caps the total, and Prevent Duplicates only catches exact repeats. Neither limits submissions per hour, and bots that rotate email addresses get past duplicate checks.

## **Method 3: Rate Limit Submissions per IP and Email with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports Bricksforge Pro Forms natively from version 1.2.87. It checks each submission on the server before Bricksforge runs any action. If a visitor goes over your limit, the submission is blocked. Real visitors aren't affected as long as they stay under the cap.

### **How to Set It Up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Scroll to the **Bricksforge Forms** section and check **Activate Spam Protection**.

![Check Activate Spam Protection in the Bricksforge Forms section](/blog/assets/posts/bricksforge-forms-section.png "Check Activate Spam Protection in the Bricksforge Forms section")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**. Then set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears the table it uses to track submissions.

Click **Save Changes**.

![Turn on rate limiting and set limits per IP and email](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn on rate limiting and set limits per IP and email")

A good starting point is 3 submissions per hour per IP and per email, a 24-hour block and a 48-hour clean-up. Raise the numbers if your form has legitimate repeat users, such as a support form.

### **Turn On Trust Proxy Headers (If You Use Cloudflare or Another Proxy)**

Per-IP limits only work if oopspam sees each visitor's real IP address. If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, all visitors share the proxy's IP and could hit the limit together.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Test It**

Submit your form a few more times than your limit allows. The blocked attempt shows the spam message on the form, and you can set a custom message in oopspam to tell real visitors how to reach you.

![Spam message shown when a Bricksforge submission is blocked](/blog/assets/posts/bricksforge-forms-spam.png "Spam message shown when a Bricksforge submission is blocked")

Check **Form Spam Entries** in WordPress to see the blocked attempts and the reason. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

### **Add More Filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other filters. Attackers who spread requests across many IPs can stay under per-IP limits, so combine it with:

* **VPN and data center blocking:** see [How to block VPN and data center IP submissions in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricksforge-forms).
* **Country filtering:** see [How to block countries in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-countries-in-bricksforge-forms).
* **Disposable email blocking:** see [How to block disposable email addresses in WordPress forms](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms).

For very high-volume attacks, you can also add Cloudflare [rate limiting rules](https://developers.cloudflare.com/waf/rate-limiting-rules/) on the Pro Forms endpoint, `/wp-json/bricksforge/v1/form_submit`, to stop bursts before they reach WordPress.

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
</style>

<table>
  <thead>
    <tr>
      <th>Goal</th>
      <th>Best method</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Close a form after a fixed total</td>
      <td>Maximum Submissions + Submission Limit Reached</td>
    </tr>
    <tr>
      <td>One entry per email or other field</td>
      <td>Prevent Duplicates</td>
    </tr>
    <tr>
      <td>Stop bots from flooding a public form</td>
      <td>oopspam rate limiting</td>
    </tr>
    <tr>
      <td>Limit repeat submissions per IP or email per hour</td>
      <td>oopspam rate limiting</td>
    </tr>
    <tr>
      <td>Stop bursts before they reach WordPress</td>
      <td>Cloudflare rate limiting rules</td>
    </tr>
  </tbody>
</table>

Most sites need two layers: a built-in limit for the business rule (one entry per email, 100 seats) and oopspam rate limiting to stop abuse.

## **FAQ**

### **Can Bricksforge limit submissions per user or IP?**

Not by time. Prevent Duplicates blocks an exact repeat value in one field, such as email. Bricksforge has no per-hour limit per IP or email. Use oopspam rate limiting for that.

### **What happens when Maximum Submissions is reached?**

The form keeps working. Visitors can still submit and see a success message, but Bricksforge stops saving their entries under **Submissions**. To actually close the form, add a **Submission Limit Reached** condition that hides or disables the submit button.

### **Do I need the Form Submissions extension?**

Yes, for the built-in limits. Maximum Submissions and Prevent Duplicates live in the Create Submission action, which only works with the Form Submissions extension active. oopspam rate limiting works without it.

### **Will rate limiting block real visitors?**

Rarely, if your limits are sensible. Three submissions per hour is plenty for a contact form. Raise the limit for forms people use often, and review **Form Spam Entries** for false positives.

### **Does rate limiting work behind Cloudflare?**

Yes, as long as you turn on **Trust proxy headers** in oopspam's **Misc** tab. Otherwise every visitor appears to share Cloudflare's IP address.

## **Final Thoughts**

Use Bricksforge's built-in limits to control how many entries you accept: a total cap with Maximum Submissions and one entry per person with Prevent Duplicates. Use oopspam rate limiting to control how fast anyone can submit. Together they keep your Pro Forms open to real people and closed to floods.

Using the native Bricks Form element? See [How to limit form submissions in Bricks Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-bricks-forms).

## Related guides

- [7 Ways to Protect Your Bricksforge Forms from Spam](https://www.oopspam.com/blog/7-ways-to-protect-your-bricksforge-forms-from-spam)
- [How to Block Countries in Bricksforge Forms?](https://www.oopspam.com/blog/how-to-block-countries-in-bricksforge-forms)
- [How to Block VPN and Data Center IP Submissions in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricksforge-forms)
