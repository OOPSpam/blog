---
layout: post
title: How to Block Countries in Spectra Forms
date: 2026-11-06T15:15:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_spectra_blockcountries.png
description: Spectra has no built-in country blocking. Learn how to block or
  allow countries on Spectra Forms and Register with oopspam, or site-wide with
  Cloudflare.
tags:
  - Spectra
  - Cloudflare
---
Spectra has no built-in country blocking. To block countries, use the oopspam Anti-Spam plugin (that's us 👋) to filter Spectra Forms and Spectra Pro Register submissions by country, or use Cloudflare to block whole countries from your website. For most sites, form-level filtering is the better choice because your site stays open to everyone.

[Spectra](https://wpspectra.com/) adds a **Form** block for contact and lead forms, and Spectra Pro adds a **Register** block for user sign-ups. Spam from countries you don't serve fills your inbox, and fake sign-ups from those countries fill your user list. Blocking those countries cuts the noise on both.

## **Does Spectra Have Built-In Country Blocking?**

No. The [Form block](https://wpspectra.com/docs/forms-block/) offers Google reCAPTCHA, required fields and email actions, and the [Register block](https://wpspectra.com/docs/registration-form-block/) adds user roles, after-registration actions and field validation. None of these look at where a visitor is. To block countries, you need a third-party tool. We cover Spectra's built-in protection in [5 Ways to Protect Your Spectra Forms from Spam](https://www.oopspam.com/blog/5-ways-to-protect-your-spectra-forms-from-spam).

## **Method 1: Block Countries in Spectra Forms with oopspam**

**[oopspam Anti-Spam](https://www.oopspam.com/)** supports Spectra Forms and Spectra Pro Register natively, in one integration. It checks each submission on the server before Spectra processes it. Visitors from blocked countries can still read your site. They just can't submit your forms or create an account.

### **What oopspam Adds to Spectra**

* **Country filtering:** block or allow submissions from selected countries
* **Trusted countries:** let your core markets skip spam checks
* **Language filtering:** reject messages written in languages you don't support
* **VPN, proxy and data center blocking:** stop visitors who hide their real location
* **Rate limiting:** cap how often one IP or email can submit
* **Logs:** see every blocked submission and the reason it was blocked

### **How to Set It Up**

**Step 1: Install the oopspam plugin**

In WordPress, go to **Plugins > Add New**, search for **oopspam Anti-Spam**, then install and activate it. You can also download it from the [WordPress plugin directory](https://wordpress.org/plugins/oopspam-anti-spam/).

![Install oopspam Anti-Spam from the WordPress plugin directory](/blog/assets/posts/oopspam-anti-spam-overview.png "Install oopspam Anti-Spam from the WordPress plugin directory")

**Step 2: Get your API key**

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key from the dashboard.

![Copy your API key from the oopspam dashboard](/blog/assets/posts/oopspam-dashboard-api.png "Copy your API key from the oopspam dashboard")

**Step 3: Connect the API key**

Go to **Settings > oopspam Anti-Spam**. Paste the key into **My API Key** and select **oopspam Dashboard** as the key source. Save your changes.

![Paste your API key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your API key into the My API Key field")

**Step 4: Turn on Spectra protection**

Scroll to the **Spectra Forms and Spectra Pro Register** section and turn on **Activate Spam Protection**. This covers every Form block and Register block on your site.

![Turn on Activate Spam Protection in the Spectra Forms and Spectra Pro Register section](/blog/assets/posts/spectra-forms-section.png "Turn on Activate Spam Protection in the Spectra Forms and Spectra Pro Register section")

**Step 5: Block or allow countries**

Go to **Country Filtering** under the **General** tab. You'll see three options:

* **Trusted Countries:** submissions from these countries skip all spam checks. Use this only for your core market or internal team.
* **Country Allowlist:** only accept submissions from these countries. Everyone else is blocked.
* **Country Blocklist:** reject submissions from these countries. Quick-add buttons let you add common groups, such as China and Russia, African countries or EU countries.

Trusted Countries always override the blocklist. Pick the allowlist if you only serve a few countries. Pick the blocklist if most of your spam comes from a few countries. Save your settings.

![Set up country filtering for Spectra in oopspam](/blog/assets/posts/country-filtering-settings.png "Set up country filtering for Spectra in oopspam")

**Step 6: Turn on Trust proxy headers (if you use Cloudflare or another proxy)**

If your site runs behind Cloudflare or another proxy, go to the **Misc** tab and turn on **Trust proxy headers**. Without it, oopspam sees the proxy's IP address instead of the visitor's, and country rules match the wrong location.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

**Step 7: Set the failure message and test**

The Spectra Form block shows its own **failure message** when oopspam blocks a submission, not oopspam's **Spectra Spam Message**. Select the Form block, open its **General** settings and edit the **Error Message Text** so it helps real visitors too, for example: "We couldn't send your message. If this keeps happening, email us at name@example.com."

The Register block shows oopspam's **Spectra Spam Message** instead, so set that too, for example: "We can't accept sign-ups from your region. Please email us instead."

Then connect to a VPN server in a country on your blocklist and submit the form. You'll see the failure message instead of a success message.

![The Spectra failure message shown on a blocked submission](/blog/assets/posts/spectra-forms-failure-message.png "The Spectra failure message shown on a blocked submission")

The entry appears in **Form Spam Entries** with the country as the reason. If you also block VPNs, the reason may say VPN instead, which still confirms the block works.

### **Review Blocked Submissions**

oopspam logs every submission it checks, so you can see why one was blocked and restore real entries. Go to **oopspam > Form Spam Entries** for blocked entries and **Form Ham Entries** for accepted ones. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Blocked Spectra submissions in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Blocked Spectra submissions in Form Spam Entries")

### **Turn On Extra Filters**

Country blocking alone won't stop spammers who use a VPN. Combine it with:

* **VPN and data center IP blocking:** see [How to block VPN and data center IP submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-spectra-forms).
* **Rate limiting:** see [How to limit form submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-spectra-forms).
* **Language filtering:** see [How to block foreign language spam in WordPress forms](https://www.oopspam.com/blog/how-to-block-foreign-language-spam-in-wordpress-forms).

## **Method 2: Block Entire Countries with Cloudflare**

[Cloudflare](https://www.cloudflare.com/) blocks visitors from selected countries before they reach your website. Use it when you face a targeted attack, heavy scraping or a legal reason to restrict a region.

> **Important:** This method blocks your entire website for those countries, not only your Spectra forms.

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
    <tr><td>Spectra built-in</td><td>Not available</td><td>Yes</td><td>No</td><td>Needs a third-party tool</td></tr>
    <tr><td>oopspam</td><td>Form submissions and sign-ups only</td><td>Yes</td><td>Yes</td><td>Spam control, region filtering</td></tr>
    <tr><td>Cloudflare</td><td>Your entire website</td><td>No</td><td>Cloudflare security events</td><td>Attacks, compliance, server load</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can I block countries in Spectra without a plugin?**

Not inside Spectra. Its form and register settings don't use location. Without a plugin, your only option is a network firewall such as Cloudflare, which blocks your whole site.

### **Does country blocking work on the Register block too?**

Yes. oopspam's country rules apply to both the Form block and the Spectra Pro Register block once **Activate Spam Protection** is on.

### **Will country blocking stop spammers who use a VPN?**

No. A VPN makes the visitor appear to be in the VPN server's country. Turn on oopspam's VPN and cloud provider blocking alongside country filtering.

### **Should I use the allowlist or the blocklist?**

Use the allowlist if you only serve a few countries, such as a local business. Use the blocklist if your audience is global and spam comes from a few countries.

## **Final Thoughts**

Spectra doesn't block countries on its own, but you can add it in a few minutes. oopspam filters form submissions and sign-ups by country, language, IP reputation and content while your site stays open to every visitor. Cloudflare is the heavier option when you need to keep a region off your whole site.

For more, see our [complete guide to blocking countries from your website](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide).

## Related guides

- [5 Ways to Protect Your Spectra Forms from Spam](https://www.oopspam.com/blog/5-ways-to-protect-your-spectra-forms-from-spam)
- [How to Block VPN and Data Center IP Submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-spectra-forms)
- [How to Limit Form Submissions in Spectra Forms](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-spectra-forms)
