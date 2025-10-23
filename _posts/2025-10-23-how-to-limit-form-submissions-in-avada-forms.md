---
layout: post
title: How to Limit Form Submissions in Avada Forms?
date: 2025-10-23T11:09:00.000+08:00
author: chazie
image: /blog/assets/posts/avada_form_rt.jpg
description: Learn how to limit spam and control Avada Form submissions
  effectively using OOPSpam rate limiting, VPN blocking, and data retention best
  practices.
tags:
  - Avada Form
  - Rate limiting
---
![Avada Forms](/blog/assets/posts/avada-for-wordpress.png "Avada Forms")

[Avada Forms](https://avada.com/feature/form-builder/) doesn’t have a built-in feature to limit form submissions per user or total entries. The most effective way to control submissions and stop spam is by using OOPSpam. It integrates with Avada Forms to apply rate limits, block VPNs, and manage abusive traffic, all without affecting real users.

## **Limit Form Submissions with OOPSpam**

**[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) is the [best way to stop spam](https://www.oopspam.com/blog/4-ways-to-protect-your-avada-forms-from-spam), limit form submissions per user, and block unwanted sources.

Avada Forms by itself can’t limit how many times a single user submits a form. OOPSpam fills that gap by screening every entry before it’s processed. It can detect abuse, enforce submission limits, and reduce fake entries.

### **What OOPSpam Can Do**

* [Limit submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) per IP or email per hour.
* Detect and [block VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-avada-forms), proxy, or TOR traffic.
* Apply country allow or deny lists.
* Filter by language to stop foreign-language spam.
* View [detailed logs](https://help.oopspam.com/wordpress/form-entries/) of blocked attempts.

OOPSpam’s advanced filters ensure your inbox stays clean and your CRM receives only genuine leads.

### **How to Set Up OOPSpam for Avada Forms**

![OOPSpam ](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam ")

#### **Install and Connect**

From your WordPress dashboard, go to **Plugins → Add New**. Search **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![OOPSpam Anti-Spam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam dashboard")

[Create an OOPSpam account](https://app.oopspam.com/Identity/Account/Login) and **copy your API key**.

![Paste your API key](/blog/assets/posts/oopspam-api-key.png "Paste your API key")

In WordPress, open **OOPSpam → General Settings** and paste your API key.

![Avada Forms spam protection](/blog/assets/posts/spam-protection-for-avada-forms.png "Avada Forms spam protection")

Enable **Avada Forms spam protection** if prompted, then click **Save Changes**.

#### **Enable Rate Limiting**

Go to **OOPSpam → Rate Limiting Settings**. Toggle **Enable Rate Limiting** to **ON**.

![Rate Limiting Settings](/blog/assets/posts/rate-limiting-settings.png "Rate Limiting Settings")

Configure your limits:

* **Max submissions per IP/hour** – Limits how many times one IP can submit per hour.
* **Max submissions per email/hour** – Restricts how many times one email can submit per hour.
* **Block duration (hours)** – Temporarily blocks users after exceeding limits.
* **Data cleanup (hours)** – Automatically clears old log data to keep your database clean.

Click **Save Changes**. 

Now, each submission is checked in real time. Abusive users or bots exceeding the limits are automatically blocked.

### **Strengthen Security with OOPSpam Filters**

Enhance your [form protection](https://www.oopspam.com/blog/ways-to-stop-spam) with these settings:

* **VPN/Proxy/TOR Blocking:** Prevents automated or anonymous submissions.
* **Country Rules:** Allow [only the regions](https://www.oopspam.com/blog/how-to-block-countries-in-avada-forms) you serve.
* **Language Filter:** Reject messages in irrelevant languages.

> **Example:** Allow three submissions per IP per hour and two per email. If someone exceeds this limit, they’re blocked for 24 hours.

After setup, test the form by submitting multiple entries quickly to verify that rate limiting works.

## **Privacy Settings in Avada Forms**

![Privacy Settings in Avada Forms](/blog/assets/posts/avada-form-options.png "Privacy Settings in Avada Forms")

> Avada’s Privacy settings manage how submission data is stored, not how many times users can submit.

While Avada Forms doesn’t include submission limit controls, you can still manage how user data is handled:

1. Go to **Form Options → Privacy**.
2. Choose whether to **store IP and User-Agent**.
3. Set the **Duration of Submission Logs** (in months).
4. Select **Submission Expiration Action** (e.g., *Anonymize IP and User-Agent*).

![Avada’s  Form Options](/blog/assets/posts/avada’s-privacy-settings.png "Avada’s  Form Options")

These options help with GDPR compliance and data retention policies. They do not restrict submissions but ensure sensitive data is managed securely.

> **Tip:** Keep logs for 12–24 months if you want to review submission activity or troubleshoot spam issues.

## **Final thoughts**

If you’re serious about controlling spam and preventing repetitive submissions, OOPSpam is your best option. It provides rate limiting, network-based filtering, and detailed logs, all while keeping your genuine visitors safe from false blocks.

For full setup instructions, visit [OOPSpam’s documentation](https://www.oopspam.com/help) and integrate it with Avada Forms today. Your forms will stay clean, secure, and efficient.
