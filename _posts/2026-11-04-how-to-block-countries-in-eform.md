---
layout: post
title: How to Block Countries in eForm?
date: 2026-11-04T14:30:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_eform_blockcountries.png
description: eForm has no built-in country blocking. Learn how to block or
  allow countries with oopspam at the form level, or with Cloudflare
  site-wide.
tags:
  - eForm
  - Cloudflare
---
eForm has no built-in country blocking. To block countries, use the oopspam Anti-Spam plugin (that's us 👋) to filter eForm submissions by country, or use Cloudflare to block whole countries from your website. For most sites, form-level filtering is the better choice because your site stays open to everyone.

[eForm](https://eform.live/) is a WordPress form builder by WPQuark for quizzes, surveys, cost estimators, payments and registration. Spam from countries you don't serve can skew survey results, fill leaderboards and create fake accounts. Blocking those countries is a quick way to cut the noise.

## **Does eForm Have Built-In Country Blocking?**

No. eForm's [Submission Limitation](https://eform.live/fsqm/form-submission-related/limiting-eform-submissions/) settings cap entries per email, IP address, user, cookie or in total, but none of them look at where a visitor is located. eForm's GPS locator element can record a visitor's location, but it doesn't block submissions. To block countries, you need a third-party tool. We cover eForm's built-in protection in [6 Ways to Protect Your eForm from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-eform-from-spam).

## **Method 1: Block Countries in eForm with oopspam**

**[oopspam Anti-Spam](https://www.oopspam.com/)** supports eForm natively from plugin version 1.2.87. It checks each submission on the server before eForm saves it. Visitors from blocked countries can still read your site. They just can't submit your forms.

### **What oopspam Adds to eForm**

* **Country filtering:** block or allow submissions from selected countries
* **Trusted countries:** let your core markets skip spam checks
* **Language filtering:** reject messages written in languages you don't support
* **VPN, proxy and data center blocking:** stop visitors who hide their real location
* **Rate limiting:** cap how often one IP or email can submit
* **Logs:** see every blocked entry and the reason it was blocked

### **How to Set It Up**

**Step 1: Install the oopspam plugin**

In WordPress, go to **Plugins > Add New**, search for **oopspam Anti-Spam**, then install and activate it. You can also download it from the [WordPress plugin directory](https://wordpress.org/plugins/oopspam-anti-spam/). Make sure you run version 1.2.87 or later.

![Install oopspam Anti-Spam from the WordPress plugin directory](/blog/assets/posts/oopspam-anti-spam-overview.png "Install oopspam Anti-Spam from the WordPress plugin directory")

**Step 2: Get your API key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

**Step 3: Connect the API key**

Go to **Settings > oopspam Anti-Spam**. Paste the key into **My API Key** and select **oopspam Dashboard** as the key source. Save your changes.

![Paste your API key into the My API Key field in oopspam settings](/blog/assets/posts/oopspam-api-key.png "Paste your API key into the My API Key field in oopspam settings")

**Step 4: Turn on eForm protection**

Scroll to the **eForm Form Builder** section and check **Activate Spam Protection**. This covers every eForm form on your site.

![Turn on Activate Spam Protection in the eForm Form Builder section](/blog/assets/posts/eform-forms-section.png "Turn on Activate Spam Protection in the eForm Form Builder section")

**Step 5: Block or allow countries**

Go to **Country Filtering** under the **General** tab. You'll see three options:

* **Trusted Countries:** submissions from these countries skip all spam checks. Use this only for your core market or internal team.
* **Country Allowlist:** only accept submissions from these countries. Everyone else is blocked. Leave it empty if you don't need a strict region rule.
* **Country Blocklist:** reject submissions from these countries. Quick-add buttons let you add common groups, such as China and Russia, African countries or EU countries.

Trusted Countries always override the blocklist. Pick the allowlist if you only serve a few countries. Pick the blocklist if most of your spam comes from a few countries. Save your settings.

![Set up country filtering for eForm in oopspam](/blog/assets/posts/country-filtering-settings.png "Set up country filtering for eForm in oopspam")

**Step 6: Turn on Trust proxy headers (if you use Cloudflare or another proxy)**

If your site runs behind Cloudflare or another proxy, go to the **Misc** tab and turn on **Trust proxy headers**. Without it, oopspam sees the proxy's IP address instead of the visitor's, and country rules match the wrong location.

![Enable Trust proxy headers in the Misc tab of oopspam settings](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab of oopspam settings")

**Step 7: Test your form**

Connect to a VPN server in a country on your blocklist, then submit an eForm form. The visitor sees your spam message on the form. Set a custom message in the **eForm Spam Message** field to explain the block, for example "We can't accept submissions from your region. Please email us instead."

![Custom spam message shown on a blocked eForm submission](/blog/assets/posts/eform-spam-message.png "Custom spam message shown on a blocked eForm submission")

The entry appears in **Form Spam Entries** with the country as the reason. If you also block VPNs, the reason may say VPN instead, which still confirms the block works.

### **Review Blocked Submissions**

oopspam logs every entry it checks, so you can see why a submission was blocked and restore real entries. Go to **oopspam > Form Spam Entries** for blocked entries and **Form Ham Entries** for accepted ones. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Blocked eForm submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Blocked eForm submissions in Form Spam Entries")

### **Turn On Extra Filters**

Country blocking alone won't stop spammers who use a VPN. Combine it with:

* **VPN and data center IP blocking:** see [How to block VPN and data center IP submissions in eForm](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-eform).
* **Rate limiting:** see [How to limit form submissions in eForm](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-eform).
* **Language filtering:** see [How to block foreign language spam in WordPress forms](https://www.oopspam.com/blog/how-to-block-foreign-language-spam-in-wordpress-forms).

## **Method 2: Block Entire Countries with Cloudflare**

[Cloudflare](https://www.cloudflare.com/) blocks visitors from selected countries before they reach your website. Use it when you face a targeted attack, heavy scraping or a legal reason to restrict a region.

> **Important:** This method blocks your entire website for those countries, not only your eForm forms.

1. Log in to the [Cloudflare dashboard](https://dash.cloudflare.com/) and select your domain.
2. Go to **Security > Security Rules**.
3. Click **Create rule**, then select **Custom rules**. Name the rule (for example, "Block countries").
4. Under **When incoming requests match**, set **Field** to **Country**, **Operator** to **is in**, and select the countries.
5. Under **Then take action**, choose **Block**, or **Managed Challenge** if you want real people to get through after a quick check.
6. Click **Deploy**.

See Cloudflare's [custom rules documentation](https://developers.cloudflare.com/waf/custom-rules/) or our guide on [how to block countries in Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare).

![Create a Cloudflare security rule to block countries](/blog/assets/posts/cloudflare-security-rules.png "Create a Cloudflare security rule to block countries")

## **Which Method Should You Use?**

<style>
  table {
    border: 2px solid black;
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    border: 2px solid black;
    padding: 12px;
    text-align: left;
    vertical-align: top;
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
      <th>What it blocks</th>
      <th>Can blocked visitors read your site?</th>
      <th>Logs with block reason</th>
      <th>Best for</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>eForm built-in</td><td>Not available</td><td>Yes</td><td>No</td><td>Needs a third-party tool</td></tr>
    <tr><td>oopspam</td><td>Form submissions only</td><td>Yes</td><td>Yes</td><td>Spam control, region filtering</td></tr>
    <tr><td>Cloudflare</td><td>Your entire website</td><td>No</td><td>Cloudflare security events</td><td>Attacks, compliance, server load</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can I block countries in eForm without a plugin?**

Not inside eForm. Its limits work by email, IP, user, cookie or date, not location. Without a plugin, your only option is a network firewall such as Cloudflare, which blocks your whole site.

### **Will country blocking stop spammers who use a VPN?**

No. A VPN makes the visitor appear to be in the VPN server's country. Turn on oopspam's VPN and cloud provider blocking alongside country filtering.

### **Should I use the allowlist or the blocklist?**

Use the allowlist if you only serve a few countries, such as a local business. Use the blocklist if your audience is global and spam comes from a few countries.

### **How accurate is country detection?**

It relies on IP geolocation databases, which are accurate for most traffic but can misplace some IP addresses. Review **Form Spam Entries** regularly and add your core markets to **Trusted Countries**.

## **Final Thoughts**

eForm doesn't block countries on its own, but you can add it in a few minutes. oopspam filters submissions by country, language, IP reputation and content while your site stays open to every visitor. Cloudflare is the heavier option when you need to keep a region off your whole site.

For more, see our [complete guide to blocking countries from your website](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide).

## Related guides

- [6 Ways to Protect Your eForm from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-eform-from-spam)
- [How to Block VPN and Data Center IP Submissions in eForm](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-eform)
- [How to Limit Form Submissions in eForm](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-eform)
