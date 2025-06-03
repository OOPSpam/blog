---
layout: post
title: How to Block IPs from VPN and Cloud Providers in Make
date: 2025-03-24T02:18:00.000Z
author: chazie
image: /assets/posts/how-to-block-ips-from-vpn-and-cloud-providers-in-make.jpg
description: Block VPN and cloud provider IPs in Make with OOPSpam to reduce
  spam and maintain clean data. Improve workflows while keeping real users
  engaged!
tags:
  - VPN
  - Cloud Provider
  - Make
---
![How to Block IPs from VPN and Cloud Providers in Make](/blog/assets/posts/how-to-block-ips-from-vpn-and-cloud-providers-in-make.jpg "How to Block IPs from VPN and Cloud Providers in Make")

Dealing with [spam submissions can be a challenge](https://www.oopspam.com/blog/5-common-spam-problems-in-make-how-to-fix-them) for anyone managing online forms. Whether you're running a business website, an online community, or handling customer inquiries, spam can quickly overwhelm your system. Spammers often exploit VPNs (Virtual Private Networks) and cloud provider servers to mask their identity, making it difficult to detect and block them.

Luckily, [OOPSpam’s Make integration](https://www.make.com/en/integrations/oopspam-anti-spam) offers a solution. With two new settings, you can effectively reduce spam and maintain clean, reliable data:

* **Block VPN, Proxy, Tor IPs:** Prevents spam from IPs linked to VPN services, proxies, and Tor networks.
* **Block IP addresses from Cloud Providers:** Blocks IPs commonly associated with automated spam bots hosted on cloud servers.

These features are crucial for maintaining smooth workflows and keeping spam at bay, while still allowing legitimate users to interact with your forms. Let’s break down why these settings matter and how to configure them.

## **Why Do Spammers Use VPNs and Cloud Providers?**

Before we get into the details of how to block these IP addresses, it’s important to understand why spammers choose VPNs and cloud providers as their go-to tools.

### **1. VPNs Help Conceal Identity**

[VPNs](https://en.wikipedia.org/wiki/Virtual_private_network) reroute internet connections through remote servers, hiding users' actual IP addresses. While commonly used for privacy, spammers exploit this feature to mask their identity and bypass location-based restrictions, making spam detection harder.

### **2. Multiple Submissions in Surveys**

In addition to masking identity, VPNs are often used to manipulate survey responses or voting forms. Some users submit multiple entries using different IP addresses, skewing results or maliciously affecting outcomes. 

### **3. Cloud Servers Automate Spam Attacks**

Cloud hosting services like AWS, DigitalOcean, and Google Cloud are powerful tools for businesses, but they are also commonly exploited by spammers. Automated bots running on cloud servers can generate a massive volume of spam in seconds, making it nearly impossible to keep up without automated filtering.

### **4. Constantly Changing IPs**

VPN and cloud provider IP addresses are often dynamic, making it challenging to maintain a manual blacklist. Spammers take advantage of this by frequently changing IPs, allowing them to dodge traditional spam filters.

## **How OOPSpam’s Make Integration Helps**

![How OOPSpam’s Make Integration Helps](/blog/assets/posts/oopspam’s-make-integration-helps.png "OOPSpam’s Make Integration")

The [OOPSpam integration with Make](https://help.oopspam.com/other-integrations/make/) allows you to automatically block spam from VPNs and cloud providers, keeping your forms secure and clean. Here’s how the two key settings work:

### **Block VPNs**

This setting blocks form submissions from users connecting through VPNs, proxies, or Tor networks. While VPNs are useful for privacy, spammers often use them to hide their real IP addresses and automate spam attacks.

* Useful when you notice a pattern of spam originating from VPN or proxy servers.
* Be mindful that some legitimate users, like remote workers, may also use VPNs.

> If you're unsure whether an IP belongs to a VPN provider, you can verify it using an [IP reputation check tool](https://ipreputationcheck.com/).

### **Block Cloud Providers**

This setting prevents spam submissions from IPs linked to over 2,000 cloud providers, including popular data centers and hosting services frequently used for spam automation. 99.9% of spam from cloud providers originates from automated programs rather than real users.

* Real users rarely submit forms from cloud servers, making this setting generally safe to enable.
* Occasionally, legitimate IPs might get blocked if they are reassigned or repurposed.

OOPSpam’s IP database is continuously updated to ensure accurate detection and reduce false positives. By enabling these settings in [Make](https://www.make.com/en), you minimize spam while maintaining a smooth and efficient workflow.

## **Step-by-Step: How to Block VPN and Cloud Provider IPs in Make?**

Setting up VPN and cloud provider blocking in Make with [OOPSpam](https://www.oopspam.com/) is straightforward. Here’s how you can do it:

### **Step 1: Add OOPSpam to Your Make Scenario**

![Search for "OOPSpam Anti-Spam" and select "Check for Spam" from the list of actions.](/blog/assets/posts/add-oopspam-to-your-make-scenario.png "Add OOPSpam to Your Make Scenario")

1. Open your Make dashboard and navigate to your desired workflow.
2. Click the **"+" button** to add a new module.
3. Search for **"OOPSpam Anti-Spam"** and select **"Check for Spam"** from the list of actions.

### **Step 2: Create an OOPSpam Connection**

![Enter your OOPSpam API key (found in your OOPSpam dashboard).](/blog/assets/posts/create-an-oopspam-connection.png "Create an OOPSpam Connection")

1. Click **"Add"** to establish a new connection.
2. Enter your **OOPSpam API key** (found in your [OOPSpam dashboard](https://app.oopspam.com/Identity/Account/Register)).
3. Confirm and save the connection settings.

### **Step 3: Map the Form Fields to OOPSpam**

![To enhance spam detection, map your form fields correctly.](/blog/assets/posts/spam-settings.png "Map the Form Fields to OOPSpam")

To enhance spam detection, map your form fields correctly:

* **Content:** Map to the **Message field**.
* **Email:** Map to the **Email field**.
* **Sender IP:** Map to the **IP field** to improve detection accuracy.

### **Step 4: Enable VPN and Cloud Provider Blocking in Make**

![Enable VPN and Cloud Provider Blocking in Make](/blog/assets/posts/enable-vpn-and-cloud-provider-blocking.png "Enable VPN and Cloud Provider Blocking in Make")

1. **Toggle VPN Blocking:** Set **"Block VPN, Proxy, Tor IPs"** to "Yes."
2. **Toggle Cloud Blocking:** Set **"Block IP addresses from Cloud Providers"** to "Yes."
3. **Save Your Changes:** Click "**Save**" to update the settings.

### **Step 5: Testing and Verifying Your Settings**

![Submit a test form from a VPN connection and from a cloud server if possible.](/blog/assets/posts/spam-workflow.png "Testing and Verifying Your Make Settings")

Once you’ve configured the settings, it’s important to test their effectiveness. Follow these steps to ensure everything is working correctly:

1. **Run a Test Submission:** Submit a test form from a VPN connection and from a cloud server if possible.
2. **Check Spam Detection:** Verify that the submission is blocked and appears in your OOPSpam logs.
3. **Monitor Legitimate Users:** Keep an eye on user feedback to ensure legitimate visitors are not accidentally blocked.

> **Troubleshooting Tip:** If legitimate users report being blocked, consider temporarily disabling VPN blocking while keeping cloud provider blocking active. Use [IP reputation checking tools](https://ipreputationcheck.com/) to cross-verify blocked IPs and adjust your settings accordingly.

## **Pros and Cons of Blocking VPN and Cloud IPs**

Blocking VPN and cloud provider IPs can reduce spam, but may also impact legitimate users. It’s essential to weigh the benefits against potential drawbacks before enabling these settings.

#### **Pros:**

* **Significantly Reduces Spam:** Eliminates a large portion of automated junk submissions.
* **Saves Time:** Reduces manual spam filtering.
* **Improves Data Quality:** Ensures that only genuine users submit forms.
* **Integrates Seamlessly with Make:** Easy to enable and manage.

#### **Cons:**

* **Potential to Block Legitimate Users:** Some users might get caught in the filter if they use VPNs for privacy.
* **False Positives:** Though rare, some cloud provider IPs might belong to legitimate services.
* **Needs Regular Monitoring:** Adjustments might be necessary if real users are affected.

## **Best Practices for Using Blocking Features** 

To get the most out of OOPSpam’s Make integration, follow these tips:

* **Monitor Submissions:** Regularly check your logs for blocked IPs to ensure no legitimate users are mistakenly flagged.
* **Use IP Checking Tools:** Before making drastic changes, verify IPs using a reputation check.
* **Communicate with Users:** Let your audience know if VPN blocking might affect them, especially for global or privacy-conscious users.
* **Fine-Tune Your Settings:** Don’t hesitate to adjust your configuration based on real-world data and user feedback.

## **Final thoughts**

Automated spam can quickly clog your workflows and disrupt your operations. By leveraging OOPSpam’s Make integration to block VPN and cloud provider IPs, you take a proactive approach to spam management. These settings help ensure that your submissions come from real users rather than automated bots.

Take some time to monitor how the changes impact your form submissions. Adjust your settings as needed to balance security and accessibility. With the right configuration, you’ll keep your forms spam-free while maintaining a positive user experience.

Try it out and [experience the difference OOPSpam can make](https://app.oopspam.com/Identity/Account/Register) in your Make workflows! [Let us know](https://www.oopspam.com/#contact) if you need further assistance or guidance on setting up your spam protection.
