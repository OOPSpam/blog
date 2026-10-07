---
layout: post
title: How to Limit Form Submissions in WS Form?
date: 2024-12-19T03:39:00.000Z
author: chazie
image: /assets/posts/limitform_wsforms.jpg
description: Learn how to secure WS Form using oopspam advanced rate-limiting
  features to block spam, manage submissions, and protect your website.
tags:
  - Rate Limiting
  - WS Form
---
![A graphic titled "How to Limit Form Submissions in WS Form" featuring a "Rate Limit" road sign.](/blog/assets/posts/limitform_wsforms.jpg "How to Limit Form Submissions in WS Form")

Spam and abuse can transform your carefully designed forms into a liability. For WordPress users, forms are an essential gateway for meaningful interactions—whether it’s capturing leads, gathering survey feedback, or managing event registrations.

However, when bots and malicious actors flood your forms with junk submissions, it can waste your time, overload your resources, and compromise your data quality.

[WS Form](https://wsform.com/) is a highly customizable and feature-rich tool for creating forms, but ensuring they remain secure requires advanced measures beyond basic built-in protections. In this blog, we’ll show you how to use oopspam’s rate limiting to enhance WS Form security and limit spam submissions. 

You’ll learn how to block excessive entries and protect your forms without frustrating legitimate users.

## What Is Rate Limiting, and Why Is It Essential?

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) acts like a traffic light for your forms. It sets boundaries on how many times a user can submit a form within a specific period. 

For example, you might allow only three submissions per hour to curb spam while accommodating genuine users.

### Why Rate Limiting Matters

Bots and bad actors can exploit forms in multiple ways:

* **System Overload:** Frequent submissions can slow down or crash your server.
* **Cluttered Data:** Spam submissions make it harder to identify real entries.
* **Poor User Experience:** Legitimate users may face slowdowns or blocked access due to malicious activity.

With rate limiting, you can ensure your website remains secure and user-friendly, delivering a seamless experience while preserving data integrity.

## The Common Challenges of WS Form Without Rate Limiting

![A showcase of over 100 pre-designed form templates for various purposes, including contact forms, job applications, event registrations, e-commerce, and more.](/blog/assets/posts/ws-form-pro.png "Over 100 Pre-Designed Form Templates Available in WS Form PRO")

WS Form’s robust capabilities make it a favorite for creating advanced forms. However, like any tool, its built-in spam protection features have limitations. Without additional measures like rate limiting, you may encounter issues such as:

* **Spam Submissions:** Bots can submit hundreds of entries in seconds, overwhelming your inbox.
* **Duplicate Entries:** Users may unintentionally click “Submit” multiple times, creating redundant data.
* **Brute Force Attacks:** Hackers may repeatedly target login or registration forms to guess credentials.

