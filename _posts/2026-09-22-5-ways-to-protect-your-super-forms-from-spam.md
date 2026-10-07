---
layout: post
title: 5 Ways to Protect Your Super Forms From Spam
date: 2026-09-22T21:27:00.000+08:00
author: chazie
image: /blog/assets/posts/general_5ways_superforms.jpg
description: Stop spam in Super Forms with oopspam, reCAPTCHA, duplicate entry
  blocking, custom PHP rules, and Cloudflare. Step-by-step setup.
tags:
  - Super Forms
---
![Super Forms](/blog/assets/posts/super-forms.png "Super Forms")

You can protect[ Super Forms](https://super-forms.com/) from spam in five ways: add an anti-spam plugin such as oopspam, enable Google reCAPTCHA v2 or v3, block duplicate entries, add a custom PHP blocklist, or block countries at Cloudflare. Layering two or three of these works best, since each catches a different type of spam. The steps for each method are below.

## **Method 1: Add Google reCAPTCHA v2 or v3**

Super Forms includes a Google reCAPTCHA element that verifies visitors are human.

![Method 1: Add Google reCAPTCHA v2 or v3](/blog/assets/posts/super-forms-recaptcha.png "Method 1: Add Google reCAPTCHA v2 or v3")

1. Create a v2 (checkbox) or v3 key pair in the[ Google reCAPTCHA admin console](https://www.google.com/recaptcha/admin). Add your exact domain.
2. In WordPress, go to **Super Forms > Settings**, search for "captcha", and paste your Site Key and Secret Key.
3. Save, then add the **reCAPTCHA** element to your form.

[v2 and v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website) keys are not interchangeable. [reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) stops most bots, but it does not reliably stop a human who fills in the form by hand. 

## **Method 2: Block Duplicate Entries**

Duplicate blocking limits repeat submissions from the same email address.

![Method 2: Block Duplicate Entries](/blog/assets/posts/super-forms-duplicate-entries.png "Method 2: Block Duplicate Entries")

1. Edit your form and open **Form Settings**.
2. Set **Save data** to **Save as Contact Entry**.
3. Check **Enable custom entry titles** and enter **{email}** as the value.
4. Enable **Prevent submitting form when entry title already exists**.

This stops repeats from one address. It does not stop a spammer who rotates addresses.

## **Method 3: Install the oopspam Anti-Spam Plugin**

**[oopspam](https://www.oopspam.com/)** hooks into the Super Forms submission process and filters spam automatically. Visitors never see a puzzle or checkbox.

### **How to set it up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate it.

![oopspam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam Anti-Spam")

Create a free account at [oopspam.com](https://app.oopspam.com/Identity/Account/Login) and copy your API key from the dashboard.

![Copy your API key from the dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the dashboard")

Go to **Settings > oopspam**, paste your API key, and save.

![Go to Settings > oopspam, paste your API key, and save.](/blog/assets/posts/oopspam-api-key.png "Go to Settings > oopspam, paste your API key, and save.")

Find the **Super Forms** section and check **Activate Spam Protection**.

![Find the Super Forms section and check Activate Spam Protection.](/blog/assets/posts/super-forms_activate-spam-protection.png "Find the Super Forms section and check Activate Spam Protection.")

* Optional: edit **Super Forms Spam Message**. This is what a visitor sees when a submission is flagged, for example "*Our spam detection classified your submission as spam. Please contact via name@example.com*".

![Super Forms Spam Message](/blog/assets/posts/super-forms-spam-message.png "Super Forms Spam Message")

* Optional: use **Content field mapping** if your form has more than one textarea. Enter the name of the main message field. For multiple forms, separate field names with commas.
* Optional: enter form IDs in **Don't protect these forms** (for example 1,5,2) to skip forms that don't need filtering.

### **What oopspam can filter**

* Known spam IPs and email domains
* VPN, proxy, and data center traffic
* [Disposable email](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms) addresses
* Submissions from [countries](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide) you choose to block
* [Repeat submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) from the same IP or email within a set time

oopspam also keeps a [submission log](https://help.oopspam.com/wordpress/form-entries/), so you can review blocked entries and adjust settings if a real visitor gets caught.

![oopspam submission log](/blog/assets/posts/screenshot-1.png "oopspam submission log")

## **Method 4: Add a Custom PHP Blocklist**

Super Forms documents a **super_before_processing_data** hook that compares submitted values against a list you define. When a value matches, it shows the bot a fake "Thank you" message and discards the submission. The bot never learns it was blocked. See the[ Super Forms code example](https://docs.super-forms.com/developers/code-examples/prevent-form-submission-based-on-entered-field-values.md). Use this for known bad emails or phone numbers. You must maintain the list yourself.

## **Method 5: Block Countries at Cloudflare**

If your spam comes from regions where you have no customers, block them before requests reach WordPress.

![Method 5: Block Countries at Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Method 5: Block Countries at Cloudflare")

1. Log into[ Cloudflare](https://dash.cloudflare.com/) and select your site.
2. Go to **Security > Security rules** and click **Create rule**.
3. Set the field to **Country**, the operator to **is in**, and select the countries.
4. Set the action to **Block** and deploy.

This is a blunt tool. Use it only when the pattern is clear and real visitors won't be locked out.

## **Final thoughts**

Layer your defenses. Start with oopspam for automatic filtering, add reCAPTCHA for bot verification, and use duplicate blocking, custom rules, or Cloudflare for specific patterns. Keep Super Forms updated to 6.3.314 or later, which patched a critical file upload vulnerability.

## Related guides

- [How to Limit Form Submissions in Super Forms?](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-super-forms)
- [How to Block Countries in Super Forms?](https://www.oopspam.com/blog/how-to-block-countries-in-super-forms)
- [How to Block VPN and Data Center IP Submissions in Super Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-super-forms)
