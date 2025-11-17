---
layout: post
title: How to Limit Form Submissions in MemberPress?
date: 2025-11-17T13:50:00.000+08:00
author: chazie
image: /blog/assets/posts/mp_rt.jpg
description: Learn how to limit form submissions in MemberPress using its
  Registration Restrictions add-on and OOPSpam for advanced spam protection.
tags:
  - MemberPress
  - Rate-limiting
---
![MemberPress](/blog/assets/posts/memberpress-homepage.png "MemberPress")

Limiting form submissions in [MemberPress](https://memberpress.com/) helps you control registrations, stop spam, and keep your membership site healthy. The best methods include using the Membership Registration Restrictions add-on for core membership control and **OOPSpam Anti-Spam** for advanced submission limits and rate-limiting features. Together, these tools help you prevent abuse, reduce fake signups, and keep real members engaged.

## **Method 1: Use MemberPress Registration Restrictions Add-On**

MemberPress has a [built-in add-on](https://memberpress.com/docs/installation-configuration-of-our-membership-registration-restrictions-addon/) that lets you control who can register and how many signups are allowed.

### **Install and Activate the Add-On**

Go to **WordPress Dashboard → MemberPress → Add-ons**, find **Membership Registration Restrictions**, and click **Install** then **Activate**.

> **Note:** Available for Growth and Scale plans only.

### **Set Restrictions Per Membership**

![Set Restrictions Per Membership in MemberPress](/blog/assets/posts/set-restrictions-per-membership.png "Set Restrictions Per Membership in MemberPress")

1. Go to **MemberPress → Memberships**.
2. Click **Edit** on the membership you want to limit.
3. Under the **Permissions** tab, enable **Maximum # of Active Registrations**.
4. Enter the number of members allowed for that membership.

For example, if you want to allow only 50 active members, set the value to **50**. Once that limit is reached, no new users can register until an active membership slot becomes available.

#### **Add a Custom Error Message**

You can customize what users see if they attempt to register after the limit is reached. Use a short, direct message like: *“Registration is full. Please try again later.”*

### **Restrict by IP, Email, Domain, or Age**

You can also stop specific users or patterns of abuse before they even reach your membership cap.

#### **IP Restrictions**

![IP Restrictions in MemberPress](/blog/assets/posts/ip-restrictions-memberpress.png "IP Restrictions in MemberPress")

Block or allow users based on their IP address. You can use wildcards or CIDR notation (e.g., `192.168.0.*` or `192.168.0.0/24`). Apply these settings globally or per membership.

#### **Email Domain and Email Address Restrictions**

![Email Domain and Email Address Restrictions in MemberPress](/blog/assets/posts/email-domain-and-email-address-restrictions-memberpress.png "Email Domain and Email Address Restrictions in MemberPress")

You can block disposable email domains or allow only specific ones (like company emails). Enter your list in the **Email Domain List** or **Email Address List** fields and choose **Block** or **Allow**.

#### **Age Restrictions**

![Age Restrictions in MemberPress](/blog/assets/posts/age-restrictions-memberpress.png "Age Restrictions in MemberPress")

If your site requires members to meet a minimum age, enable **Age Restriction** and set the required age. Users must confirm they meet the requirement during signup.

## **Global vs Membership-Level Restrictions**

**Global restrictions** apply to the entire site. You can set them in your **WordPress dashboard → MemberPress → Settings → Restrictions.**

![Global vs Membership-Level Restrictions in MemberPress](/blog/assets/posts/mp-global-restrictions.png "Global vs Membership-Level Restrictions in MemberPress")

If you apply restrictions on individual memberships, those will override global settings. For instance, if you block an IP globally but allow it for one membership, the membership-specific setting takes priority.

You can also set restrictions for coupons and corporate accounts, giving full flexibility to control how members and sub-accounts register.

## **Method 2: Add OOPSpam for Advanced Control**

If you want to block spam and [rate-limit submissions](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) beyond MemberPress’s native options, use **[OOPSpam](https://www.oopspam.com/)** (that’s us 👋). It adds machine-learning spam detection and rate-limiting to your WordPress forms.

![OOPSpam ](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam ")

### **Install and Activate OOPSpam**

Go to **Plugins → Add New**, search for **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, and install it. [Create an account](https://app.oopspam.com/Identity/Account/Login) at **OOPSpam.com** and copy your **API Key**.

![OOPSpam Dashboard](/blog/assets/posts/oopspam-dashboard-api.png "OOPSpam Dashboard")

In WordPress, go to **OOPSpam → General Settings** and **paste your API key**.

![Paste your API key](/blog/assets/posts/oopspam-api-key.png "Paste your API key")

Activate spam protection for MemberPress forms. Click **Save Changes.**

![Activate spam protection for MemberPress](/blog/assets/posts/memberpress-spam-protection.png "Activate spam protection for MemberPress")

### **Enable Rate Limiting**

Open the **Rate Limiting** tab in OOPSpam settings and toggle **Enable Rate Limiting** ON.

![Enable Rate Limiting](/blog/assets/posts/enabled-rate-limiting-settings.png "Enable Rate Limiting")

Configure your thresholds:

* **Max Submissions per IP/hour:** Prevents repeat attempts from the same IP.
* **Max Submissions per Email/hour:** Stops rapid signups using one email.
* **Block Duration (hours):** How long a blocked user remains restricted.
* **Data Cleanup (hours):** Automatically removes old logs.

Click **Save Changes** when done.

### **Strengthen Spam Filtering**

For stronger protection, turn on these OOPSpam filters:

* VPN, Proxy, or TOR blocking
* [Country-based filtering](https://www.oopspam.com/blog/how-to-block-countries-in-memberpress)
* Language filter
* [Contextual spam detection](https://www.oopspam.com/blog/introducing-contextual-spam-detection)
* Logs and monitoring

These filters ensure that only legitimate users can access your forms while keeping bots and abusers away.

## **Best Practices for Site Owners**

1. Always review your error messages for clarity.
2. Regularly update blocked IPs and email domains.
3. Combine global restrictions with membership-specific limits for better precision.
4. Use [OOPSpam logs](https://help.oopspam.com/wordpress/form-entries/) to monitor failed or abusive attempts.
5. Test your signup form after every configuration change.

## **Final thoughts**

Start by enabling the Membership Registration Restrictions add-on to control how many users can sign up, and integrate OOPSpam Anti-Spam for rate-limiting and spam protection. This simple setup keeps your membership system efficient, secure, and fair for real users, so you can focus on growth, not cleanup.
