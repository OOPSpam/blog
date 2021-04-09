---
layout: post
title:  "How to protect your Ninja Forms from spam with anti-spam filter API"
author: "Onar A."
image: ../blog/assets/nj-oopspam-wordpress-plugin.jpg
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img width="772" alt="OOPSpam Anti-Spam WordPress Plugin supports Ninja Forms" src="/blog/assets/nj-oopspam-wordpress-plugin-header.jpg">
</a>
</center>
<br/>
Recently, we announced the [OOPSpam Anti-Spam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) which uses OOPSpam Anti-Spam API to filter spam on your comments. Very soon we realized that many people also concern about spam through contact forms. In fact, most of the requests to OOPSpam Anti-Spam API are coming from contact form submissions.

A few days ago we published a new update to our WordPress plugin. This update brings [Ninja Forms](https://ninjaforms.com/) support. If you are familiar with WordPress contact form solution then you hear about Ninja Forms. Ninja Forms is a powerful plugin that supports form drag & drop form building and many add-ons for any custom needs. It has a free and premium version. The free version is pretty flexible and allows you to get started quickly. 

Although, Ninja Forms has already built-in support for spam protection. Those are Honeypot and Captcha methods. I wrote shortly about how these techniques are not reliable anymore on [How to add a powerful spam filter to your contact form](https://www.oopspam.com/blog/how-to-add-spamfilter-to-a-contact-form) article. When it comes to a paid plugin, well, there is a well-known Akismet. We have [a dedicated page](https://www.oopspam.com/akismet-alternative.html) on why we think we can do a better job than Akismet without overflowing your database with gigabytes of data, respecting your visitors' privacy and still bringing higher accuracy.

OOPSpam Anti-Spam WordPress plugin now supports:
> - Contact Form 7, Ninja Forms, Gravity Forms
> - Sensitivity Level
> - Country restriction
> - Language restriction
> - Ability restrict IP analyses
> - and more

Back to the plugin, with this update, all your Ninja Forms submission will go through the OOPSpam Anti-Spam API. 
Here are a few steps to activate spam protection for Ninja Forms:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure check OOPSpam Dashboard in the setting page

2. If you have a Ninja Forms installed and activated then a special section will appear on OOPSpam Anti-Spam plugin's setting page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/oopspam-nj-settings.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate Ninja Forms Spam Protection by checking the Activate Spam Protection checkbox. 

4. Don't forget to enter a short message to display when a spam Ninja Forms entry is submitted.

That is all! Now go on and create your forms.

Once spam detected your message will appear on the bottom of the message field.
<center>
<img width="350" alt="OOPSpam Anti-Spam WordPress Plugin" src="/blog/assets/nj-spam-detected.png">
</center>
<br/>

Happy spam-free day!

