---
layout: post
title: How to Block Countries in WP Booking System
date: 2026-11-05T12:15:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_wpbs_blockcountries.png
description: WP Booking System has no built-in country blocking. Learn how to
  block or allow countries with oopspam at the form level, or with Cloudflare
  site-wide.
tags:
  - WP Booking System
  - Cloudflare
---
WP Booking System has no built-in country blocking. To block countries, use the oopspam Anti-Spam plugin (that's us 👋) to filter bookings by country, or use Cloudflare to block whole countries from your website. For most booking sites, form-level filtering is the better choice because guests from every country can still see your calendar and prices.

[WP Booking System](https://www.wpbookingsystem.com/) is a booking calendar plugin for holiday rentals, B&Bs, tours and appointments. Fake bookings from countries you never get guests from fill your bookings list, send confirmation emails to fake addresses and can mark real dates as unavailable. Blocking those countries cuts the noise.

## **Does WP Booking System Have Built-In Country Blocking?**

No. The [Booking Restrictions add-on](https://www.wpbookingsystem.com/add-ons/booking-restrictions-add-on/) controls stay length, start days and how far ahead guests can book, but none of its rules look at where a guest is. The **ipinfo.io Token** setting under **Settings > Form** uses the visitor's location only to pre-fill the phone country code ([docs](https://www.wpbookingsystem.com/documentation/form/)). It doesn't block anyone. To block countries, you need a third-party tool. We cover the built-in protection in [6 Ways to Protect Your WP Booking System from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-wp-booking-system-from-spam).

## **Method 1: Block Countries in WP Booking System with oopspam**

**[oopspam Anti-Spam](https://www.oopspam.com/)** supports WP Booking System natively. It checks each booking on the server before WP Booking System saves it. Guests from blocked countries can still see your calendar and prices. They just can't submit a booking.

### **What oopspam Adds to WP Booking System**

* **Country filtering:** block or allow bookings from selected countries
* **Trusted countries:** let your core markets skip spam checks
* **Language filtering:** reject messages written in languages you don't support
* **VPN, proxy and data center blocking:** stop visitors who hide their real location
* **Rate limiting:** cap how often one IP or email can book
* **Logs:** see every blocked booking and the reason it was blocked

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

**Step 4: Turn on WP Booking System protection**

Scroll to the **WP Booking System** section and check **Activate Spam Protection**. This covers every WP Booking System form on your site.

![Turn on Activate Spam Protection in the WP Booking System section](/blog/assets/posts/wpbs-forms-section.png "Turn on Activate Spam Protection in the WP Booking System section")

**Step 5: Block or allow countries**

Go to **Country Filtering** under the **General** tab. You'll see three options:

* **Trusted Countries:** bookings from these countries skip all spam checks. Use this only for your core market or internal team.
* **Country Allowlist:** only accept bookings from these countries. Everyone else is blocked.
* **Country Blocklist:** reject bookings from these countries. Quick-add buttons let you add common groups, such as China and Russia, African countries or EU countries.

Trusted Countries always override the blocklist. Holiday rentals and tours usually get guests from many countries, so the blocklist is the safer choice. A local service, such as a cleaning company or a clinic, can use the allowlist. Save your settings.

![Set up country filtering for WP Booking System in oopspam](/blog/assets/posts/country-filtering-settings.png "Set up country filtering for WP Booking System in oopspam")

**Step 6: Turn on Trust proxy headers (if you use Cloudflare or another proxy)**

If your site runs behind Cloudflare or another proxy, go to the **Misc** tab and turn on **Trust proxy headers**. Without it, oopspam sees the proxy's IP address instead of the guest's, and country rules match the wrong location.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

**Step 7: Test your form**

Connect to a VPN server in a country on your blocklist, then submit a booking. The guest sees your spam message on the form. Set a custom message in the **WP Booking System Spam Message** field to explain the block, for example "We can't accept online bookings from your region. Please email us instead."

![Custom spam message shown on a blocked WP Booking System booking](/blog/assets/posts/wpbs-spam-message.png "Custom spam message shown on a blocked WP Booking System booking")

The booking appears in **Form Spam Entries** with the country as the reason. If you also block VPNs, the reason may say VPN instead, which still confirms the block works.

### **Review Blocked Bookings**

oopspam logs every booking it checks, so you can see why one was blocked and restore real ones. Go to **oopspam > Form Spam Entries** for blocked bookings and **Form Ham Entries** for accepted ones. Learn more in the [form entries guide](https://help.oopspam.com/wordpress/form-entries/).

![Blocked bookings in Form Spam Entries](/blog/assets/posts/oopspam-logs-bulk-actions.png "Blocked bookings in Form Spam Entries")

### **Turn On Extra Filters**

Country blocking alone won't stop spammers who use a VPN. Combine it with:

* **VPN and data center IP blocking:** see [How to block VPN and data center IP submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system).
* **Rate limiting:** see [How to limit form submissions in WP Booking System](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wp-booking-system).
* **Language filtering:** see [How to block foreign language spam in WordPress forms](https://www.oopspam.com/blog/how-to-block-foreign-language-spam-in-wordpress-forms).

## **Method 2: Block Entire Countries with Cloudflare**

[Cloudflare](https://www.cloudflare.com/) blocks visitors from selected countries before they reach your website. Use it when you face a targeted attack, heavy scraping or a legal reason to restrict a region.

> **Important:** This method blocks your entire website for those countries, not only your booking form. Guests there can't see your calendar, prices or listings either.

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
      <th>Can blocked visitors see your calendar?</th>
      <th>Logs with block reason</th>
      <th>Best for</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>WP Booking System built-in</td><td>Not available</td><td>Yes</td><td>No</td><td>Needs a third-party tool</td></tr>
    <tr><td>oopspam</td><td>Bookings only</td><td>Yes</td><td>Yes</td><td>Spam control, region filtering</td></tr>
    <tr><td>Cloudflare</td><td>Your entire website</td><td>No</td><td>Cloudflare security events</td><td>Attacks, compliance, server load</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can I block countries in WP Booking System without a plugin?**

Not inside WP Booking System. Its restrictions work by dates and stay length, not location. Without a plugin, your only option is a network firewall such as Cloudflare, which blocks your whole site.

### **Will country blocking stop spammers who use a VPN?**

No. A VPN makes the visitor appear to be in the VPN server's country. Turn on oopspam's VPN and cloud provider blocking alongside country filtering.

### **Should I use the allowlist or the blocklist?**

Use the blocklist if you take bookings from travelers in many countries, which is most rentals and tours. Use the allowlist if you only serve local customers, such as a salon or a clinic.

### **Will a real guest abroad get blocked?**

Only if their country is on your blocklist or missing from your allowlist. Country detection uses the guest's IP address, so a guest who books from a hotel abroad shows that hotel's country. Review **Form Spam Entries** regularly and add your core markets to **Trusted Countries**.

## **Final Thoughts**

WP Booking System doesn't block countries on its own, but you can add it in a few minutes. oopspam filters bookings by country, language, IP reputation and content while your calendar stays open to every visitor. Cloudflare is the heavier option when you need to keep a region off your whole site.

For more, see our [complete guide to blocking countries from your website](https://www.oopspam.com/blog/how-to-block-countries-from-your-website-the-complete-guide).

## Related guides

- [6 Ways to Protect Your WP Booking System from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-wp-booking-system-from-spam)
- [How to Block VPN and Data Center IP Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system)
- [How to Limit Form Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-limit-form-submissions-in-wp-booking-system)
