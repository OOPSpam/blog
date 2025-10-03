---
layout: post
title: How to Limit Form Submissions in Paid Memberships Pro (PMPro)
date: 2025-10-03T04:38:00.000+08:00
author: chazie
image: /blog/assets/posts/pmp_rt.jpg
description: Learn how to limit form submissions in Paid Memberships Pro using
  add-ons, WS Form integration, and OOPSpam for spam protection and rate limits.
tags:
  - Paid Memberships Pro
  - WS Form
---
![Paid Memberships Pro (PMPro)](/blog/assets/posts/paid-memberships-pro-home.png "Paid Memberships Pro (PMPro)")

Limiting form submissions in [Paid Memberships Pro (PMPro)](https://www.paidmembershipspro.com/) helps protect your site from spam, manage member access, and control how often users can submit content. You can achieve this with PMPro’s official add-ons, and integrations with form builders like [WS Form](https://www.oopspam.com/integrations/spam-protection-for-ws-form). For advanced protection, pairing with **[OOPSpam](https://www.oopspam.com/)** adds rate-limiting, country filtering, and spam detection.

## **Use the Limit Post Views Add-On**

![PMPro - Use the Limit Post Views Add-On](/blog/assets/posts/use-the-limit-post-views-add-on.png "PMPro - Use the Limit Post Views Add-On")

If your forms rely on members submitting or viewing protected content, the [PMPro Limit Post Views Add-On](https://www.paidmembershipspro.com/add-ons/pmpro-limit-post-views/) provides another layer of control.

1. Navigate to **Memberships > Add Ons** and install **Limit Post Views**.
2. Configure how many times members or non-members can access specific content.
3. Set limits per hour, day, week, or month.
4. Choose a redirect page when limits are reached.

This approach doesn’t stop the form itself but restricts how often members access the submission page,  effectively throttling submissions.

## **Using Third-Party Form Plugins with PMPro**

PMPro integrates with popular form builders. Using [WS Form](https://www.oopspam.com/blog/wsform-block-user), you can directly set submission rules.

### **WS Form Integration**

![PMPro - WS Form Integration](/blog/assets/posts/ws-form-integration.png "PMPro - WS Form Integration")

With WS Form, you can:

1. Create a submission form (for posts, applications, or member content).
2. Protect the form with PMPro’s **Require Membership** block, so only certain levels can access it.
3. Apply WS Form’s built-in submission limits to restrict how often members can submit (per user, per IP, or per timeframe).

### **Restrict Access with Membership Shortcodes**

You can also control form visibility using PMPro’s **membership shortcodes**.

1. Add a new page or post.
2. Insert the WS Form shortcode into a shortcode block.
3. Wrap it with the `[membership]` shortcode.
4. Adjust the level ID to match your target membership tier.

**Example:**

```
[membership level="1"]  
[ws_form id="123"]  
[/membership]  
```

This ensures only members of a specific level can see and submit the form.

## **Advanced Submission Control with OOPSpam**

For [advanced abuse prevention](https://www.oopspam.com/blog/4-ways-to-stop-spam-on-your-paid-memberships-pro-membership-site), integrate **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋) with your form workflow. This adds features beyond PMPro’s core.

### **Key Features of OOPSpam for PMPro Forms**

* Rate-limits by IP/email (e.g., max 3 submissions per hour).
* [Country allow/deny](https://www.oopspam.com/blog/how-to-block-countries-in-paid-memberships-pro) lists to block high-risk regions.
* Language filters to stop irrelevant or harmful content.
* Proxy/VPN detection to catch hidden attackers.
* Submission [logs](https://help.oopspam.com/wordpress/form-entries/) so you can review and adjust your rules.

### **Setup Steps**

Install and activate **OOPSpam Anti-Spam** from the WordPress repository. Create an [OOPSpam account](https://app.oopspam.com/Identity/Account/Login) and get your API key.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Anti-Spam")

Enter the key in **OOPSpam → General Settings**.

![Enter the key in OOPSpam → General Settings.](/blog/assets/posts/oopspam-api-key.png "Enter the key in OOPSpam → General Settings.")

Enable **Spam Protection** for your chosen form plugin (e.g., PMPro).

![Enable Spam Protection for Paid Memberships Pro](/blog/assets/posts/paid-memberships-pro-spam-protection-settings.png "Enable Spam Protection for Paid Memberships Pro")

Toggle on **[Rate Limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam)** and configure:

![Toggle on Rate Limiting settings](/blog/assets/posts/rate-limiting-settings.png "Toggle on Rate Limiting settings")

* **Max submissions per IP/hour:** Prevents too many entries coming from the same IP address.
* **Max submissions per email/hour:** Stops repeated attempts from the same email.
* **Block duration:** Sets how long a user is locked out after hitting the limit.
* **Log cleanup:** Automatically clears old submission logs to keep your site running smoothly.

This ensures that even if a member gains form access, they cannot overwhelm the system with excessive or automated submissions.

## **Final Thoughts**

Paid Memberships Pro gives you strong membership and access control, but it doesn’t directly manage form submissions. By combining PMPro settings, the Limit Post Views Add-On, and WS Form integration, you can enforce submission rules that suit your site. Adding OOPSpam on top ensures that only real members, not bots or spammers, get through.
