---
layout: post
title: Stop spam on Webflow forms using Zapier and OOPSpam
date: 2024-10-22T21:29:00.000Z
author: onar
image: /assets/posts/social-media-meta.png
description: Learn how to protect Webflow forms from spam without CAPTCHA.
  Step-by-step guide to integrate OOPSpam with Zapier or Make for better spam
  protection.
tags:
  - zapier
  - contact_form
  - make
---
<center>
<a href="https://zapier.com/apps/email/integrations/webflow/1170002/spam-check-new-webflow-contact-form-submissions-with-oopspam-and-send-outbound-emails">
<img loading="lazy"  width="600" alt="Spam protection for Webflow contact form in Zapier" src="/blog/assets/posts/webflow-contact-form/overall-setup.png">
</a>
</center>
<br/>

<script type="module" src="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.esm.js"></script>

<link rel="stylesheet" href="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.css"/>

{% include toc.md %}

## Intro

[Webflow](https://webflow.com/) is a popular website builder that allows users to create websites through a drag-and-drop interface. While the platform provides a reCAPTCHA field to add spam protection to its contact forms, this may not always be effective. reCAPTCHA and other CAPTCHA solutions are becoming increasingly irrelevant due to the availability of services that can solve them for a low cost.

To tackle this issue, this article presents an alternative solution to prevent spam submissions in Webflow contact forms. The approach involves using automation tools such as [Zapier](https://zapier.com/) or [Make](https://www.make.com) to capture form submissions, then filtering them through a spam filter before finally sending an email notification to the user.

## Chose your automation tools (Zapier, Make, etc.)

I'll be using Zapier for this tutorial, but you can do this with Make or any other automation platforms.

If you wish to skip the steps below, use [the template](https://zapier.com/apps/email/integrations/webflow/1170002/spam-check-new-webflow-contact-form-submissions-with-oopspam-and-send-outbound-emails) we created for a quick start:

<zapier-zap-templates
  theme="light"
  ids="1170002"
  limit="5"
  presentation="row"
  use-this-zap="show"

> </zapier-zap-templates>

<br>
Zapier will walk you through the configuration for all 4 steps: Webflow -> Spam check with OOPSpam -> Filter -> Email by Zapier.

*Filter* should be configured by default. The filter is straightforward with just one rule: **continue processing only if the Spam Score is less than 3**.

## Configuring Webflow Zap

I made a simple website using a pre-built template. It includes a working contact form.

![Webflow contact form](/blog/assets/posts/webflow-contact-form/cf.png "Webflow contact form")

Once we connect our Webflow Zapier app to our Webflow account, we should be able see our contact form.

> In order for Zapier to recognize your contact form, you must publish your website and submit at least one form submission. Otherwise, your contact form will be hidden.

To configure Webflow with the Form Submission event, follow these steps:

1. Select Webflow Zap and then under Event, select **Form Submissions**.
2. Select **Choose account** to connect your Webflow account.
3. Fill in the *Site Name* and *Form Name* fields.
4. Your first submission will be populated at **Test trigger**. Check to see if you get the *We found a submissions!* message.
5. You're finished! The following step is to check for spam.

The first submission will also appear as test data when you set up Webflow for the first time.

![Webflow Zapier set up](/blog/assets/posts/webflow-contact-form/webflow-zapier.gif "Webflow Zapier set up")

## Checking for spam with OOPSpam

To set up spam protection, follow these steps:

1. Register for an API key on the [OOPSpam dashboard](https://app.oopspam.com/).
2. In Zapier, enter the API key when prompted on the "Choose Account" step.
3. Map necessary form information to OOPSpam's fields:

   * **Content**: This is where the form message goes.
   * **Sender IP**: Leave blank. Or [follow these steps](https://discourse.webflow.com/t/how-to-track-ip-address-of-people-who-fill-out-a-form/67026/2) to capture an IP and map it to this field.
   * **Email**: Map the form submitter's email here.
   * **Language Allowlist**: Select any languages you expect to receive form submissions in.
   * **Allow messages only from these countries**: Filter submissions by country.
   * **Block messages from these countries**: Block by country
4. Test the action and use the returned "Score" to approve or reject submissions.

See the GIF below for a visual guide.

![OOPSpam Zapier set up](/blog/assets/posts/webflow-contact-form/zapier-oopspam.gif "OOPSpam Zapier set up")

## Filtering with Filter

The "Filter" app in Zapier sets conditions for your automation flow to continue.

In this case, the condition is that the "Score" (or Spam Score) must be less than 3. This ensures that only emails with a low spam score will continue through.

![Filter by Zapier set up](/blog/assets/posts/webflow-contact-form/filter-zapier.gif "Filter by Zapier set up")

### Alternative Approach: Store Spam Submissions in Airtable

Instead of using the Filter app, you can use the Paths app to take different actions based on whether the submission is considered spam or not. Here's an example:

* Path A: If the Score is less than 3, then send an email.
* Path B: If the Score is greater than or equal to 3, then create a record in Airtable to store the spam submission for later review.

This alternative approach stores all spam submissions in Airtable for future analysis. You can use another platform like Google Sheets if desired.

> It's important to note that scores of 3 or higher should be considered as spam, while scores less than 3 are considered non-spam.

![Paths by Zapier set up](/blog/assets/posts/webflow-contact-form/paths-zapier.png "Paths by Zapier set up")

## Send an email to yourself with Email by Zapier

The final step is to set up the **Send Outbound Email** to notify yourself of new submissions.

![Send Email by Zapier set up](/blog/assets/posts/webflow-contact-form/sendemail-zapier.gif "Send Email by Zapier set up")

In order to send the email, you need to map the required fields to the data from the Webflow contact form submissions. The required fields are:

* **To**: Your email address (up to 5 emails can be added).
* **Subject**: The name of the form.
* **Body**: The email body can be in HTML or plain text. In the example, the data points (email, name, message fields) are separated by line breaks using the <p> HTML tag.
* **Reply To** (optional): This field is not required, but it makes responding to submissions more convenient. The sender's email can be added here so that you can simply click the "Reply" button in your email client if you want to respond to the submission.

Once you have set up the email, test it to see if you receive the first submission. You can also use other email services such as Postmark or Mailgun instead of Email by Zapier.

## Final thoughts

This was a basic workflow to filter spam in your Webflow contact forms using Zapier. You can also use other platforms to automate the process. Plus, you can add extra steps and conditions to make it more complex, such as sending an automated email response to the visitor confirming successful submission.
