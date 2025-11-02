---
layout: post
title: "How to Block VPN and Data Center IP Submissions in Avada Forms? "
date: 2025-10-20T13:54:00.000+08:00
author: chazie
image: /blog/assets/posts/avada_form_block.jpg
description: Block spam at the source. Learn how to stop VPN and data center IP
  submissions in Avada Forms using OOPSpam and Cloudflare for safer entries.
tags:
  - Cloudflare
  - Avada Forms
---
![Avada Forms](/blog/assets/posts/avada-for-wordpress.png "Avada Forms")

[Avada Forms](https://avada.com/feature/form-builder/) cannot block VPN or data center IPs on its own. The fastest, most reliable way to stop those submissions is to add OOPSpam to Avada Forms and enable its IP Filtering (Block VPNs + Block Cloud Providers). For [extra protection](https://www.oopspam.com/blog/4-ways-to-protect-your-avada-forms-from-spam), keep Avada’s Honeypot and Cloudflare Turnstile on, and if you use Cloudflare, add a simple WAF rule that challenges low bot-score traffic. This layered setup cuts spam without breaking real user flows.

### **Why VPN and Cloud IPs Flood Avada Forms**

* VPNs hide true locations and rotate identities, letting abusers bypass basic rate limits.
* Cloud/data-center hosts (AWS, Google Cloud, OVH, DigitalOcean, etc.) power most automated bots; they are cheap, fast, and disposable.

Blocking these two sources won’t stop every bad actor, but it removes a large, noisy slice of anonymous traffic before it reaches your inbox or CRM.

## **What Avada Forms Can and Can’t Do Natively**

A quick baseline helps you pick the right controls.

* **Available out of the box:**
* * Honeypot element (stops simple bots).
  * Cloudflare Turnstile element (privacy-friendly challenge; better UX than legacy captchas).
* **Not available out of the box:**
* * IP reputation or ASN filtering (e.g., “block VPNs,” “block cloud providers”).
  * Country allow/deny rules or per-form rate limiting with analytics.

To block VPN and data center IPs, you need a third-party plugin or an edge firewall. The most direct option for Avada Forms owners is **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋).

## **Why OOPSpam Is the Straightforward Choice for Avada**

Pick the tool that gives you results in minutes, not days.

* **One-click IP Filtering:** Toggle Block VPNs and Block Cloud Providers—no ASN lists to maintain.
* **Always-updated reputation data:** Covers 1,500+ data centers, known VPN/proxy ranges, and newly seen threats.
* **Form-level controls:** Works directly with Avada Forms. You can fine-tune per form without touching code.
* **Layered defense built in:** [Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam), ML-based scoring, keyword/context checks, and country rules to catch abuse that sneaks past IP filters.
* **Quiet UX:** Filters run in the background; legitimate users don’t see puzzles unless you choose to challenge them.

### **Step-by-Step: Enable OOPSpam on Avada Forms**

Follow this once. It’s quick and repeatable across sites.

In **WordPress → Plugins → Add New**, search **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**. Install and activate.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

Create an [OOPSpam account](https://app.oopspam.com/Identity/Account/Login) and generate your API key.

![OOPSpam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam dashboard")

Go to **Settings → OOPSpam Anti-Spam → General**. Select **OOPSpam Dashboard** as the data source, paste your **API key** from the OOPSpam dashboard, and save.

![OOPSpam General Settings ](/blog/assets/posts/oopspam-api-key.png "OOPSpam General Settings  ")

Once OOPSpam detects Avada Forms, a dedicated section appears. Enable **Activate Spam Protection**. Optionally set a custom message for blocked submissions.

![Activate Spam Protection for Avada Forms](/blog/assets/posts/spam-protection-for-avada-forms.png "Activate Spam Protection for Avada Forms")

Open the **IP Filtering** tab and toggle:

* Block VPNs
* Block Cloud Providers (recommended)

![IP Filtering tab](/blog/assets/posts/ip-filtering-oopspam.png "IP Filtering tab")

### **(Optional) Add precision controls**

* **Rate limiting:** Set per-form submission caps to slow “human-like” spam.
* **Country rules:** Allow or deny [specific countries](https://www.oopspam.com/blog/how-to-block-countries-in-avada-forms) if your audience is regional.
* **Keyword rules:** Flag or block obvious spam phrases unique to your niche.

Submit your form in an **Incognito** window. Confirm outcomes in [Spam & Ham Logs](https://help.oopspam.com/wordpress/form-entries/) and in your **OOPSpam Dashboard**.

![Spam & Ham Logs](/blog/assets/posts/form-spam-entries-oopspam.png "Spam & Ham Logs")

> Keep Avada’s Honeypot and Turnstile elements enabled. They complement OOPSpam and improve accuracy with minimal friction.

## **Cloudflare WAF (Optional but Powerful)**

If your site runs behind [Cloudflare](https://www.cloudflare.com/), block or challenge bad traffic before it hits WordPress.

![Cloudflare WAF](/blog/assets/posts/cloudflare_was_asn.png "Cloudflare WAF")

* **Bot Score Rule:** Set this expression — `cf.bot_management.score lt 30 and not cf.bot_management.verified_bot`. Choose **Managed Challenge** as the action, or **Block** if the attack is severe.
* **ASN Rules:** Keep a list of abusive networks (like specific hosting providers). Block or rate limit them temporarily, then review daily.
* **Country Rules:** If you don’t serve certain countries, block them at the edge. Still, keep OOPSpam’s per-form country rules active for better accuracy.

This approach reduces server load and works perfectly with OOPSpam’s filtering inside Avada Forms.

### **Tuning for Conversions and Fewer False Positives**

You want to block abuse without hurting real users. This is how.

* **Start conservative:** Block Cloud Providers; challenge or allow + flag VPNs until you trust your pattern.
* **Maintain allowlists:** Add staff, agencies, and API partners so their submissions are never blocked.
* **Watch the logs, not just volume:** Check OOPSpam’s Spam/Ham logs weekly to spot patterns (countries, ASNs, or URLs) and adjust rules.
* **Verify suspicious IPs:** You can use tools like **[IP Reputation Check](https://ipreputationcheck.com/)** to determine whether a specific IP address is associated with a VPN or data center.
* **Don’t over-block globally:** Broad ASN blocks can catch remote workers and B2B users. Use them only during active incidents and remove them when quiet.
* **Accessibility matters:** [Turnstile](https://www.oopspam.com/blog/common-cloudflare-turnstile-errors-in-wordpress-forms-and-how-to-fix-them) is friendlier to assistive tech than image puzzles. Keep it on with the [Honeypot](https://www.oopspam.com/blog/ways-to-stop-spam#:~:text=Final%20thoughts-,Honeypot,-%3A%20filter%20spam%20with) for baseline protection.

## **Final Thoughts**

You don’t need a security team to stop VPN and data center spam on Avada. Turn on Avada’s Honeypot and Turnstile, add OOPSpam and enable Block VPNs + Block Cloud Providers, and, if available, apply a simple Cloudflare bot-score challenge. This layered setup is fast to deploy, low-maintenance, and highly effective. Keep an eye on the logs for a week, fine-tune your allow lists, and enjoy quieter inboxes and cleaner analytics.
