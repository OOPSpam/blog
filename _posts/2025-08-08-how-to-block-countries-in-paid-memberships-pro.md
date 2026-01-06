---
layout: post
title: How to block countries in Paid Memberships Pro?
date: 2025-08-08T09:39:00.000+08:00
author: chazie
image: /blog/assets/posts/header_pmp.png
description: Paid Memberships Pro lacks native country blocking, use OOPSpam for
  advanced filtering or custom code and Cloudflare for broader access control.
tags:
  - Paid Memberships Pro
  - Cloudflare
---
![Paid Memberships Pro](/blog/assets/posts/paid-memberships-pro-home.png "Paid Memberships Pro")

Do you want to prevent users from certain countries from signing up for your membership site? If you're using [Paid Memberships Pro (PMPro)](https://www.paidmembershipspro.com/), there’s no built-in setting to block countries, but you can still do it effectively.

In this guide, we’ll show you two methods:

* A custom code recipe that restricts registration by country for specific membership levels
* A plugin-based approach using **[OOPSpam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)** (that’s us 👋), ideal for blocking form submissions and spammy registrations

### **No Built-In Country Blocking in PMPro**

Paid Memberships Pro doesn’t offer a built-in geolocation filter to restrict countries during the registration process. However, since the plugin is developer-friendly, it allows you to add a **custom PHP filter** that blocks registrations based on the user’s billing country.

Let’s explore your options.

## **1. Restrict Registrations by Country in Paid Memberships Pro (Code Method)**

If you need to restrict membership signups from specific countries, PMPro gives you the flexibility to do this via a code snippet.

This is especially useful if:

* Your service is only available in specific regions
* You need to comply with export restrictions or local regulations
* You want to reduce fraudulent signups

### **How It Works**

You’ll use the `pmpro_registration_checks` filter to check the user’s billing country during registration and prevent signups from certain locations.

### **Step-by-Step: How to Block Countries in PMPro**

**Step 1: Access Your Theme’s Functions.php**

Go to your WordPress admin panel:

`Appearance > Theme File Editor > functions.php`

(Or use a custom functionality plugin to avoid theme update overrides.)

**Step 2: Add the Country Restriction Code**

Here’s a sample code recipe developed by the PMPro team:

```php
function my_pmpro_registration_checks($user_id, $pmpro_level_id, $user_data)
{
// Define the restricted countries and levels
    $restricted_countries = [
        'level_1' => ['US', 'CA'], // Level 1 restricted to US and Canada
        'level_2' => ['AU'],       // Level 2 restricted to Australia
    ];
// Get the user's selected membership level
    $membership_level_id = isset($_POST['level']) ? $_POST['level'] : false;
// Check if the selected level is in the restricted array
    if ($membership_level_id && isset($restricted_countries['level_' . $membership_level_id])) {
// Get the billing address from the POST data
        $billing_country = isset($_POST['billing_country']) ? $_POST['billing_country'] : false;
// Check if the billing country is in the restricted list
        if ($billing_country && in_array($billing_country, $restricted_countries['level_' . $membership_level_id])) {
// Return an error message
            return 'Sorry, registration is not allowed from your country.';
        }
    }
    return false; // Allow registration if no restrictions apply
}
add_filter('pmpro_registration_checks', 'my_pmpro_registration_checks', 10, 3);
```

**Tip**: Country codes should match ISO Alpha-2 codes (e.g., 'US' for United States, 'CA' for Canada). You can find these in the pmpro_countries array in /includes/countries.php.

**Step 3: Test the Restrictions**

Once added, try registering with a billing address from a restricted country. The error message “Sorry, registration is not allowed from your country” should appear.

## **2. Filter Registrations Using OOPSpam Anti-Spam**

If your registration forms are being spammed by bots or fake accounts, especially from specific regions, OOPSpam Anti-Spam can help.

![OOPSpam Anti-Spam](/blog/assets/posts/oopspam-anti-spam-overview.png "OOPSpam Anti-Spam")

