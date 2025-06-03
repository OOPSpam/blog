---
layout: post
title: Why Shopify Country Blocking Apps Don't Actually Block Countries?
date: 2025-06-01T08:50:00.000Z
author: onar
image: /blog/assets/posts/header_shopify.jpg
description: Learn how Shopify Geo-Blocking apps work and how they can easily be bypassed.
tags:
  - ip-restrictions
  - shopify
  - geo-blocking
---
At [OOPSpam](https://www.oopspam.com/), we started looking into Shopify as a potential [integration](https://www.oopspam.com/integrations/) with [our API](https://www.oopspam.com/docs/). I knew nothing about the Shopify app system, how it works, or its capabilities.

After doing some research, we realized there isn't much you can do to truly secure your Shopify website. As you may know, it is a closed system, unlike [Woo](https://www.oopspam.com/woocommerce) and other open-source solutions. It's only natural that you have limited options for addressing card testing attacks, which are the main threat in e-commerce.

There are two sides to this story. On the one hand, you are not responsible for card testing attacks or spam protection as you are with WooCommerce. On the other hand, if you are receiving these threats, [as many people are](https://www.reddit.com/r/shopify/comments/1dnjd1m/high_velocity_card_testing_issue/), then you cannot do much.

People have started looking for an app for their Shopify store that can block access from certain countries, VPNs, proxies, and data centers. There are [nearly 90 apps](https://apps.shopify.com/categories/store-management-security-fraud/all), most of which offer IP, VPN, proxy, and country blocking in the fraud category.

After seeing these apps, we thought about offering our API as a way to validate and block spam and card testing attacks, but apparently, all these apps do is inject JavaScript into the front end. When a visitor or bot visits a website, the app validates the country of origin.

![Shopify Country Blocking](/blog/assets/posts/screenshot-2025-06-02-at-6.07.33 pm.png "Shopify Country Blocking")

This means that if you prevent an app's JavaScript from loading, it should not be able to block access.

Here is a simple way to bypass all these apps. For this demonstration, I used the popular app [Blockify Fraud Filter Blocker](https://apps.shopify.com/blockify). All other apps work the same way.



1. Access the demo website by going to the app’s page in the Shopify App Store and clicking on "View demo store”.

   ![View Demo Store in Shopify App](/blog/assets/posts/screenshot-2025-06-02-at-6.10.41 pm.png "View Demo Store in Shopify App")
2. When you try to access the website, you will see an error message saying that you do not have permission.

   ![Access Denied in Shopify Store](/blog/assets/posts/screenshot-2025-06-02-at-6.06.47 pm.png "Access Denied in Shopify Store")
3. I used uBlock Origin to block the script from loading, which effectively avoided any blocking.

   ![Unblocking a website in Shopify App](/blog/assets/posts/screenshot-2025-06-02-at-6.20.51 pm.png "Unblocking a website in Shopify App")



All the apps in this category work the same way, and bypassing them is as simple as it looks.  Due to Shopify’s limitations, it seems there is no backend validation.

Most bots nowadays are smarter, and any serious bot will be able to bypass this type of blocking. That said, the dumb ones will likely be blocked.



### Wrap Up

Shopify is great, and they protect you against many of the threats you're likely to face if you run your own e-commerce store. Occasionally, though, the system won’t protect your store against new risks. While these apps claim to block countries, they can easily be bypassed. Currently, there is no reliable way to block countries in Shopify.

Instead, modify your [shipping settings](https://help.shopify.com/en/manual/fulfillment/setup) to restrict your shipping countries, preventing them from placing an order. Unfortunately, sometimes attacks happen from countries you are selling to. In these cases, your best bet is to reach out to Shopify support.
