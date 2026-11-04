---
layout: post
title: How to Block Countries in Bricksforge Forms?
date: 2026-11-03T12:00:00.000+04:00
last_modified_at: 2026-11-04T10:21:00.000Z
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_bricksforge_blockcountries.png
description: Bricksforge Pro Forms has no built-in country blocking. Learn how
  to block or allow countries with oopspam at the form level, or with
  Cloudflare site-wide.
tags:
  - Bricksforge Forms
  - Cloudflare
---
Bricksforge Pro Forms has no built-in country blocking. To block countries, use the [oopspam Anti-Spam](https://www.oopspam.com/wordpress) plugin (that's us 👋) to filter Pro Forms submissions by country, or use Cloudflare to block whole countries from your website. For most sites, form-level filtering is the better choice because your site stays open to everyone.

[Bricksforge](https://bricksforge.io/) is an add-on for the [Bricks](https://bricksbuilder.io/) site builder. Its Pro Forms element can create posts, register users, send webhooks and take payments. That makes every spam submission more expensive than a junk email. If most of your spam comes from countries you don't serve, blocking those countries is a quick way to cut the noise.

This guide covers two methods:

* **oopspam:** blocks Pro Forms submissions from selected countries. Your site stays visible worldwide.
* **Cloudflare:** blocks visitors from selected countries before they reach your website.

## **Does Bricksforge Have Built-In Country Blocking?**

No. Bricksforge Pro Forms can't filter submissions by country or IP address.

The [Pro Forms documentation](https://docs.bricksforge.io/en/elements/pro-forms/) lists these protection tools:

* reCAPTCHA v3, hCaptcha and Cloudflare Turnstile
* Honeypot fields
* Server-side validation rules (required fields, regex, file limits)
* **Prevent Duplicates** and **Maximum Submissions** in the Create Submission action
* Submit button conditions

None of these look at where a visitor is located. Submit button conditions can check form fields, post meta or submission limits, but not the visitor's country. To block countries, you need a third-party tool. We cover all the built-in options in [7 Ways to Protect Your Bricksforge Forms from Spam](https://www.oopspam.com/blog/7-ways-to-protect-your-bricksforge-forms-from-spam).

> **Using the native Bricks Form element instead of Bricksforge Pro Forms?** The steps are almost the same. See [How to block countries in Bricks Forms](https://www.oopspam.com/blog/how-to-block-countries-in-bricks-forms).

## **Method 1: Block Countries in Bricksforge Forms with oopspam**

**[oopspam Anti-Spam](https://www.oopspam.com/)** supports Bricksforge Pro Forms natively from plugin version 1.2.87. It checks each submission on the server before Bricksforge runs any action, so a blocked entry never creates a post, user or webhook call.

Country filtering works at the form level. Visitors from blocked countries can still read your site. They just can't submit your forms.

### **What oopspam adds to Bricksforge Forms**

* **Country filtering:** block or allow submissions from selected countries
* **Trusted countries:** let your core markets skip spam checks
* **Language filtering:** reject messages written in languages you don't support
* **VPN, proxy and Tor blocking:** stop visitors who hide their real location
* **Rate limiting:** cap how often one IP or email can submit
* **Machine learning spam detection:** catch bot and human spam in the message content
* **Logs:** see every blocked entry and the reason it was blocked

### **How to set it up**

Setup takes about five minutes. You don't need to edit your forms in the Bricks builder.

**Step 1: Install the oopspam plugin**

In WordPress, go to **Plugins > Add New**, search for **oopspam Anti-Spam**, then install and activate it. You can also download it from the [WordPress plugin directory](https://wordpress.org/plugins/oopspam-anti-spam/). Make sure you run version 1.2.87 or later.

![Install oopspam Anti-Spam from the WordPress plugin directory](/blog/assets/posts/oopspam-anti-spam-overview.png "Install oopspam Anti-Spam from the WordPress plugin directory")

**Step 2: Get your API key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

**Step 3: Connect the API key**

Go to **Settings > oopspam Anti-Spam**. Paste the key into **My API Key** and select **oopspam Dashboard** as the key source. Save your changes.

![Paste your API key into the My API Key field in oopspam settings](/blog/assets/posts/oopspam-api-key.png "Paste your API key into the My API Key field in oopspam settings")

**Step 4: Turn on Bricksforge Forms protection**

Scroll to the **Bricksforge Forms** section and check **Activate Spam Protection**. This covers every Pro Form on your site. If you also use the native Bricks Form element, turn on the **Bricks Forms** section too.

![Check Activate Spam Protection in the Bricksforge Forms section](/blog/assets/posts/bricksforge-forms-section.png "Check Activate Spam Protection in the Bricksforge Forms section")

**Step 5: Block or allow countries**

Go to **Country Filtering** under the **General** tab. You'll see three options:

* **Trusted Countries:** submissions from these countries skip all spam checks. Use this only for your core market or internal team.
* **Country Allowlist:** only accept submissions from these countries. Everyone else is blocked. Leave it empty if you don't need a strict region rule.
* **Country Blocklist:** reject submissions from these countries. Quick-add buttons let you add common groups, such as China and Russia, African countries or EU countries.

Trusted Countries always override the blocklist. Pick the allowlist if you only serve a few countries. Pick the blocklist if most of your spam comes from a few countries. Save your settings.

![Set up country filtering for Bricksforge Forms in oopspam](/blog/assets/posts/country-filtering-settings.png "Set up country filtering for Bricksforge Forms in oopspam")

**Step 6: Turn on Trust proxy headers (if you use Cloudflare or another proxy)**

If your site runs behind Cloudflare or another proxy, go to the **Misc** tab in oopspam settings and turn on **Trust proxy headers**. Without it, oopspam sees the proxy's IP address instead of the visitor's. Country rules would then match the proxy's location, not your visitor's.

![Enable Trust proxy headers in the Misc tab of oopspam settings](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab of oopspam settings")

**Step 7: Test your form**

Connect to a VPN server in a country on your blocklist, then submit a Pro Form. The entry should appear in **Form Spam Entries** with the country as the reason. If you also block VPNs, the reason may say VPN instead, which still confirms the block works.

When a submission is blocked, the visitor sees the spam message on the form. If you set a custom spam message in oopspam, they see that message instead of the default one.

![Spam message shown on a blocked Bricksforge Pro Form submission](/blog/assets/posts/bricksforge-forms-spam.png "Spam message shown on a blocked Bricksforge Pro Form submission")

### **Turn on extra filters**

Country blocking alone won't stop spammers who use a VPN. Combine it with:

* **VPN and data center IP blocking:** see [How to block VPN and data center IP submissions in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricksforge-forms).
* **Rate limiting:** see [How to limit form submissions in Bricksforge Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-bricksforge-forms).
* **Language filtering:** see [How to block foreign language spam in WordPress forms](https://www.oopspam.com/blog/how-to-block-foreign-language-spam-in-wordpress-forms).

### **Review blocked submissions**

oopspam logs every entry it checks, so you can see why a submission was blocked and restore real leads. Each log shows the submission content, IP address, email, spam score, reason and timestamp.

You can review entries in two places:

1. **WordPress dashboard:** go to **oopspam > Form Spam Entries** for blocked entries and **Form Ham Entries** for accepted ones. If a real lead was blocked, mark it as not spam. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).
2. **oopspam Dashboard:** see detailed reports, blocking reasons and spam trends over time.

![Blocked Bricksforge Forms submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Blocked Bricksforge Forms submissions in Form Spam Entries")

## **Method 2: Block Entire Countries with Cloudflare**

[Cloudflare](https://www.cloudflare.com/) blocks visitors from selected countries before they reach your website. Use it when you face a targeted attack, heavy scraping or a legal reason to restrict a region.

> **Important:** This method blocks your entire website for those countries, not only your Bricksforge forms. Real visitors from those countries won't be able to read your content either.

### **How to block countries in Cloudflare**

1. Log in to the [Cloudflare dashboard](https://dash.cloudflare.com/) and select the domain where Bricks runs.
2. Go to **Security > Security Rules**.
3. Click **Create rule**, then select **Custom rules**. Name the rule (for example, "Block countries").
4. Under **When incoming requests match**, set **Field** to **Country**, **Operator** to **is in**, and select the countries.
5. Under **Then take action**, choose **Block**. Choose **Managed Challenge** instead if you want real people to get through after a quick check.
6. Click **Deploy**.

Visitors from those countries now get a Cloudflare block page on every URL of your site. For more detail, see Cloudflare's [custom rules documentation](https://developers.cloudflare.com/waf/custom-rules/) or our step-by-step guide on [how to block countries in Cloudflare](https://www.oopspam.com/blog/blocking-countries-from-accessing-your-website-using-cloudflare).

![Create a Cloudflare security rule to block countries](/blog/assets/posts/cloudflare-security-rules.png "Create a Cloudflare security rule to block countries")

**Tip:** Cloudflare labels Tor traffic with the country code `T1` ([source](https://developers.cloudflare.com/fundamentals/reference/http-headers/)). You can add Tor to the same rule to block anonymous visitors.

### **When should you use Cloudflare?**

* You're under a DDoS attack or heavy bot traffic.
* You must restrict a region for legal or compliance reasons.
* You want to cut server load from regions you never serve.

For spam control alone, keep your site open and filter at the form level with oopspam. If you already use Cloudflare, remember to turn on **Trust proxy headers** in oopspam (Step 6 above).

## **Which Method Should You Use?**

Use oopspam if you want to stop spam and keep your site open. Add Cloudflare only when you need to block a region from your whole site.

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
    <tr>
      <td>Bricksforge built-in</td>
      <td>Not available</td>
      <td>Yes</td>
      <td>No</td>
      <td>Needs a third-party tool</td>
    </tr>
    <tr>
      <td>oopspam</td>
      <td>Form submissions only</td>
      <td>Yes</td>
      <td>Yes (WordPress and oopspam Dashboard)</td>
      <td>Spam control, region filtering, lead review</td>
    </tr>
    <tr>
      <td>Cloudflare</td>
      <td>Your entire website</td>
      <td>No</td>
      <td>Cloudflare security events only</td>
      <td>Attacks, compliance, server load</td>
    </tr>
  </tbody>
</table>

You can also use both: Cloudflare for regions you never want on your site, and oopspam for precise form-level rules on everything else.

## **FAQ**

### **Can I block countries in Bricksforge without a plugin?**

Not inside Bricksforge itself. Pro Forms has no country or IP rules. Without a plugin, your only option is a network firewall such as Cloudflare, which blocks your whole site.

### **Will country blocking stop spammers who use a VPN?**

No. A VPN makes the visitor appear to be in the VPN server's country. Turn on oopspam's VPN, proxy and Tor blocking alongside country filtering to close that gap.

### **Should I use the allowlist or the blocklist?**

Use the allowlist if you only serve a few countries, such as a local business. Use the blocklist if your audience is global and spam comes from a few countries.

### **How accurate is country detection?**

Country detection relies on IP geolocation databases, which are accurate for most traffic but can misplace some IP addresses. Check **Form Spam Entries** regularly and add your core markets to **Trusted Countries** to protect real leads.

### **Does oopspam add a CAPTCHA or slow down my form?**

No. oopspam checks submissions on the server after the visitor clicks submit. It adds no CAPTCHA and no visible challenge to your Pro Forms.

## **Final thoughts**

Bricksforge Pro Forms doesn't block countries on its own, but you can add it in a few minutes. oopspam filters submissions by country, language, IP reputation and content, while your site stays open to every visitor. Cloudflare is the heavier option when you need to keep a region off your whole site.

For most Bricksforge sites, start with oopspam's country filter, add VPN blocking and rate limiting, and check your logs after the first week.

Using another form builder? We also cover country blocking for [Bricks Forms](https://www.oopspam.com/blog/how-to-block-countries-in-bricks-forms), [Elementor Atomic Forms](https://www.oopspam.com/blog/how-to-block-countries-in-elementor-atomic-forms), [Fluent Forms](https://www.oopspam.com/blog/how-to-block-countries-in-fluent-forms) and more in our [complete guide to blocking countries from your website](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide).

## Related guides

- [7 Ways to Protect Your Bricksforge Forms from Spam](https://www.oopspam.com/blog/7-ways-to-protect-your-bricksforge-forms-from-spam)
- [How to Block Countries in Bricks Forms?](https://www.oopspam.com/blog/how-to-block-countries-in-bricks-forms)
- [How to Block VPN and Data Center IP Submissions in Bricksforge Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-bricksforge-forms)
- [How to Limit Form Submissions in Bricksforge Forms?](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-bricksforge-forms)
