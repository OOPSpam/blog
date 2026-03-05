---
layout: post
title: 3 Ways to Protect Your Breakdance Forms from Spam
date: 2026-03-05T11:36:00.000-06:00
author: chazie
image: /blog/assets/posts/header_bkdance.png
description: Learn how to protect Breakdance Forms from spam using Honeypot,
  reCAPTCHA v3, and OOPSpam with a simple layered setup guide.
tags:
  - Breakdance
  - Breakdance Forms
  - Honeypot
  - reCAPTCHA
---
![Breakdance](/blog/assets/posts/breakdance-home.png "Breakdance")

Spam protection is essential for [Breakdance](https://breakdance.com/) Forms. Bots can bypass simple filters and submit messages that look real. Using just one protection method is not enough.

The solution is layered protection. Enable the built-in Honeypot to block basic bots. Add Google reCAPTCHA v3 to analyze user behavior. Use OOPSpam to evaluate message content, email quality, and IP signals. Together, these three tools significantly reduce spam and keep your submissions clean.

Here is how to set them up correctly.

## **1. Enable the Built-In Honeypot Field**

The [Honeypot](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) is the easiest and fastest protection you can enable in Breakdance. It requires no API keys, no third-party services, and no extra configuration beyond a simple toggle.

### **How to Enable Honeypot in Breakdance**

![Honeypot in Breakdance](/blog/assets/posts/honeypot-in-breakdance.png "Honeypot in Breakdance")

1. Open your page in Breakdance.
2. Select the Form Builder element.
3. Go to the **Advanced** section.
4. Toggle **Add Honeypot Field** on.
5. Save your form.

Once enabled, Breakdance automatically adds a hidden field (commonly named **hpinput**). If that field contains data during submission, the form will reject it.

The Honeypot effectively blocks basic bots and low-effort spam scripts. However, it does not stop advanced bots that simulate real browser behavior or human-assisted spam submissions. For that reason, you should treat it as your first layer of defense, not your only one.

## **2. Add Google reCAPTCHA v3**

Google [reCAPTCHA v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website) adds a behavioral layer to your spam protection. Unlike older versions of [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives), it does not require users to solve puzzles. Instead, it runs silently in the background and assigns a risk score based on how the user interacts with the page.

This approach helps identify suspicious activity without creating friction for legitimate visitors.

### **Step 1: Generate reCAPTCHA API Keys**

![Generate reCAPTCHA API Keys](/blog/assets/posts/recaptcha-form.png "Generate reCAPTCHA API Keys")

1. Visit the Google Cloud Console.
2. Create a new reCAPTCHA key.
3. Choose **Website** as the platform type.
4. Add your domain.
5. Copy the **Site Key** and **Secret Key**.

### **Step 2: Enable reCAPTCHA in Breakdance**

![reCAPTCHA in Breakdance](/blog/assets/posts/recaptcha-in-breakdance.png "reCAPTCHA in Breakdance")

1. Select your Form Builder element.
2. Go to **Advanced → reCAPTCHA settings**.
3. Toggle reCAPTCHA on.
4. Enter your Site Key and Secret Key.
5. Save the form.

After saving, visit your form on the frontend. You should see the reCAPTCHA badge at the bottom-right of the page, which confirms it is active.

While reCAPTCHA improves protection significantly, it does not eliminate spam entirely. Some services solve CAPTCHAs manually. Some bots simulate real human activity. That is why content-based filtering is still necessary.

## **3. Use OOPSpam for Advanced Spam Filtering**

[OOPSpam](https://www.oopspam.com/) (that's us 👋) adds intelligent [spam protection to Breakdance Forms](https://www.oopspam.com/blog/spam-protection-for-breakdance). It evaluates the actual message, not just the user behavior.

## **Option 1: Activate OOPSpam Using the WordPress Plugin**

This is the easiest way to add OOPSpam to Breakdance Forms.

### **Step 1: Install the Plugin**

Go to **Plugins → Add New**. Search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**. Install and activate the plugin.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

### **Step 2: Get Your API Key**

Subscribe to OOPSpam, log in to your [dashboard](https://app.oopspam.com/Identity/Account/Login) and copy your API key.

![OOPSpam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam")

### **Step 3: Add API Key in WordPress**

![Add API Key in WordPress](/blog/assets/posts/oopspam-api-key.png "Add API Key in WordPress")

1. Go to your WordPress Admin Dashboard.
2. Navigate to **Settings → OOPSpam Anti-Spam**.
3. Paste your API key in the appropriate field.
4. Make sure you select the **OOPSpam Dashboard** on the settings page.
5. Save changes.

### **Step 4: Enable Spam Protection for Breakdance Forms**

If Breakdance is installed, a dedicated Breakdance Forms section will appear automatically in the OOPSpam plugin settings.

![Enable Spam Protection for Breakdance Forms](/blog/assets/posts/screenshot_2026-03-04_at_10.35.23_am.png "Enable Spam Protection for Breakdance Forms")

In this section:

1. Turn on Activate Spam Protection.
2. Optionally customize the Breakdance Forms Spam Message that appears when a submission is flagged as spam.
3. Save your settings.

After enabling this option, OOPSpam will automatically monitor all Breakdance form submissions and filter spam based on its detection rules.

No additional actions need to be added inside the Breakdance form builder. Once spam protection is activated, OOPSpam works in the background and evaluates every submission automatically.

### **Optional Settings**

You may also configure additional options in this section:

* Content field mapping if your form uses multiple message fields
* Exclude specific forms from spam protection using their form IDs

These settings are optional and are only needed for advanced configurations.

Once configured, OOPSpam will begin filtering Breakdance form submissions immediately.

## **Option 2: Advanced Setup Using Make + OOPSpam**

For most websites, the OOPSpam WordPress plugin is enough to protect Breakdance Forms. However, some teams prefer more advanced automation workflows.

Connecting Breakdance Forms to [Make](https://www.oopspam.com/blog/stop-spam-on-breakdance-forms-using-make-and-oopspam) allows you to process submissions, filter spam, and route legitimate entries to different systems such as CRMs, spreadsheets, or email tools.

This setup is useful if you want more control over how form submissions are handled after they are submitted.

### **Basic Workflow**

1. Add a **Webhook** action to your Breakdance form.
2. Send the form submission data to **Make**.
3. Use the **OOPSpam module** in Make to evaluate the submission.
4. Route the result to different actions depending on the spam score.

### **Configure the Webhook in Breakdance**

![Webhook in Breakdance](/blog/assets/posts/integration-options.png "Webhook in Breakdance")

Open your Breakdance form and go to **Actions → Actions After Submit**. Add a **Webhook** action and paste the webhook URL generated from Make.

### **Configure the Scenario in Make**

![Scenario in Make](/blog/assets/posts/spam-settings.png "Scenario in Make")

Inside Make:

1. Add a **Webhook module** to receive the form submission.
2. Add the **OOPSpam – Check for Spam** module.
3. Enter your OOPSpam API key.
4. Map the relevant fields from the Breakdance form:
5. * Content → Message field
   * Email → Email field
   * IP Address → IP field (if available)

Providing the IP address improves detection accuracy.

### **Route Submissions Based on Spam Score**

![Route Submissions Based on Spam Score](/blog/assets/posts/spam-workflow.png "Route Submissions Based on Spam Score")

After OOPSpam evaluates the submission, you can create routing rules.

For example:

* If the spam score is high, store the submission in a log, spreadsheet, or monitoring tool.
* If the score is low, send the data to email notifications, CRM systems, or marketing tools.

Typical spam score guidance:

* **1–2:** Not spam
* **3–6:** Spam

These thresholds can be adjusted based on your needs.

Using Make in this way gives you full flexibility to automate workflows while keeping spam submissions separated from legitimate leads.

## **Enable Advanced OOPSpam Filters**

For stronger protection, enable additional filters inside OOPSpam:

* [Rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-breakdance-forms) to restrict repeated submissions from the same IP
* [VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-breakdance-forms), proxy, and TOR blocking
* [Country allow](https://www.oopspam.com/blog/how-to-block-countries-in-breakdance-forms) or deny lists
* Language filtering
* Disposable email blocking
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* [Logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring attempts

These settings help stop more sophisticated abuse patterns.

## **Recommended Protection Setup**

Start by enabling the Honeypot in Breakdance. It is built-in, easy to activate, and blocks many basic bots without affecting users.

If you want a free additional layer, add Google reCAPTCHA v3. It analyzes visitor behavior and helps detect suspicious submissions.

If you need more control over spam filtering, use the OOPSpam WordPress plugin. It evaluates message content, email reputation, and IP signals while keeping the impact on your website’s performance low. 

You don't need to use reCAPTCHA if you are using OOPSpam WordPress plugin.

## **Final Thoughts**

Spam will continue to evolve, but you can stay ahead by combining simple built-in tools with intelligent filtering.

Start with the Honeypot to block basic bots. Add reCAPTCHA v3 to analyze behavior. Use OOPSpam to evaluate the actual submission content before it reaches your inbox.

When configured correctly, this setup keeps your Breakdance Forms clean, protects your CRM, and saves valuable time.
