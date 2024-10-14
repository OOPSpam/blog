---
layout: post
title:  "Troubleshooting Gravity Forms Not Sending Email Notifications"
author: onar
image: /blog/assets/posts/gravityforms-email-notification/meta.png
tags: [wordpress, contact_form, gravity]

description: "Learn how to fix Gravity Forms not sending email notifications. Discover step-by-step solutions using SMTP plugins, email delivery services, and spam protection."
# modified: 
---
<center>
<img loading="lazy"  alt="" src="/blog/assets/posts/gravityforms-email-notification/header.png">
</center>
<br/>

## Why you're not getting emails?

You're not alone if you're NOT receiving email notifications from your [Gravity Forms](https://www.gravityforms.com/) on your website. The plugin uses the built-in *wp_mail* function to send your email notifications. Unfortunately, many hosting providers don't configure this properly, leading to emails being marked as spam or not delivered at all.
To solve this, start using an SMTP plugin with a third-party email delivery service. An SMTP plugin connects your WordPress site to a dedicated email service, significantly increasing the chances that your emails will reach their intended recipients. Here are some improvements you'll see after switching to an SMTP plugin:

- Improved Deliverability: Your emails are actually will be delivered to people's inbox
- Authentication: SMTP plugins provide proper authentication for your emails. This means that receiving email servers can verify that the email truly came from your domain, reducing the likelihood of your messages being flagged as spam.
- Detailed Logging and Tracking: Most SMTP plugins offer detailed logs of sent emails. This feature is invaluable for troubleshooting when emails aren't being received. You can see exactly what happened to each email, whether it was sent successfully, and if not, why it failed.
- Better Performance: For high-traffic sites sending many emails, an SMTP plugin can offer better performance. It can handle large volumes of emails more efficiently than the default *wp_mail* function.
- Better Security: SMTP plugins typically support encryption protocols like SSL/TLS, ensuring that your emails are transmitted securely. This is particularly important for sites handling sensitive information.
- Compatibility with Email Services: Using an SMTP plugin allows you to easily integrate with popular email services like Gmail, Outlook, or dedicated transactional email services like SendGrid, Mailgun, or my personal favorite Postmark.

{% include toc.md %}

## How to fix it?

I'll keep this section brief. To resolve the issue of Gravity Forms not sending email notifications, you need to get these 3 things right:

1. Use an email delivery service (e.g., [Postmark](https://postmarkapp.com/))
2. Implement an SMTP plugin (e.g., [WP Mail SMTP](https://wordpress.org/plugins/wp-mail-smtp/), [Gravity SMTP](https://www.gravityforms.com/gravity-smtp/))
3. Set up spam protection (e.g., [OOPSpam](https://www.oopspam.com/wordpress))

When combined, these solutions will ensure you receive an email notification in your inbox for each legitimate (non-spam) form submission.

## Setting up a Postmark account

To start using an SMTP plugin, you have several options:

- [WP Mail SMTP](https://wordpress.org/plugins/wp-mail-smtp/)
- [FluentSMTP](https://wordpress.org/plugins/fluent-smtp/)
- [Easy WP SMTP](https://wordpress.org/plugins/easy-wp-smtp/)
- [Gravity SMTP](https://www.gravityforms.com/gravity-smtp/) (available for Gravity customers only)

These popular solutions offer similar functionality and support top email delivery services. We'll use Postmark with WP Mail SMTP as an example, but the configuration is similar for other SMTP plugins and email delivery services. Here's the basic setup to start receiving emails from your forms:

1. Register for a Postmark account
2. Add and verify your domain in your account
3. Set up DKIM, SPF, and DMARC
4. Copy your Server API Token (we'll use this in the SMTP plugin)
5. Done!

For detailed instructions, check out [the official Postmark's step-by-step article](https://postmarkapp.com/support/article/1002-getting-started-with-postmark) and [how to get Server API Token in your Postmark account](https://postmarkapp.com/support/article/1207-how-to-create-and-send-through-message-streams).

## Setting up an SMTP plugin

Recently, the company behind Gravity Forms released a new SMTP plugin called Gravity SMTP. There is an official guide on [how to use Gravity SMTP with Gravity Forms](https://www.gravityforms.com/blog/the-ultimate-gravity-smtp-guide/). In this post, I will use WP Mail SMTP instead of Gravity SMTP.

Setting up WP Mail SMTP with Postmark is straightforward. WP Mail SMTP provides a detailed article on [how to achieve this step-by-step](https://wpmailsmtp.com/docs/how-to-set-up-the-postmark-mailer-in-wp-mail-smtp/). Here's a quick guide to configure it:

1. Install [WP Mail SMTP](https://wordpress.org/plugins/wp-mail-smtp/) and click *"Get Started"* to begin configuring the plugin.

    ![WP Mail SMTP get started](/blog/assets/posts/wpforms-email-notification/wpmail-get-started.png "WP Mail SMTP get started")

2. Select Postmark as your email delivery service in the next step. You can choose a different service depending on your budget and needs. We recommend Postmark based on our positive experience, but connecting any email service follows a similar process.

    ![WP Mail SMTP Postmark](/blog/assets/posts/wpforms-email-notification/wpmail-postmark.png "WP Mail SMTP Postmark")

3. Paste your *Server API Token* from your Postmark account into the corresponding field in the next step.

    ![WP Mail SMTP Postmark Config](/blog/assets/posts/wpforms-email-notification/wpmail-config.png "WP Mail SMTP Postmark Config")

That's all there is to it. The final step will send a test email to your address. Be sure to also test by submitting a form to ensure everything is working correctly.

## Setting up a spam filter

Now that you have a form with proper email notifications set up, it's crucial to protect it from abuse and spam if you haven't already implemented spam protection. Here are a few important reasons why you should take this seriously:

- Your Postmark account limit could be quickly reached due to spam submissions.
- Spam can lead to a higher bounce rate and more spam complaints for your Postmark account, potentially resulting in account suspension.
- Your domain's reputation can be damaged, making it difficult for your emails to reach recipients' inboxes, regardless of the email delivery service you use.

While [Gravity Forms comes with built-in spam protection](https://www.oopspam.com/blog/spam-protection-for-gravity-forms) such as reCAPTCHA, hCAPTCHA, Turnstile, we will use [OOPSpam Spam Protection for WordPress](https://wordpress.org/plugins/oopspam-anti-spam/) to view all form submission logs, including those that were filtered out as spam. The plugin captures these logs immediately after a visitor submits a form, before any emails are sent. This provides you with a comprehensive record of all submissions, helping you understand which ones didn't trigger an email notification and why.

![OOPSpam WordPress Plugin Logs](/blog/assets/posts/wpforms-email-notification/form-entries.png "OOPSpam WordPress Plugin Logs")

In addition, the plugin allows you to set up a filter to allow submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for Gravity Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Gravity Forms installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/gravity/oopspam-gravity-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Gravity Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"   alt="OOPSpam detected spam on Gravity Forms" src="/blog/assets/posts/gravity/gravity-spam-detected.png">
</center>
<br/>

## Final thoughts

This is a common issue many form builder plugin users face. In this article, we went through how to set up a SMTP plugin and enable spam protection with logging functionality for Gravity Forms.