---
layout: post
title: How to Limit Form Submissions in Ultimate Member
date: 2025-12-11T07:11:00.000+08:00
author: chazie
image: /blog/assets/posts/limitform_um.jpg
description: Learn how to limit Ultimate Member form submissions with OOPSpam
  and built-in tools that reduce spam, repeated attempts, and abusive
  registrations.
tags:
  - Ultimate Member
  - Rate Limiting
---
![Ultimate Member](/blog/assets/posts/ultimate-member-header.png "Ultimate Member")

Ultimate Member cannot limit form submissions by itself. To control repeated registrations, spam attempts, or abusive activity, you must add rate limiting, spam detection, or a third-party form plugin. The easiest method is using OOPSpam with Ultimate Member.

## **Ultimate Member Does Not Offer Form Submission Limits**

[Ultimate Member](https://ultimatemember.com/) focuses on managing users, roles, and content access. It does not track or control submission frequency. There is no feature to limit total entries, per-user attempts, or per-IP activity.

UM does include basic spam prevention:

* Blocked email addresses
* Blacklisted username words
* Google [reCAPTCHA](https://www.oopspam.com/blog/best-recaptcha-alternatives)
* Content restriction for non-public pages

These tools help reduce low-quality signups, but they do not stop repeated or automated submissions.

### **Why You Need a Third-Party Solution**

Spam bots often submit the registration form many times within minutes. Since UM cannot block these repeated attempts, a layer of rate limiting and spam scoring is necessary.

**[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) provides:

* [Spam detection](https://www.oopspam.com/blog/spam-protection-for-ultimate-member)
* Rate limiting
* Country and proxy filtering
* Logs and monitoring

This gives you full control over how often the form can be submitted.

## **How to Set Up OOPSpam for Ultimate Member**

![OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam")

### **Step 1 — Install the Plugin**

Go to **Plugins → Add New**, search for **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, install, and activate.

### **Step 2 — Connect Your API Key**

Create an account at [OOPSpam.com](https://app.oopspam.com/Identity/Account/Login). Copy your API key.

![Connect Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Connect Your API Key")

In WordPress, open **OOPSpam → General Settings**, paste your key, and save.

![OOPSpam General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings")

### **Step 3 — Enable Ultimate Member Protection**

Toggle **Ultimate Member Form Spam Protection** on. This ensures every registration and login attempt is checked before submission.

![Enable Ultimate Member Protection](/blog/assets/posts/ultimate-member-spam-protection.png "Enable Ultimate Member Protection")

### **Step 4 — Turn On Rate Limiting (The Feature UM Lacks)**

Open **OOPSpam → Rate Limiting** tab and toggle **Enable Rate Limiting** on.

![Turn On Rate Limiting](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn On Rate Limiting")

Set limits such as:

* **Max submissions per IP per hour** — Limits how many times the same IP address can submit within an hour.
* **Max submissions per email per hour** — Prevents one email address from sending multiple repeated submissions.
* **Block duration (hours)** — Sets how long OOPSpam will block an IP or email after it reaches the limit.
* **Data cleanup schedule** — Automatically removes old submission records to keep rate limiting running smoothly.

These settings stop rapid-fire form submissions from bots and abusive users. Save your changes to apply the limits.

## **Strengthen Your Protection Further**

OOPSpam includes advanced filters that reduce false positives and catch sophisticated bots. Useful settings include:

* VPN / Proxy / TOR blocking
* [Country allow/deny list](https://www.oopspam.com/blog/how-to-block-countries-in-ultimate-member)
* Language filtering
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* [Logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring attempts

These features create a layered defense that Ultimate Member does not provide.

## **If You Are Using OOPSpam**

If OOPSpam is installed, you do **not** need to rely on Ultimate Member’s manual blocking tools. 

![OOPSpam Manual Moderation](/blog/assets/posts/manual-moderation.png "OOPSpam Manual Moderation")

OOPSpam allows you to manually control submissions before they reach Ultimate Member. From the **Manual Moderation** tab, you can:

* Block email addresses to stop known spam sources
* Block IP addresses that repeatedly abuse registration or login forms
* Block specific keywords commonly used by bots or fake accounts
* Allow trusted emails or IPs to bypass spam checks when needed

These rules are applied before Ultimate Member processes the form, which makes them more effective than UM’s built-in manual blocking.

## **If You Are Not Using OOPSpam**

If OOPSpam is not installed, Ultimate Member’s built-in options can still help reduce low-quality registrations. You can use:

### **Blocked Email Addresses**

You can enter individual emails or entire domains. This stops disposable or suspicious addresses from registering.

![UM Blocked Email Addresses](/blog/assets/posts/um-block-email-address-on-registration.png "UM Blocked Email Addresses")

### **Blacklist Words**

UM prevents usernames containing specific words. Default entries include admin, webmaster, support, staff, and similar terms. Add more if needed.

![UM Blacklist Words](/blog/assets/posts/um-blacklist-words.png "UM Blacklist Words")

### **Content Restriction**

You can [restrict most pages](https://docs.ultimatemember.com/article/1914-restriction-content) to logged-in users.

![UM Content Restriction](/blog/assets/posts/um-restriction-content.png "UM Content Restriction")

**Note:** Login, Registration, and Password Reset cannot be restricted and will always be public.

## **Alternative Method: Use a Form Plugin With Built-In Limits**

If your form needs a strict total limit, per-user cap, or scheduled availability, use a form builder that supports these features. Reliable options include:

* [WPForms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wpforms) (Form Locker Add-On)
* [Ninja Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-ninja-forms)
* [Gravity Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-gravity-forms)

These plugins handle submission limits, while Ultimate Member handles user roles and profiles.

## **Final Thoughts**

Ultimate Member does not offer submission limits. To protect your registration and login forms from repeated attempts, you need [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) and advanced spam filtering. OOPSpam provides this through IP and email caps, country filtering, proxy blocking, and contextual detection. Ultimate Member’s built-in settings help reinforce your defenses.

Together, these tools keep your membership site clean, secure, and free from automated abuse.
