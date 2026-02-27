---
layout: post
title: How to Limit Form Submissions in MailPoet?
date: 2026-02-26T10:40:00.000+08:00
author: chazie
image: /blog/assets/posts/maipoet_meta.jpg
description: Learn how to limit form submissions in MailPoet using list
  controls, signup settings, and OOPSpam rate limiting to reduce spam and abuse.
tags:
  - MailPoet
---
![MailPoet](/blog/assets/posts/mailpoet-home.png "MailPoet")

MailPoet does not include built-in submission throttling. That means bots can submit forms repeatedly, use disposable emails, and inflate your subscriber count. Over time, this affects deliverability and engagement rates. The solution is to control validation first, then control frequency.

To limit form submissions in [MailPoet](https://www.mailpoet.com/), enable double opt-in, restrict how your forms are displayed, and add rate limiting with OOPSpam. These three steps prevent fake signups, reduce list pollution, and protect your sender reputation.

Below is the exact setup.

## **1. Control Signup Behavior in MailPoet**

Start by configuring how subscriptions are handled. MailPoet includes built-in controls that reduce fake or automated signups.

### **Enable Double Opt-In**

![Enable Double Opt-In](/blog/assets/posts/enable-double-opt-in.png "Enable Double Opt-In")

[Double opt-in](https://kb.mailpoet.com/article/128-signup-confirmation-double-opt-in-feature) requires users to confirm their email before being added to your list.

To enable it:

1. Go to **MailPoet → Settings**.
2. Open the **Sign-up Confirmation** tab.
3. Toggle **Enable sign-up confirmation** to active. 
4. Save changes.

Now users must confirm their subscription through email. This prevents bots from instantly joining your list with fake addresses.

### **Limit Which Lists a Form Can Subscribe To**

![MailPoet Forms](/blog/assets/posts/mailpoet-list.png "MailPoet Forms")

Each MailPoet form can be connected to specific lists.

1. Go to **MailPoet → Forms**.
2. Edit the form.
3. Under form settings, select only the lists you want subscribers added to.

Avoid connecting one form to multiple unnecessary lists. This limits exposure if spam occurs.

MailPoet’s built-in settings reduce fake confirmations. However, they do not stop rapid repeated submissions. For that, you need rate limiting.

## **2. Restrict Form Access Using Display Rules**

MailPoet forms allow display targeting. This does not directly limit submissions, but it reduces exposure.

![MailPoet forms](/blog/assets/posts/restrict-form-access-using-display-rules.png "MailPoet forms")

When editing a form:

1. Open **Display Settings**.
2. Choose where the form appears.
3. Limit display to specific pages instead of the entire website.

This reduces unnecessary visibility and lowers automated scanning. You can also disable popups or floating bars if they attract spam.

Display control reduces surface area. It does not stop bots entirely.

## **3. Add Rate Limiting with OOPSpam**

MailPoet does not include per-IP or per-email rate limits by default. Without [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam), a bot can submit your signup form many times within minutes.

[OOPSpam](https://www.oopspam.com/) (that's us 👋) adds this control. It checks submissions before MailPoet processes them and blocks repeated abuse automatically.

### **Step 1: Install OOPSpam**

Go to **Plugins → Add New**. Search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**. Install and activate the plugin.

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

[Create an account](https://app.oopspam.com/Identity/Account/Login) at OOPSpam.com and copy your API key.

![OOPSpam account ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam account ")

In WordPress, go to **OOPSpam → General Settings**, paste your API key, and save.

![OOPSpam - General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam - General Settings")

Your site is now connected.

### **Step 2: Enable Protection for MailPoet Forms**

In OOPSpam settings, enable spam protection for MailPoet or general WordPress forms.

![Enable Protection for MailPoet Forms](/blog/assets/posts/enable-spam-protection-for-mailpoet.png "Enable Protection for MailPoet Forms")

This ensures each subscription attempt is checked before MailPoet adds the user.

### **Step 3: Turn On Rate Limiting**

Open the **Rate Limiting** tab and enable it.

![Turn On Rate Limiting](/blog/assets/posts/rate-limiting-settings-oopspam.png "Turn On Rate Limiting")

You can configure:

* **Max submissions per IP per hour** – Limits how many times one IP can subscribe in an hour.
* **Max submissions per email per hour** – Limits how often one email can attempt signup.
* **Block duration** – How long an IP or email stays blocked after hitting the limit.
* **Data cleanup schedule** – Automatically removes old logs to keep performance stable.

For example, you might allow 5 submissions per IP per hour. If exceeded, that IP is temporarily blocked.

This stops rapid bot-driven signups.

## **Strengthen Protection with Advanced Filters**

OOPSpam also provides additional controls:

* [VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-givewp-donation-forms), proxy, and TOR blocking
* [Country allow](https://www.oopspam.com/blog/how-to-block-countries-in-givewp-donation-forms) or deny lists
* Language filtering
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* [Logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring attempts

You can also use manual moderation to block specific emails, IP addresses, or keywords, and allow trusted users to bypass checks.

![OOPSpam manual moderation](/blog/assets/posts/manual-moderation-settings-oopspam.png "OOPSpam manual moderation")

These features create layered protection and reduce false positives.

## **Final Thoughts**

Limiting form submissions in MailPoet is simple when you apply the right controls. With these layers in place, your MailPoet forms remain clean, manageable, and focused on real subscribers instead of spam.

A smaller, verified list always performs better than a large, polluted one. Protect your forms early and you avoid cleanup later.
