---
layout: post
title: How to Limit Form Submissions in WPForms?
date: 2024-12-17T02:04:00.000Z
author: chazie
image: /assets/posts/limitform_wpforms.jpg
description: Limit form submissions in WPForms using the Form Locker addon and
  OOPSpam rate limiting. Learn how to control entry caps, user limits, and spam
  safely.
tags:
  - Rate Limiting
  - WPForms
  - Form Locker Addon
---
![WPForms](/blog/assets/posts/wpforms-home.png "WPForms")

If you want to limit submissions in [WPForms](https://wpforms.com/), you have two solid options.

Use the Form Locker Addon when you need hard rules like a total entry cap, scheduling, logged-in access, or “one entry per person.” Add **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋) rate limiting when your problem is repeated abuse, form floods, or the same IP or email submitting over and over in a short period.

This guide shows both, so you can choose what fits your form.

## **What “limit form submissions” can mean**

People use this phrase in a few different ways. [WPForms](https://www.oopspam.com/blog/wpforms-block-user) can handle each one, but the tool you use depends on the goal.

* **Limit total entries**: Stop accepting submissions after a set number (example: 100 contest entries).
* **Limit entries per person**: Restrict repeat submissions by email, IP, or logged-in user.
* **Limit by time**: Open and close the form on specific dates, or run daily or weekly limits.
* **Limit floods and repeated abuse**: Reduce automated or repeated submissions from the same source.

Form Locker handles the first three. OOPSpam is best for the last one.

## **Option 1: Limit submissions using WPForms only (Form Locker Addon)**

If your goal is to cap entries, control access, or run time-based submission rules, [Form Locker](https://wpforms.com/docs/how-to-install-and-use-the-form-locker-addon-in-wpforms/) is the cleanest built-in approach.

### **Step 1: Install WPForms Pro and activate Form Locker**

Install and activate **WPForms Pro** (or higher). In WordPress, go to **WPForms → Addons**. Search for **Form Locker**, then click **Install Addon** and activate it.

### **Step 2: Open the form and go to Form Locker settings**

Next, open the form you want to restrict.

Go to **WPForms → All Forms**, then click **Edit** on the form you want to limit. This opens the WPForms form builder.

![WPForms Form Locker ](/blog/assets/posts/wpforms-form-locker.png "WPForms Form Locker ")

Inside the builder, click **Settings**, then select **Form Locker**. You’ll now see all [Form Locker controls](https://wpforms.com/docs/how-to-install-and-use-the-form-locker-addon-in-wpforms/) in one place, including entry limits, user restrictions, and scheduling options.

### **Limit the total number of entries**

Use this when your form should stop after a specific number of submissions.

1. Under **Entry Limits and Restrictions**, toggle **Enable total entry limit** on.
2. Set the **Limit** (example: 100).
3. Add a **Closed Message** that displays when the form is full.
4. Click **Save**.

This is ideal for contests, registration caps, applications, and limited-time offers.

### **Limit entries per user (by IP or email)**

![Limit entries per user (by IP or email)](/blog/assets/posts/restrict-entries-ip-email.png "Limit entries per user (by IP or email)")

Use this when you want to stop repeat submissions from the same person.

1. Toggle **Enable user entry limit** on.
2. Choose your restriction method:
3. * Restrict by IP address

   * Restrict by email address
4. If you restrict by email, select the email field from the dropdown.
5. Set the maximum number of entries allowed per user.
6. Choose a timeframe such as:
7. * per 24 hours

   * per 7 days

   * per month

   * per year
8. Add the message users see when they hit the limit.
9. Click **Save**.

This is a great fit for surveys, appointment requests, lead forms, and signups where duplicates cause trouble.

### **Require unique answers for specific fields**

![Require unique answers for specific fields](/blog/assets/posts/require-unique-answers-for-specific-fields.png "Require unique answers for specific fields")

Use this when a user must submit a unique value like an email address, phone number, or name.

1. Click the field you want to protect (commonly Email, Phone, Name, or Single Line Text).
2. Open the **Advanced** settings for that field.
3. Check **Require unique answer**.
4. Save the form.

If someone tries to submit a duplicate value, WPForms will block it and show an error.

### **Schedule when your form is open**

![Schedule when your form is open](/blog/assets/posts/wpforms-form-scheduling.png "Schedule when your form is open")

Use this when the form should only accept entries during a certain time window.

1. In **Settings → Form Locker**, find **Form Scheduling**.
2. Set your start date and end date.
3. Save.

This is useful for seasonal promotions, limited-time registrations, and application windows.

### **Restrict your form to logged-in users only**

Use this when the form is for members, customers, students, or internal teams.

1. In **Settings → Form Locker**, find **Form Restrictions**.
2. Enable the logged-in restriction option.
3. Save.

## **Option 2: Add OOPSpam for advanced rate limiting and abuse control**

Form Locker can limit entries per user, but it is not designed to stop fast, repeated attempts from automated traffic. That’s where [rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) helps.

Rate limiting sets a “submission speed limit.” For example, you can allow only a few submissions per hour from the same IP or the same email. When the limit is exceeded, the source gets blocked for a defined period.

### **Step 1: Install and connect OOPSpam**

To add rate limiting and advanced spam protection, start by installing **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**.

![Install and connect OOPSpam](/blog/assets/posts/oopspam-anti-spam-overview.png "Install and connect OOPSpam")

In WordPress, go to **Plugins → Add New**, search for **OOPSpam Anti-Spam**, then install and activate the plugin.

Next, [create an account](https://app.oopspam.com/Identity/Account/Login) at OOPSpam and copy your API key. 

![OOPSpam ](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam ")

In your WordPress dashboard, go to **OOPSpam → General Settings**, paste the API key into the field provided, and save your changes.

![OOPSpam General Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings")

### **Step 2: Enable protection for WPForms**

Once connected, go to the OOPSpam settings for integrations and turn on spam protection for **WPForms**.

![Enable protection for WPForms](/blog/assets/posts/wpforms_activate-spam-protection.png "Enable protection for WPForms")

This ensures submissions are checked before they are delivered.

### **Step 3: Enable rate limiting and set your limits**

With [WPForms spam protection](https://www.oopspam.com/blog/spam-protection-for-wpforms) enabled, open the **Rate Limiting** tab in OOPSpam.

Toggle **Enable Rate Limiting** on to activate submission limits. From here, you can control how often a form can be submitted from the same source.

![Enable rate limiting and set your limits](/blog/assets/posts/enabled-rate-limiting-settings.png "Enable rate limiting and set your limits")

Configure:

* **Max submissions per IP per hour -** Limits how many times one IP can submit a form in an hour to prevent repeated automated attempts.
* **Max submissions per email per hour -** Restricts how often the same email can be used to submit a form within an hour.
* **Block duration (hours) -** Sets how long an IP or email is temporarily blocked after exceeding the limit.
* **Data cleanup schedule -** Automatically clears old rate-limit logs to keep the database optimized.

Save changes.

A simple starting point for public contact forms is to keep limits reasonable, then tighten them only if you see [abuse patterns](https://help.oopspam.com/wordpress/form-entries/).

## **Option 3: Field-level limits (input control, not submission control)**

These do not limit how many people can submit the form. They limit what users can type into specific fields, which improves data quality and prevents invalid entries.

### **Limit words or characters in a field**

For text fields, go to the field’s **Advanced** tab in Field Options and set word or character limits where available. This is useful for message fields, short-answer forms, and any form where you want clean, consistent input.

### **Limit number ranges in the Numbers field**

![WPForms Numbers field](/blog/assets/posts/wpforms-limit-numbers-form.jpg "WPForms Numbers field")

If you use a [Numbers field](https://wpforms.com/developers/how-to-limit-range-allowed-in-numbers-field/), WPForms supports basic range limits directly in Field Options.

1. Click your **Numbers** field.
2. Go to **Field Options** and find the **Range** controls.
3. Set your minimum and maximum values.

For specialized rules like enforcing even numbers only, you can add a CSS class in the Advanced tab and apply a small JavaScript snippet site-wide, so the rule can be reused across multiple forms.

## **Which option should you use?** 

If you only need a submission cap, scheduling, login-only access, or unique entries, Form Locker is usually enough.

If you are dealing with repeated abuse, automated bursts, or the same IP or email hammering your forms, add OOPSpam rate limiting on top of Form Locker.

Many sites run both:

* Form Locker to control how many entries are accepted and who can submit
* OOPSpam to prevent floods from consuming those limited slots

## **Final thoughts**

Limiting WPForms submissions is not one setting, it is a mix of controls depending on what you are trying to stop. Start with Form Locker for hard rules like caps, schedules, and per-user limits. Add OOPSpam when you need true rate limiting and [stronger abuse prevention](https://www.oopspam.com/integrations/spam-protection-for-wpforms).
