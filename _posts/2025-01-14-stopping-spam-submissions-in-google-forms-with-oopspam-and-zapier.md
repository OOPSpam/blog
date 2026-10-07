---
layout: post
title: How to Stop Google Forms Spam with Zapier or Make
date: 2025-01-14T04:32:00.000Z
last_modified_at: 2026-10-07T12:00:00.000+04:00
author: chazie
image: /assets/posts/header-stopping-spam-submissions-in-google-forms-with-oopspam-and-zapier.jpg
description: "Stop spam in Google Forms by checking every response with oopspam in Zapier or Make. Step-by-step setup that keeps only real responses."
tags:
  - Zapier
  - Make
  - Google Forms
---
![Stopping Spam Submissions in Google Forms with oopspam and Zapier](/blog/assets/posts/header-stopping-spam-submissions-in-google-forms-with-oopspam-and-zapier.jpg "Stopping Spam Submissions in Google Forms with oopspam and Zapier")

Spam submissions in Google Forms can be a significant issue, especially if you rely on forms for lead generation, surveys, or data collection. These submissions not only distort your data but also waste time and resources. The good news? There’s an efficient, automated way to filter out spam while ensuring legitimate responses are handled effectively—by integrating [oopspam](https://www.oopspam.com/) with [Zapier](https://zapier.com/).

This guide will walk you through the process of connecting Google Forms, oopspam, and Zapier to create a seamless spam-free workflow. Using Make instead of Zapier? The same workflow works there too: jump to [the Make setup](#make). With this setup, you’ll have more time to focus on what matters: actionable insights from clean, reliable data.

## Why You Should Care About Spam Prevention in Google Forms

Spam submissions aren't just annoying; they can lead to bigger problems, such as:

1. **Corrupted Data:** Spam responses can distort survey results, analytics, or customer feedback, making it hard to draw meaningful conclusions.
2. **Reduced Productivity:** Manually sifting through submissions to separate spam from legitimate responses wastes valuable time.
3. **Inbox Overload:** If your form is set to send email notifications, spam entries can flood your inbox, burying the legitimate responses you actually care about.

### How Zapier Enhances Spam Prevention

Zapier is a powerful automation platform that connects thousands of apps, including Google Forms and oopspam. With Zapier, you can create “[Zaps](https://help.zapier.com/hc/en-us/articles/8496309697421-What-is-a-Zap)” (automated workflows) that identify and filter spam submissions in real-time. This not only saves time but ensures that only valid responses are processed further.

## What Is oopspam and How Does It Work?

oopspam (that’s us! 👋) is an advanced anti-spam solution that uses machine learning to identify and block spam submissions. Its sophisticated algorithms analyze multiple factors, including email validity, message content, and disposable email detection.

Key features include:

* **Multi-Layer Spam Detection:** Filters submissions based on IP addresses, email patterns, and global spam trends.
* **Language and Geo-Filters:** Restrict submissions based on specific languages or countries.
* **Customizable Spam Thresholds:** Adjust sensitivity to suit your specific requirements.

When combined with Zapier, oopspam becomes an indispensable tool for automating spam detection and handling.

### What You’ll Need

To get started, ensure you have:

* **Google Form:** A functional form for testing (fields like Name, Email, and Message).
* **Zapier Account:** A free or paid Zapier account to set up the automation.
* **oopspam Account:** Access to the oopspam API key for spam detection.
* **Google Sheets (Optional):** A destination to store valid submissions.

## Step 1: Create and Test Your Google Form

![Google Form with fields for name, email, and message.](/blog/assets/posts/sample-form-template.png "Sample Google Form Template")

### Setting Up Your Google Form

1. **Log in to Google Forms:** Visit[ Google Forms](https://forms.google.com).
2. **Create a New Form:**

   Add fields such as:

   * Name (Short Answer)
   * Email (Email format)
   * Message (Paragraph or Long Answer)
3. **Test the Form**

   Submit test responses, including both legitimate and spammy submissions. Examples:

   * **Legitimate:** "Alice Smith, alice@example.com, I’m interested in your services."
   * **Spam:** "!!!WinPrizesWin PrizesWinPrizes!!!, fake@spam.com, Click here to claim now!"

🎯 **Pro Tip:** Use realistic test data to mimic actual user behavior and refine your spam-detection thresholds accordingly.

## Step 2: Set Up Accounts for Zapier and oopspam

Before creating your Zap, ensure you have active accounts on both platforms.

### Create a Zapier Account

![Zapier login page with multiple sign-in options.](/blog/assets/posts/zapier-login.png "Zapier Login and Sign-Up Options")

1. Sign up at [Zapier](https://zapier.com/sign-up). The free plan should suffice for basic workflows.

### Create an oopspam Account

![oopspam dashboard displaying API usage and spam detection sample data.](/blog/assets/posts/dashboard-sample-data.png "oopspam Dashboard with Sample Data")

1. Sign up at [oopspam](https://app.oopspam.com/Identity/Account/Register).
2. Navigate to the dashboard to retrieve your **API Key**, which you’ll need to integrate with Zapier.

## Step 3: Build the Workflow in Zapier

Zapier acts as the bridge between Google Forms and oopspam, enabling automated spam detection. Here’s [how to set it up](https://help.zapier.com/hc/en-us/articles/8495997064845-How-to-Get-Started-with-Google-Forms-on-Zapier):

### Add Google Forms as the Trigger

![Zapier interface showing event selection for Google Forms trigger.](/blog/assets/posts/zapier-event-selection.png "Zapier Event Selection for Google Forms Trigger")

1. **Start a New Zap:** Click "**Create Zap**" in your Zapier dashboard.
2. **Select Google Forms as the Trigger App**

   * Choose “**New Form Response**” as the trigger event.
   * Connect your Google account and select the form you created earlier.
3. **Test the Trigger**

   * Run a test to verify that Zapier successfully retrieves sample data from your form.

### Add oopspam to Check for Spam

![Zapier setup interface for oopspam action event.](/blog/assets/posts/oopspam-action-setup-in-zapier.png "oopspam Action Setup in Zapier")

* **Add the oopspam App**

  * Search for oopspam in Zapier and select “**Check for Spam**” as the action event.
  * Connect your oopspam account using the API Key.
* **Map Form Fields to oopspam**

  * **Email:** Map this to the **Respondent Email** field from your form.
  * **Content:** Map this to the **Message** field or any primary text field in your form.
  * **Sender IP:** Leave this blank (Google Forms doesn’t provide IP data).

![oopspam configuration screen with message and email input fields.](/blog/assets/posts/oopspam-check-for-spam-configuration.png "oopspam Check for Spam Configuration")

* **Configure Additional Settings**

  * **Consider Short Messages as Spam:** Set this to **False** (as shown in the screenshot). This ensures that legitimate short messages are not flagged as spam.
  * **Log Submissions to oopspam:** You can leave this setting as **False** unless you want to log all submissions in the oopspam dashboard for further review.
  * **Block Temporary/Disposable Emails:** Enable this option to filter out submissions using temporary or disposable email addresses. 

    * This is recommended to avoid spam generated by fake email accounts.
  * **Allow Messages Only in Specific Languages:** Use this setting to restrict form submissions to certain languages if necessary.
* **Test the oopspam Setup**

  * Submit both legitimate and spammy responses to ensure the spam detection works as intended.

### Add a Filter by Zapier to Refine Submissions

Before sending data to Google Sheets or any other destination, it’s essential to add a filtering step to ensure that only legitimate submissions pass through. This filter will use oopspam's spam score to determine whether a submission should proceed or be flagged as spam.

#### Setting Up the Filter by Zapier

![Zapier Copilot setup for automating spam submissions handling using Google Forms and oopspam.](/blog/assets/posts/automating-spam-submission.png "Automating Spam Submission Handling in Zapier")

> You can also use [Zapier's Copilot](https://zapier.com/blog/zapier-copilot-guide/) to help you get started. Simply input the workflow's description, and it will generate an initial flow for you. In the example screenshot, I pasted the article's title, and Copilot created the foundational steps for this Zap automatically, making the setup faster and easier!

1. **Add a Filter Step**

   * Click on the "**+**" button after the oopspam step in your Zap workflow.
   * Select "**Filter**" from the list of available apps.
2. **Configure Filter Conditions**

![Zapier filter condition setup for spam score less than 3.](/blog/assets/posts/zapier-filter-condition-setup.png "Zapier Filter Condition Setup")

* Set the condition to evaluate the spam score provided by oopspam. Use the following configuration:

  * **Field:** Select **Spam Score** (from the oopspam output).
  * **Condition:** Select “**Less than**”.
  * **Value:** Enter **3** (as shown in the screenshot).

> This setup ensures that only submissions with a spam score of less than 3 are considered legitimate and proceed to the next steps.

**3. Test the Filter**

![Zapier test confirmation showing a matched test record with a score of 2.](/blog/assets/posts/zapier-test-record-confirmation.png "Zapier Test Record Confirmation")

* Zapier will display a test result indicating whether the filter would allow the current test data to pass.
* In the attached example, a test record with a score of 2 successfully passes the filter.

#### Why This Step is Important

By implementing a filter:

* **Spam is Automatically Blocked:** Submissions with a high spam score are stopped here and do not proceed further.
* **Efficiency is Improved:** Only valid responses are sent to your next action, whether that’s storing them in Google Sheets or notifying your team.
* **Customizable Thresholds:** The spam score threshold (e.g., 3) can be adjusted to meet your specific requirements, depending on how sensitive your form needs to be.

### Add Google Sheets to Store Valid Submissions

![Zapier workflow connecting Google Forms, oopspam, a filter, and Google Sheets.](/blog/assets/posts/zapier-workflow-for-data-logging.png "Zapier Workflow for Spam Filtering and Data Logging.")

1. **Set Up Google Sheets as the Action App**

   * Add [Google Sheets](https://workspace.google.com/products/sheets/) to your Zap.
   * Choose “**Create Spreadsheet Row**” as the action event.
2. **Connect Your Google Account**

   * If you haven’t already connected your Google account, Zapier will prompt you to do so.
   * Grant access to enable Zapier to write data to your Google Sheets.
3. **Configuring the Google Sheets Action**

![Google Sheets setup in Zapier to create a row in a spreadsheet with fields for feedback, person, and completed status.](/blog/assets/posts/zapier-google-sheets.png "Zapier Google Sheets Row Creation Configuration")

* **Drive:** Choose the Google Drive where your spreadsheet is located.
* **Spreadsheet:** Select the specific spreadsheet you want to use.
* **Worksheet:** Choose the worksheet where the data will be added (e.g., "Sheet1").

**4. Test the Google Sheets Setup**

* Verify that only valid submissions are added to the spreadsheet.

### Add Notifications for Valid Submissions (Optional)

* **Add an Email App:** Include an email notification step in the workflow to alert you of valid submissions.
* **Test Notifications:** Verify that notifications are sent only for valid submissions.

🎯 **Pro Tip:** Instead of email notifications, you can integrate Slack to receive instant alerts in a dedicated channel.

## Step 4: Test the Entire Workflow

Testing is crucial to ensure the workflow operates as expected.

1. Submit both spammy and legitimate responses to your Google Form.
2. Check the workflow results in Zapier:

   * Spam submissions should be flagged and discarded.
   * Legitimate submissions should be stored in Google Sheets or sent via email.

## Step 5: Publish and Monitor the Zap

![Publishing progress screen for a Zap in Zapier.](/blog/assets/posts/zapier-publishing-progress.png "Zapier Publishing Progress Screen")

1. **Turn on the Zap:** Once everything is working perfectly, publish the Zap to start processing live form submissions.
2. **Monitor Performance:** Periodically review spam-detection results and adjust settings like spam score thresholds to improve accuracy.

You can apply the same automation approach to embedded forms by following this guide on how to[ add spam protection to embedded forms using oopspam and Zapier](https://www.oopspam.com/blog/add-spam-protection-to-embedded-forms-using-oopspam-and-zapier).

## Using Make instead of Zapier {#make}

The same workflow takes about 10 minutes in [Make](https://www.make.com/). You need a Make account, an [oopspam API key](https://app.oopspam.com/Identity/Account/Register) and the Google Form from Step 1.

![Workflow integration showing Google Forms, oopspam Anti-Spam, and Google Sheets modules.](/blog/assets/posts/integration-workflow.png "Integration Workflow: Google Forms to Google Sheets via oopspam")

### 1. Watch new Google Forms responses

1. In Make, click **Create a new scenario**.
2. Add the **Google Forms - Watch Responses** module, connect your Google account and select your form.
3. Set **Limit** to **1** so the scenario processes one response at a time.

![Google Forms "Watch Responses" settings with connection, form ID, and limit fields.](/blog/assets/posts/google-forms-watch-responses.png "Google Forms Watch Responses Configuration")

### 2. Check each response with oopspam

1. Click **+** and add the **oopspam Anti-Spam** module.
2. Create a connection with your oopspam API key.
3. Map the fields:
   * **Sender IP:** leave blank (Google Forms doesn't share IP addresses).
   * **Email:** the **Respondent Email** field.
   * **Content:** your main message field.
4. Under advanced settings, set **Ignore Short Content** to **No** so short genuine answers aren't blocked. Turn on **Block Disposable Emails**, and use the language filters if you only accept certain languages.

![oopspam Anti-Spam module settings with input fields for email and content.](/blog/assets/posts/oopspam-anti-spam-module-configuration.png "oopspam Anti-Spam Module Configuration")

### 3. Keep real responses, set spam aside

1. Add a filter after the oopspam module so only responses with a **Spam Score** of 2 or lower continue.
2. Add **Google Sheets - Add a Row** (or an email or Slack module) and map the fields you want to keep.
3. Optionally, add a second route for responses with a **Spam Score** above 2 that logs them to a separate "Spam" sheet for review.

![Google Sheets showing spam submissions with columns for Name, Email, Message, and Spam Score.](/blog/assets/posts/spam-submissions-in-google-sheets.png "Spam Submissions in Google Sheets with Spam Score")

### 4. Test and activate

1. Click **Run once**, then submit one genuine and one spammy test response.
2. Check that each went down the right route, then click **Activate** to run the scenario automatically.

For more Make fixes, see [5 common spam problems in Make and how to fix them](https://www.oopspam.com/blog/5-common-spam-problems-in-make-how-to-fix-them).

## Final Thoughts

By combining the spam-detection capabilities of oopspam with the automation features of Zapier or Make, you can create a highly effective system to filter spam submissions from Google Forms. This setup not only saves time but also ensures that your data is accurate and actionable.

Whether you’re using Google Forms for lead generation, surveys, or event registrations, this workflow is your ultimate solution for managing submissions effortlessly. Get started with [oopspam and Zapier](https://zapier.com/apps/oopspam/integrations) today, and say goodbye to unwanted submissions for good!

If you have questions or need further assistance, feel free to reach out to [oopspam’s support team](https://www.oopspam.com/#contact) or check out [our documentation](https://help.oopspam.com/).
