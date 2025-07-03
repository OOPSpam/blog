---
layout: post
title: How to Prevent Fake Orders in Shopify with Shopify Flow and OOPSpam
date: 2025-07-03T02:18:00.000Z
author: onar
image: /blog/assets/posts/sureforms-block-countries.jpg
description: Discover how to prevent fake orders in Shopify by leveraging Shopify Flow and OOPSpam to block unwanted countries, IPs, and emails.
tags:
  - Shopify
  - Shopify Flow
  - OOPSpam
---

In our previous article, we discussed how nearly 90 apps in the Shopify store claim to block countries and offer similar blocking features, yet most are ineffective and easily bypassed. After exploring Shopify further to find a truly reliable solution, I discovered Shopify Flow. This tool enables powerful automatons, similar to what Zapier offers directly within Shopify. With Shopify Flow, you can take full control of your orders, including integrating third-party APIs like OOPSpam to detect card testing attacks.

Here’s a quick overview of the workflow we’ll create:

[image]

The goal of this flow is to automatically trigger when an order is placed and assign a risk score based on the spam score returned by OOPSpam. While this example focuses on assigning a risk score, you can easily extend the workflow to take additional actions, such as canceling or refunding suspicious orders, sending yourself an alert email, or implementing any other measures to help prevent spam orders.

Let’s start from the beginning and build the workflow step by step.

1. Install the Shopify Flow app & create a workflow

Visit the Shopify App Store and install the official Flow app by Shopify. Once installed, open the Flow app and create a new workflow.

2. Add your OOPSpam API key to Manage Secrets

Retrieve your API key from the OOPSpam dashboard and add it as a secret in the Manage Secrets section of the Flow app.

3. Set up the first step

With your API key ready and a new workflow created, add the first step by selecting Shopify -> Order created action. This will trigger the automation whenever a new order is placed.

4. Perform a fraud check with OOPSpam

Next, we’ll send an HTTP request to the OOPSpam API to receive a spam score for each order. Shopify Flow now supports the ‘Send HTTP request’ action, which we’ll use here. Add this action to your workflow.

Configure the settings as follows:

**Configure the HTTP request as follows:**

- **Method:** `POST`
- **URL:** `https://api.oopspam.com/v1/spamdetection`
- **Headers:**
  - `X-Api-Key`: `{{secrets.MyOOPSpamAPIKey}}`
  - `Content-Type`: `application/json`
- **Body:**
  ```json
  {
    "email": "{{order.email}}",
    "senderIP": "{{order.clientIp}}",
    "blockTempEmail": true,
    "blockDC": true,
    "blockVPN": false,
    "allowedCountries": ["it", "us"],
    "blockedCountries": ["ru"]
  }
  ```

> Be sure to update `secrets.MyOOPSpamAPIKey` to match the name of your secret. In this example, we’re blocking Russia and only allowing orders from Italy and the USA. If you use `allowedCountries`, you don’t need to specify `blockedCountries`—any country not listed will be blocked automatically. For instance, if you only sell in the USA, set `allowedCountries` to `["us"]` and all other countries will be restricted.

To make the API response easier to use in the next steps, add a ‘Run code’ action with the following JavaScript to extract the `Score` from the response body:

export default function main(input) {
  const body = JSON.parse(input.sendHttpRequest.body);
  console.log("body is", body);
  return {
    Score: body.Score,
  };
}

You should also clearly define the inputs and outputs for this code step. In the Flow app, set the input variable to the response from the previous "Send HTTP request" action (usually named `sendHttpRequest`). For the output, specify a variable such as `Score` to store the spam score extracted by your code. This makes it easy to reference the score in later steps of your workflow, like setting conditions or assigning risk levels.

Refer to the screenshot below for a visual guide on configuring these input and output fields.

[image]

5. Assign a risk score

Now, let’s flag orders with a spam score greater than 2. Add a Condition step and set it to “IF Score Greater than 2”.

> In this example, we’re simply assigning a risk score to the order, but you can easily extend this to automatically cancel or refund orders. For instance, set the Condition to “IF Score Equal to 6” to catch the most suspicious cases and trigger an automatic refund or cancellation.

Continuing with the flow, add a new action and choose Shopify -> Create order risk assessment. Here, you can set the Risk level, Fact description, and Fact sentiment.

Here’s how I configured mine:

- **Risk level:** High
- **Fact description:** Spam Score {{runCode.Score}} by OOPSpam
- **Fact sentiment:** Negative (red)

That’s it! Now it’s time to test the workflow.

6. Test the entire flow

To test your setup, create an order using an email like ‘testing@example.com’, which is blocked by default.

[image]

Check the Recent runs section in your workflow to see the test results. You’ll find detailed logs for each step.

When you review the order, you should see “Spam Score 6 by OOPSpam” listed in the Order Risk section.

[image]

And that’s it! You’ve successfully set up a Shopify Flow automation using OOPSpam to assess order risk and optionally trigger actions like refunds, cancellations, or email notifications.
