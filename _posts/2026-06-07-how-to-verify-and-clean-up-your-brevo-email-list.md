---
layout: post
title: How to verify and clean up your Brevo email list?
date: 2026-06-07T13:16:00.000+08:00
author: chazie
image: /blog/assets/posts/social-media-meta.png
description: Learn how to verify and clean your Brevo email list with OOPSpam to
  remove risky contacts, improve deliverability, and boost engagement.
tags:
  - Brevo
---
Email lists naturally collect invalid, inactive, and spam contacts over time, which can hurt deliverability and engagement. OOPSpam's new [Brevo](https://www.brevo.com/) integration connects directly to your account, scans your lists against a spam database, and lets you act on flagged contacts, all without exporting a single CSV.

## **Step 1: Find the Brevo Integration**

From your[ OOPSpam Dashboard](https://app.oopspam.com/), click **Integrations** in the left sidebar. You'll see Brevo listed alongside the other available integrations. Click **Connect** on the Brevo card.

![Step 1: Find the Brevo Integration](/blog/assets/posts/brevo-1.png "Step 1: Find the Brevo Integration")

## **Step 2: Connect with Your Brevo API Key**

You'll be asked for your **Brevo API Key**. To get one, go to your Brevo account and navigate to **Account Settings → SMTP & API**.

![Step 2: Connect with Your Brevo API Key](/blog/assets/posts/brevo-2.png "Step 2: Connect with Your Brevo API Key")

Paste it into the field and click **Connect**.

## **Step 3: Pick a List to Scan**

After connecting, OOPSpam fetches your Brevo lists along with their subscriber counts. Click on the list you want to check.

![Step 3: Pick a List to Scan](/blog/assets/posts/brevo-3.png "Step 3: Pick a List to Scan")

## **Step 4: Preview Contacts and Start the Scan**

You'll see a full preview of the contacts in your selected list before the scan runs. OOPSpam will check each address against its spam database to identify risky emails.

![Step 4: Preview Contacts and Start the Scan](/blog/assets/posts/brevo-4.png "Step 4: Preview Contacts and Start the Scan")

Click **Scan All Emails** when ready. For larger lists, the scan runs in two steps: first loading all contacts, then scanning them with OOPSpam. Either way, the process runs automatically.

*Note:* scanning uses your OOPSpam API credits.

## **Step 5: Review and Act on Risky Contacts**

Once the scan finishes, results are displayed in three summary cards:

* **Total Scanned** - every address checked
* **Clean** - addresses that passed
* **Risky** - addresses flagged as suspicious or harmful

![Step 5.1: Review and Act on Risky Contacts](/blog/assets/posts/brevo-5.png "Step 5.1: Review and Act on Risky Contacts")

All risky contacts appear in the list below with individual action buttons. For each one you can:

* **Unsubscribe** - removes the contact from this list only; they remain in your Brevo account
* **Delete** - permanently removes the contact from your Brevo account entirely

To handle them in bulk, use the buttons at the top of the list:

* **Unsubscribe Selected** - unsubscribes all checked contacts from the list
* **Delete Selected** - permanently deletes all checked contacts from your account

![Step 5.2: Review and Act on Risky Contacts](/blog/assets/posts/brevo-6.png "Step 5.2: Review and Act on Risky Contacts")

Before bulk actions are applied, Brevo will show a confirmation dialog to make sure you intended the action. Click **OK** to proceed.

## **Step 6: Done! List Cleaned**

After confirming, the risky count drops to 0 and a success message appears. In this example, 4 contacts were successfully unsubscribed from the list.

![Step 6: Done! List Cleaned](/blog/assets/posts/brevo-7.png "Step 6: Done! List Cleaned")

## **Why Bother Cleaning Your Brevo List?**

Most email problems don't announce themselves, they build up quietly. A few reasons to scan regularly:

* Bounce rates rise when invalid addresses accumulate, hurting your sender score
* Spam traps get added to lists through scraped or purchased contacts, hitting one can get your domain flagged
* Engagement metrics become unreliable when a chunk of your list can't or won't open anything
* Brevo charges by email volume, removing dead contacts keeps your costs in check

A clean list means your campaigns reach real people and your stats reflect reality. Connect OOPSpam to Brevo once, and you can run a scan whenever your list needs it. No imports, no spreadsheets, no manual cross-referencing.
