---
layout: post
title: How to Block Countries in FluentCart?
date: 2026-10-22T20:39:00.000+08:00
author: chazie
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_fluentcart_blockcountries.jpg
description: Block countries in FluentCart with shipping zones, oopspam country
  filtering, or Cloudflare rules. Stop fake orders from regions you do not sell
  to.
tags:
  - FluentCart
  - Cloudflare
---
FluentCart has no dedicated country-blocking setting. You can [block countries](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide) three ways. Exclude them in a shipping zone to stop physical-product orders. Use the oopspam Anti-Spam plugin to reject checkout attempts from blocked countries, including digital orders. Use a Cloudflare rule to stop traffic from those countries before it reaches your server.

This guide shows each method, step by step, and when to use it.

## **Does FluentCart Have Built-In Country Blocking?**

No.[ FluentCart](https://fluentcart.com/) has no setting that blocks buyers by country or IP location. Its[ store settings](https://docs.fluentcart.com/guide/settings-configuration/store-settings) and[ checkout fields](https://docs.fluentcart.com/guide/settings-configuration/checkout-fields) have no allowed-countries list.

The closest native option is shipping zones. Know these limits before you rely on them:

* **Physical products only.** Shipping zones control shipping methods. Digital products, licenses, and subscriptions skip shipping, so zones do not stop those orders.
* **Address, not location.** Zones read the address the buyer types. A bot can type any address it wants.
* **No spam check.** FluentCart's Cloudflare Turnstile and its checkout rate limit (5 Place Order requests per 60 seconds per IP) stop simple bots. Neither filters by country.

For real country blocking, add oopspam at checkout or Cloudflare at the edge.

## **Method 1: Exclude Countries in FluentCart Shipping Zones**

Use this to stop physical-product orders to countries you do not ship to. It is free and built in.

* In WordPress, go to **FluentCart > Settings**.
* Open the **Shipping** tab, then the **Shipping Zones** sub-tab.
* Click **Add Shipping Zone**, or edit an existing zone.

![Open the Shipping tab, then the Shipping Zones sub-tab.](/blog/assets/posts/fluentcart-shipping-zone.png "Open the Shipping tab, then the Shipping Zones sub-tab.")

* Enter a **Zone Name**, such as "Worldwide (excluded)".
* Under **Coverage**, choose **All countries except**.
* In the **Countries** dropdown, select the countries to exclude.
* Click **Save**, then add your[ shipping methods](https://docs.fluentcart.com/guide/shipping/setting-up-shipping-methods) to the zone.

![Under Coverage, choose All countries except.](/blog/assets/posts/fluentcart-all-countries-except.png "Under Coverage, choose All countries except.")

FluentCart shows buyers only the shipping methods for the zone their address falls into. Excluded countries get no shipping option.

**Check two things:**

* No other zone, such as a **Whole world** zone, can cover the excluded countries. If one does, those buyers still see shipping.
* Place a test order with an excluded address to confirm checkout stops.

To sell to only a few countries, choose **Selected countries only** instead.

## **Method 2: Block Countries at Checkout With oopspam**

Use this to reject [fake orders, card testing, and checkout spam](https://www.oopspam.com/blog/how-to-protect-your-store-from-fake-orders-card-testing-and-checkout-spam) from countries you do not serve. It works for physical and digital products. The rest of your site stays open.

**[oopspam](https://www.oopspam.com/)** checks each FluentCart order by the buyer's IP before it is processed. [FluentCart support](https://www.oopspam.com/blog/5-ways-to-stop-fake-orders-in-fluentcart) was added in oopspam Anti-Spam version 1.2.85.

Go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://www.oopspam.com/wordpress)**, then install and activate it.

![Go to Plugins > Add New, search for oopspam Anti-Spam, then install and activate it.](/blog/assets/posts/oopspam-anti-spam-overview.png "Go to Plugins > Add New, search for oopspam Anti-Spam, then install and activate it.")

[Create a free account](https://app.oopspam.com/Identity/Account/Register) and copy your API key.

![Create a free account and copy your API key.](/blog/assets/posts/oopspam-dashboard-api.png "Create a free account and copy your API key.")

Go to **Settings > oopspam Anti-Spam** and paste the key.

![Go to Settings > oopspam Anti-Spam and paste the key.](/blog/assets/posts/oopspam-api-key.png "Go to Settings > oopspam Anti-Spam and paste the key.")

Find the **FluentCart** section and turn on **Activate Spam Protection**.

![Find the FluentCart section and turn on Activate Spam Protection.](/blog/assets/posts/fluentcart-protection.png "Find the FluentCart section and turn on Activate Spam Protection.")

Scroll to **Country Filtering** and pick a mode:

![Scroll to Country Filtering and fill in the lists you need](/blog/assets/posts/country-filtering-settings.png "Scroll to Country Filtering and fill in the lists you need")

Scroll to **Country Filtering** and fill in the lists you need:

* **Trusted Countries:** orders from these countries are always allowed and skip all spam checks. Add only your core markets, such as your home country.
* **Country Allowlist:** when you select countries here, oopspam processes orders only from these countries. Leave it empty to accept every country not on the blocklist.
* **Country Blocklist:** orders from these countries are rejected, unless the country is also in Trusted Countries. 

Use the quick buttons to add common sets in one click: **Add China and Russia**, **Add countries in Africa**, or **Add countries in the EU**.

Click **Save Changes**.

If your site runs behind Cloudflare or another proxy, turn on **Trust proxy headers**. Without it, oopspam may read the proxy's IP instead of the buyer's.

### **Add these for stronger coverage:**

* **Block VPNs and cloud providers.** Fraudsters use VPNs to fake their country.

![Block VPNs and cloud providers. Fraudsters use VPNs to fake their country.](/blog/assets/posts/ip-filtering-oopspam.png "Block VPNs and cloud providers. Fraudsters use VPNs to fake their country.")

* **Rate limiting.** [Cap orders per IP](https://www.oopspam.com/blog/how-to-rate-limit-orders-in-fluentcart) and per email per hour.

![Rate limiting. Cap orders per IP and per email per hour.](/blog/assets/posts/enabled-rate-limiting-settings.png "Rate limiting. Cap orders per IP and per email per hour.")

* **Logs.** Review blocked orders under **[Form Spam Entries](https://help.oopspam.com/wordpress/form-entries/)**, with the country, IP, and reason.

![Logs. Review blocked orders under Form Spam Entries, with the country, IP, and reason.](/blog/assets/posts/oopspam-logs-bulk-actions.png "Logs. Review blocked orders under Form Spam Entries, with the country, IP, and reason.")

The free plan includes 40 spam checks per month. Each checked order uses one.

## **Method 3: Block Countries at the Edge With Cloudflare**

Use this when bots flood your store from [specific countries](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare). A Cloudflare rule stops requests before they reach WordPress, so they cost you no server resources.

![Block Countries at the Edge With Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Block Countries at the Edge With Cloudflare")

1. Log in to the[ Cloudflare dashboard](https://dash.cloudflare.com/) and select your store's domain.
2. Go to **Security > Security rules** and create a new custom rule.
3. Name it, for example "Block countries at checkout".
4. Set **Field** to **`Country`**, **Operator** to **`is in`**, and select the countries.
5. *(Optional)* To block only checkout, add **And**: **URI Path** **`equals /wp-json/fluent-cart/v2/checkout/place-order`**.
6. Set **Action** to **Block**, or **Managed Challenge** to let real people through.
7. Click **Deploy**.

The checkout-only rule looks like this in the expression editor. Replace the country codes with your own:

```
(ip.src.country in {"XX" "YY"} and http.request.uri.path eq "/wp-json/fluent-cart/v2/checkout/place-order")
```

Without step 5, the rule blocks your whole site for those countries. That includes product pages and your blog. Use the full-site block only for legal or security reasons.

### **Which Method Should You Use?**

Start with oopspam for most stores. Add shipping zones for physical goods and Cloudflare for heavy bot traffic.

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
    text-align: center;
  }
</style>

<table class="oopspam-table">
  <thead>
    <tr>
      <th>Method</th>
      <th>What it blocks</th>
      <th>Covers digital products</th>
      <th>Best for</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>FluentCart shipping zones</td>
      <td>Shipping to excluded addresses</td>
      <td>No</td>
      <td>Countries you cannot ship to</td>
    </tr>
    <tr>
      <td>oopspam Anti-Spam</td>
      <td>Checkout orders by IP country</td>
      <td>Yes</td>
      <td>Fake orders, card testing, logs</td>
    </tr>
    <tr>
      <td>Cloudflare Rules</td>
      <td>Checkout path or the whole site</td>
      <td>Yes</td>
      <td>Bot floods, legal or security bans</td>
    </tr>
  </tbody>
</table>

## **Final Thoughts**

Country blocking is IP-range blocking, not identity checking. VPNs and proxies can make a buyer look like they are somewhere else. Pair country rules with VPN blocking and rate limiting so attackers cannot simply switch locations.

FluentCart's shipping zones control where you ship. oopspam controls who can place an order. Cloudflare controls who can reach your server. Use the layers you need, and review your spam logs weekly.
