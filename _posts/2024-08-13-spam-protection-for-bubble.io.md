---
layout: post
title: Spam protection for Bubble.io
date: 2021-12-10
last_modified_at: 2026-11-24T14:30:00.000+04:00
author: onar
image: /assets/bubble_oopspam.png
description: Learn how to stop spam, fake sign-ups and abusive submissions in your Bubble app with the oopspam plugin. No CAPTCHA, one workflow step.
tags:
  - bubble
---
<center>
<a href="https://bubble.io/plugin/oopspam-spam-detection-1582908608700x936823858020745200">
<img loading="lazy"  width="772" style="height: 200px;object-fit: cover;" alt="Bubble.io and oopspam" src="/blog/assets/bubble_oopspam.png">
</a>
</center>
<br/>

[Bubble.io](https://bubble.io) is one of the leading no-code platforms, and like any public website, Bubble apps attract spam. Contact forms fill up with SEO offers, sign-up forms get fake accounts, and review sections collect link-dropping comments.

Our official [oopspam plugin for Bubble](https://bubble.io/plugin/oopspam-spam-detection-1582908608700x936823858020745200) stops this without CAPTCHAs. It checks each submission in your workflow and tells you whether it's spam, so real visitors never see a puzzle or a checkbox.

> **Updated for the new major version (November 2026).** The plugin now has a dedicated *Check for spam* action with a simple yes/no result, automatic visitor IP and domain detection, contextual (AI) detection and spam reporting. You no longer need a separate IP plugin. Upgrading from the old version? Jump to [Upgrading from the old version](#upgrading-from-the-old-version).

In this guide we'll protect a contact form, but the same steps work for sign-ups, orders, reviews, comments or any other user input.

## What you'll build

When a visitor clicks the form's submit button, the workflow will:

1. Show a "Thank you" message (spammers see it too, so they move on)
2. Check the submission with oopspam
3. Stop the workflow if the submission is spam
4. Otherwise, send you an email 

![The finished contact form workflow in Bubble](/blog/assets/posts/bubbleio-oopspam/v2/workflow-overview.png "The finished contact form workflow in Bubble")

## 1. Get your oopspam API key

1. [Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register). The free plan includes 40 spam checks per month, which is enough to try everything in this guide.
2. Verify your email and log in to the dashboard.
3. Click *Copy* next to your API key.

![Copying the API key in the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copying the API key in the oopspam dashboard")

## 2. Install the plugin and add your API key

1. In your Bubble editor, go to *Plugins* → *Add plugins*.
2. Search for **oopspam** and click *Install*.

   ![Installing the oopspam plugin in Bubble](/blog/assets/posts/bubbleio-oopspam/oopspam-plugin.png "Installing the oopspam plugin in Bubble")

3. Open the installed plugin and paste your key into **oopspam API key**.

   ![Pasting the API key into the oopspam plugin settings](/blog/assets/posts/bubbleio-oopspam/v2/plugin-settings.png "Pasting the API key into the oopspam plugin settings")

## 3. Prepare your form

You need a form with at least a message field. An email field is optional but recommended. We're using the contact form from Bubble's *Startly - Startup Landing Page* template, but any form works.

![Contact form in a Bubble app](/blog/assets/posts/bubbleio-oopspam/cf.png "Contact form in a Bubble app")

## 4. Add the oopspam Visitor IP element

Sending the visitor's IP makes spam detection much more accurate. Bubble doesn't expose it by default, so the plugin includes a small invisible element that detects it.

1. In the *Design* tab, open the element list and search for **oopspam Visitor IP**.
2. Drag it anywhere onto the page that contains your form. It's invisible to visitors.

![Adding the oopspam Visitor IP element to the page](/blog/assets/posts/bubbleio-oopspam/v2/visitor-ip-element.png "Adding the oopspam Visitor IP element to the page")

The element provides two values that you'll use in the next step:

- **IP**: the visitor's IP address
- **Your domain**: the domain your app runs on, so you can see which site a submission came from in your oopspam dashboard

> The element starts detecting as soon as the page loads, so the values are ready long before anyone submits the form. If an ad blocker prevents detection, the spam check still runs, just without the IP.

## 5. Show a thank you message

Go to the *Workflow* tab and open the workflow for your submit button, e.g. *When Button CONTACT US is clicked*. Add a first step, **Show an element**, and choose your success message or popup. The Startly template comes with *Popup Thank you for your message*.

Spammers see this confirmation too, just like everyone else, so they have no reason to try again.

## 6. Add the "Check for spam" action

1. Click *Click here to add an action* → *Plugins* → **Check for spam (oopspam)**.

   ![Selecting the Check for spam (oopspam) action](/blog/assets/posts/bubbleio-oopspam/v2/add-action.png "Selecting the Check for spam (oopspam) action")

2. Fill in the fields:

<table>
  <thead>
    <tr><th>Field</th><th>What to enter</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>Content</strong></td><td>Your message input's value, e.g. <em>MultilineInput What would you like 's value</em></td></tr>
    <tr><td><strong>Context (optional)</strong></td><td>Leave empty for now. See <a href="#optional-catch-vague-and-manual-spam-with-contextual-detection">Contextual detection</a></td></tr>
    <tr><td><strong>Email</strong></td><td>Your email input's value (optional)</td></tr>
    <tr><td><strong>Sender IP</strong></td><td><em>oopspamVisitorIP A's IP</em></td></tr>
    <tr><td><strong>Your domain</strong></td><td><em>oopspamVisitorIP A's Your domain</em></td></tr>
  </tbody>
</table>

![Check for spam action with fields filled in](/blog/assets/posts/bubbleio-oopspam/v2/action-fields.png "Check for spam action with fields filled in")

That's all you need. Every other option has a sensible default, and they're covered in [Fine-tuning the spam filter](#fine-tuning-the-spam-filter).

## 7. Stop the workflow when it's spam

Add a **Terminate this workflow** step after the check, and set its *Only when* condition to:

**Result of step 2 (Check for spam (oopspam))'s Is it spam? is yes**

![Terminate this workflow when Is it spam? is yes](/blog/assets/posts/bubbleio-oopspam/v2/terminate.png "Terminate this workflow when Is it spam? is yes")

## 8. Send the email

Finally, add **Send email** (or create a thing, notify Slack, anything you normally do with a submission) and fill it in from your form fields. This step only runs when the submission isn't spam.

![Send email action](/blog/assets/posts/bubbleio-oopspam/v2/send-email.png "Send email action")

## 9. Test it

Preview your app and submit two messages:

- **A normal message**, e.g. "Hi, I'd like a quote for 3 office chairs." You should get the email.
- **An obvious spam message**, e.g. "Get 1000 backlinks cheap, best SEO services, visit our site now!" No email arrives.

To see exactly what oopspam returned, run the preview in *Debug mode* and use *Step-by-step*. The result of the *Check for spam* step shows these values:

<table>
  <thead>
    <tr><th>Value</th><th>Meaning</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>Is it spam?</strong></td><td><em>yes</em> when the score is at or above your threshold (default 3)</td></tr>
    <tr><td><strong>Score</strong></td><td>0 (clean) to 6 (spam)</td></tr>
    <tr><td><strong>Reason</strong></td><td>Why it was flagged, e.g. "spam content, disposable email"</td></tr>
    <tr><td><strong>Spam words</strong></td><td>Spam words found in the content</td></tr>
    <tr><td><strong>Error</strong></td><td>Filled only if the check couldn't run (see <a href="#troubleshooting">Troubleshooting</a>)</td></tr>
  </tbody>
</table>

![Debug mode pausing at the Terminate step after a spam check](/blog/assets/posts/bubbleio-oopspam/v2/debugger-result.png "Debug mode pausing at the Terminate step after a spam check")

That's it. Your form is protected. 🎉

## Fine-tuning the spam filter

All of these options are on the *Check for spam (oopspam)* action and are optional.

<table>
  <thead>
    <tr><th>Option</th><th>What it does</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>Allowed languages</strong></td><td>Only accept these languages. Comma-separated codes, e.g. <code>en, it</code>. See <a href="https://www.oopspam.com/docs/#request-body-parameters">supported languages</a>.</td></tr>
    <tr><td><strong>Allowed countries</strong></td><td>Only accept submissions from these countries. Two-letter <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements">country codes</a>, e.g. <code>us, it</code>.</td></tr>
    <tr><td><strong>Blocked countries</strong></td><td>Block submissions from these countries, e.g. <code>ru, cn</code>.</td></tr>
    <tr><td><strong>Block short content</strong></td><td>On by default. Messages shorter than 20 characters count as spam. Turn it off for forms without a real message.</td></tr>
    <tr><td><strong>Block disposable email</strong></td><td>Block temporary/disposable email addresses.</td></tr>
    <tr><td><strong>Block VPN</strong></td><td>Block VPN, proxy and Tor IPs.</td></tr>
    <tr><td><strong>Block data center IPs</strong></td><td>Block submissions from cloud providers, where many bots run.</td></tr>
    <tr><td><strong>Log to oopspam dashboard</strong></td><td>Save each check in your oopspam dashboard so you can review it.</td></tr>
    <tr><td><strong>Spam threshold</strong></td><td>The score at which <em>Is it spam?</em> becomes yes. Default 3. Higher means less strict.</td></tr>
    <tr><td><strong>Treat API errors as spam</strong></td><td>By default, if the check can't run (wrong key, quota reached, timeout), the submission goes through so you never lose a real message. Tick this to block it instead.</td></tr>
  </tbody>
</table>

Leave any field empty to skip that filter. You no longer need to enter `[""]` like in the old version.

## Optional: catch vague and manual spam with contextual detection

Some spam is written by real people, or is vague enough to look legitimate, like "Hi, I visited your website and have a proposal for you." [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection) uses AI to check whether a message actually fits your website.

To turn it on, describe your website's purpose in the **Context** field. Describe the website or business, not the form. For best results, say what you consider legitimate and what you consider spam:

> We fabricate and install custom iron doors and gates for homes in Texas. Legitimate messages are quote requests and questions about our products. Sales pitches, SEO and marketing offers are spam.

For review, forum or comment systems, you can also use the product or post title and description as the context.

Keep in mind:

- Use it only on forms with a real message field. For sign-ups or orders without a message, leave *Context* empty.
- When *Context* is set, oopspam judges the content against the context only. IP, email, VPN, data center, country and language options are not applied.
- The score is either 0 (not spam) or 6 (spam).

## Use it beyond contact forms

The same action protects any part of your app. Fill in *Context* only where there's a real message.

**Sign-ups:** stop fake accounts and free-trial abuse
- Pass the email and Sender IP. *Content* can be the name or bio field.
- Turn on *Block disposable email*, *Block VPN* and *Block data center IPs*. Turn off *Block short content*.

**E-commerce orders:** flag suspicious orders before you fulfil them
- Turn on *Block VPN* and *Block data center IPs*, and set *Allowed countries* to where you ship.
- Instead of terminating the workflow, save *Is it spam?* and *Reason* on the order and review flagged orders manually.

**Reviews and comments:** keep link-dropping and spam off your pages
- Turn on *Block short content* and set *Allowed languages* to your site's languages. Use the product or post as *Context*.
- Save flagged items as hidden until approved instead of deleting them.

> For anything involving money or accounts, flagging for review is safer than blocking outright.

## Report spam that got through (or real messages that were blocked)

No filter is perfect. The **Report spam / not spam (oopspam)** action sends mistakes back to oopspam so detection improves over time. For example, add *Mark as spam* and *Not spam* buttons to the admin page where you review submissions, and run this action with the same values you passed to the check (so save them with each submission). Set **Should be spam** to *yes* for spam that got through, or *no* for a real message that was blocked.

## Troubleshooting

<table>
  <thead>
    <tr><th>Problem</th><th>Fix</th></tr>
  </thead>
  <tbody>
    <tr><td><em>Error</em> says "Missing API key"</td><td>Paste your key into <strong>oopspam API key</strong> in the plugin settings.</td></tr>
    <tr><td><em>Error</em> says "401: Invalid API key"</td><td>Copy the key again from your <a href="https://app.oopspam.com">oopspam dashboard</a>.</td></tr>
    <tr><td><em>Error</em> says "429: Rate limit / quota exceeded"</td><td>You've used your monthly checks. Upgrade your plan or wait for the reset.</td></tr>
    <tr><td><em>IP</em> is empty</td><td>An ad blocker may block IP detection. The check still runs without it. Make sure the <em>oopspam Visitor IP</em> element is on the same page as the form.</td></tr>
    <tr><td>VPN or country options seem to be ignored</td><td><em>Context</em> is set, so contextual detection is used. Clear <em>Context</em> to use standard detection.</td></tr>
    <tr><td>Real messages are flagged</td><td>Check <em>Reason</em> in the debugger. Raise the <em>Spam threshold</em>, turn off the filter that triggered, and report the message as <em>Not spam</em>. See also <a href="https://www.oopspam.com/blog/why-legitimate-form-submissions-get-flagged-as-spam-and-how-to-reduce-false-positives">why legitimate submissions get flagged</a>.</td></tr>
  </tbody>
</table>

## Upgrading from the old version

The new version is a major update. The old *Check for spam* API call has been replaced by the *Check for spam (oopspam)* action, and the *IP Geo* plugin is no longer needed. Your app keeps working on the old version until you upgrade. When you do:

1. Go to *Plugins* → *oopspam* and upgrade to the latest version.
2. Paste your API key into the new **oopspam API key** field.
3. Add the **oopspam Visitor IP** element to each page with a form ([step 4](#add-the-oopspam-visitor-ip-element)).
4. In each workflow, replace the old *Check for spam* step with **Check for spam (oopspam)** ([step 6](#add-the-check-for-spam-action)). Bubble's issue checker points you to every step that still uses the old call.
5. Change your terminate condition from *Score ≥ 3* to **Is it spam? is yes** ([step 7](#stop-the-workflow-when-its-spam)).
6. Once everything works, you can uninstall the *IP Geo* plugin.

## Privacy

Visitor IP addresses and email addresses are personal data under GDPR. If you send them to oopspam, mention oopspam as a processor in your privacy policy. Logging to the oopspam dashboard is off unless you turn on *Log to oopspam dashboard*.

Have a spam-free day!
