---
layout: post
title: Stopping Spam Submissions in Google Forms with OOPSpam and Make
date: 2025-01-07T00:40:00.000Z
author: chazie
image: /assets/posts/google-forms-make-and-oopspam-integration.jpg
description: Learn how to stop spam in Google Forms with OOPSpam and Make.
  Streamline submissions, save time, and ensure clean, actionable data
  effortlessly.
tags:
  - Google Forms
  - Make
---
![Google Forms integration with OOPSpam illustration.](/blog/assets/posts/google-forms-make-and-oopspam-integration.jpg "Google Forms and OOPSpam Integration")

Spam submissions on your Google Forms can be a nightmare. Not only do they clutter your responses, but they can also distort your data, waste your time, and drain resources. If you’ve been dealing with spam submissions and wondering how to put a stop to them, you’re in the right place.

In this guide, we’ll walk you through the entire process of integrating Google Forms, [OOPSpam](https://www.oopspam.com/), and [Make](https://help.oopspam.com/other-integrations/make) to create an automated, spam-free workflow. Whether you’re a small business owner or a large organization, this solution will streamline your form submissions and let you focus on what matters most.

## The Importance of Spam Prevention in Google Forms

Before we dive into the step-by-step setup, let’s first understand why spam prevention is critical for your Google Forms.

### Why Spam Submissions Are Problematic

* **Data Corruption:** Spam submissions can skew analytics, making it hard to track accurate trends and insights.
* **Lost Productivity:** Manually sorting through submissions wastes valuable time and effort.
* **Email Overload:** If your forms trigger email notifications, spam submissions can flood your inbox, hiding legitimate responses.

### How OOPSpam Solves the Problem

OOPSpam uses advanced machine-learning spam detection to identify and block malicious submissions before they reach your system. Its algorithms adapt over time, ensuring you stay ahead of evolving spam tactics. 

Combined with Make, OOPSpam becomes a powerful automation tool that keeps your Google Forms free from spam.

## Getting Started: What You’ll Need

Here’s what you’ll need to get started:

* **A Google Form:** Create a Google Form with fields like Name, Email, and Message.
* **Make Account:** Make is a no-code automation platform that connects different apps and services.
* **OOPSpam Account:** Sign up for OOPSpam to access its spam-checking capabilities and API key.

Let’s get started by setting up your form and accounts.

## Step 1: Create and Test Your Google Form

![Sample form layout with fields for name, email, and message.](/blog/assets/posts/sample-form-template.png "Sample Form Template")

The first step is to ensure you have a functional Google Form to use in this process. Follow these steps:

**1. Log into Google Forms**

Visit[ Google Forms](https://forms.google.com) and create a new form.

**2. Design Your Form**

Add relevant fields such as:

* **Name** (Short answer)
* **Email** (Email format)
* **Message** (Paragraph or long answer)

**3. Submit Test Responses**

Add both legitimate and spammy responses to test the system later. Examples:

* **Legitimate:** “John Doe, john@example.com, Interested in your services.”
* **Spam:** “%%BUY NOW\*\*, fake@spam.com, Win a million dollars!”

## Step 2: Set Up Accounts for Make and OOPSpam

To integrate Google Forms with OOPSpam, you’ll need accounts on both Make and OOPSpam.

### Create a Make Account

![Sign-up form with fields for name, email, password, hosting region, and country selection.](/blog/assets/posts/user-sign-up-form.png "User Sign-Up Form")

1. Visit [Make’s website](https://www.make.com/en/register?promo=oopspam-anti-spam-app-partner-program) and click **Sign Up**.
2. Complete the registration process and log in to the Make dashboard.

### Create an OOPSpam Account

![OOPSpam dashboard displaying API usage and spam detection sample data.](/blog/assets/posts/dashboard-sample-data.png "OOPSpam Dashboard with Sample Data")

1. Go to [OOPSpam’s website](https://app.oopspam.com/Identity/Account/Register) and create an account.
2. Once logged in, navigate to the **Dashboard** and copy your **API Key**. This key will allow Make to communicate with OOPSpam.

## Step 3: Set Up the Workflow in Make

![Google Forms integration module showing "Watch Responses" option highlighted.](/blog/assets/posts/google-forms-integration-module.png "Google Forms Integration Module Options")

The next step involves creating the automation in Make. Here’s how:

### Add the Google Forms Module

**1. Start a New Scenario**

Log in to Make and click **Create a new scenario**.

**2. Search for Google Forms**

Drag the **Google Forms - Watch Responses** module into the canvas.

**3. Connect Google Forms**

Link your Google account to Make and select the form you created.

**4. Configure the Module**

![Google Forms "Watch Responses" settings with connection, form ID, and limit fields.](/blog/assets/posts/google-forms-watch-responses.png "Google Forms Watch Responses Configuration")

* Set the **Limit** to **1**. This ensures the [automation processes](https://www.make.com/en/blog/automate-spam-free-customer-interactions-oopspam) one submission at a time.

### Add the OOPSpam Anti-Spam Module

**1. Search for OOPSpam**

![Workflow connecting Google Forms "Watch Responses" to OOPSpam Anti-Spam for spam checking.](/blog/assets/posts/google-forms-to-oopspam-anti-spam-workflow.png "Google Forms to OOPSpam Anti-Spam Workflow")

* Click the **+** icon in the scenario and select **OOPSpam Anti-Spam**.

**2. Create a Connection**

* Enter your API Key to connect OOPSpam with Make.

**3. Map the Field**

![OOPSpam Anti-Spam module settings with input fields for email and content.](/blog/assets/posts/oopspam-anti-spam-module-configuration.png "OOPSpam Anti-Spam Module Configuration")

* **Sender IP:** Leave this blank (Google Forms doesn’t provide IP addresses).
* **Email:** Map this to the **Respondent Email** field.
* **Content:** Map this to the **Message** field (or the primary content field in your form).

#### 📌 Advanced Settings 

* **Ignore Short Content:** Set this to **No**. This ensures valid short submissions are not blocked.
* **Logs in the OOPSpam Dashboard:** Set this to **No**, unless you want to enable log viewing in your OOPSpam dashboard. Enabling this is optional and may help during testing.
* **Block Disposable Emails:** Enable this to prevent submissions using temporary email addresses.
* **Language Filters:** Use these to restrict submissions from specific languages.

## Step 4: Handle Submissions with Conditions

Now that your **Google Forms → OOPSpam** flow is set up, it’s time to decide how to handle and store the processed submissions. This step ensures that legitimate submissions are stored in your desired application, while spam submissions are either logged for review or discarded.

### Final Workflow Overview

![Workflow integration showing Google Forms, OOPSpam Anti-Spam, and Google Sheets modules.](/blog/assets/posts/integration-workflow.png "Integration Workflow: Google Forms to Google Sheets via OOPSpam")

From the screenshot provided, the workflow has three key components:

1. **Google Forms:** Captures responses from users.
2. **OOPSpam Anti-Spam:** Filters out spam submissions based on a spam score.
3. **Google Sheets:** Stores legitimate submissions in a spreadsheet.

This flow ensures seamless handling of form submissions, providing an organized way to store valid entries while dealing with spam efficiently.

### Add Google Sheets as the Final Destination

* Add the **Google Sheets - Add a Row** module to your scenario. 
* Link your Google account to Make and select an existing [Google Sheet](https://docs.google.com/spreadsheets/create) or create a new one to store your data.
* Map the output fields from the OOPSpam Anti-Spam module to the corresponding columns in your Google Sheet.

> If you prefer to be alerted about new legitimate submissions, add an **Email** module as an alternative or alongside Google Sheets.

### Spam Submission Handling

![Google Sheets showing spam submissions with columns for Name, Email, Message, and Spam Score.](/blog/assets/posts/spam-submissions-in-google-sheets.png "Spam Submissions in Google Sheets with Spam Score")

For spam submissions, you can choose to:

**1. Log to Google Sheets**

* Create a separate Google Sheet to store spam entries for later review.
* Map fields like Name, Email, Message, and Spam Score to the spam sheet.

**2. Discard the Data**

* Simply terminate the scenario for submissions where **Spam Score > 2**, ensuring they are not processed further.

## Step 5: Test the Workflow

![Google Forms response output details showing question IDs and text answers.](/blog/assets/posts/google-forms-response-output.png "Google Forms Response Output Details")

Testing ensures that the workflow runs smoothly and handles submissions as expected.

1. **Run the Scenario:** In Make, click **Run Once** to manually test the workflow.
2. **Submit Test Forms:** Use both spammy and legitimate test submissions.
3. **Review Results:**

   * Check that:
   * Spam submissions are flagged and handled appropriately.
   * Legitimate submissions follow the correct path.

## Step 6: Activate and Optimize the Scenario

Once testing is complete:

1. **Activate the Scenario:** Click **Activate** to enable real-time automation.
2. **Monitor and Adjust:** Periodically review the spam detection and tweak settings like spam score thresholds or filters for better results.

### Optional Enhancements to the Workflow

Make allows you to add additional modules to customize the workflow further:

* **Slack Notifications:** Send alerts to a Slack channel for new legitimate submissions.
* **CRM Integration:** Automatically add legitimate submissions to your CRM system for seamless lead management.

These additions help tailor the workflow to your specific needs.

## Final Thoughts

[Stopping spam](https://www.oopspam.com/blog/ways-to-stop-spam) submissions in Google Forms doesn’t have to be a manual or tedious process. By combining the advanced spam detection capabilities of OOPSpam with the automation power of Make, you can create a system that’s efficient, reliable, and tailored to your needs.

This setup not only saves time but also ensures your data is clean and actionable. Whether you’re managing forms for lead generation, surveys, or event registrations, this workflow has you covered.

Have questions or need further assistance? Check out the [documentation on OOPSpam’s website](https://help.oopspam.com/) or reach out to our support team for expert help.

Start your journey to spam-free forms today with OOPSpam and Make!
