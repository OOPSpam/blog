---
layout: post
title: How to Limit Form Submissions in WP Booking System
date: 2026-11-05T15:30:00.000+04:00
author: daniella
hub: vpn-country-rate-limits
image: /blog/assets/posts/meta_wpbs_limit_submissions.png
description: WP Booking System can't limit bookings per email, IP or hour. Use
  its date and inventory controls, then add hourly rate limiting with oopspam.
tags:
  - WP Booking System
---
WP Booking System has no setting to limit bookings per email, IP address or hour. Its built-in controls limit what can be booked instead: **Automatically Block Dates** stops two bookings on the same dates, the Inventory add-on caps bookings per date, and the Booking Restrictions add-on sets stay length and booking windows. To limit how often one visitor can submit, add rate limiting with the oopspam Anti-Spam plugin (that's us 👋).

[WP Booking System](https://www.wpbookingsystem.com/) is a booking calendar plugin for rentals, rooms, tours and appointments. Submission limits stop one visitor or bot from sending dozens of booking requests, filling your calendar with fake holds and your inbox with fake confirmations. This guide covers each option, step by step.

## **Method 1: Use WP Booking System's Built-In Booking Controls**

WP Booking System limits bookings by date and capacity, not by person. Two of these controls, Inventory and Booking Restrictions, are add-ons: their settings only appear after you install and activate them. These are the controls that cap how much can be booked:

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
      <th>Setting</th>
      <th>Where</th>
      <th>What it limits</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Automatically Block Dates</td><td>Calendar block &gt; Form Options (or the calendar shortcode)</td><td>Marks booked dates as unavailable, so the same dates can't be booked twice</td></tr>
    <tr><td>Minimum Days / Maximum Days</td><td>Calendar block &gt; Form Options</td><td>Shortest and longest stay, without any add-on. Ignored once the Booking Restrictions add-on is active</td></tr>
    <tr><td>Inventory field (Inventory add-on)</td><td>Form Builder &gt; Pricing Form Elements &gt; Inventory, plus the Inventory column in the calendar editor</td><td>Bookings per date. When a date reaches 0, it shows as booked</td></tr>
    <tr><td>Maximum Limit (Inventory add-on)</td><td>Inventory field &gt; General Options</td><td>How many slots one booking can take at once</td></tr>
    <tr><td>Booking Restrictions (add-on)</td><td>Edit Form &gt; Booking Restrictions tab &gt; Enable Booking Restrictions</td><td>Stay length, fixed number of days, start and end days, advance reservation and turnaround time</td></tr>
    <tr><td>Default Booking Status: Pending</td><td>Form Options &gt; General Options</td><td>Nothing is confirmed until you accept it</td></tr>
  </tbody>
</table>

Sources: [Inventory docs](https://www.wpbookingsystem.com/documentation/inventory/), [Booking Restrictions add-on](https://www.wpbookingsystem.com/add-ons/booking-restrictions-add-on/), [General options](https://www.wpbookingsystem.com/documentation/form-options/general-options/).

**Automatically Block Dates** is set where you embed the calendar. In the block editor, select the calendar block and open **Form Options** in the sidebar.

![Turn on Automatically Block Dates in the calendar block's Form Options](/blog/assets/posts/wpbs-automatically-block-dates.png "Turn on Automatically Block Dates in the calendar block's Form Options")

**Inventory** works per date. Set the starting number of slots with **Default inventory** in the calendar editor, then add the **Inventory** field to your form. Each booking takes one slot, or as many as the guest picks, up to the field's **Maximum Limit**.

![Set a Maximum Limit on the Inventory field in the WP Booking System form builder](/blog/assets/posts/wpbs-inventory-field.webp "Set a Maximum Limit on the Inventory field in the WP Booking System form builder")

*Image: [WP Booking System](https://www.wpbookingsystem.com/documentation/inventory/)*

**Booking Restrictions** live in their own tab on the form. Turn on **Enable Booking Restrictions**, then set the **General Rule**. Click **Add Custom Period Restriction Rule** for seasons with different rules, such as a 7-night minimum in summer. Custom Period rules override the General Rule.

![Booking Restrictions tab with stay length, advance reservation and turnaround time](/blog/assets/posts/wpbs-booking-restrictions.webp "Booking Restrictions tab with stay length, advance reservation and turnaround time")

*Image: [WP Booking System](https://www.wpbookingsystem.com/documentation/booking-restrictions/)*

![Default Booking Status set to Pending in the form's General Options](/blog/assets/posts/wpbs-default-booking-status.png "Default Booking Status set to Pending in the form's General Options")

Which to use:

* **One booking per date or unit:** turn on Automatically Block Dates.
* **Several slots per date, such as tours or classes:** use the Inventory add-on with a **Maximum Limit** per booking.
* **Stop long fake holds far in the future:** set a maximum **Stay length** and a maximum **Advance reservation** in Booking Restrictions.

> **Limits of the built-in options:** none of these count bookings per email, IP address or hour. A bot can send booking after booking for different dates, and each one blocks real availability until you reject it.

## **Method 2: Add a Custom Validation Rule (for Developers)**

WP Booking System runs the `wpbs_form_validation` and `wpbs_field_validation` filters after every submission ([custom validation rules](https://www.wpbookingsystem.com/documentation/custom-validation-rules/)). A developer can use them to reject a booking, for example when the same email already has a pending booking. Add the code to your theme's `functions.php` or a small custom plugin.

This gives you exact business rules, but you write and maintain the code, and it still can't stop a bot that uses a new email each time.

## **Method 3: Rate Limit Bookings per IP and Email with oopspam**

The [oopspam Anti-Spam plugin](https://www.oopspam.com/) supports WP Booking System natively. It checks each booking on the server and blocks visitors who go over your hourly limit. It needs no code and works for every visitor.

### **How to Set It Up**

In WordPress, go to **Plugins > Add New**, search for **[oopspam Anti-Spam](https://wordpress.org/plugins/oopspam-anti-spam/)**, then install and activate it.

![Install the oopspam Anti-Spam plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "Install the oopspam Anti-Spam plugin")

[Create a free oopspam account](https://app.oopspam.com/Identity/Account/Register) and copy your API key. Go to **Settings > oopspam Anti-Spam**. In the **General** tab, select **oopspam Dashboard** as the source and paste your key into **My API Key**.

![Paste your key into the My API Key field](/blog/assets/posts/oopspam-api-key.png "Paste your key into the My API Key field")

Scroll to the **WP Booking System** section and check **Activate Spam Protection**.

![Turn on Activate Spam Protection in the WP Booking System section](/blog/assets/posts/wpbs-forms-section.png "Turn on Activate Spam Protection in the WP Booking System section")

Open the **Rate Limiting** tab and turn on **Enable Rate Limiting**. Then set your limits:

* **Max submissions per IP per hour:** how many times one IP address can submit in an hour.
* **Max submissions per email per hour:** how many times one email address can submit in an hour.
* **Block duration (in hours):** how long an IP or email stays blocked after hitting the limit.
* **Data clean-up frequency (in hours):** how often oopspam clears the table it uses to track submissions.

Click **Save Changes**.

![Turn on rate limiting and set limits per IP and email](/blog/assets/posts/enabled-rate-limiting-settings.png "Turn on rate limiting and set limits per IP and email")

A good starting point is 3 submissions per hour per IP and per email, a 24-hour block and a 48-hour clean-up. Raise the numbers if guests often book several rooms or dates one after another.

If your site runs behind Cloudflare or another proxy, open the **Misc** tab and turn on **Trust proxy headers**. Without it, all visitors share the proxy's IP and could hit the limit together.

![Enable Trust proxy headers in the Misc tab](/blog/assets/posts/trust-proxy-headers.png "Enable Trust proxy headers in the Misc tab")

### **Test It**

Submit a few more bookings than your limit allows. The blocked attempt shows your spam message on the form. Set a custom message in the **WP Booking System Spam Message** field to tell real guests how to reach you.

![Custom spam message shown on a blocked WP Booking System booking](/blog/assets/posts/wpbs-spam-message.png "Custom spam message shown on a blocked WP Booking System booking")

Check **Form Spam Entries** in WordPress to see blocked attempts and the reason ([form entries guide](https://help.oopspam.com/wordpress/form-entries/)).

### **Add More Filters**

[Rate limiting](https://www.oopspam.com/blog/protecting-forms-with-rate-limiting-in-wordpress-using-oopspam) works best with oopspam's other filters:

* **VPN and data center blocking:** see [How to block VPN and data center IP submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system).
* **Country filtering:** see [How to block countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system).
* **Disposable email blocking:** see [How to block disposable email addresses in WordPress forms](https://www.oopspam.com/blog/how-to-block-disposable-email-addresses-in-wordpress-forms). Throwaway addresses are a common way around per-email limits.

## **Which Method Should You Use?**

<table>
  <thead>
    <tr>
      <th>Goal</th>
      <th>Best method</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>No double bookings</td><td>Automatically Block Dates</td></tr>
    <tr><td>Several bookings per date (tours, classes)</td><td>Inventory add-on</td></tr>
    <tr><td>Cap slots in one booking</td><td>Inventory add-on Maximum Limit</td></tr>
    <tr><td>Stop long or far-future fake holds</td><td>Booking Restrictions: Stay length and Advance reservation</td></tr>
    <tr><td>Review everything before it's confirmed</td><td>Default Booking Status: Pending</td></tr>
    <tr><td>Stop floods from one visitor or bot</td><td>oopspam rate limiting</td></tr>
  </tbody>
</table>

## **FAQ**

### **Can WP Booking System limit bookings per email or IP?**

Not with a setting. A developer can write a custom validation rule, or you can use oopspam's per-IP and per-email hourly limits with no code.

### **Can I limit bookings per hour in WP Booking System?**

Not on its own. Use oopspam rate limiting to cap how many times one IP address or email can submit per hour.

### **Does Automatically Block Dates stop spam?**

It stops two bookings on the same dates. It doesn't stop fake bookings, and a fake booking can block real dates until you reject it. Keep new bookings Pending and add a spam filter.

### **Will rate limiting block real guests?**

Rarely, if your limits are sensible. Three submissions per hour is enough for most booking forms. Raise it if guests often book several units in a row, and review **Form Spam Entries** for false positives.

## **Final Thoughts**

Use WP Booking System's date, inventory and restriction settings for the business rules: no double bookings, a fixed number of slots, a sensible stay length. Use oopspam rate limiting to stop floods from one visitor or bot. Together they keep your calendar open to real guests and closed to abuse.

## Related guides

- [6 Ways to Protect Your WP Booking System from Spam](https://www.oopspam.com/blog/6-ways-to-protect-your-wp-booking-system-from-spam)
- [How to Block Countries in WP Booking System](https://www.oopspam.com/blog/how-to-block-countries-in-wp-booking-system)
- [How to Block VPN and Data Center IP Submissions in WP Booking System](https://www.oopspam.com/blog/how-to-block-vpn-and-data-center-ip-submissions-in-wp-booking-system)
