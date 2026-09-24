---
layout: post
title: How to Limit Form Submissions in Super Forms?
date: 2026-09-24T15:41:00.000+08:00
author: chazie
image: /blog/assets/posts/howtolimitformsubs_superforms_.jpg
description: Limit Super Forms submissions with built-in user and global
  lockers, or add per-IP and per-email rate limiting with OOPSpam. Step-by-step
  setup.
tags:
  - Super Forms
---
[Super Forms](https://super-forms.com/) has two built-in [submission limits](https://docs.super-forms.com/features/advanced/lock-and-hide-form), a User Form locker and a Global Form locker, both under Form Settings. Both are count-based, and the documentation does not describe IP, email, or per-hour limits. To cap repeat submissions per IP or email within a set time, add rate limiting with the OOPSpam Anti-Spam plugin. This guide covers both, step by step.

## **Method 1: Use the Super Forms User Form Locker**

Use this to limit how many times one user can submit a form.

![Method 1: Use the Super Forms User Form Locker](/blog/assets/posts/super-forms-user-form-locker.png "Method 1: Use the Super Forms User Form Locker")

1. Edit your form and open **Form Settings**.
2. Go to **User Form locker / submission limit**.
3. Set how many times a user can submit the form.
4. Enter a message to show when the limit is reached.
5. Optional: enable hiding the form once the limit is reached.
6. Reset the counter whenever you want to let users submit again.

The Super Forms feature list describes this limit as applying to logged in users. If your form is public, it is not a reliable way to stop anonymous bots. For those, use Method 3.

## **Method 2: Use the Super Forms Global Form Locker**

Use this to close a form after a fixed total number of submissions, such as a giveaway or event signup.

![Method 2: Use the Super Forms Global Form Locker](/blog/assets/posts/super-forms-global-form-locker.png "Method 2: Use the Super Forms Global Form Locker")

1. Edit your form and open **Form Settings**.
2. Go to **Global Form locker / submission limit**.
3. Set the total number of submissions allowed, for example 10.
4. Enter the message that later visitors will see.
5. Optional: enable hiding the form once it is locked.
6. Reset the counter if you reopen the form.

The Super Forms feature list also mentions resetting the lock on a schedule (daily, weekly, monthly, yearly, or manually). A global cap counts spam too. A bot can use up your limit and lock out real visitors, so pair this method with spam filtering.

## **Method 3: Add Rate Limiting With OOPSpam**

**[OOPSpam](https://www.oopspam.com/)** checks each submission before it is processed. If a visitor goes over your limit, the submission is blocked. Real visitors are not affected as long as they stay under the cap.

### **How to set it up**

In WordPress, go to **Plugins > Add New**, search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate it.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

Create a free account at[ oopspam.com](https://app.oopspam.com/Identity/Account/Login) and copy your API key from the dashboard.

![Copy your API key from the dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the dashboard")

Open the OOPSpam settings in your WordPress dashboard, paste your API key, and save.

![Open the OOPSpam settings in your WordPress dashboard, paste your API key, and save](/blog/assets/posts/oopspam-api-key.png "Open the OOPSpam settings in your WordPress dashboard, paste your API key, and save")

Find the **Super Forms** section and check **Activate Spam Protection**.

![Find the Super Forms section and check Activate Spam Protection](/blog/assets/posts/super-forms_activate-spam-protection.png "Find the Super Forms section and check Activate Spam Protection")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**.

![Open the Rate Limiting tab and turn on Enable Rate Limiting](/blog/assets/posts/enabled-rate-limiting-settings.png "Open the Rate Limiting tab and turn on Enable Rate Limiting")

Set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often OOPSpam clears the table it uses to track submissions.

Click **Save Changes**, then submit your form several times to test it.

A good starting point is 3 submissions per hour per IP and per email, a 24 hour block, and a 48 hour clean-up. Raise the numbers if your form has legitimate repeat users, such as support forms.

### **Add more filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with OOPSpam's other filters. You can block VPN and data center IPs, [disposable emails](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms), and specific [countries](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide). You can also block keywords and review blocked entries in the [submission log](https://help.oopspam.com/wordpress/form-entries/). 

![OOPSpam's other filters](/blog/assets/posts/manual-moderation.png "OOPSpam's other filters")

Use the optional **Super Forms Spam Message** field to tell blocked visitors how to reach you, in case a real person is caught by mistake.

![Super Forms Spam Message](/blog/assets/posts/super-forms-spam-message.png "Super Forms Spam Message")

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
      <td>Stop bots from flooding a public form</td>
      <td>OOPSpam rate limiting</td>
    </tr>
    <tr>
      <td>Limit repeat submissions per IP or email</td>
      <td>OOPSpam rate limiting</td>
    </tr>
    <tr>
      <td>Limit submissions per logged in user</td>
      <td>User Form locker</td>
    </tr>
    <tr>
      <td>Close a form after a fixed total</td>
      <td>Global Form locker</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

Use the built-in lockers to control who can submit and how many entries you accept. Use OOPSpam rate limiting to control how fast anyone can submit. Keep in mind that attackers spreading requests across many IPs can stay under per-IP limits, so combine rate limiting with content filtering. Keep Super Forms updated to version 6.3.314 or later, which patched a critical file upload vulnerability.
