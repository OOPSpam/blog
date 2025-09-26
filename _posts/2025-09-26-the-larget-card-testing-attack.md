---
layout: post
title: "The largest card testing attack we’ve seen: WooCommerce targeted across all payment gateways"
date: 2025-09-26T13:09:00.000-05:00
author: onar
image: /assets/posts/largest-card-testing-attack-Woo.png
description: OOPSpam detected the largest card testing campaign against WooCommerce, targeting PayPal plus credit and debit gateways. Here’s what happened and how we mitigated it.
tags:
  - Woo
  - WooCommerce
  - spam
  - fake
  - card testing
---


## Attack overview

We recently stopped the largest WooCommerce card testing attack we've seen. Attackers targeted PayPal, credit, and debit card processors across multiple stores, creating thousands of failed orders marked with Origin = "Unknown."

Merchants using OOPSpam's protection settings were already covered. Our systems blocked over 450,000 attack attempts in one week.

> This attack was broader than previous campaigns that mainly targeted PayPal through Block-based Checkout. For background, see our earlier posts:
> - [Card testing through Block‑based Checkout](https://www.oopspam.com/blog/card-testing-attacks-a-new-threat-vector-through-woocommerce-block-based-checkout)
> - [How to stop failed orders with Unknown origin](https://www.oopspam.com/blog/how-to-stop-failed-orders-with-unknown-origin-in-woocommerce)

{% include toc.md %}

## What we saw

- Large, sudden bursts of checkout attempts across multiple WooCommerce sites using both Classic and Block‑based Checkout
- Gateway coverage: PayPal, credit, and debit processors targeted, not just PayPal
- Orders frequently recorded with Origin = “Unknown” or missing "Device Type" in Order Attribution
- Highly uniform session characteristics (for example, identical "Session page views" across many attempts)

![WooCommerce order list showing multiple failed transactions.](/blog/assets/posts/multiple-failed-orders.png "WooCommerce Failed Orders List")


## How attackers bypassed security checks

WooCommerce's newer Block‑based Checkout uses different code paths than the classic checkout. Many security tools were built for the old system and miss activity on the new one. Attackers took advantage of this gap by using both checkout types and multiple payment gateways, relying on:

- API‑first paths that bypass legacy hook‑based checks
- Express checkout shortcuts that go directly to payment processors
- Incomplete attribution (Unknown origin, missing device type) that correlates strongly with automation

![Card Testing Attack in Woo with Credit Card](/blog/assets/posts/card-testing-with-credit-card.png "Card Testing Attack in Woo with Credit Card")


## Impact on merchants

- Processor health: elevated declines can trigger risk controls and temporary blocking of legitimate payments
- Email reputation: spikes of failure notifications and bounces can harm deliverability
- Operational load: flooded order lists and support queues


## How we mitigated at the edge and the application layer

Our mitigations combine attribution‑aware rules with IP/email reputation. All three of the following attribution‑based controls leverage WooCommerce Order Attribution (WooCommerce ≥ 8.5):

- Block orders from unknown origin
  - Blocks orders when WooCommerce cannot reliably attribute the origin. This has been effective against Store API‑driven automation. We broadened coverage to account for different gateway flows.
- Require valid device type
  - Blocks orders when the Device Type field is missing or invalid. This is another strong automation signal.
- Minimum session page views (new)
  - Blocks orders if the session’s page views fall below a threshold. Card‑testing bots commonly show the exact same low page‑view count across attempts.

![WooCommerce setting in the OOPSpam WordPress plugin](/blog/assets/posts/oopspam-woo.png "WooCommerce setting in the OOPSpam WordPress plugin")

Blocked entries appear under Form Spam Entries for review.

![Blocked orders with Unknown Origin in WooCommerce](/blog/assets/posts/screenshot-2025-01-10-at-11.40.04 am.png "Blocked orders with Unknown Origin in WooCommerce")

In parallel, our IP and email reputation engines blocked over 450,000 attempts during the heaviest 7‑day window.

![Fake order with Unknown origin](/blog/assets/posts/fakeorder_woo.png "Fake order with Unknown origin")


## Indicators and patterns from this campaign

- Geography: ~65% sourced from the United States; notable volumes also from Brazil, Venezuela, Colombia, Kosovo, and South Africa
- Target regions: most targeted stores were in the US, UK, Australia, and New Zealand
- Attribution anomalies:
  - Origin sometimes shows Unknown
  - Sometimes a valid Origin but missing Device Type
  - Identical Session page views across large batches

![Fake Orders in WooCommerce with missing Device Type](/blog/assets/posts/fake_order_woo_without_devicetype.png "Failed Orders in WooCommerce with missing Device Type")

## Recommendations

- **Remove Express Checkout**
  
  Express paths can hit processors directly, skipping fraud‑relevant hooks. Removing or gating them reduces exposure.

- **Update WooCommerce and enable Order Attribution tracking**
  
  Ensure you're running WooCommerce ≥ 8.5 with Order Attribution enabled. This provides the data needed for attribution-based detection rules to work effectively.

- **Compare attribution on fake vs legitimate orders**
  
    If fake orders show Unknown Origin, missing Device Type, or uniform Session page views, enable:
    - Block orders from unknown origin
    - Require valid device type
    - Minimum session page views

- **Add a CAPTCHA where appropriate**
  
    A lightweight CAPTCHA like Cloudflare Turnstile helps discourage automation on checkout.

    ![CAPTCHA examples](/blog/assets/posts/captcha.webp "CAPTCHA examples")

- **Restrict by geography**
  
  Block countries you don’t sell to at Cloudflare WAF: [https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare)

  Or use OOPSpam’s country restrictions to prevent order placement from selected countries while keeping the site accessible.

![Country and language filter settings for message restrictions.](/blog/assets/posts/country-language-filter.png "Country and Language Filtering Settings")

- (Optional) **Disable WooCommerce checkout via REST API**
  If you have no third‑party integrations that rely on REST (for example, Amazon, marketplaces, or custom apps), you can enable OOPSpam’s “Disable WooCommerce checkout via REST API.” Our data indicates this wave wasn’t primarily using REST endpoints, so treat this as a defense‑in‑depth option only when safe to enable.

## For teams already using OOPSpam

Merchants with “Block orders from unknown origin” enabled were already protected during this campaign. We have since:

- Expanded gateway coverage for Unknown Origin detection
- Added “Require valid device type” and “Minimum session page views” controls to catch more automation patterns

If you haven’t enabled these yet, see our step‑by‑step guide: [https://www.oopspam.com/blog/how-to-stop-failed-orders-with-unknown-origin-in-woocommerce](https://www.oopspam.com/blog/how-to-stop-failed-orders-with-unknown-origin-in-woocommerce)

## Closing notes

This attack shows how fraudsters adapt to new WooCommerce features like Block-based Checkout. Our attribution-based controls and reputation systems effectively stop these attacks while keeping legitimate orders flowing. We'll keep updating our detection as attackers try new tactics.