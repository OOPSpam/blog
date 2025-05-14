---
layout: post
title: 7 ways to stop spam on your website
date: 2025-05-14T12:08:00.000Z
author: onar
image: /blog/assets/ways-to-stop-spam.png
description: Prevent spam on your website with Honeypot, Spam Words, Captcha,
  IP-based filtering, country/language restrictions, AI, and rule-based methods.
tags:
  - spam
  - contact_form
---
<center>
<img loading="lazy"  width="772" style="height: 200px;object-fit: cover;" alt="OOPSpam illustration" src="/blog/assets/ways-to-stop-spam.png">
</center>
<br/>

Feeling overwhelmed by the amount of spam you are getting on your website? You're not alone.

This article doesn't list every spam detection strategy under the sun.

Instead, it lists some of the tactics we use at [OOPSpam](https://www.oopspam.com) and many more proven to work ones. These are methods that stopped over 3.5M spam with 99.8% accuracy.

Let's get to it

{% include toc.md %}

## Honeypot: filter spam with a hidden field

It is the oldest trick in the book. The honeypot technique is easy to understand and implement. It works both for forms and comments. Here is a simple illustration that shows how honeypot spam filtering works.

![How honeypot spam filtering works](/blog/assets/posts/ways-to-stop-spam/honeypot.png "How honeypot spam filtering works")

A spam bot submits a form by making sure that every field or at least the ones that are required is filled so, no form validation prevents it from submitting. The honeypot technique relies on this assumption.

> 🎯 Many people use honeypot technique and get near-zero spam. As your website gets more traffic or for some reason your website ends up in a spammer's database, you may get hit by more "serious" bots which could easily bypass honeypot. Remember, honeypot tactic won't work against manually submitted spam by human.

Implementation

1. Create a form with fields (name, email, etc.)
2. Include a hidden field(s)
3. Check in your backend, if the hidden field is NOT empty then it is spam
4. Done! 🎉

Make sure to hide the field properly. Bots can detect which field is hidden and avoid filling it.

ℹ️ Here are few tricks to make it harder:

1. Do NOT use display:none, instead hide them by pushing them out of a screen or applying opacity: 0; position: absolute; to the field. Be aware of accessibility issues.
2. Do NOT use obvious class names like hidden, invisible
3. Do NOT use obscure field names for hidden fields. Use email, name, phone, etc. instead.

and here is one way to do it:

<p class="codepen" data-height="265" data-theme-id="dark" data-default-tab="html,result" data-user="oopspam" data-slug-hash="YzZOaYv" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Contact Form with honeypot">
  <span>See the Pen <a href="https://codepen.io/oopspam/pen/YzZOaYv">
  Contact Form with honeypot</a> by OOPSpam (<a href="https://codepen.io/oopspam">@oopspam</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

## Spam Words: check content for malicious words

All spam messages want you to do something for them. Let it be SEO, Website development offers, selling, and advertising products. That means they tend to use the same words such as "free", "get it now", "100%", "SEO".

![Spam words cloud](/blog/assets/posts/ways-to-stop-spam/spam-word-cloud.png "Spam words cloud")

Of course one can argue that these words could certainly be used in legitimate messages, and they do appear. So, how effective is it to flag a message as spam based on spam words?

In our experience, it depends on how you implement it. It is important that:

1. You look for a combination of words instead of a single word. Such as "get it now" instead of "get".
2. Consider a threshold for the number of spam words in the content.
3. Consider the frequency of spam word in a content

Take a look at some of the spam words [we published](https://github.com/OOPSpam/spam-words).

## Captcha: Solve an interactive problem

You are presented with a puzzle, math problem, or simple game to complete. Once you complete the task you are allowed to submit a comment or purchase a product.

Captcha techniques usually work two way:

1. Forces bots and humans to wait a certain time (aka rate-limiting) by solving a puzzle.
2. Tracking a user behavior and decide if it is a bot
3. A simple problem that only humans can solve (text-based).

While the third option still in use, it is not sufficient anymore. Bots got better and can easily solve math problems and read obscure letters nowadays.

![Different CAPTCHA examples](/blog/assets/posts/ways-to-stop-spam/captcha.png "Different CAPTCHA examples")

The most widely used and still somehow reliable approach is to represent an interactive puzzle, game-like captcha. This is a combination of both the first and second CAPTCHA types. There is a good chance you have already seen these types of captchas. The idea behind this is that while you are busy solving a puzzle, the CAPTCHA collects certain information about your behavior like mouse movement on a website and browsing history. The bots don't like to wait for a few seconds. They have to move to the next website and act fast to submit spam as many websites as possible.

Combined your website behavior and browsing history information with a couple of seconds waiting time results in the final decision about the user (spam or not).

The most notable CAPTCHA solution is [reCaptcha](https://developers.google.com/recaptcha/) and [hCaptcha](https://www.hcaptcha.com/) (offers better privacy).

> 🎯 Captchas tend to have accessibility, privacy and performance issues. As CAPTCHAs load script (JS files) on your front end, they may [slow down your website](https://www.oopspam.com/blog/recaptcha-performance-analyses).

## IP-based filtering: check for blocked spammer IPs

There are services such as [Spamhaus](https://www.spamhaus.org/) that keep a list of known spammer IPs. Spammers change their IPs often to avoid being blocked. However, blocking based on an IP is still a powerful way to block spam that is because a wide range of websites reports these IPs to these services.

At OOPSpam, we receive thousands of spammer IPs every day. From our experience, over 60% of spam are detected solely based on IP. That being said relying entirely on an IP-based filtering may not be the best protection.

> 🎯 Keep in mind that some legitimate users may use VPNs or proxies which tend to be used by spammers as well. That is why you may unintentionally restrict legitimate visitors.

## Country and Language restriction

It is a simple and yet robust way to filter spam from your website. There are two approaches for this:

1. Using DNS based solutions like Cloudflare that could block access to your website from selected countries 
2. Allow visitors from every country to view your website but restrict submissions (contact form, comment, etc.) only.

Both approaches work great but if you want to be open to every country then the second option is the way to go.

![Flags](/blog/assets/posts/ways-to-stop-spam/flags.png "Flags")

Another less known way to block spam is by languages. Similar to country restriction, by simply allowing submission in a certain language. If you expect comments on your website to be in English, letting comments only in English through could potentially eliminate unnecessary work.

With OOPSpam API, we implemented three options:

Allow messages only in selected languages
Block messages from specific countries
Allow messages only from selected countries

## Machine Learning to filter spam content

This is a more advanced solution that can be hard to implemented and most importantly find a proper data set to train an ML algorithm.

Filtering spam using ML is a rather well-documented process especially with Bayesian Filtering, however, if you want a good result (high accuracy) then you need to have a well-defined and clean data set which may be hard to find.

That being said no matter how good the data set is, spammers also get better at customizing their messages. Especially with the recent development with OpenAI's [GPT-5](https://beta.openai.com/) shows that AI can generate genuine-looking, human-like, custom messages. This could make spam detection using Machine Learning algorithms harder.

## Rule-based spam filtering

Rule-based spam filtering is static and predefined rules to catch spam. It's one of the simplest forms of spam filtering. This technology has been around since spam started appearing in our email inboxes. One notable example of a rule-based spam filter is Spam Assassin for emails.

![Traffic light](/blog/assets/posts/ways-to-stop-spam/rules.png "Traffic light")

The more you deal with spammers, the more you learn how they operate and what are the common patterns. Besides the above-listed tactics, there are many other small ways to detect spam. Sometimes, these rather insignificant rules spot spam before it reaches other more advanced analyses.

Technically, some of the mentioned methods in this article can be categorized as rule-based such as country & language restriction, honeypot, spam words.

Here are some easy-to-implement rules you could consider (besides the ones above):

* URLs in a spam message

Many spam messages have URL(s) to get you to click on them. Does a message has a URL in it? It could be spam. Be careful with this though, you may end up blocking legitimate messages. It is important to check the reputation of URLs instead of flat-out blocking them. You could use WOT or Safe Browsing for this.

* URL shortening services

We are all seen URL shortening services that are used by spammers.

Although not all URL shortening services are malicious. Some shortening services are for local use only, meaning they are not open to the public. For example, when you generate a short URL for your Dropbox image or Google Docs. So, be aware of this fact when you set a rule.

> 🎯 A rule-based spam filtering is a powerful alternative to stop spam. It has been used for decades, but make sure you reconsider your rules once in a while to avoid flagging legitimate messages.

## **OOPSpam: A Smarter Combination of All**

All the techniques above can help—but none are foolproof. Spam tactics change fast, and what works today might fail tomorrow. That’s why at OOPSpam, we’ve been refining our models since 2017 to keep up.

Instead of relying on one approach, we combine multiple proven strategies into a single, powerful API. We skip honeypots—modern bots can easily bypass them—and focus on smarter, more reliable protection:

* Spam detection that considers key patterns and abuse signals
* [Contextual analysis](https://www.oopspam.com/blog/introducing-contextual-spam-detection) that helps flag spam when only the message body is available (no IP/email)
* IP & network reputation checks based on real-time data
* Language and [country restrictions](https://www.oopspam.com/blog/filter-spam-by-country) you can customize
* Machine learning that continuously adapts to evolving spam tactics
* Rule-based filtering for URLs, shortlinks, and common abuse patterns

It’s automatic. It’s accurate. And it works quietly in the background. You won’t need to configure captchas, maintain blacklists, or tweak form settings.

## Final thoughts

There isn't a single solution for the spam problem. Spam messages on the web are different from spam in emails. To encounter them we need to use multiple approaches.

Most of these tactics we already use at [OOPSpam](https://www.oopspam.com) and found them very effective when used in combination.

Happy spam-free day!
