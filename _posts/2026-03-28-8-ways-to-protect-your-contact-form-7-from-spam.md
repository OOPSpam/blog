---
layout: post
title: 8 Ways to Protect Your Contact Form 7 from Spam
date: 2026-03-28T20:21:00.000+08:00
author: chazie
image: /blog/assets/posts/cf7_header_meta.png
description: Protect Contact Form 7 from spam using Turnstile, OOPSpam,
  honeypots, and validation. Simple steps to reduce spam and improve form
  security.
tags:
  - Contact Form 7
  - Turnstile
  - Honeypots
  - reCAPTCHA
---
![Contact Form 7](/blog/assets/posts/using-contact-form-7.png "Contact Form 7")

If your [Contact Form 7](https://contactform7.com/) is getting spam, start with two things: enable Cloudflare Turnstile and install OOPSpam. These handle most automated and low-quality submissions right away.

Then improve your form with validation, honeypots, and basic filters. This combination is simple to manage and works well for most websites.

### **Why Contact Form 7 Gets So Much Spam**

Contact Form 7 is widely used, which makes it an easy target.

Bots are built to scan the web for common plugins. Once they detect a Contact Form 7 form, they attempt to submit links, random messages, or fake inquiries.

Another issue is setup. Many forms are left unprotected after installation. Without proper filtering or bot detection, spam gets through easily.

Spam today is also more advanced. Some bots behave like real users, which is why basic protection alone is not enough.

## **1. Keep Contact Form 7 Updated**

Start with the simplest fix. Updates often include security improvements that reduce abuse. Running an outdated version can leave your form exposed.

![Keep Contact Form 7 Updated](/blog/assets/posts/keep-contact-form-7-updated-1.png "Keep Contact Form 7 Updated")

To update, go to **Dashboard → Updates**, find Contact Form 7, and click **Update Now**.

![Contact Form 7 Updated](/blog/assets/posts/keep-contact-form-7-updated-2.png "Contact Form 7 Updated")

Do the same for WordPress core and other plugins. Keeping everything current helps prevent avoidable issues.

## **2. Use Contact Form 7 reCAPTCHA**

Contact Form 7 includes built-in support for Google [reCAPTCHA v3](https://developers.google.com/recaptcha/docs/v3), which helps reduce spam without adding friction for users. It works in the background by assigning a score to each submission and blocking those that appear to be bots.

To set it up, go to the **Google reCAPTCHA Admin Console**, register your site, and choose **reCAPTCHA v3**. Copy your Site Key and Secret Key.

![Google reCAPTCHA Admin Console](/blog/assets/posts/contact-form-7-recaptcha-v3.png "Google reCAPTCHA Admin Console")

Then in WordPress, go to **Contact → Integration**, click **Setup Integration** under reCAPTCHA, paste your keys, and save.

![reCAPTCHA](/blog/assets/posts/setup-integration-under-recaptcha.png "reCAPTCHA")

Once enabled, reCAPTCHA starts protecting your Contact Form 7 forms automatically.

## **3. Use Cloudflare Turnstile**

[Turnstile](https://www.oopspam.com/turnstile-alternative) is one of the easiest ways to block bots without affecting real users. Instead of showing puzzles, it runs quietly in the background and checks user behavior. Most visitors will not even notice it.

To set it up, [create a Turnstile account](https://dash.cloudflare.com/sign-up) on Cloudflare and register your website. You will get a Site Key and Secret Key.

![Use Cloudflare Turnstile](/blog/assets/posts/turnstile-cf7.png "Use Cloudflare Turnstile")

In WordPress, go to **Contact → Integration**, find Turnstile, and paste your keys. Save the changes, and it will start working immediately.

## **4. Add OOPSpam for Filtering**

[OOPSpam](https://www.oopspam.com/) (that's us 👋) works differently from Turnstile and CAPTCHA. Instead of asking users to complete a challenge, it analyzes each submission in the background. It looks at behavior, content, and technical signals to decide whether a message is spam.

This makes it effective even against more advanced spam that mimics real users.

### **How to set it up**

Start by installing the plugin. Go to **Plugins → Add New**, search for **“[OOPSpam Anti-Spam](https://www.oopspam.com/wordpress),”** then install and activate it.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

Once activated, you need to connect your website to OOPSpam using an API key.

[Create an account](https://app.oopspam.com/Identity/Account/Login) on the OOPSpam website. After signing in, you will find your **API key** in the dashboard. Copy this key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Next, go back to WordPress and open **Settings → OOPSpam**. Paste your API key into the field provided and save your changes.

![OOPSpam Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam Settings")

At this point, the plugin is connected, but you still need to activate spam protection for Contact Form 7.

![Activate spam protection for Contact Form 7](/blog/assets/posts/activate-contact-form-7.png "Activate spam protection for Contact Form 7")

Scroll through the OOPSpam settings page and find the **Contact Form 7 integration option**. Turn it on. Once enabled, OOPSpam will start filtering submissions automatically.

### **Adjusting your settings**

You do not need to configure everything right away. The default settings already work well for most websites.

However, you can fine-tune the protection if needed. On the settings page, you can:

* Adjust the sensitivity level of spam detection
* Allow or block submissions from [specific countries](https://www.oopspam.com/blog/how-to-block-countries-in-contact-form-7)
* Filter messages based on language
* Enable [logs](https://help.oopspam.com/wordpress/form-entries/) to review blocked submissions

If you are unsure, keep the sensitivity on the default “moderate” level and adjust later based on results.

### **What OOPSpam checks behind the scenes**

OOPSpam uses multiple signals to [detect spam without interrupting users](https://www.oopspam.com/spam-filter-for-contactform7).

It evaluates things like [repeated submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-contact-form-7), suspicious IP behavior, and content patterns. It can also detect traffic [coming from VPNs](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-contact-form-7), proxies, or disposable email services.

Because it runs in the background, your visitors do not experience any extra steps when submitting the form. For most websites, this becomes the main filtering system, while other tools simply support it.

## **5. Add a Honeypot Field**

A [honeypot](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) is a hidden field that normal users never see. Bots tend to fill out every field they detect. When they fill in this hidden field, the submission is flagged as spam.

![Add a Honeypot Field](/blog/assets/posts/honeypot-to-contact-form-7.png "Add a Honeypot Field")

To add one, install the “[Honeypot for Contact Form 7](https://wordpress.org/plugins/contact-form-7-honeypot/)” plugin. Then edit your form under **Contact → Contact Forms** and insert a honeypot tag like: **`[honeypot your-field]`**

Save the form, and it will start working in the background.

## **6. Use the Disallowed List**

WordPress includes a built-in feature that lets you block certain words, links, or IP addresses.

Go to **Settings → Discussion** and scroll to **Disallowed Comment Keys**. Add terms commonly found in spam messages, such as suspicious keywords or URLs.

![Use the Disallowed List](/blog/assets/posts/disallowed-comment-keys.png "Use the Disallowed List")

Save your changes once done. Keep this list focused. Adding too many general words can block real messages.

## **7. Improve Form Validation**

Form validation helps reduce low-quality spam, especially short or random messages. By setting rules on your fields, you can prevent submissions that do not meet basic requirements. 

Contact Form 7 already supports built-in validation, such as required fields and proper email formats. You can also add limits to control how much content users must enter.

For example, you can require fields and set minimum or maximum lengths directly in your form:

**`[text* your-name]`**

**`[textarea* your-message minlength:20 maxlength:500]`**

This ensures that very short or meaningless messages are not submitted.

If needed, you can also create [custom validation](https://contactform7.com/2015/03/28/custom-validation/) rules using filters. For example, you can require users to confirm their email address or match specific field values. This is more advanced, but useful for stricter forms.

## **8. Use Quizzes Only If Needed**

Contact Form 7 includes a [quiz feature](https://contactform7.com/quiz/) that works like a simple question-and-answer check. Before submitting the form, users must enter the correct answer. This can stop basic bots that cannot process the question.

![Use Quizzes Only If Needed](/blog/assets/posts/cf7-quizzes.png "Use Quizzes Only If Needed")

You can add a quiz field directly in your form, such as:

**`[quiz capital-quiz "The capital of Japan?|Tokyo"]`**

Or a simple math question:

**`[quiz math-quiz "1+1=?|2"]`**

You can also include multiple questions, and one will be shown randomly:

```
[quiz random-quiz
"The capital of Japan?|Tokyo"
"The capital of France?|Paris"]
```

While this can help reduce simple spam, it is not very effective against modern bots. It also adds an extra step for users, which can affect form completion.

Because of this, quizzes are best used only for small sites or as an additional check, not as your main protection method.

## **Final Thoughts**

Contact Form 7 spam is manageable once the right tools are in place. 

Spam patterns change over time, so it helps to review your form activity occasionally.

Check your OOPSpam logs and look for patterns in blocked submissions. You might notice repeated phrases, email formats, or locations. Use that information to refine your filters, update your disallowed list, or adjust settings.

A few small adjustments can make a big difference over time.
