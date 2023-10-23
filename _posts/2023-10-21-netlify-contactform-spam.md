---
layout: post
title:  "Stop spam on Netlify Forms using Zapier and OOPSpam"
author: "Onar A."
image: /assets/posts/social-media-meta.png
tags: [zapier, contact_form]


description: "Learn how to add spam protection to your Netlify Forms without reCaptcha"
# modified: 
---
<center>
<a href="https://zapier.com/apps/email/integrations/netlify/1579593/spam-check-new-netlify-contact-form-submissions-with-oopspam-and-send-outbound-emails">
<img width="600" alt="Spam protection for Netlify contact form in Zapier" src="/blog/assets/posts/netlify/overall-setup.png">
</a>
</center>
<br/>

<script type="module" src="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.esm.js"></script>
<link rel="stylesheet" href="https://cdn.zapier.com/packages/partner-sdk/v0/zapier-elements/zapier-elements.css"/>

{% include toc.md %}

## Intro

[Netlify](https://netlify.com/) is a leading website deployment platform known for its ability to deliver highly scalable websites. It simplifies the build process and makes it possible to deploy websites quickly. 

In this article we will focus on [Netlify Forms](https://www.netlify.com/platform/core/forms/) and its anti-spam features. It is easy to set up Netlify Forms, all you need to do is add its ``netlify'' attribute to an HTML form and it will automatically collect all form data.

By default, all forms are filtered by Akismet. After the submissions go through the spam filter, they are categorized into two lists: not spam entries under _Verified Submissions_ and spam entries under _Spam Submissions_.  Years ago, I had a simple website hosted on Netlify with a form, so I decided to check _Verified Submissions_. To my surprise, I noticed a lot of obvious spam submissions going through. Here are a few of them:

![Netlify Form Verified Submissions](/blog/assets/posts/netlify/verified-submissions.png "Netlify Form Verified Submissions")

but it also did a good job of catching a lot of them:

![Netlify Form Spam Submissions](/blog/assets/posts/netlify/spam-submissions.png "Netlify Form Spam Submissions")

In addition to Akismet, Netlify Forms also supports the [reCaptcha](https://docs.netlify.com/forms/spam-filters/#recaptcha-2-challenge) and [honeypot](https://docs.netlify.com/forms/spam-filters/#honeypot-field) fields. We previously talked about [how the honeypot technique prevents bots](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field) from spamming your forms. Although it's less effective now, it still works to some extent.
The hidden honeypot field will not be visible to humans, but bots will consider it a valid field. Bots scan web pages and fill in all fields, including the hidden field in your form. Netlify Forms will reject any submission that contains an entry in a hidden field.

As mentioned above, Netlify also comes with reCaptcha v2 support. Although, reCaptcha and other captcha solutions are becoming increasingly irrelevant due to the availability of services that can solve them for a low cost.

If you are still getting spam with the options available to you through Netlify, this article will look at an alternative solution to prevent spam submissions to Netlify contact forms. The approach is to use automation tools such as [Zapier](https://zapier.com/) or [Make](https://www.make.com) to capture form submissions, then filter them through a spam filter (using [OOPSpam](https://www.oopspam.com/)) before finally sending an email notification to yourself.

I'll be using Zapier for this tutorial, but you can do this with Make or any other automation platforms.

If you wish to skip the steps below, use [the template](https://zapier.com/apps/email/integrations/netlify/1579593/spam-check-new-netlify-contact-form-submissions-with-oopspam-and-send-outbound-emails) we created for a quick start:

<zapier-zap-templates
  theme="light"
  ids="1579593"
  limit="5"
  presentation="row"
  use-this-zap="show"
></zapier-zap-templates>

<br>
Zapier will walk you through the configuration for all 4 steps: Netlify -> Spam check with OOPSpam -> Filter -> Email by Zapier.

_Filter_ should be configured by default. The filter is simple with only one rule: **Continue processing only if spam score is less than 3**.

## Capturing Netlify form submissions

Our goal is to build a simple automation flow where it checks every form submission with OOPSpam and sends an email to us.

![Netlify Zapier](/blog/assets/posts/netlify/netlify-zapier.png "Netlify Zapier")

1. First, add Netlify zap to your flow and under _Event_, select _New Form Submission_. Connect your Netlify account so that it can retrieve available forms from your account.

![Netlify Trigger on Zapier](/blog/assets/posts/netlify/Netlify-Trigger.png "[Netlify Trigger on Zapier")

2. Under _Trigger_, select your _Site_ and _Form_ and click Continue.

3. In the _Test_ step, your last 3 form submissions will be populated. So make sure you have submitted some test form.

## Setting up OOPSpam for spam detection

To set up spam filtering in your Zapier flow, follow these steps:

1. Register for an API key on the [OOPSpam Dashboard](https://app.oopspam.com/).
2. Add the [OOPSpam](https://zapier.com/apps/oopspam/integrations) Zap to your flow
3. Under OOPSpam's _Event_ select _Check for spam_
2. To connect your OOPSpam account, enter the API key when prompted on the _Choose Account_ step.
3. Map the necessary form information to OOPSpam's fields:
    - **Content**: This is where the form message goes. Usually called **Data Message**.
    - **Sender IP**:  This is where the IP of the form submitter goes. Usually called **Data Ip**.
    - **Email**: This is where the form submitter's email goes. Usually called **Data Email**.
    - **Allow messages only in these languages**: Select any languages you expect to receive form submissions in.
    - **Allow messages only from these countries**: Filter submissions by country.
    - **Block messages from these countries**: Block by country.
4. Test the action. We will use the "score" returned by OOPSpam to approve or reject submissions with [Filter Zapier](https://zapier.com/blog/filter-by-zapier-guide/) in the next step.

![OOPSpam Zapier setup](/blog/assets/posts/netlify/oopspam-zapier.png "OOPSpam Zapier setup")


## Filtering with Filter

The "Filter" app in Zapier sets conditions for your automation flow to continue.

In this case, the condition is that the "Score" (or Spam Score) must be less than 3. This ensures that only emails with a low spam score pass through.

![Filter by Zapier set up](/blog/assets/posts/webflow-contact-form/filter-zapier.gif "Filter by Zapier set up")

### Alternative approach: Storing spam submissions in Airtable

Instead of using the Filter app, you can use the Paths app to take different actions depending on whether the submission is considered spam or not. Here's an example:

- Path A [Not spam]: If the Score is less than 3, then send an email.
- Path B [Spam]: If the Score is greater than 2, then create a record in Airtable to store the spam submission for later review.

This alternative approach stores all spam submissions in Airtable for future analysis. You can use another platform such as Google Sheets if you prefer.

> It's important to note that scores of 3 or higher should be considered spam, while scores below 3 should be considered non-spam.

![Paths by Zapier set up](/blog/assets/posts/netlify/paths-zapier.png "Paths by Zapier set up")

## Send an email to yourself with Email by Zapier

The final step is to set up the **Send Outbound Email** to notify yourself of new submissions. Depending on your use case, you could also use Slack or another type of notification.

![Send Email by Zapier set up](/blog/assets/posts/netlify/sendemail-zapier.png "Send Email by Zapier set up")

To send the email, you will need to map the required fields to the data from the Netlify contact form submissions. The required fields are:

- **To**: Your email address (up to 5 emails can be added).
- **Subject**: The name of the form.
- **Body**: The email body can be in HTML or plain text. In the example, the data points (email, name, message fields) are separated by line breaks using the <p> HTML tag.
- **Reply To** (optional): This field is not required, but it makes responding to emails more convenient. The sender's email can be added here so that you can simply click the "Reply" button in your email client if you wish to respond to the submission.

Once you have the email set up, test it to see if you receive the first submission. You can also use other email services like Postmark or Mailgun instead of Email by Zapier.

## Final thoughts

This was a basic workflow for filtering spam in your Netlify forms using Zapier and OOPSpam. You can also use other platforms to automate this process. You can also add additional steps and conditions to make it more complex, such as sending an automated email response to the visitor confirming successful submission.