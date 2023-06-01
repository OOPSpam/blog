---
layout: post
title:  "Stop Spam in its tracks: A Guide to Gravity Forms Protection"
author: "Onar A."
image: /assets/posts/gravity/gf-meta.png
tags: [WordPress, contact_form, gravity]


description: "Learn how to add spam protection to Gravity Forms with these 4 different methods in WordPress."
# modified: 
---
<center>
<img width="500" alt="Gravity Forms plugin" src="/blog/assets/posts/gravity/gf-forms.png">
</center>
<br/>

[Gravity Forms](https://www.gravityforms.com/) is prepays the most popular contact form builder for WordPress, packed with a range of features that include online payment methods, automation, and conditional logics. One area where it truly stands out is [the vast range of spam protection options](https://docs.gravityforms.com/spam/) it provides. Not only was Gravity Forms one of the first form builders to be supported by [our WordPress plugin](https://www.oopspam.com/blog/oopspam-supports-gravity-forms), but it also includes built-in and third-party spam prevention alternatives. Let's go through some of them.

{% include toc.md %}

## Honeypot

We previously discussed [how the honeypot technique works](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field). While it's not as effective as it used to be, it still prevents some bots from spamming your forms.
Gravity Forms has [a built-it honeypot field](https://docs.gravityforms.com/spam/#h-honeypot) but you need to enable it. The honeypot field won't be visible to humans, but bots see the hidden field as a valid field. Bots scan a website and fill in all the fields, including the hidden field in your form. Gravity Forms will dismiss every submission that has an entry in a hidden field.

To enable the honeypot field, go to __Form Settings -> Form Options__ settings of your form and enable __Anti-spam honeypot__.

![Gravity Forms Anti-spam honeypot](/blog/assets/posts/gravity/honeypot.png "Gravity Forms Anti-spam honeypot")

## reCaptcha

Gravity Forms also supports reCaptcha. Unlike other major contact form builders, Gravity Forms doesn't have built-it reCaptcha v3. Instead, it has reCaptcha v2 support. If you would like to use reCaptcha v3, then you have to install Gravity Forms reCAPTCHA Add-On. The add-on is available with all plans.

To enable reCaptcha, visit __Settings -> reCAPTCHA__ (see screenshot below) and enter Site Key and Secret Key. Here is how to get reCaptcha keys:

1. Go to [the reCaptcha website](https://www.google.com/recaptcha/) and click on the "v3 Admin Console" button located on the top right corner of the page.
2. Sign in to your Google account if you haven't already done so.
3. On the Admin Console page, click on the "Add" button to register a new site.
4. Fill in the required fields, such as your website domain name and reCaptcha type (v2 or v3).
5. After you've filled in the required fields, click on the "Submit" button to register your site.
    ![reCaptcha adding website](/blog/assets/posts/gravity/recaptcha-form.png "reCaptcha adding website")
6. You'll be taken to a page with your site key and secret key. These are the keys you'll need to integrate reCaptcha into your website.
    ![reCaptcha generates Site keys](/blog/assets/posts/gravity/recaptcha-keys.jpg "reCaptcha generates Site keys")

> 📌  Make sure to add CAPTCHA field to your form too.

Check out Gravity Forms' [How to](https://www.gravityforms.com/blog/add-recaptcha-to-your-forms/) article on reCaptcha.

### Should I set up v2 or v3?

Gravity Forms supports only v2 and v2 Invisible by default. First, let's quickly see how are they different.

- reCaptcha v2 (built-in): A visitor solves provided captcha
- reCaptcha v2 (built-in): Invisible: Hidden by default. A captcha appears if a visitor is detected as malicious
- reCaptcha v3 (requires add-on): Invisible all the time

v3 came after many people complained about accessibility and usability issues with v2. v2 asks visitors to solve a challenge before submitting a form. To address this issue, Google removed the "challenge" part of reCaptcha. As a result, with v3, users don't solve any challenge. Instead, it tracks the user's behavior on your website and scores the user from 0 (bot) to 1 (human). It is up to the website owner to determine the threshold. 

Many people are happy with reCaptcha. It is effective against simple bots, however, advanced bots can [bypass reCaptcha](https://github.com/xHossein/PyPasser). There are also "captcha farms" where people get paid to solve reCaptcha. It may also slow down your website as it loads extra js files into your website.

If you're looking for a free and easy solution, reCaptcha may be the answer.

> 📌 Tip: Consider adding both reCaptcha and the honeypot field to your contact form. Remember HoneyPot is NOT enabled by default.


![Gravity Forms reCaptcha](/blog/assets/posts/gravity/reCaptcha.png "Gravity Forms reCaptcha")

## Custom captcha using Conditional Logic

Another way to prevent spam in Gravity Forms is to ask your visitors a question. Just like the honeypot method, it is an old and inexpensive technic but still works in many cases. For this to work, you need to add a __Single Line Text__ to your form with your question as __Field Label__. Make sure this field is _required_ so that a visitor is forced to fill it. In this example, we will use the sample question from [the Gravity Forms docs](https://docs.gravityforms.com/spam/#h-submit-button-conditional-logic): **A panda is black and ____**.

Here are some questions you could use:

1. What is the sum of 6 and 9?
2. Which of the following is a fruit: tomato, carrot, or apple?
3. What is the capital of France?
4. What color is the sky on a clear day?
5. Which of the following is a type of animal: giraffe, banana, or guitar?
6. What is the opposite of hot?
7. Which of the following is a musical instrument: piano, chair, or house?
8. What is the primary language spoken in Japan?
9. Which of the following is a type of food: pizza, chair, or cloud?

The next step is to find __Submit Button Conditional Logic__ under the __Submit__ button settings. Here you can _Enable Conditional Logic_.

And the final step is to add our condition as _Show this form button if All of the following match: [Your Single Line Text field] contains white_ (See the screenshot below).

As you may guess, here we are forcing the Submit form to be hidden by default and display it only if the presented question is answered correctly. 

![Gravity Forms Conditional Logic](/blog/assets/posts/gravity/conditional-logic.png "Gravity Forms Conditional Logic")

and here is a screen recording of how it works:

![Gravity Forms uses Conditional Logic for captcha purposes](/blog/assets/posts/gravity/conditional-logic.gif "Gravity Forms uses Conditional Logic for captcha purposes")

While question-based verification can be an effective method to verify your visitor, there are some limitations:

- Limited: It's only effective if the questions asked are relevant to the user and are not too obscure. If the questions are too specific or require specialized knowledge, it may exclude legitimate users who do not have the necessary knowledge to answer the questions correctly.
- Predictable: If the questions asked are always the same or follow a predictable pattern, advanced bots can potentially learn how to answer them correctly, making it less effective as a form of human verification.
- User frustration: If the questions are too difficult or confusing, it can frustrate legitimate users and discourage them from submitting a form.
- Accessibility: As the questions are presented in a text format only, visitors with visual impairments may have difficulty reading the questions.


## OOPSpam WordPress plugin

[Our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) is another way to stop spam on your Gravity Forms and WordPress comments. The plugin works with OOPSpam API that protects over 1M websites daily. While the other alternatives above are free, OOPSPam API is a paid service. But it does come with free 40/month spam checks for you to test and see the difference.

It's likely you have already tried the above options, and they didn't work for you. It could be [a slow website from reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) or overwhelming spam you are still getting despite implementing the above alternatives. What makes OOPSpam different from other solutions is that it doesn't slow your website and is effective against human spammers and bots. There is no challenge to solve. No performance penalty as everything happens in your server instead of client-side. The OOPSpam API uses machine learning models, content analyses, IP & email reputation, and other rule-based checks to score every contact form submission. A combination of all these analyses returns a single spam score that is how it accurately stops both manual spam and bots.

On the plugin's settings page, you could also adjust how sensitive you want your spam filter to be. Even keeping default __Sensitivity level__ setting will help you cut down spam to zero.

![OOPSpam WordPress Plugin Sensitivity level](https://www.oopspam.com/assets/WP_SensitivyLevel.jpg "OOPSpam WordPress Plugin Sensitivity level")

In addition, the plugin allows you to set up a filter to accept submissions only from certain countries and languages.

![OOPSpam WordPress Plugin country & language restrictions](https://www.oopspam.com/assets/country-language-filter.png "OOPSpam WordPress Plugin country & language restrictions")

Unlike other premium solutions, OOPSpam is privacy-friendly. We don't store or share your data. All cloud-based spam filtering services in the market require you to send visitors IP addresses which violates GDPR. With OOPSpam, you don't have to.

Here are a few steps to activate spam protection for Gravity Forms

1. [Subscribe to get an API key](https://app.oopspam.com/Identity/Account/Register) then copy-paste the API key to the plugin's appropriate field under __Settings->OOPSpam Anti-Spam__ on your WordPress Admin Dashboard.

> ℹ️ Make sure to select OOPSpam Dashboard on the setting page

2. If you have Gravity Forms installed then a special section will appear on the OOPSpam Anti-Spam plugin's settings page.

    ![OOPSpam Anti-Spam WordPress Plugin Settings](/blog/assets/posts/gravity/oopspam-gravity-setting.png "OOPSpam Anti-Spam WordPress Plugin Settings")

3. On this page, you need to activate the spam filtering for Gravity Forms by checking the **Activate Spam Protection** checkbox. You don't have to do anything on your form. Once you activate spam protection on the OOPSpam plugin settings, you are good to go.

4. Don't forget to enter a short message to display when a spam form entry is submitted. Your message will appear at the bottom of the message field.

<center>
<img width="350" alt="OOPSpam detected spam on Gravity Forms" src="/blog/assets/posts/gravity/gravity-spam-detected.png">
</center>
<br/>

## Final thoughts

All websites eventually get hit by spammers. As a website grows and gets more traffic it attracts more serious spammers with advance bots. Both honeypot and reCaptcha will protect your website to a certain degree but they are not enough for targeted spam attacks, manual spam and sophisticated bots. I hope this article helps you find a solution for your spam problem.

That is all! Go on and create your forms.

Happy spam-free day!