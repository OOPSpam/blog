---
layout: post
title: How to block countries in Ultimate Member?
date: 2025-09-04T03:22:00.000+08:00
author: chazie
image: /blog/assets/posts/ultimate_header.png
description: Ultimate Member doesn’t have built-in country blocking. Use OOPSpam
  for form-level protection or Cloudflare Firewall for site-wide blocking.
tags:
  - Ultimate Member
  - Cloudflare
---
![Ultimate Member](/blog/assets/posts/ultimate-member.png "Ultimate Member")

Ultimate Member does not support country blocking on its own. To stop unwanted registrations, spam, or abusive traffic, you’ll need to use a third-party tool. The easiest solution is the [OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/) plugin (that’s us 👋), which lets you block specific countries at the form level. For wider protection beyond Ultimate Member, you can use [Cloudflare Firewall Rules](https://developers.cloudflare.com/firewall/) to block traffic from entire countries before they reach your site.

### **Why Ultimate Member Doesn’t Do This Directly**

[Ultimate Member](https://ultimatemember.com/) is built for user management, not traffic blocking. 

It focuses on creating profiles, handling registrations, and restricting content by roles. Security controls like country blocking aren’t part of its core features because these are typically handled by security plugins or your hosting provider’s firewall.

Most importantly, this means you’ll need a separate plugin or a network-level firewall to block spam or access from unwanted countries.

## **Option 1: Block Countries in Ultimate Member Forms with OOPSpam**

[OOPSpam](https://www.oopspam.com/) gives you direct control over form submissions.

It integrates with WordPress forms, including Ultimate Member, and lets you decide which countries can submit registrations or login attempts.

**Key Features include:**

* Country filtering to allow or [block submissions](https://www.oopspam.com/blog/spam-protection-for-ultimate-member).
* Language filtering for unwanted entries.
* Submission [frequency limits](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) to stop abuse.
* Machine learning-based spam detection that catches bots and automated signups.
* Proxy, VPN, and TOR blocking for stronger protection.
* Submission [logs](https://help.oopspam.com/wordpress/form-entries/) so you know what was blocked and why.

### **How to Set It Up**

Install the **OOPSpam Anti-Spam plugin** from your WordPress dashboard. Create an account at **[OOPSpam.com](https://app.oopspam.com/Identity/Account/Login)** and generate an API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

Go to **OOPSpam Anti-Spam > Settings** and paste your API key.

![OOPSpam Anti-Spam > Settings](/blog/assets/posts/oopspam-api-key.png "OOPSpam Anti-Spam > Settings")

Enable protection for **Ultimate Member forms** in the settings.

![Enable protection for Ultimate Member forms in the settings.](/blog/assets/posts/ultimate-member-spam-protection.png "Enable protection for Ultimate Member forms in the settings.")

Scroll to the **Country Filtering** section under the General Settings tab and select the countries to block or allow.

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Save changes and review blocked entries under **Spam & Ham logs** in WordPress.

![Spam & Ham logs in WordPress](/blog/assets/posts/form-spam-entries-oopspam.png "Spam & Ham logs in WordPress")

For deeper insights, visit the **OOPSpam Dashboard** where you’ll see reports, blocking reasons, and spam trends over time.

![OOPSpam dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam dashboard logs")

## **Option 2: Block Entire Countries with Cloudflare**

If your issue is bigger than spam, use Cloudflare Firewall.

[Cloudflare](https://www.cloudflare.com/) lets you [block traffic](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare) at the network level, stopping attacks before they even reach your WordPress site.

### **How to Do It**

![Block Entire Countries with Cloudflare](/blog/assets/posts/blocking-countries-in-cloudflare.png "Block Entire Countries with Cloudflare")

1. Log in to your **Cloudflare account**.
2. Go to **Security > WAF > Firewall Rules**.
3. Create a new rule and name it **“Block Countries.”**
4. Set the field to **Country**, operator to **is in**, and select the countries to block.
5. Choose **Block** as the action, then save.

Visitors from those countries will now be denied access to your entire site, not just Ultimate Member forms.

## **Final thoughts**

The main takeaway is this:

* OOPSpam gives you form-level control, letting you block spam registrations by country inside Ultimate Member.
* Cloudflare Firewall provides site-wide security, stopping abusive traffic before it hits your server.

Together, these tools give you the flexibility and protection that Ultimate Member alone cannot provide, keeping your site safer while still letting the right users in.
