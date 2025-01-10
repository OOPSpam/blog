---
layout: post
title: "Card Testing Attacks: A New Threat Vector Through WooCommerce
  Block-based Checkout"
date: 2025-01-10T17:43:00.000Z
author: onar
image: /blog/assets/posts/blockcountrieswithcloudflare-copy-2x.jpg
description: Learn how to prevent fake and spam orders on your WooCommerce
  store. Explore how card testing attacks exploit the Store API and how to
  protect your business when using Block Checkout.
tags:
  - Woo
  - WooCommerce
  - spam
  - fake
---
Recent incidents have highlighted a concerning trend in e-commerce security: card testing attacks specifically targeting WooCommerce stores using [the Block-based Checkout](https://woocommerce.com/checkout-blocks/) feature. While this modern checkout experience offers enhanced flexibility and user experience, it has inadvertently opened up new vulnerabilities that attackers are actively exploiting.

![Block-based Checkout in Woo](/blog/assets/posts/screenshot-2024-12-20-at-4.58.01 pm.png "Block-based Checkout in Woo")

## The Root of the Problem: Block-based Checkout and Store API

If you're wondering why your WooCommerce store is suddenly vulnerable to card testing attacks despite having security measures in place, the answer lies in a recent technological shift. WooCommerce's new Block-based Checkout system, powered by the Store API, has introduced an unexpected security challenge that attackers are actively exploiting.

While this modern checkout system brings improved flexibility and user experience, it operates fundamentally differently from the classic checkout. The critical issue is that most security plugins were designed to work with the classic checkout's hook system, but the Store API uses an entirely different set of hooks. This architectural difference has created a significant blind spot in standard security setups.

We're seeing this pattern repeatedly: store owners who have invested in multiple security tools are still finding themselves vulnerable to these attacks. The reason is clear - attackers have identified that the Store API effectively bypasses traditional security measures, making stores using Block-based Checkout particularly attractive targets. It's not that the existing security tools aren't working; they're simply not equipped to monitor and protect this new pathway.

![Fake Orders in WooCommerce with Unknown Origin Attribute](/blog/assets/posts/multiple-failed-orders.png "Failed Orders in WooCommerce with Unknown Origin Attribute")

## The Impact on Merchants

The consequences of these attacks are particularly severe for online merchants:

1. **Payment Processing Disruption**: Payment processors may begin blocking legitimate transactions due to the high number of declined payments, potentially crippling your ability to process valid sales.
2. **Email Reputation Damage**: The flood of failed order notifications can lead to email delivery services flagging and potentially blacklisting your domain due to excessive bounce rates.

## Identifying the Attack Pattern

One consistent marker of these failed orders is **the "Unknown" origin attribute in the Orders list**. This characteristic provides a valuable indicator for identifying and filtering potentially malicious orders.

## Implementing Protective Measures

To [protect your WooCommerce store](https://www.oopspam.com/blog/spam-protection-for-woocommerce) from card testing attacks, consider implementing these security  measures:

### Primary Defense

Install the OOPSpam plugin and enable both the Spam Protection for Woo and the **"Block orders from unknown origin"** features. This targets the specific pattern these attacks follow and can significantly reduce successful attack attempts.

![WooCommerce setting in the OOPSpam WordPress plugin](/blog/assets/posts/screenshot-2024-12-20-at-5.00.58 pm.png "WooCommerce setting in the OOPSpam WordPress plugin")

Blocked entries will be listed under the Form Spam Entries.

![Blocked orders with Unknown Origin in WooCommerce](/blog/assets/posts/screenshot-2025-01-10-at-11.40.04 am.png "Blocked orders with Unknown Origin in WooCommerce")

### Additional Security Layers

* **Geographic Restrictions**: Implement country-based blocking for regions where you don't conduct business. You can either [use Cloudflare to block countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) on the DNS-Level or the OOPSpam WordPress plugin.

  ![Country blocking in the OOPSpam](/blog/assets/posts/country-language-filter.png "Country blocking in the OOPSpam")
* **CAPTCHA Integration**: Add a Turnstile widget to your checkout page for additional verification. You can use [the Simple Cloudflare Turnstile plugin](https://wordpress.org/plugins/simple-cloudflare-turnstile/) for this.

  ![CAPTHCA examples](/blog/assets/posts/captcha.webp "CAPTCHA examples")
* **Rate Limiting**: Enable [rate limiting through the OOPSpam plugin](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to restrict the number of checkout attempts from the same IP address, effectively preventing rapid-fire card testing attempts

  ![OOPSpam WordPress plugin Rate Limiting setting](/blog/assets/posts/rate-limiting-settings.png "OOPSpam WordPress plugin Rate Limiting setting")

## Moving Forward

For store owners using Block-based Checkout, it's crucial to understand that traditional security solutions may need to be supplemented with specific measures targeting the Store API endpoints. Regular monitoring of order patterns and implementing the suggested security measures can help protect your store from these sophisticated attacks. To wrap things up on a positive note, here's a store with no failed orders—definitely a good mood moment!

![Processing orders in Woo](/blog/assets/posts/legitorders.jpg "Processing orders in Woo")
