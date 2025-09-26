---
layout: post
title: How to Limit Form Submissions in SureForms?
date: 2025-09-26T05:25:00.000+08:00
author: chazie
image: /blog/assets/posts/sf_rt.jpg
description: Limit form submissions in SureForms with entry caps, date
  restrictions, and OOPSpam rate limiting to prevent spam and manage responses.
tags:
  - SureForms
  - Rate Limiting
---
![SureForms](/blog/assets/posts/sureforms-ai-form-builder.png "SureForms")

In SureForms, you can limit submissions by enabling restrictions in the Advanced Settings. You can set a maximum number of entries, restrict access by date and time, combine both, or add advanced rate limiting with **[OOPSpam](https://www.oopspam.com/)**. This ensures your forms stay open only as long as you need and prevents unwanted overload or spam.

### **Why Limit Form Submissions?**

Limiting form entries helps you manage responses, control event signups, or close promotions automatically. Instead of monitoring forms manually, [SureForms](https://sureforms.com/) and OOPSpam handles restrictions for you.

## **Step-by-Step: Setting Limits in SureForms**

In the SureForms builder, choose the form you want to edit. Navigate to **Settings → Advanced**.

![Setting Limits in SureForms](/blog/assets/posts/navigate-to-advanced-settings.png "Setting Limits in SureForms")

Under **Advanced Settings**, select **Restrictions**. A new panel will open with all available restriction options.

![Access Advanced Settings](/blog/assets/posts/restriction-options.png "Access Advanced Settings")

Toggle **Maximum Number of Entries** to ON. Enter the number of submissions allowed (e.g., 50, 100, 500).

![Restrict by Date and Time](/blog/assets/posts/restrict-by-date-and-time.png "Restrict by Date and Time")

Set the **start date/time** and **end date/time**. The form will accept entries only within this window.

Once the limit is reached, the form automatically closes. Click **Save** to apply your new submission limits.

## **Advanced Option: Rate Limiting with OOPSpam**

If you need per-user or per-IP limits, SureForms can integrate with **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋). This adds another layer of control on top of the built-in restrictions.

**How to set it up:**

Install and activate the **OOPSpam Anti-Spam** plugin. [Create an account](https://app.oopspam.com/Identity/Account/Login) on OOPSpam and copy your **API key**.

![OOPSpam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam")

Go to **OOPSpam → Settings** in WordPress and paste the API key.

![Paste the API key](/blog/assets/posts/oopspam-api-key.png "Paste the API key")

Enable OOPSpam protection for SureForms.

![Enable OOPSpam protection for SureForms.](/blog/assets/posts/activate-sureforms.png "Enable OOPSpam protection for SureForms.")

Navigate to the **Rate Limiting** tab in OOPSpam’s settings and turn on **Enable Rate Limiting**.

![Navigate to the Rate Limiting tab in OOPSpam’s settings and turn on Enable Rate Limiting.](/blog/assets/posts/rate-limiting-settings.png "Rate Limiting with OOPSpam")

Configure your limits, such as:

* **Max Submissions per IP per Hour -** Limit how many times a single IP can submit.
* **Max Submissions per Email per Hour -** Prevents one email address from spamming multiple entries.
* **Block Duration (hours) -** Defines how long a user is blocked once they exceed limits.
* **Data Clean-Up Frequency (hours) -** Clears stored logs regularly to keep performance smooth.

This ensures that even if someone tries to bypass SureForms’ built-in limits, OOPSpam will block repeated abuse and [keep your forms clean](https://www.oopspam.com/blog/5-ways-to-stop-spam-on-sureforms).

## **Final Thoughts**

SureForms makes it easy to [control form submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) without extra work. You can:

* Limit total entries.
* Close forms by date and time.
* Combine both for flexible restrictions.
* Add OOPSpam for advanced, per-user rate limiting.

Together, these options give you full control over how and when your forms accept responses, keeping them efficient and spam-free.
