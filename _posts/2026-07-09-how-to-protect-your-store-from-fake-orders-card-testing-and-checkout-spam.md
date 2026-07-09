---
layout: post
title: How to Protect Your Store from Fake Orders, Card Testing, and Checkout Spam
date: 2026-07-09T13:47:00.000+08:00
author: chazie
image: /blog/assets/posts/social-media-meta.png
description: Protect your store from fake orders, card testing, and checkout
  spam with proven security layers, fraud detection, and WooCommerce best
  practices.
tags:
  - WooCommerce
  - Card Testing
  - Shopify
  - MemberPress
  - SureCart
---
Card testing and checkout spam are no longer occasional nuisances. Attackers now run large scale, automated attempts against checkout pages, and the tools that stop them are the same ones that have protected stores for years: CAPTCHA or Turnstile at checkout, AVS and CVV enforcement, account verification, a web application firewall, and a [dedicated fraud or spam detection layer](https://www.oopspam.com/blog/best-fraud-detection-plugins-for-wordpress-in-2026). Stack these together and most fake orders and card testing attempts never reach your payment processor.

### **Why This Problem Got Bigger**

Fraud on checkout pages used to be an occasional annoyance. That changed in 2025. According to our [2025 Annual Spam Report](https://www.oopspam.com/2025-spam-report), e-commerce spam jumped to 22% of all tracked spam activity, up from 15% the year before, driven mostly by card testing attacks against WooCommerce stores. In a single week in September 2025, the report recorded over [450,000 card testing](https://www.oopspam.com/blog/the-larget-card-testing-attack) attempts, the largest wave it had ever logged, hitting both classic and block based checkout flows.

Two shifts make this harder to catch with old school tools:

* **Residential proxies replaced data center IPs.** Attackers now route traffic through real home devices, routers, and IoT hardware, so IP blocking and geo-fencing catch far less than they used to.
* **Free webmail dominates fake signups.** Gmail addresses made up more than 63% of the email addresses seen in card testing attempts in the same report, with Yahoo and Microsoft services rounding out the top three.

That combination means bot traffic increasingly looks like normal shopper traffic, which is why layered defenses matter more than any single tool.

## **Step 1: Stop Bots and Spam Traffic Before Checkout**

![Step 1: Stop Bots and Spam Traffic Before Checkout](/blog/assets/posts/turnstile-at-checkout-.png "Step 1: Stop Bots and Spam Traffic Before Checkout")

* **Turn on CAPTCHA or Turnstile.** [Google reCAPTCHA](https://woocommerce.com/products/recaptcha-for-woocommerce/) or [Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile) on your checkout, login, and registration forms filters out scripted bot traffic without adding much friction for real shoppers.
* **Put a WAF in front of your store.** Cloudflare and similar firewalls flag known bad data centers and sudden traffic spikes before they hit your server.
* **Rate limit checkout attempts.** Cap how many [checkout submissions](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-woocommerce-for-orders-and-registrations) a single IP address or email can make in an hour. Most fraud plugins and security tools include this out of the box.

## **Step 2: Shut Down Card Testing**

[Card testing](https://www.oopspam.com/blog/card-testing-attacks-a-new-threat-vector-through-woocommerce-block-based-checkout) is when someone runs a batch of stolen card numbers through your checkout to see which ones are still active, usually with tiny or even $0 transactions.

![Step 2: Shut Down Card Testing](/blog/assets/posts/woocommerce-failed-cvc-check.png "Step 2: Shut Down Card Testing")

* **Require CVV on every transaction.** This is a [default setting](https://woocommerce.com/document/woopayments/fraud-and-disputes/card-verification-checks/) most gateways offer, but it is worth confirming it is actually turned on.
* **Enforce AVS.** Address Verification checks that the billing address matches the one on file with the card issuer, which stops a large share of stolen card attempts.
* **Restrict shipping geographies.** If you only ship domestically, block checkout traffic and transactions from outside your [target countries](https://www.oopspam.com/blog/how-to-block-countries-in-woocommerce-order-registration).
* **Turn on 3D Secure.** 3DS adds one extra verification step and shifts chargeback liability to the issuing bank, which matters a lot if testing attacks slip through.

## **Step 3: Prevent Fake Orders and Chargebacks**

![OOPSpam](/blog/assets/posts/oopspam-1.png "OOPSpam")

### **Add a dedicated fraud or spam detection layer.** 

This is where a purpose-built tool earns its keep. **[OOPSpam](https://www.oopspam.com/)** (that's us) is worth a close look because it offers:

1. WooCommerce checkout protection alongside form and comment spam filtering in a single plugin.
2. [Contextual and behavioral detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection) instead of relying solely on IP reputation, a significant advantage now that residential proxies can bypass traditional geo and IP-based blocking.
3. One API key that agencies can use across unlimited websites, making management much simpler.
4. Optional blocking of VPN and cloud provider traffic with a single toggle.
5. Protection that works without forcing shoppers to complete CAPTCHA puzzles, helping maintain a smoother checkout experience.

* **Another option is to use Stripe Radar if you're using Stripe as your payment processor.** [Stripe Radar](https://stripe.com/radar) uses machine learning to detect and block fraudulent payments and can flag high-risk transactions before processing, adding an extra layer of protection against fake orders.
* **Require an account with verified email.** Removing [guest checkout](https://woocommerce.com/document/configuring-woocommerce-settings/accounts-and-privacy/#guest-checkout-and-accounts) and adding a double opt in step filters out a large share of automated order attempts, since bots generally do not bother completing email verification.
* **Enable 3D Secure** as described above, since it directly reduces chargeback exposure on fraudulent orders that do get through.

## **Platform Specific Checklist**

### **WooCommerce**

![Disable guest checkout under Settings > Accounts & Privacy.](/blog/assets/posts/woocommerce-disable-guest-checkout.png "Disable guest checkout under Settings > Accounts & Privacy.")

* Disable guest checkout under **Settings > Accounts & Privacy**.
* Install a WooCommerce focused anti-fraud plugin and enable [reCAPTCHA](https://www.oopspam.com/recaptcha-alternative) v2 (it tends to hold up better at checkout than v3).
* Add rate limiting through a firewall or a security plugin such as Wordfence.
* Consider installing [OOPSpam](https://www.oopspam.com/blog/spam-protection-for-woocommerce), since it flags orders with [unknown origin](https://www.oopspam.com/blog/how-to-stop-failed-orders-with-unknown-origin-in-woocommerce) or missing device data on both Classic and Block based Checkout that many fraud plugins miss.

## **Shopify**

![Use Shopify Flow to auto cancel or hold high risk orders for review.](/blog/assets/posts/shopify-flow.png "Use Shopify Flow to auto cancel or hold high risk orders for review.")

* Use [Shopify Flow](https://apps.shopify.com/flow) to auto cancel or hold high risk orders for review.
* Install the built in Shopify Fraud Filter app to block known bad IPs, emails, and repeat offenders.
* Confirm AVS and CVV checks are enforced under Shopify Payments settings.
* Consider connecting [OOPSpam to Shopify Flow](https://www.oopspam.com/blog/how-to-stop-fake-orders-in-shopify) to score orders by IP and email risk and auto flag suspicious ones for review.

## **SureCart**

![Turn on native Spam Protection under SureCart > Settings > Advanced.](/blog/assets/posts/surecart-spam-protection.webp "Turn on native Spam Protection under SureCart > Settings > Advanced.")

* Turn on native Spam Protection under **SureCart > Settings > Advanced**.
* Consider installing [OOPSpam alongside SureCart](https://www.oopspam.com/blog/5-ways-to-stop-fake-orders-in-surecart) to add [rate limiting](https://www.oopspam.com/blog/how-to-rate-limit-orders-in-surecart), [country filtering](https://www.oopspam.com/blog/how-to-block-countries-in-surecart), and cloud provider [IP blocking](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-surecart-forms) on top of SureCart's native protections.

## **MemberPress**

![Enable Math CAPTCHA on registration pages under the Account settings tab.](/blog/assets/posts/memberpress-enabling-math-captcha-.webp "Enable Math CAPTCHA on registration pages under the Account settings tab.")

* Enable **Math CAPTCHA** on registration pages under the **Account** settings tab.
* Require email verification before granting access to paid content.
* Consider installing [OOPSpam for MemberPress](https://www.oopspam.com/blog/spam-protection-for-memberpress) to add [rate limiting](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-memberpress) and [country filtering](https://www.oopspam.com/blog/how-to-block-countries-in-memberpress), VPN detection, and cloud provider [IP blocking](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-memberpress) for registration and contact forms.

## **Final Takeaway**

No single tool stops every fake order or card testing attempt. The stores that hold up best combine a firewall at the network level, CAPTCHA or OOPSpam at the form level, AVS and CVV at the payment level, and a checkout and spam protection plugin like OOPSpam watching the checkout itself. Layer these together, keep an eye on which tactics are trending, and stick with tools that have a real track record behind them.
