---
layout: post
title: 3 Ways to Protect Your QuForm from Spam
date: 2026-03-16T14:59:00.000+08:00
author: chazie
image: /blog/assets/posts/quform_headers.png
description: Protect Quform from spam using built-in tools, Turnstile, hCaptcha,
  submission limits, and OOPSpam advanced filtering.
tags:
  - Quform
  - Turnstile
  - hCaptcha
  - CSRF
  - reCAPTCHA
  - Honeypot
---
![QuForm ](/blog/assets/posts/quform.png "QuForm ")

Spam submissions waste time, pollute lead data, and overload inbox notifications. The good news is that [Quform](https://www.quform.com/) already includes built-in anti-spam tools. When combined with submission limits and advanced filtering, these tools can block most automated spam.

This guide shows three simple ways to protect your Quform forms from spam.

## **1. Enable Quform’s Built-In Protection: reCAPTCHA, Honeypot, CSRF, Turnstile, and hCaptcha**

Quform includes several native features that help stop automated form submissions while keeping the experience simple for real users.

### **CAPTCHA Options (reCAPTCHA, Turnstile, hCaptcha)**

Quform supports multiple CAPTCHA providers:

* Google reCAPTCHA
* Cloudflare Turnstile
* [hCaptcha](https://www.oopspam.com/hcaptcha-alternative)

These tools verify users before submission. They help detect bots using behavior signals, browser data, and challenge responses.

### **Steps to Enable CAPTCHA in Quform**

**Step 1: Open global settings**

Go to **Forms → Settings → reCAPTCHA**

**Step 2: Choose your CAPTCHA provider**

You will see sections for:

#### **reCAPTCHA**

![QuForm reCAPTCHA](/blog/assets/posts/recaptcha-quform.png "QuForm reCAPTCHA")

#### **Cloudflare Turnstile**

![QuForm Cloudflare Turnstile](/blog/assets/posts/cloudflare-turnstile-quform.png "QuForm Cloudflare Turnstile")

#### **hCaptcha**

![QuForm hCaptcha](/blog/assets/posts/hcaptcha-quform.png "QuForm hCaptcha")

**Step 3: Add your keys**

 Enter the required credentials:

* Site Key
* Secret Key

You can get these keys from the respective provider dashboard.

**Step 4: Save settings**

Click **Save** after adding your keys.

Once configured, you can add the CAPTCHA element to your form inside the builder.

**Note:**

* [Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile) is a good low-friction option that often works without user interaction.
* hCaptcha is a strong alternative if you want a non-Google solution.
* Invisible [reCAPTCHA](https://www.oopspam.com/recaptcha-alternative) is ideal for minimal user disruption.

### **Honeypot Fields**

![QuForm Honeypot Fields](/blog/assets/posts/honeypot.png "QuForm Honeypot Fields")

A [honeypot](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) field is a hidden form field that users cannot see. Bots that automatically fill every field will complete it, allowing Quform to detect and block the submission.

Recent updates improved this feature by randomly placing the [honeypot field](https://www.quform.com/blog) and making it look like a normal field to bots, making detection more effective.

### **CSRF Protection**

Quform includes [CSRF](https://www.quform.com/2024/02/quform-2-20-0-released) protection, which adds a unique security token to each form submission. The token ensures the request comes from your website and prevents unauthorized submissions.

To enable or confirm it: Go to **Forms → Settings → Tweaks & Troubleshooting**.Make sure **CSRF protection** is **turned ON**.

![QuForm CSRF Protection](/blog/assets/posts/csrf-protection-quform.png "QuForm CSRF Protection")

Together, these [built-in protections](https://www.quform.com/features) help block common spam methods and should always be the first layer of defense for your Quform forms.

## **2. Use Submission Limits to Prevent Form Abuse**

Another effective way to reduce spam is to [limit how often](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-quform) a form can be submitted. Quform includes built-in controls that allow you to [restrict submissions](https://www.quform.com/2021/10/quform-2-15-0-released) directly from the form builder.

### **Steps to Set Submission Limits in Quform**

**Step 1: Open your form**

Go to **Quform → Forms** in your WordPress dashboard. Select the form you want to protect and click **Edit**.

**Step 2: Go to the Limits settings**

![Go to the Limits settings](/blog/assets/posts/quform-one-entry-per-user.png "Go to the Limits settings")

In the form builder, click the **Settings** icon. Then navigate to **General → Limits**.

**Step 3: Enable submission limits**

![Enable submission limits](/blog/assets/posts/limit-entries.png "Enable submission limits")

You can enable two useful options:

* **One Entry Per User** – Limits the form to one submission per logged-in user or IP address.
* **Limit Entries** – Sets a maximum number of submissions for the form. Once the limit is reached, the form automatically closes and displays a message such as *“This form is no longer open for new submissions.”*

**Step 4: (Optional) Schedule the form**

![Schedule the form](/blog/assets/posts/quform-form-scheduling.png "Schedule the form")

You can also control when the form opens and closes. Go to **Settings → General → Scheduling**, then set the date and time for when submissions should start and stop.

Submission limits help prevent repeated bot submissions and form flooding. Even if spam bots [bypass CAPTCHA](https://www.oopspam.com/blog/bypassing-captcha), these controls can still stop large volumes of automated submissions.

## **3. Use OOPSpam for Advanced Spam Filtering**

Quform’s built-in protections stop many bots, but some spam can still get through. [OOPSpam](https://www.oopspam.com/) (that's us 👋) adds an additional layer of protection by analyzing the actual content of form submissions using machine learning.

OOPSpam evaluates signals such as message content, IP reputation, and behavior patterns. This helps detect more sophisticated spam that traditional methods may miss.

### **Steps to Add OOPSpam to Your WordPress Site**

**Step 1: Install the OOPSpam Plugin**

![OOPSpam Plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Plugin")

Go to your WordPress dashboard and navigate to **Plugins → Add New**. Search for **[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate the plugin.

**Step 2: Get Your API Key**

![Get Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Get Your API Key")

[Create an account](https://app.oopspam.com/Identity/Account/Login) on the OOPSpam website. After logging in, go to your **dashboard** and copy your **API key**.

This key connects your website to OOPSpam’s spam detection service.

**Step 3: Add the API Key in WordPress**

![Add the API Key in WordPress](/blog/assets/posts/oopspam-api-key.png "Add the API Key in WordPress")

Return to your WordPress dashboard and go to **Settings → OOPSpam Anti-Spam**.

Paste your API key into the appropriate field, select **OOPSpam Dashboard** as the key source, and save your settings.

**Step 4: Enable Spam Protection**

![Enable Spam Protection](/blog/assets/posts/spam-protection-for-quform.png "Enable Spam Protection")

In the OOPSpam settings page, turn on **Activate Spam Protection** forQuform. You can also customize the message shown when a submission is flagged as spam. Once saved, OOPSpam will begin monitoring form submissions automatically.

No additional configuration is required inside the Quform builder.

### **Optional OOPSpam Advanced Filters**

For stronger protection, OOPSpam also offers additional filters such as:

* [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to restrict repeated submissions from the same IP
* [VPN](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-quform), proxy, and TOR blocking
* [Country](https://www.oopspam.com/blog/how-to-block-countries-in-quform) allow or deny lists
* Language filtering
* Disposable email blocking
* Contextual spam detection
* [Logs](https://help.oopspam.com/wordpress/form-entries/) for monitoring spam attempts

These tools help detect more advanced abuse patterns. For example, [contextual detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection) analyzes the wording of a message to determine whether it is likely spam.

## **Final Thoughts**

Spam prevention does not need to be complicated. Quform already provides several powerful tools to protect forms from automated submissions.

Start by enabling the built-in protections. Then control how often forms can be submitted. Finally, add a dedicated spam detection service such as OOPSpam for deeper filtering.

With these three steps in place, your Quform forms will remain clean, reliable, and easier to manage, allowing you to focus on real messages instead of spam.
