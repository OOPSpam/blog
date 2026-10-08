---
layout: post
title: Common Cloudflare Turnstile Errors in WordPress Forms (And How to Fix Them)
date: 2025-05-13T03:05:00.000Z
last_modified_at: 2026-10-08T12:00:00.000+04:00
author: chazie
image: /assets/posts/header-turnstile-errors.png
description: "Fix Cloudflare Turnstile errors in WordPress forms: 110200 domain not authorized, invalid sitekey, timeouts, 106010, 300030, 600010 and missing tokens."
tags:
  - Cloudflare Turnstile
  - WordPress Forms
---
![Cloudflare Turnstile homepage](/blog/assets/posts/cloudflare-turnstile-homepage.png "Cloudflare Turnstile")

[Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile) is a user-friendly, privacy-first [CAPTCHA alternative](https://www.oopspam.com/blog/best-captcha-alternatives) that’s becoming popular with WordPress users. But it can run into issues, especially with form plugins. This guide covers common Turnstile errors in WordPress forms and how to fix them fast.

> 💡 **Tired of fixing Turnstile errors?** oopspam stops spam on your server, with no widget for visitors, no challenge script, and no tokens to expire. See our [Cloudflare Turnstile alternative for WordPress](https://www.oopspam.com/turnstile-alternative).

<!-- Quick Links (Table of Contents) for: Common Cloudflare Turnstile Errors in WordPress Forms -->

<nav class="turnstile-quick-links" aria-label="Quick links">
  <p><strong>Quick Links</strong></p>
  <ul>
    <li><a href="#why-cloudflare-turnstile-errors-happen-in-wordpress">Why Cloudflare Turnstile errors happen in WordPress</a></li>
    <li><a href="#1-cloudflare-turnstile-verification-failed-please-try-again-later">Cloudflare Turnstile verification failed, please try again later</a></li>
    <li><a href="#2-turnstile-widget-not-displaying-on-form">Turnstile widget not displaying on form</a></li>
    <li><a href="#3-form-submission-blocked-even-after-passing-turnstile">Form submission blocked even after passing Turnstile</a></li>
    <li><a href="#error-110200-domain-not-authorized">Error 110200: Domain not authorized</a></li>
    <li><a href="#error-110100-invalid-sitekey">Error 110100 / 400020: Invalid sitekey</a></li>
    <li><a href="#error-110110-sitekey-not-found">Error 110110: Sitekey not found</a></li>
    <li><a href="#error-400070-sitekey-disabled">Error 400070: Sitekey disabled</a></li>
    <li><a href="#error-400021-sitekey-domain-mismatch">Error 400021: Sitekey domain mismatch</a></li>
    <li><a href="#error-110600-challenge-timed-out">Error 110600: Challenge timed out</a></li>
    <li><a href="#error-110620-interaction-timed-out">Error 110620: Interaction timed out</a></li>
    <li><a href="#error-200100-clock-or-cache-problem">Error 200100: Clock or cache problem</a></li>
    <li><a href="#error-200500-iframe-load-error">Error 200500: Iframe load error</a></li>
    <li><a href="#error-110420-invalid-action">Error 110420: Invalid action</a></li>
    <li><a href="#error-110430-invalid-cdata">Error 110430: Invalid cData</a></li>
    <li><a href="#7-cloudflare-turnstile-error-code-106010">Error 106010</a></li>
    <li><a href="#8-turnstile-token-missing">Turnstile token missing</a></li>
    <li><a href="#9-client-side-execution-errors-300010-300030-300031">Errors 300010, 300030, 300031</a></li>
    <li><a href="#10-challenge-execution-failure-600010">Error 600010</a></li>
    <li><a href="#technical-turnstile-error-codes-and-what-they-mean">Turnstile error codes and what they mean</a></li>
    <li><a href="#use-oopspam-for-advanced-spam-filtering">Use oopspam for advanced spam filtering</a></li>
    <li><a href="#final-thoughts">Final thoughts</a></li>
  </ul>
</nav>

## Why Cloudflare Turnstile errors happen in WordPress

Turnstile issues usually come down to misconfigurations, plugin conflicts, browser-related problems, or expired credentials. WordPress adds complexity due to its wide variety of themes, plugins, and caching systems, all of which can interfere with how Turnstile renders or validates.

We’ve seen several recurring errors across [forums](https://community.cloudflare.com/), especially from form users. Let’s go over them one by one.

### **1. "Cloudflare Turnstile verification failed, please try again later."**

![Cloudflare Turnstile verification failed, please try again later.](/blog/assets/posts/cloudflare-turnstile-verification-failed.png "Cloudflare Turnstile verification failed")

This is one of the most common Turnstile error messages in WordPress. It often appears after submitting a form.

#### **Cause:**

This usually happens when the Site Key or Secret Key entered is incorrect. Another common reason is interference from caching plugins like Breeze or WP Rocket, which may prevent Turnstile from loading properly. Sometimes, the issue stems from browser cache or extensions that block necessary scripts.

#### **How to Fix:**

![Double-check your Site Key and Secret Key in the Turnstile plugin settings.](/blog/assets/posts/turnstile-api-key-settings.png "Turnstile plugin settings")

* Double-check your **Site Key** and **Secret Key** in the Turnstile plugin settings.
* Disable caching plugins temporarily, or exclude the form page from cache.
* Clear both your browser and site cache.
* Try submitting the form in an Incognito window to rule out browser issues.

### **2. Turnstile Widget Not Displaying on Form**

![Turnstile Widget Not Displaying on Form](/blog/assets/posts/turnstile-widget.png "Turnstile Widget ")

Sometimes, the Turnstile CAPTCHA box doesn’t appear at all.

#### **Cause:**

The Turnstile widget won’t appear if [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) is disabled in the browser. Conflicts between your theme or other plugins may prevent it from rendering. In some cases, minified or combined scripts break the Turnstile widget’s ability to load correctly.

#### **How to Fix:**

* Confirm that **JavaScript is enabled** in your browser.
* Temporarily disable ad blockers or privacy extensions.
* Check for JavaScript errors using browser DevTools console.
* Exclude Turnstile scripts from minification in caching/CDN plugins.

### **3. Form Submission Blocked Even After Passing Turnstile**

A particularly frustrating issue is when users solve the Turnstile challenge, but the form doesn’t submit.

#### **Affected Plugins:**

This issue can happen with any WordPress form builder, but we’ve seen the most reports from users of: 

* [Fluent Forms](https://www.oopspam.com/blog/spam-protection-for-fluent-forms)
* [Forminator](https://www.oopspam.com/blog/spam-protection-for-forminator)
* [Elementor Forms](https://www.oopspam.com/blog/spam-protection-for-elementor-forms)

#### **Cause:**

[AJAX-based](https://en.wikipedia.org/wiki/Ajax_(programming)) form submissions sometimes bypass the Turnstile verification token. File upload fields in forms, especially in Forminator, can also interfere with how the plugin processes verification. Some plugins may also skip server-side token validation entirely.

#### **How to Fix:**

* Temporarily remove file upload fields for testing
* Ensure your form plugin version is updated
* Check whether the plugin supports Turnstile officially, or use the Simple Cloudflare Turnstile plugin to manage validation
* Manually add token verification if using a custom form

<span id="4-invalid-sitekey-or-invalid-domain-errors"></span>

### **4. Error 110200: "Domain not authorized"** {#error-110200-domain-not-authorized}

!["Invalid domain" Cloudflare Turnstile Errors](/blog/assets/posts/invalid-domain-errors.png "Error 110200: Domain not authorized")

#### Error codes:

* `110200`: Domain not authorized. In the browser console it often reads `unknown domain: Domain not allowed`, with an HTTP 400 response.

#### **Cause:**

Turnstile only runs on hostnames you've added to the widget. The page showing your form is on a hostname the widget doesn't list. Common reasons in WordPress:

* You added only `www.example.com`, but the form loads on `example.com`. Adding the root domain covers `www` and every other subdomain; adding `www` alone does not cover the root.
* The form runs on a staging site, a new subdomain, a temporary hosting URL (like a `.vercel.app` or host-provided domain) or `localhost`.
* The site key in your plugin belongs to a different widget or Cloudflare account than the one where you added the domain.
* The hostname was removed from the widget's list.

#### **How to fix:**

1. In the Cloudflare dashboard, open **Turnstile**, select the widget whose site key your plugin uses, then go to **Settings > Hostname Management** and select **Add Hostnames**.
2. Add the root domain (for example `example.com`). Enter the hostname only: no `https://`, port, path or wildcard.
3. Save, then reload the form page with the cache cleared.
4. If the hostname is already listed and the error continues, remove it and add it again. That fixed it for [this Cloudflare community user](https://community.cloudflare.com/t/new-hostname-not-verified-returns-110200/800804).
5. For `localhost` or local development, use Cloudflare's [test site keys](https://developers.cloudflare.com/turnstile/troubleshooting/testing/), which work on any domain, instead of adding local domains to your production widget.

Free Cloudflare plans allow up to 10 hostnames per widget, so if you run many sites, use one widget per group of sites.

### **5. Error 110100 / 400020: "Invalid sitekey"** {#error-110100-invalid-sitekey}

#### Error codes:

* `110100`, `400020`: Invalid sitekey

#### **How to fix:**

* Copy the **Site Key** again from the widget in your Cloudflare dashboard and paste it into your form or Turnstile plugin settings. Watch for extra spaces.
* Make sure you didn't paste the **Secret Key** into the Site Key field.

### **6. Error 110110: "Sitekey not found"** {#error-110110-sitekey-not-found}

#### Error codes:

* `110110`: Sitekey not found

#### **How to fix:**

* Check the site key for typos.
* Confirm the widget still exists in your Cloudflare dashboard. If someone deleted it, create a new widget and update both keys in WordPress.

### **7. Error 400070: "Sitekey disabled"** {#error-400070-sitekey-disabled}

#### Error codes:

* `400070`: Sitekey disabled

#### **How to fix:**

* Open the widget in your Cloudflare dashboard and check whether it's disabled. Re-enable it, or create a new widget and update the keys in WordPress.

### **8. Error 400021: "Sitekey domain mismatch"** {#error-400021-sitekey-domain-mismatch}

#### Error codes:

* `400021`: Sitekey domain mismatch

#### **How to fix:**

* Cloudflare describes this as the site key's region not matching the domain in the Turnstile script tag. Load the script exactly as shown in Cloudflare's [client-side rendering guide](https://developers.cloudflare.com/turnstile/get-started/client-side-rendering/), and check that a plugin or CDN isn't rewriting the script URL.

<span id="6-turnstile-challenge-timeout"></span>

### **9. Error 110600: "Challenge timed out"** {#error-110600-challenge-timed-out}

![Turnstile Challenge Timeout](/blog/assets/posts/turnstile-challenge-timeout.png "Turnstile Challenge Timeout")

#### Error codes:

* `110600`: Challenge timed out

#### **Cause:**

The challenge took too long to complete, or the visitor's device clock is wrong.

#### **How to fix:**

* Ask the visitor to refresh the page and try again.
* Ask them to check that their device's date and time are set automatically.

### **10. Error 110620: "Interaction timed out"** {#error-110620-interaction-timed-out}

#### Error codes:

* `110620`: Interaction timed out

#### **Cause:**

The visitor didn't interact with the widget in time, for example by leaving the form open in a tab and coming back later.

#### **How to fix:**

* If your form plugin allows custom code, reset the widget with `turnstile.reset()` before the next attempt. Otherwise, a page refresh fixes it.

### **11. Error 200100: "Clock or cache problem"** {#error-200100-clock-or-cache-problem}

#### Error codes:

* `200100`: Clock or cache problem

#### **Cause:**

Either the visitor's clock is wrong, or something between the visitor and Cloudflare cached the challenge. On WordPress, that's usually a page cache or CDN serving an old copy of the form page.

#### **How to fix:**

* Exclude form pages from page caching in plugins like WP Rocket, LiteSpeed Cache or W3 Total Cache, and in your CDN.
* Purge the cache after changing Turnstile settings.
* Ask affected visitors to check their device's date and time.

### **12. Error 200500: "Iframe load error"** {#error-200500-iframe-load-error}

#### Error codes:

* `200500`: Iframe load error

#### **Cause:**

The Turnstile iframe couldn't load, usually because `challenges.cloudflare.com` is blocked.

#### **How to fix:**

* Check your Content Security Policy allows `challenges.cloudflare.com` in `script-src` and `frame-src`.
* Test without ad blockers, privacy extensions, VPNs or corporate firewalls.

<span id="5-invalid-action-or-invalid-cdata"></span>

### **13. Error 110420: "Invalid action"** {#error-110420-invalid-action}

#### Error codes:

* `110420`: Invalid action

#### **How to fix:**

* If your form or plugin sets a Turnstile `action`, keep it short and use only letters, numbers, dashes and underscores.

### **14. Error 110430: "Invalid cData"** {#error-110430-invalid-cdata}

#### Error codes:

* `110430`: Invalid cData

#### **How to fix:**

* Make sure any `cData` value passed to the widget follows the same format: short, letters, numbers, dashes and underscores only.

These two codes aren't in Cloudflare's current [error code table](https://developers.cloudflare.com/turnstile/troubleshooting/client-side-errors/error-codes/), but they still appear in older integrations and forum threads.

### **15. Cloudflare Turnstile error code `106010`** {#7-cloudflare-turnstile-error-code-106010}

![Cloudflare Turnstile error code 106010](/blog/assets/posts/error-code-106010.png "Cloudflare Turnstile error code 106010")

#### Error Codes:

* `106010`

**`106010`** isn't in Cloudflare's current [error code table](https://developers.cloudflare.com/turnstile/troubleshooting/client-side-errors/error-codes/), but it's one of the most searched Turnstile errors. In WordPress it usually appears when something about the page environment or the widget's parameters isn't accepted.

#### **Common WordPress level causes to check**

* Content Security Policy blocks Turnstile resources
* A privacy or script blocking extension interferes with required data or cookies
* Aggressive caching or script optimization changes request behavior on first load
* VPNs, proxies, or network security tooling interferes

#### **How to fix**

* Test in Incognito mode and a second browser to rule out extensions.
* Temporarily disable performance features that delay or rewrite scripts, then retest.
* Check DevTools Network and Console for blocked requests or 4xx errors on Turnstile resources.
* Review CSP rules and allow Cloudflare Turnstile endpoints if you enforce CSP.

### **16. “Turnstile token missing”** {#8-turnstile-token-missing}

![Turnstile token missing](/blog/assets/posts/turnstile-token-missing.png "Turnstile token missing")

#### **Common query:** 

* `turnstile token missing`

Turnstile automatically injects a hidden input named `cf-turnstile-response`inside a form. That input carries the token that your server should validate. If that field is missing, empty, or not included in the request, Siteverify can return errors like `missing-input-response`.

#### **Most likely causes**

* The widget never rendered, so no token was created
* The form submits via AJAX but does not include the token
* The request reaches the server, but the integration does not read `cf-turnstile-response` correctly
* Caching or optimization breaks the widget lifecycle, so the token is not refreshed
* The token is expired or already redeemed, then validation fails

#### **How to fix**

* Confirm the widget renders on the page and the hidden `cf-turnstile-response` field exists.
* If the form uses AJAX, confirm the token is included in the AJAX payload.
* Make sure your integration validates the token via **[Siteverify](https://developers.cloudflare.com/turnstile/get-started/server-side-validation/)**, and that the server sends both the token and the secret.
* Reduce caching or exclude the form page. Also exclude Turnstile scripts from delay and minify.
* If the form stays on the same page after submission, ensure the Turnstile widget resets and generates a fresh token before another submit.

#### **Related server side error codes**

Cloudflare documents these Siteverify response errors, which map directly to real WordPress issues:

* `missing-input-secret`
* `invalid-input-secret`
* `missing-input-response`
* `invalid-input-response`
* `bad-request`

This error occurs when a form submission reaches the server without a Turnstile response token attached.

### **17. Client-Side Execution Errors (`300010`, `300030`, `300031`)** {#9-client-side-execution-errors-300010-300030-300031}

![Client-Side Execution Errors (300010, 300030, 300031)](/blog/assets/posts/execution-errors-300010-300030-300031-.png "Client-Side Execution Errors (300010, 300030, 300031)")

#### Error Codes:

* `300010`, `300030`, `300031`

Cloudflare lists **`300*`** as a [generic challenge failure](https://developers.cloudflare.com/turnstile/troubleshooting/client-side-errors/error-codes/): Turnstile detected bot-like behavior. Real visitors usually hit it when the widget can't complete its front-end flow, because scripts are delayed, blocked or rewritten.

#### **How to fix**

* Disable minify, combine, delay, and defer settings for Turnstile scripts.
* Check for console errors and blocked resources.
* Test without browser extensions and without a VPN or proxy.
* Check for CSP rules blocking `challenges.cloudflare.com`

Retrying may work temporarily, but persistent errors point to browser or script-loading issues.

### **18. Challenge Execution Failure (`600010`)** {#10-challenge-execution-failure-600010}

![Challenge Execution Failure (600010)](/blog/assets/posts/challenge-execution-failure-600010-.png "Challenge Execution Failure (600010)")

#### Error Codes:

* `600010`

Cloudflare also lists **`600*`** as a [generic challenge failure](https://developers.cloudflare.com/turnstile/troubleshooting/client-side-errors/error-codes/): bot-like behavior was detected. In the Cloudflare community, `600010` is often discussed alongside browser state, extensions and network blockers.

#### **How to fix**

* Confirm your site key and secret key are correct and belong to the same widget setup.
* Clear browser cache and cookies, then retry.
* Disable extensions, especially privacy and script blockers.
* If it occurs only on certain networks, test without VPN or filtering.

This error is expected behavior when Turnstile detects abnormal execution conditions.

## **Technical Turnstile Error Codes and What They Mean**

These are the codes Cloudflare currently documents. They show up in the browser console or in your form plugin's error message:

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
</style>

<table>
  <thead>
    <tr>
      <th>Error code</th>
      <th>Cloudflare's description</th>
      <th>Retry</th>
      <th>Fix</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>110100</td>
      <td>Invalid sitekey</td>
      <td>No</td>
      <td>Copy the site key again from the dashboard</td>
    </tr>
    <tr>
      <td>110110</td>
      <td>Sitekey not found</td>
      <td>No</td>
      <td>Check spelling; confirm the widget exists</td>
    </tr>
    <tr>
      <td>110200</td>
      <td>Domain not authorized</td>
      <td>No</td>
      <td>Add the domain in Hostname Management</td>
    </tr>
    <tr>
      <td>110600</td>
      <td>Challenge timed out</td>
      <td>Yes</td>
      <td>Refresh; check the device clock</td>
    </tr>
    <tr>
      <td>110620</td>
      <td>Interaction timed out</td>
      <td>Yes</td>
      <td>Reset the widget with <code>turnstile.reset()</code></td>
    </tr>
    <tr>
      <td>200100</td>
      <td>Clock or cache problem</td>
      <td>No</td>
      <td>Exclude form pages from cache; check the clock</td>
    </tr>
    <tr>
      <td>200500</td>
      <td>Iframe load error</td>
      <td>Yes</td>
      <td>Unblock <code>challenges.cloudflare.com</code></td>
    </tr>
    <tr>
      <td>300*</td>
      <td>Generic challenge failure</td>
      <td>Yes</td>
      <td>Check scripts, extensions, VPNs</td>
    </tr>
    <tr>
      <td>400020</td>
      <td>Invalid sitekey</td>
      <td>No</td>
      <td>Copy the site key again from the dashboard</td>
    </tr>
    <tr>
      <td>400021</td>
      <td>Sitekey domain mismatch</td>
      <td>No</td>
      <td>Load the script tag exactly as documented</td>
    </tr>
    <tr>
      <td>400070</td>
      <td>Sitekey disabled</td>
      <td>No</td>
      <td>Re-enable the widget or create a new one</td>
    </tr>
    <tr>
      <td>600*</td>
      <td>Generic challenge failure</td>
      <td>Yes</td>
      <td>Check scripts, extensions, VPNs</td>
    </tr>
  </tbody>
</table>

Source: Cloudflare's [Turnstile error codes](https://developers.cloudflare.com/turnstile/troubleshooting/client-side-errors/error-codes/), checked 8 October 2026. A `*` means the remaining digits vary. Codes like `106010`, `110420` and `110430` aren't in the current table; see their sections above.

## **Use oopspam for Advanced Spam Filtering**

Turnstile helps reduce automated form abuse, but it is not the whole solution. Some spam still gets through, and some attacks focus on content quality rather than pure automation.

**[oopspam WordPress plugin](https://www.oopspam.com/wordpress)** (that’s us 👋) adds a second layer that helps catch nuisance submissions, patterns, and language based abuse, without adding more friction for real users.

![oopspam WordPress plugin](/blog/assets/posts/oopspam-anti-spam-overview.png "oopspam WordPress plugin")

Benefits of using **[oopspam](https://www.oopspam.com/)**:

* Works silently in the background (no CAPTCHA)
* Compatible with major form plugins
* Detects patterns and language abuse, not just bots
* Country blocking to stop spam from specific regions
* No impact on performance or user experience

[Turnstile alternative](https://www.oopspam.com/turnstile-alternative) solutions like oopspam gives you layered protection without overburdening your users.

## **Final Thoughts**

Most Cloudflare Turnstile issues in WordPress come down to configuration, script loading, or token handling. Once keys are verified, caching is controlled, and server-side validation is confirmed, most errors resolve quickly.

For stronger protection and fewer false positives, combining Turnstile with background spam filtering provides a more reliable approach without hurting user experience. Whether you're already using Turnstile or just exploring spam protection options, it’s a great time to [get started with oopspam](https://app.oopspam.com/Identity/Account/Register) for advanced, frictionless form security.

Stay secure and spam-free!
