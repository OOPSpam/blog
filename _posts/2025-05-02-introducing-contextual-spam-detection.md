---
layout: post
title: "Introducing Context-Aware Spam Detection: Now evaluating messages
  against your website's purpose"
date: 2025-05-02T16:24:00.000Z
author: onar
image: /blog/assets/posts/header_contextual.png
description: Introducing Contextual Spam Detection. Learn how to use the OOPSpam
  API to detect spam within your website context.
tags:
  - spam
  - AI
---
📣 Calling anyone looking for spam protection for their websites’ forms!

When you have a form on your website, you don’t always have enough background information from the sender for a traditional spam detector to properly filter. 

We have developed a solution for this use case which is available to toggle on for all plans.

Our standard spam detection is a powerful model trained on up-to-date spam examples and works very well. In addition to the model-based detection, we perform many in-depth analyses (IP, email, domains, and more) on content. We have been continuously improving this model since 2017 and it is highly effective on broad use cases, from card testing attacks to comments.

{% include toc.md %}

For the specific use case of forms (especially when less information about the sender is available) Contextual Spam Detection our solution. It relies solely on content in the context of your website’s purpose. For example, if you sell shoes, then your form submissions should be related to footwear. 

There is no country, language, IP, or email blocking. It just takes two parameters:

1. `content`: This can be a message field in your form, a comment or post in your community forum, a review, or any other content you receive from the public.
2. `context`: This represents your website's purpose, such as a post title in a community forum or a product description, which helps determine if the content is relevant.

## When to use Contextual Spam Detection?

Use it when you have a substantial message/content field in your forms. While the standard content analysis relies on multiple parameters to determine if a message is spam, the Contextual detection focuses solely on the message and your website's purpose.

> 📌 Sometimes spam comes from real people with clean IP addresses and email reputations because their devices have been compromised without their knowledge. These random spam messages that have nothing to do with your blog content typically bypass traditional filters. Contextual spam detection effectively blocks these irrelevant messages by evaluating them against your site's purpose.

Another use case is using it in [Zapier](https://community.zapier.com/show-tell-5/how-to-stop-spam-in-your-zap-with-oopspam-46293), [Make](https://www.oopspam.com/blog/5-common-spam-problems-in-make-how-to-fix-them) or similar automation platforms where form solutions sometimes don't pass the form submitter's IP to the automation flow. In this case, using content and context would be much more powerful.

![An example Zapier flow](/blog/assets/posts/screenshot-2025-05-12-at-11001_erl7oi.png "An example Zapier flow")

## How accurate is it compared to the Standard analysis?

Our tests show similar results overall. However, Contextual detection excels at identifying unrelated messages as it operates purely based on content. The Standard analysis examines IP, Email, and domain reputation along with many other factors. In cases where spammers use new IPs, fresh email addresses, and less obvious spam content, the Standard analysis may not be as effective as the Contextual detection.

## Privacy Considerations

Your data is not used for training purposes unless you explicitly report false positives/negatives to us. The Contextual detection operates without requiring personal information, making it GDPR compliant.

## Availability

The feature is currently available through our API and [WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/). We plan to extend support to Zapier, Make, and Bubble.io in the coming weeks.

In WordPress, you can find and enable this feature in the Contextual Detection tab of our plugin settings.

![The Contextual Spam Detection the OOPSpam WordPress Plugin](/blog/assets/posts/screenshot-2025-05-02-at-4.01.02 pm.png "The Contextual Spam Detection the OOPSpam WordPress Plugin")

For API integration, please refer to our [API documentation](https://www.oopspam.com/docs/?shell#spam-detection).

Here's a simple example demonstrating how to use Contextual Spam Detection via the OOPSpam API:

Request body:

```json
{
    "content": "Looking for double front door in Monroe Nj",
    "context": "Forever Custom Iron Doors is proud to be the best iron doors, windows, and railings fabricator and installer on the east coast. We pride ourselves on not only offering you modern wrought iron doors and products of unmatched quality and price; but by also providing an excellent experience, unmatched creative custom designs, and highly professional installation services."
}
```

Response:

```json
{
    "Score": 0,
    "Details": {
        "isContentSpam": "notspam",
        "numberOfSpamWords": 0
    }
}
```

The Score value will be either 0 (not spam) or 6 (spam), and the `isContentSpam` field indicates either "spam" or "notspam".

## Pricing

Contextual Spam Detection is currently [billed](https://www.oopspam.com/#pricing) at the same rate as our Standard analysis. Pricing may be adjusted in the future based on usage patterns and operational costs.

❤️ Our goal is giving you the most bang for your buck. The team would rather pack more value into your current plan than hit you up for more money. Prices only go up when operation costs get too steep to handle - no outside funding or selling your data to keep the lights on.

## Things to know

* This is an experimental feature currently under development. We welcome your feedback and are happy to address any questions you may have.
* Use standard detection methods if your forms don't include content fields.
* Note that this feature does not consider IP addresses, email addresses, or URL reputation data.
