---
layout: post
title:  "Stop spam on Typeform using Zapier and OOPSpam"
author: onar
image: /blog/assets/posts/typeform/social-meta.png
tags: [zapier, typeform]


description: "Learn how to add spam protection to your Typeform forms."
---
<center>
<img loading="lazy"  width="600" alt="Spam protection for Typeform in Zapier" src="/blog/assets/posts/typeform/overall-setup.png">
</center>
<br/>

<script type="module" src="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.esm.js"></script>
<link rel="stylesheet" href="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.css"/>

## Intro

[Typeform](https://www.typeform.com/) is a popular form builder used for creating various types of forms such as contact forms, feedback forms, sign-up forms, surveys, and more. However, when it comes to spam protection, Typeform doesn't provide any built-in options. [According to their official documentation](https://www.typeform.com/help/a/protect-access-to-your-typeform-360029294452), CAPTCHA solutions like reCAPTCHA or hCAPTCHA are not supported. Instead, they recommend alternative measures to prevent spam, such as preventing search engine indexing and password-protecting your forms. [Another workaround suggested in the Typeform community](https://community.typeform.com/build%2Dyour%2Dtypeform%2D7/how%2Ddo%2Dyou%2Dinstall%2Da%2Dcaptcha%2Don%2Dyour%2Dform%2Dor%2Dstop%2Dyour%2Dform%2Dfrom%2Dbeing%2Dhit%2Dby%2Dspambots%2D1356) is to include a CAPTCHA image on your form and require users to fill it out before submitting.

It's likely that you are experiencing spam issues on Typeform, just like many others in the community ([source 1](https://community.typeform.com/build-your-typeform-7/my-typeform-got-hit-by-a-spam-robot-1633), [source 2](https://community.typeform.com/build-your-typeform-7/stop-multiple-visits-from-same-ip-bot-606), and [more](https://community.typeform.com/manage-your-typeform-account-48/a-bot-hijacked-my-typeform-7516)). The methods mentioned earlier may no longer be sufficient to protect your forms from spam, as spammers are becoming more sophisticated and use advanced tools.

An alternative solution involves leveraging automation tools such as [Zapier](https://zapier.com/) or [Make](https://www.make.com) to capture form submissions, filter them using OOPSpam, and then receive filtered email notifications or simple store them. By implementing this approach, you can further mitigate the amount of spam received through your Typeform forms. 

{% include toc.md %}

## Choose your automation tools (Zapier, Make, etc.)

We'll be focusing on Zapier for this tutorial, but it's worth mentioning that you can achieve the same results using Make or any other automation platforms of your choice.

If you prefer to skip the following steps and get started quickly, we have created [a template](https://zapier.com/apps/email/integrations/typeform/1211788/spam-check-new-typeform-submissions-with-oopspam-and-send-outbound-email-notifications) that you can use.

<zapier-zap-templates
  theme="light"
  ids="1211788"
  limit="1"
  presentation="row"
  use-this-zap="show"
></zapier-zap-templates>

<br>

Zapier will guide you through the configuration process for all four steps: _Typeform -> Spam check with OOPSpam -> Filter -> Email by Zapier_.

_The Filter_ step should be pre-configured with a simple rule: **continue processing only if the Spam Score is less than 3**.

In contrast to the previous template, we'll take a slightly different approach. Instead of using Filter by Zapier, we'll utilize Paths by Zapier to store both spam and non-spam submissions in an Airtable table. This allows you to review spam entries at a later time.

## Configuring the Typeform Zap

To demonstrate the process, we have created a typeform with 5 fields to collect inquiries from potential clients. Here are the form fields:

- Our organization size is
- Our website is
- The number of API calls we estimate to make per month is
- My email address is
- Let us know if you any questions?

![Typeform quote form](/blog/assets/posts/typeform/cf.png "Typeform quote form")

Let's proceed with configuring the Zapier workflow to capture submissions through the form.

Follow these steps to set up Typeform with the New Entry event:

1. Select Typeform Zap and choose **New Entry** under Event.
2. Connect your Typeform account by selecting **Choose account**.
3. Under _Trigger_, select your form.
4. An example submission will be populated under **Test trigger**. Check if you receive the _We found an entry!_ message. If not, fill and submit the form with example data.
5. That's it! The next step is to check for spam.

![Typeform Zapier set up](/blog/assets/posts/typeform/typeform-zapier.png "Typeform Zapier set up")

## Checking for spam with OOPSpam

To set up spam protection, follow these steps:

1. Register for an API key on the [OOPSpam dashboard](https://app.oopspam.com/).
2. In Zapier, enter the API key when prompted in the "Choose Account" step.
3. Map the necessary form fields to OOPSpam's fields:
    - **Content**: Map any message longer than 20 characters to this field.
    - **Sender IP**: Leave blank as Typeform doesn't provide IP.
    - **Email**: Map the email field.
    - **Allow messages only in these languages**:  Limit submissions by language, using the value from the **Content** field.
    - **Allow messages only from these countries**: Filter submissions by country (available only if **Sender IP** is provided).
4. Test the action and use the returned "Score" to approve or reject submissions.

Refer to the GIF below for a visual guide.

![OOPSpam Zapier set up](/blog/assets/posts/typeform/zapier-oopspam.gif "OOPSpam Zapier set up")

## Storing spam and non-spam submissions

There are a few ways to handle this. You can either use [Filter by Zapier](https://zapier.com/blog/filter-by-zapier-guide/) to store only non-spam entries or use [Paths by Zapier](https://zapier.com/blog/zapier-paths-conditional-workflows/) to categorize all entries as spam or non-spam. This allows you to have all submissions in one place and review spam entries later for any potential false positives.

In this case, we will store the submissions in an Airtable table. Let's create a table to store the form field values. In addition to the form fields, we will add two more fields: **Is it spam** and **Spam Score** and map values:

- **Is it spam?**: This field will store either "spam" or "not spam." You can use this field to filter and organize your submissions.
- **spam score**: OOPSpam Zap will return a spam score, which we will pass to this field. This provides useful information for potential issues and reviews.

![Airtable table](/blog/assets/posts/typeform/typeform-airtable.png "Airtable table")

> 📌 Note, **Is it spam?** is a [_Single select_](https://support.airtable.com/docs/supported-field-types-in-airtable-overview) element with two options spam and not spam.

![Airtable Single Select field](/blog/assets/posts/typeform/airtable-singleselect.png "Airtable Single Select field")

Now that our table is set up, we can use the "Paths by Zapier" app to set conditions for our automation flow to continue in two different paths.

![Paths by Zapier set up](/blog/assets/posts/typeform/zapier-paths.png "Paths by Zapier set up")

Here is the basic logic behind the two paths:

- Path A: If the score is greater than 2, create a record in [Airtable](https://airtable.com/) (you can also use Google Sheets) to store spam submissions for later review. Set the **Is it spam?** value to **spam**.
- Path B: If the score is less than 3, create a record in Airtable. Set the **Is it spam?** value to **not spam**.

> It's important to note that any score equal to or higher than 3 should be classified as spam, whereas scores lower than 3 should be classified as non-spam.

## Send an email notification with Email by Zapier

In addition to creating a record in Airtable, you can send yourself an email notification using [Email by Zapier](https://zapier.com/blog/email-by-zapier-guide/). Follow these steps to set up the **Send Outbound Email** action and notify yourself of new submissions:

In order to send an email, you need to map the required fields to the data from Typeform app. The required fields are:

- **To**: Enter your email address (you can add up to 5 email addresses).
- **Subject**: Specify the name of the form.
- **Body**: The email body can be in HTML or plain text. In the example, the data points (email, name, message fields) are separated by line breaks using the <p> HTML tag.
- **Reply To** (optional): This field is not required, but it allows for convenient response handling. You can add the sender's email address here so that you can simply click the "Reply" button in your email client if you want to respond to the submission.

![Send Email by Zapier set up](/blog/assets/posts/typeform/email-by-zapier.gif "Send Email by Zapier set up")

Testing the email notification is an important step to ensure that you receive the notification correctly when a new submission is made. It is recommended to submit a test form submission and verify that the notification email is received with the correct information.

Additionally, you can use other email service apps such as Postmark or Mailgun instead of _Email by Zapier_ to send the emails. These services can offer better deliverability, additional features, and customization options such as email templates and analytics.

## Final thoughts

This was a simple workflow to filter spam with OOPSpam in your Typeform forms using Zapier. You can also use other platforms to automate the process. Plus, you can add extra steps and conditions to make it more complex, such as sending an automated email response to the visitor confirming successful submission after the spam check or storing submissions in Google Sheets. The possibilities are endless, and you can customize the workflow according to your specific needs and preferences.