This plugin integrates with **Paid Memberships Pro** and other form systems to [provide advanced filtering](https://www.oopspam.com/blog/4-ways-to-stop-spam-on-your-paid-memberships-pro-membership-site) based on:

* Country
* Language
* IP behavior (VPN, proxy, TOR detection)
* Spam scoring (Machine learning-powered)
* Rate limiting per form
* Submission logging for transparency

### **How to Set Up OOPSpam with Paid Memberships Pro**

**Step 1: Install OOPSpam Anti-Spam**

From your dashboard, go to:

**Plugins > Add New > Search: OOPSpam Anti-Spam**

Install and activate the plugin.

**Step 2: Get Your API Key**

Go to[ OOPSpam.com](https://www.oopspam.com), sign up, and generate your API key.

![Get Your API Key](/blog/assets/posts/oopspam-dashboard-api.png "Get Your API Key")

Return to WordPress, and go to:

`OOPSpam Anti-Spam > Settings`

Paste your API key in the provided field.

![Paste your API key in the provided field.](/blog/assets/posts/oopspam-api-key.png "Paste your API key in the provided field.")

**Step 3: Enable PMPro Filtering**

In the plugin settings, scroll to the **Paid Memberships Pro** section and activate spam protection for registration forms.

![Paid Memberships Pro section](/blog/assets/posts/paid-memberships-pro-spam-protection-settings.png "Paid Memberships Pro section")

**Step 4: Set Country Filtering Rules**

Go to the **Country Filtering** section. You’ll see:

* Allow submissions only from selected countries
* Block submissions from selected countries

![Country Filtering section](/blog/assets/posts/country-filtering-settings.png "Country Filtering section")

Pick your preferred method and select the countries you want to restrict.

### **Bonus: Review Blocked Entries**

OOPSpam gives you submission logs that include:

* IP address
* Country
* Spam score
* Detection reason
* Form field content
* Timestamp

You can view this from:

* Your WordPress dashboard (Form Spam Entries / Form Ham Entries)

![WordPress dashboard (Form Spam Entries / Form Ham Entries)](/blog/assets/posts/form-spam-entries-oopspam.png "WordPress dashboard (Form Spam Entries / Form Ham Entries)")

* OOPSpam Dashboard (for more details)

![OOPSpam Dashboard logs](/blog/assets/posts/screenshot-1.png "OOPSpam Dashboard logs")

This is ideal for monitoring attacks and fine-tuning your filters without losing valuable data.

## **3. Block Countries Site-Wide Using Cloudflare (Optional)**

If you're under active attack or have compliance requirements, you can block countries at the site level using Cloudflare.

> Warning: This blocks visitors from accessing any part of your site, not just the registration form.

### **Steps to Set Up Country Blocking in Cloudflare**

![Set Up Country Blocking in Cloudflare](/blog/assets/posts/cloudflare-security-rules.png "Set Up Country Blocking in Cloudflare")

1. Log in to[ Cloudflare](https://www.cloudflare.com)
2. Select your website
3. Navigate to Security > Security rules
4. Click **Create rule**
5. Set the rule to:

   * **Field**: **`Country`**
   * **Operator**: **`is in`**
   * **Value**: Select countries to block
   * **Action**: **`Block`**
6. Save and deploy the rule

## **Comparison: Best Way to Block Countries in Paid Memberships Pro**

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    border: 2px solid black;
    padding: 10px;
    text-align: left;
  }
  th {
    background-color: #f9f9f9;
    font-weight: bold;
  }
  td:first-child {
    font-weight: bold;
  }
</style>

<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>What It Blocks</th>
      <th>Best For</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Custom PHP Code</td>
      <td>Membership registration only</td>
      <td>Precise control over who can register, level-by-level</td>
    </tr>
    <tr>
      <td>OOPSpam Anti-Spam Plugin</td>
      <td>Form submissions only</td>
      <td>Spam filtering and country-based form protection</td>
    </tr>
    <tr>
      <td>Cloudflare Firewall</td>
      <td>Entire website access</td>
      <td>Security threats, scraping bots, or legal/geographical blocks</td>
    </tr>
  </tbody>
</table>

## **Final thoughts**

While Paid Memberships Pro doesn’t offer built-in country restrictions, you still have options:

* Use a custom code filter to prevent users from restricted countries from joining specific membership levels.
* Add OOPSpam for an easier, plugin-based approach to stop spam and filter form submissions by country.
* Pair both with Cloudflare firewall rules if you need to block entire countries from accessing your website.

Need help implementing these? Visit the OOPSpam [documentation](https://www.oopspam.com/help) or reach out to support.
