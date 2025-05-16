---
layout: post
title: So, you're using OOPSpam and still getting spam?
date: 2025-05-16T16:43:00.000Z
author: onar
image: /blog/assets/posts/header-oopspam.png
description: Learn how to make the most of the OOPSpam features, such as
  blocking countries and disposable emails, and detecting spam with LLMs.
---
You started using OOPSpam and noticed spam still coming in.

No solution is going to offer 100% protection, but we can get pretty close.

That's how we get customers because people still get spam when they use [reCAPTCHA](https://www.oopspam.com/blog/best-recaptcha-alternatives), [Turnstile](https://www.oopspam.com/blog/best-turnstile-alternatives), [Akismet](https://www.oopspam.com/blog/best-akismet-alternatives), or similar solutions.

I wrote this post to help you get the most out of OOPSpam.

OOPSpam uses a machine learning model, IP, and email reputation by default. But there are other features you can use that will add an extra layer of protection.

## Verify your API key

We have encountered many cases, particularly with our integration, where a customer pastes their API key and a browser extension modifies it. After pasting your API key, submit a form. Then, check if the usage number in the OOPSpam dashboard has been updated. If so, it means we are receiving requests from your API key.

![OOPSpam dashboard](/blog/assets/posts/dashboard-sample-data.png "OOPSpam dashboard")

Then, look at the options below.

## Block Cloud Providers

OOPSpam has a feature that blocks submissions from hosting companies. This powerful feature has a low risk of false positives. It is available in all of our official [integrations](https://www.oopspam.com/integrations/).

In [WordPress](https://help.oopspam.com/wordpress/), for example, it can be found in the [IP Filtering](https://help.oopspam.com/wordpress/configuration/#ip-filtering) tab under Settings. At the [API](https://www.oopspam.com/docs/#spam-detection) level, you add **"blockDC": true** to the request body.

## Geo Restriction

Blocking or allowing countries is a powerful way to restrict form submissions. One benefit of these features is that you don't have to block access to your website. This means your website is still available worldwide to people and crawlers like Google.

### Block Countries

Another feature that is fast and also comes with a low risk of false positives. If you see, you are getting spam from countries you don’t serve, you can block them. 

### Allowed Countries

This filter is the most restrictive and effective; it allows entries only from a set country. Selling in the US? Add the US to the Allowed Countries list. Every other country will be blocked.

## Block by Language

If you have a form with a message or any other content field, you can choose to allow messages only in certain languages. Most spam is in English, but websites are sometimes targeted in other languages, too. In those cases, this feature is helpful. As a general rule, if you expect messages to be in specific languages, add those languages to the Allowed Languages filter.

## Block Disposable Emails

Real people rarely use throwaway emails to submit a form or sign up for a platform. OOPSpam doesn't block email forwarding services, such as Mozilla Relay. These services are used by individuals concerned about their privacy. OOPSpam only blocks temporary emails generated for one-time use.

Use this feature to block them and only keep valid emails. This is great for lead forms where you only want valid domains.

## Maybe Block VPNs/Proxy/Tor

Many people use VPNs or other privacy tools to avoid being tracked. Enabling this feature may block legitimate users, so keep that in mind. If you aren't concerned about that, go ahead and enable it.

In some cases, such as surveys or voting forms, where you don't want people to submit multiple entries from different IP addresses, blocking VPNs can be helpful.

## Use Contextual Spam Detection

If you have tried all of the above and are still receiving spam messages, [the contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection) may help, especially if you have a message or other content field in your forms.

Another use case is when you cannot pass the IP address of form submitters to us. This feature relies on the context of your website or business and the content of your form, such as messages, comments, or reviews.

Currently, this feature does not take IP or email reputation into account, even if you pass these data to us.

## Reach out to us!

I’d say this is one of our greatest features! We offer live chat and email support. We will look into the issue you are having and help protect you from spam and fraud attacks. This is how we have discovered many new types of spam campaigns. Recently, many WooCommerce sites started getting unusual card testing attacks (sometimes up to 1,000 daily), and no solution could stop them because the attacks were launched from regular people’s devices that had been compromised. We mitigated this attack by analyzing common patterns and implementing a new setting overnight.

If you are having an issue with one of our integrations or are still getting spam despite implementing the above features, we are here to help.
