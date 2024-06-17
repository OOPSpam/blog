---
layout: post
title: The 8 Best WordPress Form Plugins for Accessibility, Performance and Spam Protection
author: Onar A.
image: /assets/posts/best-wp-form/WordpressForms.png
tags:
  - wordpress
description: We’ve been working with WordPress form builder plugins for over five years, mainly integrating the OOPSpam WordPress anti-spam plugin with them. This involves coding, creating forms and testing them.
preview: /posts/best-wp-form/WordpressForms.png
---
<center>
<img loading="lazy"  width="600" alt="WordPress logo" src="/blog/assets/posts/best-wp-form/WordpressForms.png">
</center>
<br/>

 

We've been working with WordPress form builder plugins for over five years, mainly integrating the [OOPSpam WordPress anti-spam plugin](https://wordpress.org/plugins/oopspam-anti-spam/) with them. This involves coding, creating forms and testing them.

I also spend a lot of time working on articles like [how to build accessibility forms](https://www.oopspam.com/blog/accessible-forms) and [building a complete contact form](https://www.oopspam.com/blog/contact-form-with-PHP).

So, I decided to share our experiences with accessibility, performance impact, spam protection, and general functionality like conditional logic.

To test accessibility and performance, I'll be using Google's open source [Lighthouse](https://github.com/GoogleChrome/lighthouse) tool. All testing will be done locally in the same environment. All forms will be simple contact forms.

While most of the plugins listed below have a free version, some don't (like Gravity Forms). I will use the free version whenever possible.

__Our testing environment:__

- No other plugins except OOPSpam Anti-Spam and the form plugin installed.
- PHP 8.1.23
- WordPress 6.4.2
- Theme enabled: Twenty Twenty-Four

The test environment will be reset with each test to ensure a fair comparison between all solutions.

I'll use the default WordPress theme. Our demo page with no form has a performance score of 1/3 and an accessibility score of 21/21.

![Test page](/blog/assets/posts/best-wp-form/default-website.png "Test page")

In its current state, our simple web page makes 13 requests, transferring 1.2 MB, and the DOMContentLoaded load time is 128 ms.

- 13 requests
- 1.2 MB transferred
- 1.3 MB resources
- Finish: 209 ms
- DOMContentLoaded: 128 ms
- Load: 182 ms

We'll see how these numbers change as we create a form and add a few fields. Towards the end of the article, I'll include a table to provide an overall comparison of these popular form builders.

{% include toc.md %}

# 1. WS Form

We have already discussed [WS Form](https://wordpress.org/plugins/ws-form/) in our article about [Spam Protection for WSForm](https://www.oopspam.com/blog/spam-protection-for-wsform). It stands out as one of the most developer-friendly plugins for creating advanced forms, offering over 100 ready-to-use templates. WS Form offers features such as conditional logic, form actions, and a unique built-in debug console for easy troubleshooting. It is available in both free and paid versions.

However, it's important to note not all features are available in the WS Forms LITE version.

![WS Form Lighthouse Performance and Accessibility Result](/blog/assets/posts/best-wp-form/wsform-lighthouse.png "WS Form Lighthouse Performance and Accessibility Result")

## Accessibility in WS Form

WS Form excels at creating accessible forms by default, including necessary `aria' attributes, labels and keyboard navigation.

In the Lighthouse result, it successfully passes an additional 3 audits.

## Performance impact of WS Form

There is no noticeable impact on the page load time of our site with WS Form.

When WS Form is enabled, we see a 32% increase in network requests and a 15% increase in page DOM content load time. In general, it's only an additional 10ms to load the entire page.


| Before WS Form                                                                                                      | After WS Form                                                                                                       | Increase                               |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms | 18 requests<br>1.3 MB transferred<br>1.6 MB resources<br>Finish: 218 ms<br>DOMContentLoaded: 150 ms<br>Load: 192 ms | Requests: 32%<br>DOMContentLoaded: 15% |


These numbers look good. Would be interesting to see how other form plugins compare to these numbers.

## Spam protection in WS Form

As we provide spam filtering service for various platforms including WordPress plugins, this topic is very interesting for me personally. As mentioned above, we talk about WS Form's capabilities in terms of spam protection in [another post](https://www.oopspam.com/blog/spam-protection-for-wsform). For both WS Form LITE and PRO we have the following options:

- reCaptcha
- hCaptcha
- Turnstile
- Honeypot

All these solutions are free. Both LITE and PRO versions come with the same spam protection cabailities. I recommend enabling Honeypot in addition to one of the other three options. Keep in mind except for Honeypot, all others will have a negative impact on your website speed (see Performance Impact of [hCaptcha](https://www.oopspam.com/blog/hcaptcha-performance-analyses) and [reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) posts for detailed analysis). Turnstile is the lightest among them. Let's enable it and see how it compares to our previous numbers:

| Before Turnstile enabled [WS Form]                                                                                  	| After Turnstile enabled [WS Form]                                                                                   	| Increase                                                        	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|-----------------------------------------------------------------	|
| 18 requests<br>1.3 MB transferred<br>1.6 MB resources<br>Finish: 218 ms<br>DOMContentLoaded: 150 ms<br>Load: 192 ms 	| 30 requests<br>1.9 MB transferred<br>2.5 MB resources<br>Finish: 4.36 s<br>DOMContentLoaded: 180 ms<br>Load: 337 ms 	| Requests: 50%<br><br><br><br>DOMContentLoaded: 18%<br>Load: 54% 	|

As you can see, after enabling Turnstile, there are 12 additional requests and the load time increases.

# 2. Fluent Forms

[Fluent Forms](https://wordpress.org/plugins/fluentform/) is another popular form builder known for being easy to use and easy to get started with. You can create contact, survey, order, conversation forms and more. Just like WS Form, Fluent Forms comes with over 66 ready-made forms and over 50 form fields. They claim to be accessible and fast. Let's see what our tests show. It comes with generous free and paid versions.

![Fluent Forms Lighthouse Performance and Accessibility result](/blog/assets/posts/best-wp-form/fluentforms-lighthouse.png "Fluent Forms Lighthouse Performance and Accessibility result")

## Accessibility in Fluent Forms

The simple form with Fluent Forms fails due to accessibility issues. 

> 🚨 Background and foreground colors do not have a sufficient contrast ratio.

The problem seems to be low contrast on the default submit button. You can easily fix this by making sure the button text color and background color are different enough to be easily readable. For example, a black background with white text would be much easier to read than a light blue background with white text. To know for sure, you can use this [contrast checker.](https://webaim.org/resources/contrastchecker/)

![Fluent Forms inaccessible button](/blog/assets/posts/best-wp-form/ff-button.png "Fluent Forms inaccessible button")

The generated form can be navigated using the `Tab` key, and fields have proper `aria` attributes.

## Performance impact of Fluent Forms

Our contact form with Fluent Forms increased the number of network requests by 37%. A noticeable but negligible increase is in the time it takes to load DOM content. The form adds 21ms to the load time.

| Before Fluent Forms                                                                                                 	| After Fluent Forms                                                                                                  	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 19 requests<br>1.2 MB transferred<br>1.5 MB resources<br>Finish: 226 ms<br>DOMContentLoaded: 183 ms<br>Load: 203 ms 	| Requests: 37%<br><br><br><br>DOMContentLoaded: 35% 	|

## Spam protection in Fluent Forms

Fluent Forms comes with [a couple of spam filtering options](https://www.oopspam.com/blog/spam-protection-for-fluent-forms) in the free version. These are

- reCaptcha
- hCaptcha
- Turnstile
- Honeypot

We talked about the performance impact of these solutions above in the WS Form section. So, let me enable Turnstile and see how it affects page speed.

| Before Turnstile enabled [Fluent Forms]                                                                             	| After Turnstile enabled [Fluent Forms]                                                                              	| Increase                                                         	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|------------------------------------------------------------------	|
| 19 requests<br>1.2 MB transferred<br>1.5 MB resources<br>Finish: 226 ms<br>DOMContentLoaded: 183 ms<br>Load: 203 ms 	| 30 requests<br>1.9 MB transferred<br>2.3 MB resources<br>Finish: 1.84 s<br>DOMContentLoaded: 339 ms<br>Load: 638 ms 	| Requests: 40%<br><br><br><br>DOMContentLoaded: 59%<br>Load: 103% 	|

Here we see a significant increase in the time to load the website from 226 ms to 1.84 s, which is also reflected in the load time with a 103% increase.

# 3. WPForms

WPForms has been around for a long time and is quite popular with their free plugin. (Though they do also have a pro version to offer.) [WPForms contact form plugin](https://wordpress.org/plugins/wpforms-lite/) has a massive active installation count of over 5 million. They have over 1300+ pre-built form templates—that's right, 1300! It is also beginner friendly.

We again built a basic form with WPForms and ran the test.

![WPForms Lighthouse Performance and Accessibility Result](/blog/assets/posts/best-wp-form/wpform-lighthouse.png "WPForms Lighthouse Performance and Accessibility Result")

## Accessibility in WPForms

Based on the initial analysis, WPForms passes all accessibility checks offered by Lighthouse.

The form has proper `aria` attributes and can be navigated using only the `Tab' key.

## Performance impact of WPForms

Surprisingly, the amount of __network requests increased by 55%__. The page load time increased by an additional 137 ms, while the DOM content load time more than doubled.

| Before WPForms                                                                                                      	| After WPForms                                                                                                       	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 23 requests<br>1.3 MB transferred<br>1.6 MB resources<br>Finish: 292 ms<br>DOMContentLoaded: 246 ms<br>Load: 265 ms 	| Requests: 55%<br><br><br><br>DOMContentLoaded: 63% 	|

## Spam protection in WPForms

[WPForms comes with many spam protection tools already built in for you](https://www.oopspam.com/blog/spam-protection-for-wpforms). It offers more options than others in the Pro version. These are spam filtering tools you have in the free version:

- Token based spam protection
- hCaptcha
- Turnstile

These are available for free in WPForms Lite version, but you can enable custom captcha features as well as country and keyword filters by upgrading to the Pro version. 

Let's enable the lightest solution Turnstile among the above options and see how it affects our website performance.

| Before Turnstile enabled [WPForms]                                                                                  	| After Turnstile enabled [WPForms]                                                                                   	| Increase                                                       	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------------------	|
| 23 requests<br>1.3 MB transferred<br>1.6 MB resources<br>Finish: 292 ms<br>DOMContentLoaded: 246 ms<br>Load: 265 ms 	| 35 requests<br>1.9 MB transferred<br>2.4 MB resources<br>Finish: 1.64 s<br>DOMContentLoaded: 257 ms<br>Load: 445 ms 	| Requests: 41%<br><br><br><br>DOMContentLoaded: 4%<br>Load: 50% 	|

One noticeable change is showing resources have increased from 1.6 MB to 2.4 MB and __web page loading time has increased by 50%__.

# 4. Formidable Forms

Another popular form builder is [Formidable Forms](https://wordpress.org/plugins/formidable/). It has over 300,000 active installations. The Lite version includes unlimited forms, Stripe integration, 33 free premade templates (unlike others it requires you to provide an email). I found the features in the free version a bit limited compared to other popular form builder plugins.

![Formidable Forms Lighthouse Performance and Accessibility result](/blog/assets/posts/best-wp-form/ff-lighthouse.png "Formidable Forms Lighthouse Performance and Accessibility result")

## Accessibility in Formidable Forms

Like Fluent Forms, Formidable Forms fails the Lighthouse accessibility check. Three elements on our simple form have an inadequate ratio of background to foreground color.

> The background and foreground colors do not have a sufficient contrast ratio.

You can easily fix this by making sure that the button text color and the background color are different enough to be easily readable. For example, a black background with white text would be much easier to read than a light blue background with white text.

![Formidable Forms inaccessible button](/blog/assets/posts/best-wp-form/ff-inaccessible-elements.png "Formidable Forms inaccessible button")

The generated form can be navigated using the `Tab` key, and fields have proper `aria` attributes and labels.

## Performance impact of Formidable Forms

Now that we have created a simple contact form with Formidable Forms, lets see how it affects website speed. It doesn't seem that Formidable Forms has much of an impact on website performance. A slight increase in the number of network requests and an additional delay of 33 ms on the page load time.

| Before Formidable                                                                                                   	| After Formidable                                                                                                    	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 18 requests<br>1.2 MB transferred<br>1.5 MB resources<br>Finish: 235 ms<br>DOMContentLoaded: 198 ms<br>Load: 215 ms 	| Requests: 32%<br><br><br><br>DOMContentLoaded: 16% 	|

## Spam protection in Formidable Forms

[Formidable Forms offers similar anti-spam tools](https://www.oopspam.com/blog/spam-protection-for-formidable). However, it has a unique anti-spam feature others don't. This is blocking spam using [WordPress's built-in _Comment Moderation_](https://www.oopspam.com/blog/spam-protection-for-formidable#using-wordpresss-comment-moderation). Add URLs, IPs or any spam words (per line) to this field in _WordPress Settings -> Discussion Page -> Disallowed Comment Keys_. Formidable Forms will then check each post against this list and block it if it matches.

- reCaptcha
- hCaptcha
- Token-based spam protection
- Honeypot

As you can see from the above list, unfortunately it doesn't support Turnstile. So we will use hCaptcha instead. I have already done performance analysis of hCaptcha [in another post](https://www.oopspam.com/blog/hcaptcha-performance-analyses) using a simple HTML contact form. On a plain HTML page, hCaptcha had a significant impact on page load time. Let's see how it works with WordPress and Formidable Forms.

| Before hCaptcha enabled [Formidable Forms]                                                                          	| After hCaptcha enabled [Formidable Forms]                                                                           	| Increase                                                                                     	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------------------------------------------------	|
| 18 requests<br>1.2 MB transferred<br>1.5 MB resources<br>Finish: 235 ms<br>DOMContentLoaded: 198 ms<br>Load: 215 ms 	| 27 requests<br>2.7 MB transferred<br>3.9 MB resources<br>Finish: 560 ms<br>DOMContentLoaded: 203 ms<br>Load: 468 ms 	| Requests: 40%<br>Transferred: 76%<br>Resources: 88%<br><br>DOMContentLoaded: 2%<br>Load: 74% 	|

The DOM content loading time is similar to the number before enabling hCaptcha. However, massive increase in loaded resources. Since hCaptcha loads several JavaScript files, this is reflected in the increase of data transfers and resources. Both increase by 76% and 88% respectively.

# 5. Forminator

More than 500,000 active installations. [Free version](https://wordpress.org/plugins/forminator/) with many features. This is Forminator form builder plugin for you. It comes with lots of third party integration including payment integration with Paypal and Stripe in its free version. That being said, Forminator lacks pre-built templates. There are only 5 basic templates compared to other form builders.

![Forminator Forms Lighthouse Performance and Accessibility Result](/blog/assets/posts/best-wp-form/formi-lighthouse.png "Forminator Forms Lighthouse Performance and Accessibility Result")

## Accessibility in Forminator

The Lighthouse shows no problems for our Forminator contact form. All fields have proper `aria` attributes, labels, placeholders, error handling, and can be navigated using only the `Tab` key.

## Performance impact of Forminator

A noticeable change in the number of network hits. It increased by 63%. Total page speed increased by only 39ms. Forminator seems to have an insignificant performance impact on our site.

| Before Forminator                                                                                                   	| After Forminator                                                                                                    	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 25 requests<br>1.3 MB transferred<br>1.8 MB resources<br>Finish: 248 ms<br>DOMContentLoaded: 170 ms<br>Load: 221 ms 	| Requests: 63%<br><br><br><br>DOMContentLoaded: 28% 	|

## Spam protection in Forminator

Forminator comes with [three built-in options](https://www.oopspam.com/blog/spam-protection-for-forminator). Unfortunately it lacks native support for Turnstile. We will do our performance testing with hCaptcha.

- Honeypot
- hCaptcha
- reCaptcha

We know that hCaptcha and reCaptcha [have a big impact on page speed](https://www.oopspam.com/blog/hcaptcha-performance-analyses). This is expected from client-side solutions because they need to load javascript files, use cookies to track users, perform calculations, and send HTTP requests. Let's add hCaptcha to our Forminator form and see the impact.

| Before hCaptcha enabled [Forminator]                                                                                	| After hCaptcha enabled [Forminator]                                                                                 	| Increase                                                                                      	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|-----------------------------------------------------------------------------------------------	|
| 25 requests<br>1.3 MB transferred<br>1.8 MB resources<br>Finish: 248 ms<br>DOMContentLoaded: 170 ms<br>Load: 221 ms 	| 36 requests<br>2.7 MB transferred<br>4.2 MB resources<br>Finish: 870 ms<br>DOMContentLoaded: 328 ms<br>Load: 355 ms 	| Requests: 40%<br>Transferred: 70%<br>Resources: 80%<br><br>DOMContentLoaded: 63%<br>Load: 46% 	|


While the general load time only increased by 46% from 221ms to 355ms, the resources added by the hCaptcha integration are massive, from 1.8 MB to 4.2 MB, an increase of 80%. The number of network requests is also nearly doubled.


# 6. Gravity Forms

Another popular premium form builder. [Gravity Forms](https://www.gravityforms.com/) does not have a free version. To get your hands on Gravity Forms, you need a license. Currently it comes with 3 paid plans, Basic for 1 site, Pro for 3 sites and Elite for unlimited sites. Features are limited depending on the plan you use. For example, the Basic plan includes conditional logic, multi-page forms, and file uploads. As the name suggests, it is for basic use and for a single website. Even the Basic plan comes with many add-ons. Some Pro add-ons are only included in the Pro and Elite plans such as Stripe, Slack, Zapier integrations.

![Gravity Forms Lighthouse Performance and Accessibility Result](/blog/assets/posts/best-wp-form/gravity-lighthouse.png "Gravity Forms Lighthouse Performance and Accessibility Result")

## Accessibility in Gravity Forms

Similar to Fluent Forms, Gravity Forms' default contact form fails an accessibility check: Low contrast ratio. As you can see in the screenshot above, some text like _0 of 600 max characters_, _(Required)_, _Please let us know what's on your mind. Got a question for us? Ask away._ are too bright and don't play well with a background color. However, you can change these colors to be more accessible. This text is also too small (13px), [it is recommended](https://accessibility.digital.gov/visual-design/typography/#:~:text=Steps%20to%20take,length%20that%20promotes%20comfortable%20reading) to make the font size 16px or 14px depending on the font family.

## Performance impact of Gravity Forms

Once you enable Gravity Forms on your page, the number of network requests increases by 84%, an additional 19 requests. The changes in resources, load time are relatively small.

| Before Gravity Forms                                                                                                	| After Gravity Forms                                                                                                 	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 32 requests<br>1.3 MB transferred<br>2.0 MB resources<br>Finish: 246 ms<br>DOMContentLoaded: 210 ms<br>Load: 225 ms 	| Requests: 84%<br><br><br><br>DOMContentLoaded: 48% 	|

## Spam protection in Gravity Forms

This is where Gravity Forms really shines. It [has many options](https://www.oopspam.com/blog/spam-protection-for-gravity-forms) for spam filtering. Although only reCaptcha and Honeypot are natively supported. The other options require add-ons to be installed. All spam protection is available under the Basic plan. Here are some of them:

- Honeypot
- reCaptcha
- Custom captcha with conditional logic
- hCaptcha (add-on)
- Turnstile (add-on)

In [our previous article](https://www.oopspam.com/blog/spam-protection-for-gravity-forms#custom-captcha-using-conditional-logic) we used conditional logic to create a simple custom captcha. This is another approach where you do not need to install an add-on.

Let's configure the invisible version of reCaptcha and see how it affects the performance of Gravity Form on our page.

| Before reCaptcha enabled [Gravity Forms]                                                                            	| After reCaptcha enabled [Gravity Forms]                                                                             	| Increase                                                                                      	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|-----------------------------------------------------------------------------------------------	|
| 32 requests<br>1.3 MB transferred<br>2.0 MB resources<br>Finish: 246 ms<br>DOMContentLoaded: 210 ms<br>Load: 225 ms 	| 41 requests<br>2.5 MB transferred<br>4.1 MB resources<br>Finish: 750 ms<br>DOMContentLoaded: 203 ms<br>Load: 398 ms 	| Requests: 24%<br>Transferred: 63%<br>Resources: 68%<br><br>DOMContentLoaded: 63%<br>Load: 55% 	|

As expected, a large increase in resources of 2.1 MB more resources are loaded. The load time more than doubled. Compared to other form builders, Gravity Forms' reCaptcha implementation seems to be better as overall not a huge spike in numbers.

# 7. Ninja Forms

[Ninja Forms Lite](https://wordpress.org/plugins/ninja-forms/) is the most popular of all paid form builders with over 800,000 active installations. It is known to be beginner friendly. The free version comes with over 27 field types, calculations. Unfortunately, some key features like conditional logic, multi-step forms, all payment integrations like Stripe are part of the Pro plan.

![Ninja Forms Lighthouse Performance and Accessibility result](/blog/assets/posts/best-wp-form/ninja-lighthouse.png "Ninja Forms Lighthouse Performance and Accessibility result")

## Accessibility in Ninja Forms

As you can see in our simple Ninja Form above, the text color (_My Name_) has low contrast. It is light gray and difficult to read for many people. This is a default form that comes with Ninja Forms. However, you can change this color and make it more accessible for everyone.

One major concern is that the form is not fully navigable using the `Tab` key. If you try to navigate the form with the `Tab` key, it will go through the fields but skip the _Submit_ button.

That said, unlike others, Ninja Forms has better error handling with green, red icons in additional text based error both under each field and bottom of the form.

![Ninja Forms example](/blog/assets/posts/best-wp-form/ninja-forms.png "Ninja Forms example")

## Performance impact of Ninja Forms

Ninja Forms doesn't have much of an impact on your website's load time in its raw form. Our basic form increased page content load time by 60ms and increased network requests from 13 to 22.

| Before Ninja Forms                                                                                                  	| After Ninja Forms                                                                                                   	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 22 requests<br>1.3 MB transferred<br>1.8 MB resources<br>Finish: 265 ms<br>DOMContentLoaded: 193 ms<br>Load: 228 ms 	| Requests: 51%<br><br><br><br>DOMContentLoaded: 40% 	|

## Spam protection in Ninja Forms

Ninja Forms comes with a number of options, but it is also missing a couple of important integrations. Ninja Forms offers the following anti-spam features:

- Honeypot
- reCaptcha
- Question - Answer

This is it. There is no Turnstile, hCaptcha support. However, you can install the official hCaptcha WordPress plugin. It supports Ninja Forms. 

Lets enable reCaptcha and see how Ninja Forms performs.

| Before reCaptcha enabled [Ninja Forms]                                                                              	| After reCaptcha enabled [Ninja Forms]                                                                               	| Increase                                                                                     	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------------------------------------------------	|
| 22 requests<br>1.3 MB transferred<br>1.8 MB resources<br>Finish: 265 ms<br>DOMContentLoaded: 193 ms<br>Load: 228 ms 	| 32 requests<br>2.5 MB transferred<br>3.9 MB resources<br>Finish: 994 ms<br>DOMContentLoaded: 195 ms<br>Load: 599 ms 	| Requests: 37%<br>Transferred: 63%<br>Resources: 73%<br><br>DOMContentLoaded: 1%<br>Load: 89% 	|

After activating reCaptcha v3, we can see the increase in resources. It increased by 63%. Another noticeable change is increase in loading time of a website by 89%. This added additional 371 ms to the website speed.


# 8. Contact Form 7

The most popular contact form builder for WordPress. It has over 5 million active installations. Contact Form 7 is easy to use and a great choice for a simple form. If all you need is a simple form where you get submissions via email, then this is the plugin you are looking for.

It doesn't store submissions, doesn't integrate with external services, and doesn't use cookies. I expect the plugin to be super fast considering our minimum requirements. However, you can add spam protection, store submissions via third party plugins. Some integrations like Stripe, reCaptcha, Akismet are built in, but you have to set them up.


![Contact Form 7 Lighthouse Performance and Accessibility Result](/blog/assets/posts/best-wp-form/cf7-lighthouse.png "Contact Form 7 Lighthouse Performance and Accessibility Result")

## Accessibility in Contact Form 7

As expected, Contact Form 7 achieves a perfect score with 26 out of 26 passed accessibility checks. The form can be navigated with the `Tab` key without any problems. The generated form has appropriate `aria` attributes and labels. The field errors appear both below each field and at the bottom of the form.

## Performance impact of Contact Form 7

Because Contact Form 7 is the simplest, minimalist, fastest form builder you can get. This is also reflected when I did the test.

| Before Contact Form 7                                                                                               	| After Contact Form 7                                                                                                	| Increase                                           	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------	|
| 13 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 209 ms<br>DOMContentLoaded: 128 ms<br>Load: 182 ms 	| 17 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 208 ms<br>DOMContentLoaded: 165 ms<br>Load: 183 ms 	| Requests: 26%<br><br><br><br>DOMContentLoaded: 25% 	|


No additional resources are required. Only 25% increase in content loading time. The number of network requests also increases slightly from 13 to 17.

## Spam protection in Contact Form 7

While you can use third-party anti-spam plugins to protect your Contact Form 7, it natively supports only the following solutions

- Akismet
- reCaptcha

Let's add reCaptcha to our form and see how our basic form performs.

| Before reCaptcha enabled [Contact Form 7]                                                                           	| After reCaptcha enabled [Contact Form 7]                                                                            	| Increase                                                                                      	|
|---------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------------------------------------	|-----------------------------------------------------------------------------------------------	|
| 17 requests<br>1.2 MB transferred<br>1.3 MB resources<br>Finish: 208 ms<br>DOMContentLoaded: 165 ms<br>Load: 183 ms 	| 31 requests<br>2.4 MB transferred<br>3.5 MB resources<br>Finish: 827 ms<br>DOMContentLoaded: 197 ms<br>Load: 495 ms 	| Requests: 58%<br>Transferred: 66%<br>Resources: 91%<br><br>DOMContentLoaded: 17%<br>Load: 92% 	|


Unfortunately, after adding reCaptcha to Contact Form 7, it looks worse than other plugins. The biggest increases were in resources and load time. Both increased by 91%. Another noticeable increase was in the time (_Finish_) the browser needed to make requests and handle resources. reCaptcha added an additional 619 ms.


# Result

In this post, I did performance and accessibility analysis using Google's Lighthouse. These numbers may be different for you depending on what integration, hosting you use. There are other factors like caching, plugins, image optimization and so on. I touched on this topic in the article [Why is your WordPress website slow?](https://www.oopspam.com/blog/slow-wordpress-website).

Now that we have all the numbers, let's put them together and draw some conclusions.

General performance metrics with a simple three field form. No spam protection, third party plugins enabled.

| Form builder     	| Network request 	| Transferred data 	| Resources 	| Finished 	| DOMContentLoaded 	| Loaded 	|
|------------------	|-----------------	|------------------	|-----------	|----------	|------------------	|--------	|
| WS Form          	| 18              	| 1.3 MB           	| 1.6 MB    	| 218 ms   	| 150 ms           	| 192 ms 	|
| Fluent Forms     	| 19              	| 1.2 MB           	| 1.5 MB    	| 226 ms   	| 183 ms           	| 203 ms 	|
| WPForms          	| 23              	| 1.3 MB           	| 1.6 MB    	| 292 ms   	| 246 ms           	| 265 ms 	|
| Formidable Forms 	| 18              	| 1.2 MB           	| 1.5 MB    	| 235 ms   	| 198 ms           	| 215 ms 	|
| Forminator       	| 25              	| 1.3 MB           	| 1.8 MB    	| 248 ms   	| 170 ms           	| 221 ms 	|
| Gravity Forms    	| 32              	| 1.3 MB           	| 2.0 MB    	| 246 ms   	| 210 ms           	| 225 ms 	|
| Ninja Forms      	| 22              	| 1.3 MB           	| 1.8 MB    	| 265 ms   	| 193 ms           	| 228 ms 	|
| Contact Form 7   	| 17              	| 1.2 MB           	| 1.3 MB    	| 208 ms   	| 165 ms           	| 183 ms 	|


According to the table above, the fastest form builder is __Contact Form 7__. But considering that you may need more features, your second best option is __WS Form__ and __Formidable Forms__.

Result:

1. Contact Form 7
2. WS Form
3. Formidable Forms

Overall result with spam protection enabled (reCaptcha, hCaptcha or Turnstile)

> Turnstile is relatively lighter than reCaptcha and hCaptcha.

| Form builder     	| Spam Protection solution 	| Network request 	| Transferred data 	| Resources 	| Finished 	| DOMContentLoaded 	| Loaded 	|
|------------------	|--------------------------	|-----------------	|------------------	|-----------	|----------	|------------------	|--------	|
| WS Form          	| Turnstile                	| 30              	| 1.9 MB           	| 2.5 MB    	| 4.36 s   	| 180 ms           	| 337 ms 	|
| Fluent Forms     	| Turnstile                	| 30              	| 1.9 MB           	| 2.3 MB    	| 1.84 s   	| 339 ms           	| 638 ms 	|
| WPForms          	| Turnstile                	| 35              	| 1.9 MB           	| 2.4 MB    	| 1.6 s    	| 257 ms           	| 445 ms 	|
| Formidable Forms 	| hCaptcha                 	| 27              	| 2.7 MB           	| 3.9 MB    	| 560 ms   	| 203 ms           	| 468 ms 	|
| Forminator       	| hCaptcha                 	| 36              	| 12.7 MB          	| 4.2 MB    	| 870 ms   	| 328 ms           	| 355 ms 	|
| Gravity Forms    	| reCaptcha                	| 41              	| 2.5 MB           	| 4.1 MB    	| 750 ms   	| 203 ms           	| 398 ms 	|
| Ninja Forms      	| reCaptcha                	| 32              	| 2.5 MB           	| 3.9 MB    	| 994 ms   	| 195 ms           	| 599 ms 	|
| Contact Form 7   	| reCaptcha                	| 31              	| 2.4 MB           	| 2.5 MB    	| 827 ms   	| 197 ms           	| 495 ms 	|


In general, the fastest form builder with at least one anti-spam feature is WPForms. Here are the overall rankings:

1. WPForms
2. Fluent Forms
3. Gravity Forms

Considering that Turnstile is a bit lighter than reCaptcha and hCaptcha. If we group hCaptcha and reCaptcha, we get the following rankings

1. Gravity Forms
2. Ninja Forms
3. Contact Form 7


This concludes our performance analysis. Before we close this article, let's look at some questions.

# What is the fastest form builder for WordPress?

The fastest form builder is Contact Form 7. But it is a minimalist contact form builder and may not have features you like to use. WS Form and Formidable Forms are other options that are fast and come with rich features.

# What is the fastest form builder with spam protection enabled for WordPress?

WPForms is the fastest when used with Turnstile. Other lightweight plugins are Fluent Forms and Gravity Forms.

# What is the fastest spam protection for WordPress?

All client-side spam protection solutions including reCaptcha, hCaptcha, Turnstile will slow down your website. This is because they load JavaScript files, use cookies. If you need to use one of them, Turnstile has slightly less impact on your site. To avoid this problem, use a backend based spam protection like [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/). OOPSpam has zero impact on your site speed. More about Turnstile check out: [What No One Tells You About Cloudflare Turnstile](https://www.oopspam.com/blog/cloudflare-turnstile).


<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 10px;
  margin-bottom: 1em;
}
</style>