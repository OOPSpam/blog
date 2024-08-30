---
layout: post
title:  "Combatting Comment Spam like a Pro: Explore WPDiscuz's Anti-Spam Capabilities"
author: "Onar A."
image: /assets/posts/wpdiscuz/wpdiscuz-meta.png
tags: [WordPress, comment, wpdiscuz]


description: "Learn how to add spam protection to WPDiscuz comment system with these 4 different methods in WordPress."

---
<center>
<img loading="lazy"  width="600" alt="WPDiscuz plugin" src="/blog/assets/posts/wpdiscuz/wpDiscuz.png">
</center>
<br/>

WordPress already comes with a built-in comment system.  It does not have many features except basic commenting. And this is enough for many of us. However, if you'd like to have more features like Comment Rating, Social Commenting, Comment Stats, and Multi Layout then [WPDiscuz](https://wpdiscuz.com/) is your solution. It is a free plugin and pack with features.

In this article, we are going to focus on how to use different spam protection options to protect your WPDiscuz comment system. WPDiscuz supports reCAPTCHA and WordPress's native *Comment Moderation* as a way to stop spam. There are also third-party plugins that support WPDiscuz.

{% include toc.md %}

## OOPSpam WordPress plugin

[OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) is another way to stop spam on your WPDiscuz comments. The plugin works with OOPSpam API that protects over 3.5M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the below options, and they didn't work for you. It could be a [slow website from reCAPTCHA](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the below alternatives. These are benefits OOPSpam has over other alternative:

1. Doesn't slow down your website
2. Keeps your site accessible to all users
3. Stops both human spammers and bots

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping the default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

> ✨ Since then, we have also added the __Block messages from these countries__ feature.

![OOPSpam WordPress Plugin block countries](https://www.oopspam.com/blog/assets/wp-block-countries.png "OOPSpam WordPress Plugin block countries")

Here are a few steps to activate spam protection for WPDiscuz:

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

    > ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have WPDiscuz installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/wpdiscuz/oopspam-wpdiscuz-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for WPDiscuz by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img loading="lazy"   alt="OOPSpam detected spam on WPDiscuz" src="/blog/assets/posts/wpdiscuz/wpdiscuz-spam-detected.png">
</center>
<br/>

## reCAPTCHA

[WPDiscuz comes with reCAPTCHA v2 support](https://wpdiscuz.com/docs/wpdiscuz-7/plugin-settings/google-recaptcha/). As you may already know reCAPTCHA has a couple of versions:

- reCAPTCHA v2 (built-in): A visitor solves provided CAPTCHA (I'm not a robot)
- reCAPTCHA v2: Invisible (paid via addon): Hidden by default. A CAPTCHA appears if a visitor is detected as malicious
- reCAPTCHA v3 (paid via addon): Invisible all the time

It is important to point out that WPDiscuz doesn't support an invisible version of reCAPTCHA out of the box.  So, you visitors have to solve the "I'm not a robot" challenge to post. If you would like to use invisible then you need to buy [reCaptcha Addon](https://gvectors.com/product/wpdiscuz-recaptcha/).

![WPDiscuz reCAPTCHA](/blog/assets/posts/wpdiscuz/recaptcha.png "WPDiscuz reCAPTCHA")

To activate reCAPTCHA in your comment section, you need to get Site Key and Secret Key for it.

Here is how to get reCAPTCHA keys:

1. Go to [the reCAPTCHA website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCAPTCHA type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/gravity/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCAPTCHA into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/gravity/recaptcha-keys.jpg "reCaptcha generates Site keys")

Once you have both keys, on your WP dashboard navigate to __wpDiscuz > Settings > reCAPTCHA__ and enter both keys.

### Should I set up reCAPTCHA v2 or v3?

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCAPTCHA. As a result, with v3, users don't solve any challenges. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold.

Many people are happy with reCAPTCHA. It is effective against simple bots, however, advanced bots can [bypass reCAPTCHA](https://www.oopspam.com/blog/bypassing-captcha). There are also "captcha farms" where people get paid to solve reCAPTCHA. It may also [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses) as it loads extra js files into your website.

If you're looking for a free and easy solution, reCAPTCHA may be the answer. If you decided to go with reCAPTCHA, consider using the invisible version via an addon for better user experience.

## hCAPTCHA

Unlike reCAPTCHA, hCAPTCHA is not built into WPDiscuz. However, you can use [the official hCAPTCHA WordPress plugin](https://wordpress.org/plugins/hcaptcha-for-forms-and-more/) which supports WPDiscuz.
hCaptcha and reCAPTCHA work similarly and suffer from the same limitations. hCAPTCHA integration comes with two types: Visible and Invisible. The most notable difference between reCAPTCHA and hCAPTCHA is privacy. hCAPTCHA is considered a privacy-friendly alternative to reCAPTCHA. Setting up hCAPTCHA is also very similar to hCAPTCHA. Once the hCAPTCHA plugin is installed, navigate to __hCaptcha -> Integration__ and enter your Site Key and Secret Key.

To obtain hCAPTCHA Site Key and Secret Key, follow these step-by-step instructions:

1. Visit the hCAPTCHA website: Go to [the official hCAPTCHA website](https://www.hcaptcha.com/).
2. Sign up for an account: Click on the "Sign Up" button and provide the required information to create a new account.
3. Create a new site: Once you're logged in, navigate to the "Sites" section or dashboard.
4. Register a new site: Click on the "Register a new site" button or a similar option to register a new website.
5. Provide website details: Fill in the necessary information for your website, such as the website name, domain, and any other required fields.
6. Select hCAPTCHA type: Choose the type of hCAPTCHA you want to use. You can select between the "Checkbox" or "Invisible" options depending on your preference.
7. Get Site Key and Secret Key: After completing the registration process, hCAPTCHA will generate a unique Site Key and Secret Key for your website. 
8. Copy the keys: Copy the generated Site Key and Secret Key and keep them in a secure location. 

![WPDiscuz hCAPTCHA](/blog/assets/posts/wpdiscuz/hcaptcha.png "WPDiscuz hCAPTCHA")

If you are getting spammed and you already tried other options, it's a good practice to try hCAPTCHA as well. It's free and easy to set up. In some cases, however, the switch from reCAPTCHA to hCAPTCHA doesn't change much as spammers can bypass CAPTCHA solutions nowadays.

## Using WordPress's Comment Moderation

WPDiscuz did a great job by incorporating WordPress's already available comment moderation into their forms. I'm talking about a feature that comes with every WordPress and is accessible under __WordPress Settings -> Discussion page -> Disallowed Comment Keys__. This is a quick way to block a surge of spam by adding URLs, IPs or any spam words (per line) into this field. WPDiscuz then will check every submission against this list and block if matched. 

![WordPress Comment Moderation](/blog/assets/posts/formidable-forms/comment-keys.png "WordPress Comment Moderation")

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCAPTCHA/hCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!