With bots making up [over 40% of web traffic](https://futurecio.tech/bots-compose-42-of-overall-web-traffic-study-finds/)—and many being malicious—and [69% of spam](https://www.oopspam.com/2024-spam-report) targeting websites using WordPress, adding advanced protection like oopspam can mitigate these vulnerabilities.

## How oopspam Enhances WS Form with Rate Limiting

[oopspam](https://www.oopspam.com/) (that’s us! 👋) integrates seamlessly with [WS Form](https://www.oopspam.com/blog/spam-protection-for-wsform), adding powerful rate-limiting capabilities to control submissions. It not only prevents excessive submissions but also strengthens overall form security with advanced anti-spam features. 

 Here’s how it works:

* **Submission Limits:** Restrict how many times a user can submit a form based on their IP address or email.
* **Temporary Blocks:** Automatically block users who exceed submission limits for a set duration.
* **Multi-Layered Protection:** Combine rate limiting with spam filtering, keyword blocking, and geo-restrictions to secure your forms.

Let’s dive into the step-by-step process for setting up oopspam with WS Form.

## Step-by-Step: Setting Up Rate Limiting in WS Form with oopspam

Follow these steps to enable rate limiting for WS Form:

### 1. Install and Activate oopspam

Get started by installing oopspam Anti-Spam Plugin:

* Go to the WordPress Plugin Repository.
* Search for “**oopspam Anti-Spam Plugin**.”
* Click “**Install**” and then “**Activate**.”

Once activated, you’ll find oopspam in your WordPress dashboard.

📌 **Pro Tip:** Enable spam protection for WS Form in the oopspam settings to apply its features to your forms.

### 2. Navigate to oopspam Settings

![oopspam General Settings panel, showing options for API key setup, sensitivity level adjustment, and spam comment management. ](/blog/assets/posts/oopspam-general-settings.png "oopspam General Settings Panel with Rate Limiting Tab Highlighted")

* Access the oopspam menu in your WordPress dashboard.
* Open the settings tab to find rate-limiting options.

### 3. Enable Rate Limiting

* Toggle the “**Enable Rate Limiting**” switch to activate the feature.
* This ensures all configured forms are protected by rate-limiting rules.

### 4. Set Submission Limits

!["Rate Limiting Settings" page in oopspam, showing options to enable rate limiting and configure limits such as maximum submissions per IP and email per hour, block duration in hours, and data clean-up frequency. ](/blog/assets/posts/rate-limiting-settings.png "oopspam Rate Limiting Settings Configuration Panel")

Customize these parameters:

* **Max Submissions per IP per Hour:** Specify the number of submissions allowed per hour.
* **Max Submissions per Email per Hour:** Limit entries from a single email address.
* **Block Duration:** Set the block period for users exceeding the limit (e.g., 24 hours).
* **Data Clean-Up Frequency:** Determine how often tracking logs are cleared to maintain performance.

### 5. Save and Test Your Settings

* Click “**Save Changes**” to apply your settings.
* Test your form by submitting multiple entries to verify the limits are working correctly.

> 📌 **Helpful Tip:** Start with lenient settings for high-traffic forms and adjust as needed.

## Tips for Maximizing Form Security in WS Form

![oopspam dashboard showing API usage, average response time, active API key, and a "Test with your data" section featuring sample data for spam detection testing. ](/blog/assets/posts/oopspam-dashboard-.png "oopspam Dashboard Overview with API Usage and Testing Features")

To further secure your forms, consider these [best practices](https://www.oopspam.com/blog/new-wp-website-checklist):

* **Keep Plugins Updated:** Regular updates ensure protection against vulnerabilities.
* **Monitor Activity:** Check spam and ham logs to identify unusual patterns.
* **Combine Tools:** Use oopspam alongside [CAPTCHA](https://www.oopspam.com/blog/best-captcha-alternatives) for layered protection.

## Why Choose oopspam for WS Form?

While WS Form offers basic spam protection, it often lacks the depth needed to address modern, sophisticated threats. oopspam elevates your form security to a comprehensive level, combining advanced features to mitigate even the most persistent attacks. 

Here's what sets oopspam apart:

### 1. IP and Email Blocking

oopspam maintains an extensive database of millions of known malicious IPs and email domains to block spam proactively. If any spam bypasses this automatic protection, you have the flexibility to manually blacklist specific IPs or emails, ensuring full control over your form's security.

This functionality keeps you in charge of your form's security. Here's an example:

![A screenshot of the "Manual Moderation Settings" in the oopspam Anti-Spam plugin, displaying fields for managing blocked emails, IPs, keywords, and allowed emails or IPs.](/blog/assets/posts/manual-moderation-settings.png "oopspam Manual Moderation Settings for Blocking and Allowing Emails and IPs")

### 2. Geo-Blocking and Language Filters

![A screenshot of spam filtering settings showing options to allow messages only from selected countries.](/blog/assets/posts/country-language-filter.png "Spam Filtering Settings with Country and Language Restrictions")

oopspam allows you to restrict submissions to [specific geographic regions](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) or languages. This feature is especially useful for businesses targeting local audiences or operating in specific countries. 

For example:

* Block submissions from countries where your services aren’t offered.
* Filter out entries in non-target languages to streamline your form data.

### 3. Keyword Filtering

Advanced machine learning enables oopspam to detect and block spam messages with high accuracy. You can also define custom keywords or phrases to ensure your forms remain spam-free. This dual filtering system adapts to evolving spam tactics while catering to your specific needs.

### 4. Advanced Rate Limiting

Unlike generic rate-limiting tools, oopspam offers precise control over:

* Submission limits per IP or email.
* Adjustable block durations for users exceeding limits.
* Tailored settings for different forms, allowing flexibility across your website.

### 5. Seamless Integration with WS Form

oopspam [integrates effortlessly with WS Form](https://www.oopspam.com/integrations/spam-protection-for-ws-form) and other popular form builders like [Gravity Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-gravity-forms), [WPForms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wpforms), and [Contact Form 7](https://www.oopspam.com/spam-filter-for-contactform7) enhancing its existing functionalities without disrupting your workflow. The plugin is designed to work with popular form builders, providing a versatile solution for spam management.

### 6. GDPR Compliance and Privacy Protection

oopspam prioritizes user privacy by ensuring compliance with GDPR and other data protection laws. Unlike many other plugins, it avoids storing sensitive user data, giving both you and your users peace of mind.

### 7. Comprehensive Spam and Ham Logs

Detailed logs provide visibility into all spam (blocked entries) and ham (legitimate entries) activity. This transparency helps you:

* Monitor patterns in spam attempts.
* Adjust security settings based on real-time data.
* Easily manage and export logs for compliance or analysis.

For more details, check out our[ guide on logging form entries](https://help.oopspam.com/wordpress/form-entries/).

#### Consolidating Security with oopspam

![oopspam Anti-Spam featuring the tagline "Automate your Spam and Abuse Detection" with logos of Webflow, bettermode, and readme, indicating companies that use the service.](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam Anti-Spam - Automate Spam and Abuse Detection")

One of the biggest advantages of oopspam is its ability to streamline form security into a single plugin. With oopspam, you don’t need to juggle multiple tools to achieve comprehensive protection.

Instead of relying solely on WS Form’s default protections, oopspam adds [advanced capabilities](https://www.oopspam.com/blog/wsform-block-user) like spam filtering, keyword blocking, geo-restrictions, and detailed logging. Whether you’re facing bot attacks, manual spamming, or abuse from specific regions, oopspam simplifies and strengthens your security measures.

> oopspam supports integrations with other form builders as well, such as WPForms and Elementor Forms. Check the [oopspam WordPress Plugin page](https://wordpress.org/plugins/oopspam-anti-spam/) for an updated list of supported platforms.

## Final Thoughts

Protecting your WS Form submissions from spam and abuse is critical for maintaining a secure and efficient website. While WS Form provides powerful features for form creation, pairing it with oopspam’s advanced capabilities ensures robust protection.

Set up oopspam today, test your settings, and enjoy the peace of mind that comes with secure, user-friendly forms.
