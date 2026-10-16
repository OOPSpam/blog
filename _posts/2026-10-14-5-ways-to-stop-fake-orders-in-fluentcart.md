---
layout: post
title: 5 Ways to Stop Fake Orders in FluentCart
date: 2026-10-14T16:21:00.000+08:00
last_modified_at: 2026-10-14T15:49:14.504Z
author: chazie
hub: ecommerce-fraud
image: /blog/assets/posts/meta_fluentcart.jpg
description: Learn 5 ways to stop fake orders in FluentCart using oopspam,
  Cloudflare Turnstile, Stripe fraud protection, and checkout security tools.
tags:
  - FluentCart
  - Cloudflare Turnstile
  - Stripe
---
To stop fake orders in FluentCart, start with an order-screening plugin like oopspam Anti-Spam. It checks every order against 500M+ known malicious IPs and emails, blocks VPNs and cloud servers, rate limits checkout, and blocks countries you do not serve. It works without a CAPTCHA. Add Cloudflare Turnstile, Stripe 3D Secure and Radar, and an edge firewall for full coverage.

## **Why FluentCart Stores Get Fake Orders**

[FluentCart](https://fluentcart.com/) is fully self-hosted. Every order, customer, and failed attempt lands in your own WordPress database. Bots hit your server directly, so fake orders cost you hosting resources, gateway fees, and chargebacks.

The biggest threat is [card testing](https://www.oopspam.com/blog/how-to-protect-your-store-from-fake-orders-card-testing-and-checkout-spam). Fraudsters run stolen card numbers through small checkouts to see which ones work. [oopspam's 2025 Annual Spam Report](https://www.oopspam.com/2025-spam-report) found eCommerce spam rose to 22% of all tracked spam, up from 15% the year before. Card testing drove most of that growth.

FluentCart includes Cloudflare Turnstile, Stripe 3D Secure, server-side price and stock validation, and duplicate-order protection. These stop simple bots. They do not check an order's IP or email against a reputation database. They do not block countries or rate limit checkout per IP. That gap is where most fake orders get through.

## **1. Install oopspam Anti-Spam**

**[oopspam](https://www.oopspam.com/)** is the strongest single fix. It supports [FluentCart](https://www.oopspam.com/blog/fluentcart-vs-woocommerce-which-plugin-should-you-use) natively and runs in the background, so real buyers never solve a puzzle.

**Set it up in four steps:**

Install the free [oopspam Anti-Spam plugin](https://www.oopspam.com/wordpress) from [WordPress.org](http://wordpress.org).

![Install oopspam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "Install oopspam Anti-Spam")

[Create a free account](https://app.oopspam.com/Identity/Account/Register) at oopspam.com and copy your API key.

![Create a free account at oopspam.com and copy your API key.](/blog/assets/posts/oopspam-dashboard-api.png "Create a free account at oopspam.com and copy your API key.")

Go to **Settings > oopspam Anti-Spam**, paste the key, and set Sensitivity to **Moderate**.

![Go to Settings > oopspam Anti-Spam, paste the key, and set Sensitivity to Moderate.](/blog/assets/posts/oopspam-api-key.png "Go to Settings > oopspam Anti-Spam, paste the key, and set Sensitivity to Moderate.")

Find the **FluentCart** section and turn on **Activate Spam Protection**.

![Find the FluentCart section and turn on Activate Spam Protection.](/blog/assets/posts/fluentcart-protection.png "Find the FluentCart section and turn on Activate Spam Protection.")

**Then turn on these settings:**

![Then turn on these settings](/blog/assets/posts/oopspam-settings.png "Then turn on these settings")

* **Block VPNs and cloud providers.** Card testers hide behind VPNs and data center IPs. Real shoppers rarely do.
* **Rate limiting.** Cap order attempts per IP or email in a [set time window](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam). This stops rapid-fire card testing.
* **Country blocking.** Reject orders from [countries](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guidehttps://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide) you do not sell to.
* **Manual rules.** Block specific IPs, emails, or keywords you see in bad orders.
* **Logs.** Review spam and valid entries to see why each order was blocked or allowed.

One API key covers unlimited sites, which suits agencies. [Logs](https://help.oopspam.com/wordpress/form-entries/) stay in your WordPress database, and IP and email analysis can be turned off for stricter privacy needs.

![Logs](/blog/assets/posts/oopspam-logs-bulk-actions.png "Logs")

## **2. Turn On Cloudflare Turnstile**

FluentCart ships with [Cloudflare Turnstile](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) support on checkout. Turnstile confirms a visitor is human without a visible puzzle in most cases. It is free on every Cloudflare plan.

![Turn On Cloudflare Turnstile](/blog/assets/posts/fluentcart-security.png "Turn On Cloudflare Turnstile")

1. In the Cloudflare dashboard, go to **[Turnstile](https://www.cloudflare.com/products/turnstile/)** and add your site.
2. Copy the site key and secret key.
3. Paste both keys into FluentCart's Turnstile settings and save.
4. Run a test checkout to confirm the widget loads.

![Paste both keys into FluentCart's Turnstile settings and save.](/blog/assets/posts/fluentcart-s-turnstile-settings.png "Paste both keys into FluentCart's Turnstile settings and save.")

Turnstile stops automated scripts. It does not stop human fraudsters or [CAPTCHA-solving services](https://www.oopspam.com/blog/captcha-and-accessibility-why-your-forms-might-be-breaking-the-law-in-2026). Use it alongside oopspam, not instead of it.

## **3. Use Stripe 3D Secure and Radar Rules**

FluentCart supports Stripe 3D Secure at checkout. 3D Secure asks the cardholder's bank to verify risky payments. It shifts fraud liability away from you on authenticated payments.

![Use Stripe 3D Secure and Radar Rules](/blog/assets/posts/fluentcart-stripe-3d.png "Use Stripe 3D Secure and Radar Rules")

If you use Stripe, open **Radar > Rules** in the Stripe Dashboard and review your card checks:

* Enable **Block if CVC verification fails based on risk score**.
* Enable **Block if postal code verification fails based on risk score**.

Stripe now recommends these risk-based rules over the older hard-block CVC and postal code rules. The older rules can block real buyers whose bank already approved the payment. Make sure your checkout collects the CVC and postal code, or these checks cannot run.

FluentCart also supports PayPal, Paddle, Mollie, Square, Authorize.Net, and others. Check each gateway's fraud settings.

## **4. Add a Firewall at the Edge**

![Add a Firewall at the Edge](/blog/assets/posts/cloudflare-security-rules.png "Add a Firewall at the Edge")

A web application firewall ([WAF](https://www.cloudflare.com/learning/ddos/glossary/web-application-firewall-waf/)) blocks bad traffic before it reaches WordPress. This matters more on a self-hosted store because every bot request uses your server.

* Put your site behind Cloudflare and create a rate limiting rule for your checkout URL.
* Challenge or block traffic from known bad networks and countries you do not serve.
* Use your host's server firewall if it offers one.

A WAF cuts load. oopspam still handles the order-level checks a WAF cannot see, like email reputation.

## **5. Clean Up and Monitor Your Orders**

If fake orders slip through, remove them fast and learn from them.

![Clean Up and Monitor Your Orders](/blog/assets/posts/fluentcart-bulk-actions.png "Clean Up and Monitor Your Orders")

* Open the FluentCart **Orders** page.
* Filter by status (failed, pending, or cash on delivery) and date range.
* Select the batch and use **bulk actions** to remove it.
* Note repeat IPs, emails, and domains, then add them to oopspam's manual block rules.

Watch your Stripe Dashboard for spikes in declined payments. A sudden jump in small failed charges is the clearest sign of card testing.

### **Quick Setup Checklist**

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
      <th>Layer</th>
      <th>Tool</th>
      <th>What it stops</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Order screening</td>
      <td>oopspam</td>
      <td>Bad IPs and emails, VPNs, rapid repeats, blocked countries</td>
    </tr>
    <tr>
      <td>Bot check</td>
      <td>Cloudflare Turnstile</td>
      <td>Automated scripts</td>
    </tr>
    <tr>
      <td>Payment</td>
      <td>Stripe 3D Secure and Radar</td>
      <td>Stolen and unverified cards</td>
    </tr>
    <tr>
      <td>Network</td>
      <td>Cloudflare WAF</td>
      <td>High-volume traffic before WordPress</td>
    </tr>
    <tr>
      <td>Cleanup</td>
      <td>FluentCart bulk actions</td>
      <td>Leftover fake orders</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

No single tool stops every fake order. Bots, human fraudsters, and card testers each slip past a different layer, so you need more than one.

Start with order screening. oopspam checks each order's IP and email, blocks VPNs, rate limits repeat attempts, and filters countries. These are the checks FluentCart does not include by default. Add Cloudflare Turnstile to stop scripts, Stripe 3D Secure and Radar to catch bad cards, and a firewall to cut load on your server.

After setup, review your spam logs and declined payments every week. Attack patterns change, so adjust your settings when they do. A few minutes of review keeps fake orders, fees, and chargebacks low.
