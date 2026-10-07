---
layout: post
title: Stop Spam on Breakdance Forms Using Make and oopspam
date: 2024-10-28T04:01:00.000Z
author: chazie
image: /assets/posts/social-media-meta.png
description: Easily set up AI-powered spam protection on Breakdance forms using
  oopspam and Make to streamline and secure your form submissions.
tags:
  - Breakdance forms
  - spam protection
  - Make automation
  - oopspam integration
---
![Breakdance webpage promoting its built-in form builder, highlighting its advanced functionality compared to third-party plugins.](/blog/assets/posts/form-builder.png "Breakdance Homepage")

Spam submissions on your [Breakdance forms](https://www.oopspam.com/blog/spam-protection-for-breakdance) can quickly turn into a frustrating time drain. 

Good thing, there’s an easy fix! By integrating oopspam’s advanced spam detection with Make’s automation, you can stop those fake submissions before they clutter your inbox. 

This guide will walk you through the setup, and I’ll even show you how to manage Breakdance’s email notifications within Make to save you time and hassle. 

## Why Spam Protection is Important

Spam isn’t just an inconvenience; it can have tangible impacts on your website performance, marketing efforts, and user experience. Every spam form submission:

* Wastes time, as you manually filter through junk to find real leads.
* Pollutes your analytics, leading to misleading data on campaign performance.
* Can overwhelm your email notifications, making it harder to spot legitimate requests.

oopspam (that’s us 👋) offers robust, AI-powered spam filtering that can block unwanted submissions before they even reach you, while Make lets you automate the entire process. Sounds like a win-win, right? 

### Prerequisites for This Setup

Before getting started, you’ll need a few things ready:

* A WordPress site with **Breakdance Forms** installed and configured. (Make sure you have the **Pro version** of [Breakdance](https://breakdance.com/), as Webhooks are a Pro-only feature.)
* A **Make** account (sign up at [make.com](https://www.make.com/)).
* An **oopspam** account (sign up at [oopspam](https://www.oopspam.com/)) and your **API key**.

Let’s dive into the steps!

## Set Up oopspam for Spam Protection

![oopspam dashboard showing API usage, response time, active API key, and a test section for spam detection data with sample code.](/blog/assets/posts/oopspam-dashboard.png "oopspam Dashboard")

If you don’t have an account, head over to [oopspam ](https://www.oopspam.com/)and sign up. Once you’ve created your account, log in to your dashboard.

In the oopspam dashboard, you’ll find your **API key**. Copy this as we’ll need it later to connect with Make.

✨  oopspam’s spam filtering is powered by AI, and it supports multiple layers of protection, including filtering out disposable emails and restricting submissions by IP or country. With your API key, you’re ready to integrate it into your form submission workflow!

## Build and Configure Your Breakdance Form

If you already have a Breakdance form set up, feel free to skip to the next step. Otherwise, let’s build and configure your form for integration with Make and oopspam.

In WordPress, go to the Breakdance page builder and create a form. Add fields such as **Name**, **Email**, and **Message**—whatever you need for your site.

### Remove Email from Actions

🚨 This is crucial! 

Under the **Actions After Submit** section, remove “Email.” If you don’t do this, Breakdance will still send email notifications even if the submission is spam. We’ll manage email notifications later in Make, so you won’t miss out on legitimate form submissions.

![Actions After Submission settings with 'Email' and 'Store Submission' selected, and an option to remove them.](/blog/assets/posts/submission-actions.png "Submission Actions")

### Add Webhook

Next, add a **Webhook** as one of the actions under **Actions After Submit**. This will allow us to send form data to Make, where we’ll integrate oopspam.

![Checklist with options including GetResponse, MailChimp, MailerLite, Webhook (selected), Popup, and oopspam spam check.](/blog/assets/posts/integration-options.png "Integration Options")

🎯 To use the **Webhook** feature in Breakdance forms, you’ll need the **PRO version** of Breakdance. While you can see the Webhook option in the free version, the forms won’t work properly without the Pro upgrade. 

So, make sure you’ve got the Pro version activated. This way, everything will run smoothly and your form submissions will be sent as expected.

## Create a Make Scenario

Now that our form is configured, it’s time to set up the automation in Make to connect Breakdance with oopspam. 

Head to [Make ](https://www.make.com/)and log in (or create an account if you don’t have one yet). Click on **Create a new scenario** to start the process.

### Add a Webhook Module

For our first module, add a **Webhook** and generate the Webhook URL. Copy this URL.

![Webhook setup interface showing a generated webhook URL, options to edit, stop, or copy the address, and instructions for listening to data.](/blog/assets/posts/webhook-setup.png "Webhook Setup")

### Connect Breakdance to Make

Go back to Breakdance and paste the Webhook URL you just generated into the Webhook action under **Actions After Submit**.

Now, whenever someone submits your form, the data will be sent to Make for processing.

### Important Webhook Configuration Tip 

🚨 **Note:** When configuring the Webhook in Breakdance, do **NOT** enable **Field Map**. 

Why? When Field Map is used, Breakdance does not send the IP address to Make, which can significantly impact the accuracy of spam detection. 

So, keep Field Map off to ensure the full form data (including IP) is passed to oopspam for proper filtering.

Here's the right configuration example:

![Webhook configuration window showing a field for the webhook URL, with options to add data and headers.](/blog/assets/posts/webhook-configuration.png "Webhook Configuration")

## Integrate oopspam for Spam Detection

With the form data flowing into Make, the next step is to [integrate oopspam](https://help.oopspam.com/other-integrations/make/) to automatically check the submissions for spam.

1. In Make, click the **+** button to add another module. Search for **oopspam Anti-Spam** and select **Check for Spam**.
2. When prompted, paste in the oopspam API key you copied earlier to create a connection.
3. Map the relevant form fields from Breakdance to oopspam. 

![oopspam Anti-Spam setup showing connection details, options to filter by IP, email, and content, with settings for blocking temporary emails and viewing logs.](/blog/assets/posts/spam-settings.png "Spam Settings")

Specifically:

* **Content:** Map this to the **Message** field.
* **Email:** Map this to the **Email** field.
* **IP Address:** If available, map it here to improve spam detection accuracy.

✨  **Tip:** On this screen, you can also configure additional settings to block by **country**, **disposable emails**, and **language** for even stronger spam protection.

## Handle Spam and Legitimate Submissions

With oopspam now checking your form submissions, we need to handle both spam and legitimate entries.

### Add a Router Module

To separate spam from legitimate submissions, add a **Router** module after the oopspam spam check in Make.

![Workflow diagram showing webhooks connecting to oopspam Anti-Spam, followed by routing to Google Sheets for spam submissions and Email for non-spam.](/blog/assets/posts/spam-workflow.png "Spam Workflow")

### Handle Spam Submissions

For the spam path, set a condition where if the **spam score** is greater than 2, it triggers this path. Instead of sending an email notification, you could [store the submission in Google Sheets](https://www.make.com/en/help/app/google-sheets) or another app for later review.

#### **Spam Score Guide:**

* **1-2:** Not spam
* **3-6:** Spam

![Workflow setup showing oopspam Anti-Spam and router configuration with a filter for non-spam submissions based on spam score.](/blog/assets/posts/spam-filter.png "Spam Filter")

### Handle Legitimate Submissions

For legitimate submissions, set the condition where the spam score is less than or equal to 2. You can trigger email notifications here or save the data in your CRM or database.

## Test Your Setup

Now that everything is configured, it’s time to test your setup. Go to your Breakdance form and submit a few tests, including both [spammy content](https://help.oopspam.com/wordpress/testing/) and legitimate data.

In Make, check the logs to see if spam submissions were flagged correctly and if legitimate submissions were processed as expected. You should see legitimate submissions in your email inbox like this one:

![Email titled 'New Legitimate Submission' displaying a message from Chazie with options to reply, forward, or use AI reply.](/blog/assets/posts/legitimate-submission.png "Legitimate Submission")

If you chose to store spam submissions in Google Sheets or a similar app, review the entries there to ensure spam was properly captured.

![Google Sheets document titled 'Breakdance Forms - Spam Submissions' displaying names, emails, messages, and spam scores.](/blog/assets/posts/spam-submissions.png "Spam Submissions")

## Wrapping Up

With oopspam’s AI-powered filtering and Make’s automation capabilities, you can efficiently block spam on Breakdance forms. This setup not only helps you manage spam but also gives you full control over how legitimate submissions are handled—whether through email, CRM systems, or Google Sheets.

By integrating oopspam with Make, you no longer need to worry about spam polluting your inbox. So, go ahead and enjoy a cleaner, spam-free experience with your Breakdance forms!

✨  **Bonus Tip:** If you're looking for a simpler setup, oopspam also offers a [WordPress plugin](https://www.oopspam.com/wordpress) that you can use. However, note that Breakdance doesn’t allow plugins to stop email notifications—hence the Make integration is a great workaround to manage everything more effectively.
