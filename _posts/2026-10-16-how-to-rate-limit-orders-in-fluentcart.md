---
layout: post
title: How to Rate Limit Orders in FluentCart?
date: 2026-10-16T15:39:00.000+08:00
author: chazie
image: /blog/assets/posts/meta_fluentcart-rt.jpg
description: Learn how to rate limit orders in FluentCart using built-in limits,
  oopspam, and Cloudflare to prevent fake orders, card testing, and checkout
  spam.
tags:
  - FluentCart
---
FluentCart limits its Place Order endpoint to 5 requests per 60 seconds per IP or user. Its docs list no setting to change that number. To cap orders per IP or email per hour, add rate limiting with the oopspam Anti-Spam plugin. Turn on FluentCart's built-in Cloudflare Turnstile to block bots at checkout. For high traffic, add a Cloudflare WAF rule at the edge.

## **Method 1: Use FluentCart's Built-in Checkout Rate Limit**

This limit is on by default. You do not need to set anything up.

[FluentCart](https://fluentcart.com/) caps its public Place Order endpoint (`POST /wp-json/fluent-cart/v2/checkout/place-order`) at 5 requests per 60 seconds per IP or user. Requests over the cap get an HTTP 429 "Too many requests" response. The same endpoint also rejects a cart that was already completed, which stops simple duplicate orders.

The wider [FluentCart REST API](https://dev.fluentcart.com/api/) has its own hourly limits:

<style>
  .oopspam-table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  .oopspam-table th,
  .oopspam-table td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
  }

  .oopspam-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th>Request type</th>
      <th>Limit</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Place Order (checkout)</td>
      <td>5 per 60 seconds per IP or user</td>
    </tr>
    <tr>
      <td>Authenticated API requests</td>
      <td>1,000 per hour</td>
    </tr>
    <tr>
      <td>Unauthenticated API requests</td>
      <td>100 per hour</td>
    </tr>
    <tr>
      <td>Bulk operations</td>
      <td>10 per hour</td>
    </tr>
  </tbody>
</table>

API responses include `X-RateLimit-Limit`, `X-RateLimit-Remaining`, and `X-RateLimit-Reset` headers. If you create orders through the API, read these headers and retry with exponential backoff after a 429.

**The gaps:**

* The limit is per minute, not per hour. One IP can still send up to 300 checkout requests an hour.
* It counts IPs and users, not email addresses.
* The docs describe no dashboard setting to change it.
* [Card-testing](https://www.oopspam.com/blog/how-to-protect-your-store-from-fake-orders-card-testing-and-checkout-spam) bots rotate IPs, so each IP stays under the cap.

Use this method as a baseline. Add Methods 2 and 3 for real control.

## **Method 2: Turn On Cloudflare Turnstile in FluentCart**

Use this to stop automated scripts before they place an order. FluentCart has [built-in Turnstile support](https://docs.fluentcart.com/guide/integrations/cloudflare-turnstile-integration) for the checkout page, and Turnstile is free.

![Turn On Cloudflare Turnstile in FluentCart](/blog/assets/posts/fluentcart-security.png "Turn On Cloudflare Turnstile in FluentCart")

1. In WordPress, go to **FluentCart > Settings**.
2. Find the **Cloudflare Turnstile** card and set it to **Active**.
3. Log in to Cloudflare and open **Protect & Connect > Turnstile**.
4. Add a widget for your store's domain.
5. Copy the **Site Key** and **Secret Key**.
6. Paste them into the **Turnstile Site Key** and **Turnstile Secret Key** fields in FluentCart.
7. Click **Save Settings**, then place a test order.

![Copy the Site Key and Secret Key.](/blog/assets/posts/fluentcart-cloudflare-site-key-secret-key.png "Copy the Site Key and Secret Key.")

Turnstile is a bot check, not a rate limit. It does not cap how many orders a real browser can place. Pair it with Method 3.

## **Method 3: Add Rate Limiting With oopspam**

**[oopspam](https://www.oopspam.com/)** checks each FluentCart order before it is processed. If a visitor goes over your limit, the order is blocked. Real customers are not affected as long as they stay under the cap. FluentCart support was added in [oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) version 1.2.85.

### **How to set it up**

In WordPress, go to **Plugins > Add New**, search for **oopspam Anti-Spam**, then install and activate it.

![oopspam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam Anti-Spam")

Create a free account at [oopspam.com](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Create a free account at oopspam.com and copy your API key from the dashboard.](/blog/assets/posts/oopspam-dashboard-api.png "Create a free account at oopspam.com and copy your API key from the dashboard.")

Open the oopspam settings in WordPress, paste your API key, and save.

![Open the oopspam settings in WordPress, paste your API key, and save.](/blog/assets/posts/oopspam-api-key.png "Open the oopspam settings in WordPress, paste your API key, and save.")

Find the **FluentCart** section and check **Activate Spam Protection**.

![Find the FluentCart section and check Activate Spam Protection.](/blog/assets/posts/fluentcart-protection.png "Find the FluentCart section and check Activate Spam Protection.")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**.

![Open the Rate Limiting tab and turn on Enable Rate Limiting.](/blog/assets/posts/enabled-rate-limiting-settings.png "Open the Rate Limiting tab and turn on Enable Rate Limiting.")

Set your limits (see below). Click **Save Changes**, then place several test orders to confirm the block.

Set these limits:

* **Max submissions per IP per hour:** how many orders one IP address can place in an hour.
* **Max submissions per email per hour:** how many orders one email address can place in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears its tracking table.

A good starting point is 3 orders per hour per IP and per email, a 24 hour block, and a 48 hour clean-up. Raise the numbers if you sell to offices, schools, or other buyers who share one IP.

If your site runs behind Cloudflare or another proxy, turn on **Trust proxy headers**. Without it, oopspam may count the proxy's IP instead of the buyer's.

### **Add more filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other checks. You can block VPN and data center IPs, [disposable emails](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms), and [specific countries](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide). You can also block keywords and review every blocked order in the spam entries log.

The free plan includes 40 spam checks per month. Each checked order uses one.

## **Method 4: Add a Cloudflare Rate Limiting Rule**

Use this if your store already runs on [Cloudflare](https://www.cloudflare.com/) and gets heavy bot traffic. A [rate limiting rule](https://developers.cloudflare.com/waf/rate-limiting-rules/) blocks excess requests at the edge, before they reach WordPress.

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/), create a new rate limiting rule for your domain.
2. Match the path `/wp-json/fluent-cart/v2/checkout/place-order`.
3. Count requests by IP.
4. Set the requests per period and the block duration.
5. Choose **Block** as the action and deploy.

What each plan allows:

<style>
  .oopspam-table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  .oopspam-table th,
  .oopspam-table td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
  }

  .oopspam-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th>Cloudflare plan</th>
      <th>Rules</th>
      <th>Longest counting period</th>
      <th>Longest block</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Free</td>
      <td>1</td>
      <td>10 seconds</td>
      <td>10 seconds</td>
    </tr>
    <tr>
      <td>Pro</td>
      <td>2</td>
      <td>1 minute</td>
      <td>1 hour</td>
    </tr>
    <tr>
      <td>Business</td>
      <td>5</td>
      <td>10 minutes</td>
      <td>1 day</td>
    </tr>
  </tbody>
</table>

The Free plan only handles short bursts. Cloudflare also notes that a few extra requests can slip through before the counter updates. Use it as an outer layer, not a replacement for Method 3.

## **Which Method Should You Use?**

<style>
  .oopspam-table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  .oopspam-table th,
  .oopspam-table td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
  }

  .oopspam-table th {
    background-color: #f2f2f2;
    font-weight: bold;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th>Goal</th>
      <th>Best method</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Limit orders per IP or email per hour</td>
      <td>oopspam rate limiting</td>
    </tr>
    <tr>
      <td>Stop card testing and fake orders</td>
      <td>oopspam rate limiting + Turnstile</td>
    </tr>
    <tr>
      <td>Block automated checkout scripts</td>
      <td>Cloudflare Turnstile</td>
    </tr>
    <tr>
      <td>Absorb high-volume bot floods before WordPress</td>
      <td>Cloudflare rate limiting rule</td>
    </tr>
    <tr>
      <td>Basic burst protection with no setup</td>
      <td>FluentCart built-in limit</td>
    </tr>
  </tbody>
</table>

## **Final Thoughts**

FluentCart's built-in limit controls bursts. Turnstile controls who can check out. oopspam rate limiting controls how many orders each IP or email can place. Attackers who spread orders across many IPs can stay under per-IP limits, so keep per-email limits and spam filtering on as well. Review your spam log weekly and adjust the limits to fit your real buyers.
