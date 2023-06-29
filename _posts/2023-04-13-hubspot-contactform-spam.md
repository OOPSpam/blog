---
layout: post
title:  "Stop spam on HubSpot contact forms using Zapier and OOPSpam"
author: "Onar A."
image: /assets/posts/social-media-meta.png
tags: [zapier, contact_form, hubspot]


description: "Learn how to add spam protection to your HubSpot contact forms."
modified: 2023-06-01
---
<center>
<img width="600" alt="Spam protection for HubSpot forms in Zapier" src="/blog/assets/posts/hubspot-contact-form/overall-setup.png">
</center>
<br/>

<script type="module" src="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.esm.js"></script>
<link rel="stylesheet" href="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.css"/>

## Intro

[HubSpot](https://hubspot.com/) is a popular CRM solution that offers many different tools for businesses, including form creation. HubSpot's forms can be used as contact forms, support tickets, or to generate leads, but they can also be targeted by spammers. To prevent spam, HubSpot offers built-in solutions such as [reCaptcha](https://knowledge.hubspot.com/forms/prevent-spam-form-submissions#enable-captcha) and the ability to [block specific email domains or free email providers](https://knowledge.hubspot.com/forms/prevent-spam-form-submissions#block-specific-email-domains-or-free-email-providers). These settings can be accessed in Form editing mode under _Marketing->Forms_.

If you are still receiving spam submissions despite enabling the built-in spam prevention options in HubSpot, an alternative solution involves using automation tools like [Zapier](https://zapier.com/) or [Make](https://www.make.com) to capture form submissions, filter them through with OOPSpam, and then send a filtered email notification to yourself. This approach can help further reduce the amount of spam you receive through your HubSpot contact forms.

## Choose your automation tools (Zapier, Make, etc.)

We'll be using Zapier for this tutorial, but you can do this with Make or any other automation platforms.

If you wish to skip the steps below, use [the template](https://zapier.com/apps/email/integrations/hubspot/1208740/spam-check-new-hubspot-form-entries-with-oopspam-and-send-outbound-emails) we created for a quick start:

<zapier-zap-templates
  theme="light"
  ids="1208740"
  limit="1"
  presentation="row"
  use-this-zap="show"
></zapier-zap-templates>

<br>
Zapier will walk you through the configuration for all 4 steps: HubSpot -> Spam check with OOPSpam -> Filter -> Email by Zapier.

_Filter_ should be configured by default. The filter is straightforward with just one rule: **continue processing only if the Spam Score is less than 3**.

{% include toc.md %}

## Configuring HubSpot Zap

For demo purposes, we created a page using HubSpot Landing Page builder and embedded a form.

![HubSpot contact form](/blog/assets/posts/hubspot-contact-form/cf.png "HubSpot contact form")

Let's configure Zapier workflow to capture submissions through the form.

To set up HubSpot with the Form Submission event, follow these steps:

1. Select HubSpot Zap and then under Event, select **New Form Submission**.
2. Select **Choose account** to connect your HubSpot account.
3. Select your form under _Trigger_
4. An example submission will be populated at **Test trigger**. Check to see if you get the _We found a form!_ message.
5. You're done! The next step is to check for spam.

![HubSpot Zapier set up](/blog/assets/posts/hubspot-contact-form/hubspot-zapier.gif "HubSpot Zapier set up")

## Checking for spam with OOPSpam

To set up spam protection, follow these steps:

1. Register for an API key on the [OOPSpam dashboard](https://app.oopspam.com/).
2. In Zapier, enter the API key when prompted on the "Choose Account" step.
3. Map necessary form information to OOPSpam's fields:
    - **Content**: This is where the form message goes.
    - **Sender IP**: Leave blank.
    - **Email**: Map the form submitter's email here.
    - **Allow messages only in these languages**: Select any languages you expect to receive form submissions in.
    - **Allow messages only from these countries**: Filter submissions by country. Available only if **Sender IP** is provided.
4. Test the action and use the returned "Score" to approve or reject submissions.

See the GIF below for a visual guide.

![OOPSpam Zapier set up](/blog/assets/posts/hubspot-contact-form/zapier-oopspam.gif "OOPSpam Zapier set up")

## Filtering with Filter

Now that we have our HubSpot contact form submissions flowing into Zapier, we can use the "Filter" app to set conditions for our automation flow to continue.

The "Filter" app provides the necessary tools to screen submissions, allowing us to determine which ones are legitimate and which are spam. In this case, we will use the app to specify that the "Score" (or Spam Score) must be less than 3. This ensures that only submissions with a low spam score will continue through.

![Filter by Zapier set up](/blog/assets/posts/hubspot-contact-form/filter-zapier.gif "Filter by Zapier set up")

### Alternative Approach: Store Spam Submissions in Airtable

Another way to handle spam submissions in your HubSpot contact form is to use the Paths app in Zapier. With this approach, you can take different actions based on whether the submission is spam or not.

- Path A: If the Score is less than 3, then send an email.
- Path B: If the Score is greater than or equal to 3, then create a record in [Airtable](https://airtable.com/) to store spam submissions for later review.

This alternative approach allows you to store all spam submissions in one place for future analysis. If you prefer, you can use another platform such as [Google Sheets](https://www.google.com/sheets/about/) for this purpose.

> It's important to note that scores of 3 and higher should be considered as spam, while scores less than 3 are considered non-spam. This will ensure that only spam submissions are stored in Airtable or Google Sheets.

![Paths by Zapier set up](/blog/assets/posts/hubspot-contact-form/paths-zapier.png "Paths by Zapier set up")


## Send an email to yourself with Email by Zapier

The final step is to set up the **Send Outbound Email** to notify yourself of new submissions.

![Send Email by Zapier set up](/blog/assets/posts/hubspot-contact-form/sendemail-zapier.gif "Send Email by Zapier set up")

In order to send the email, you need to map the required fields to the data from the HubSpot contact form submissions. The required fields are:

- **To**: Your email address (up to 5 emails can be added).
- **Subject**: The name of the form.
- **Body**: The email body can be in HTML or plain text. In the example, the data points (email, name, message fields) are separated by line breaks using the <p> HTML tag.
- **Reply To** (optional): This field is not required, but it makes responding to submissions more convenient. The sender's email can be added here so that you can simply click the "Reply" button in your email client if you want to respond to the submission.

Testing the email notification is an important step to ensure that you receive the notification correctly when a new submission is made. It is recommended to test the email by submitting a test form and verifying that the notification email is received with the correct information.

Additionally, you can use other email service apps such as Postmark or Mailgun instead of _Email by Zapier_ to send the emails. These services can offer better deliverability, additional features and customization options such as email templates and analytic.

## Final thoughts

This was a basic workflow to filter spam with OOPSpam in your HubSpot forms using Zapier. You can also use other platforms to automate the process. Plus, you can add extra steps and conditions to make it more complex, such as sending an automated email response to the visitor confirming successful submission after the spam check or storing submissions in Google Sheets instead of sending an email.