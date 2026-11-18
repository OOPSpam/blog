---
layout: post
title: 5 Ways to Protect Your Elementor Atomic Forms From Spam
date: 2026-06-15
last_modified_at: 2026-11-18T12:30:00.000+04:00
author: chazie
hub: wordpress-forms
image: /blog/assets/posts/atomic_elementor_meta.png
description: Learn 5 ways to protect Elementor Atomic Forms from spam using
  the new Honeypot and Score-based reCAPTCHA elements, Cloudflare, custom PHP filters
  and oopspam.
tags:
  - Elementor Atomic Forms
---
You can protect Elementor Atomic Forms from spam in five ways. Since Elementor Pro 4.4, Atomic Forms has two built-in options: a Honeypot element and a Score-based reCAPTCHA element. You can also block countries with Cloudflare, add your own rules with the `elementor_pro/atomic_forms/spam_check` PHP filter, or install the oopspam Anti-Spam plugin (that's us 👋) to catch the spam the built-in tools miss.

[Elementor Atomic Forms](https://elementor.com/help/atomic-form-element/) is the form builder in Elementor Editor V4. It builds forms from separate field elements instead of one Form widget, which gives you more design control. When it launched, it had none of the spam protection of the classic [Elementor Form](https://www.oopspam.com/blog/spam-protection-for-elementor-forms) widget. Elementor Pro 4.4, released on November 9, 2026, added honeypot and score-based reCAPTCHA protection to Atomic Forms ([Elementor Pro changelog](https://elementor.com/pro/changelog/)).

Here are the five options, starting with the built-in ones.

## **Method 1: Add the Honeypot Element**

A honeypot is a hidden field that visitors never see but spam bots fill in. When it's filled, the submission is blocked. It adds no friction for real visitors and needs no third-party service.

1. Update Elementor and Elementor Pro to version 4.4 or later.
2. Open your page in the Elementor editor and select your Atomic Form.
3. In the **Elements** panel, drag the **Honeypot** element into the form. A form can have only one.

![Honeypot and Score-based reCAPTCHA elements in the Elementor Elements panel](/blog/assets/posts/atomic-forms-spam-elements.png "Honeypot and Score-based reCAPTCHA elements in the Elementor Elements panel")

4. Check that **Honeypot** appears in the form's **Structure** panel. It has no settings to configure, and it doesn't show on the page.

![The Honeypot element in the Atomic Form structure](/blog/assets/posts/atomic-forms-honeypot.png "The Honeypot element in the Atomic Form structure")

5. Update the page and send a test submission to check that normal entries still go through.

A honeypot stops simple bots. Bots that skip hidden fields, and people who fill in forms by hand, get past it.

## **Method 2: Add the Score-based reCAPTCHA Element**

The **Score-based reCAPTCHA** element uses Google reCAPTCHA v3. Google scores each submission in the background, and Atomic Forms blocks submissions that score too low. Visitors don't see a checkbox or a puzzle.

1. Create a reCAPTCHA v3 key pair in the [Google reCAPTCHA admin console](https://www.google.com/recaptcha/admin) and add your domain.
2. In WordPress, go to **Elementor > Editor > Settings** and open the **Integrations** tab. In the **reCAPTCHA V3** section, enter your **Site Key** and **Secret Key**, set the score threshold, and save.

![The reCAPTCHA V3 section in the Elementor Integrations settings](/blog/assets/posts/elementor-recaptcha-integrations.png "The reCAPTCHA V3 section in the Elementor Integrations settings")

3. In the editor, drag the **Score-based reCAPTCHA** element into your Atomic Form. A form can have only one. If you haven't added your keys yet, the element shows a **Set up** button that takes you to **Integrations**.

![The Score-based reCAPTCHA element with the Set up button](/blog/assets/posts/atomic-forms-score-based-recaptcha.png "The Score-based reCAPTCHA element with the Set up button")

4. Update the page and send a test submission.

A higher threshold blocks more bots but can also block real visitors. Start with the default and raise it only if spam keeps getting through. reCAPTCHA sends visitor data to Google, which matters under GDPR, and it doesn't stop spam typed by real people. See [reCAPTCHA v2 vs v3](https://www.oopspam.com/blog/recaptcha-v2-vs-v3-which-is-right-for-your-website) for more on how scoring works.

## **Method 3: Block Countries at the Cloudflare Level**

If your legitimate audience is geographically concentrated and you are getting spam traffic from [specific regions](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare), Cloudflare's country blocking is one of the effective and lowest-effort options available. Because it acts before a request ever reaches your WordPress site, it stops spam before the form submission even happens.

### **How to set it up**

![Block Countries at the Cloudflare Level](/blog/assets/posts/cloudflare-security-rules.png "Block Countries at the Cloudflare Level")

1. Log into your [Cloudflare dashboard](https://dash.cloudflare.com/) and select your site.
2. Go to **Security > Security rules** (Web Application Firewall).
3. Click **Create rule** under Custom Rules.
4. Set the field to **Country**, the operator to **is in**, and select the countries you want to block.
5. Set the action to **Block** and deploy the rule.

This approach is blunt by design. Use it when you have a clear geographic pattern to your spam and when blocking entire countries does not risk locking out real visitors. For more targeted control, combine it with the methods below.

## **Method 4: Use the** `elementor_pro/atomic_forms/spam_check` **Filter**

Elementor Atomic Forms exposes a PHP filter hook called **`elementor_pro/atomic_forms/spam_check`**. This hook fires during the form submission process and lets you inject custom validation logic before a submission is accepted. If your check fails, the submission is rejected.

This is the most flexible option. You can use it to block specific IP addresses, flag known spam email addresses, check against external APIs, or apply any custom rules your site requires.

### **Example: Blocking by IP address and email**

Add the following code to your theme's **`functions.php`** file or a custom plugin:

```
add_filter( 'elementor_pro/atomic_forms/spam_check', function( $is_spam, $form_data ) {

    // List of blocked IP addresses
    $blocked_ips = [
        '192.168.1.100',
        '203.0.113.45',
    ];

    // List of blocked email addresses or domains
    $blocked_emails = [
        'spammer@example.com',
        '@disposabledomain.com',
    ];

    // Get the submitter's IP address
    $submitter_ip = $_SERVER['REMOTE_ADDR'] ?? '';

    // Check if the IP is blocked
    if ( in_array( $submitter_ip, $blocked_ips, true ) ) {
        return true; // Mark as spam
    }

    // Get the submitted email from form data
    $submitted_email = $form_data['email'] ?? '';

    // Check against blocked emails and domains
    foreach ( $blocked_emails as $blocked ) {
        if ( str_contains( $submitted_email, $blocked ) ) {
            return true; // Mark as spam
        }
    }

    return $is_spam; // Return original value if no rule matched

}, 10, 2 );
```

**What this code does:**

* Defines a list of blocked IP addresses and blocked email addresses or domains.
* Retrieves the submitter's IP from the server request.
* If the IP matches the blocklist, the submission is flagged as spam and rejected.
* If the submitted email contains a blocked address or domain string, it is also rejected.
* Any submission that passes both checks is returned without modification.

**Note on error messages:** When spam is detected, Atomic Forms shows a default error message, but you can customize it to provide clearer feedback to users.

![Elementor Atomic Forms error messages](/blog/assets/posts/atomic-forms-error-setting.png "Elementor Atomic Forms error messages")

To do so:

1. Select the Atomic Form in the Elementor editor.
2. In the left panel, go to **General > Content > States** and select **Error**.
3. Click on the error message text on the canvas.
4. Edit the paragraph to whatever message you want the user to see.

![Elementor Atomic Forms Settings](/blog/assets/posts/atomic-forms-error-message.png "Elementor Atomic Forms Settings")

## **Method 5: Install oopspam Anti-Spam Plugin**

[oopspam](https://www.oopspam.com/) is the most complete plug-and-play option for Elementor Atomic Forms. It hooks directly into the form submission process and applies multiple layers of intelligent filtering before anything reaches your inbox.

### **How to set it up**

Go to **Plugins > Add New** in your WordPress dashboard. Search for **[oopspam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate it.

![oopspam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam Anti-Spam")

Create a free account at[ oopspam.com](https://app.oopspam.com/Identity/Account/Login) and copy your API key from the dashboard.

![Copy your API key](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key")

Navigate to **Settings > oopspam** in WordPress, **paste your API key**, and save.

![Paste your API key](/blog/assets/posts/oopspam-api-key.png "Paste your API key")

In the oopspam settings, find **Elementor Atomic Forms** and toggle on **Activate Spam Protection**.

![Elementor Atomic Forms settings](/blog/assets/posts/elementor-atomic-forms-spam-protection.png "Elementor Atomic Forms settings")

Once active, it begins filtering submissions automatically.

### **What oopspam can filter**

* Submissions from known spam IP addresses and email domains.
* Traffic originating from [VPNs](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-elementor-atomic-forms), proxies, and data center IPs.
* [Disposable](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms) or temporary email addresses.
* Submissions from [specific countries](https://www.oopspam.com/blog/how-to-block-countries-in-elementor-atomic-forms) you choose to block.
* [Repeat submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-elementor-atomic-forms) from the same IP or email within a set time window.

oopspam also includes a [submission log](https://help.oopspam.com/wordpress/form-entries/) so you can review what is being blocked and fine-tune your settings over time. This is particularly useful when legitimate submissions get caught and you need to adjust sensitivity.

## **Final thoughts**

Elementor Atomic Forms now has its own spam protection. Start with the free Honeypot element, and add the Score-based reCAPTCHA element if bots still get through. Neither stops spam typed by real people, VPN and data center traffic, or repeat submissions, so add oopspam for those, with Cloudflare and the PHP filter for site-wide or custom rules.
