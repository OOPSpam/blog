---
layout: post
title:  "3 top open-source comment systems and their anti-spam capabilities"
author: "Onar A."
image: /assets/open-source-comment-systems.png
tags: [comment, spam]


description: "Learn about 3 different open-source & free comments systems and how they protect from spam."
# modified: 
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img loading="lazy"  width="772" alt="Open-source comment systems and their anti-spam capabilities" src="/blog/assets/open-source-comment-systems.png">
</a>
</center>
<br/>

We're going to talk about different commenting systems and how they fight spam.	

Believe me: I have read a lot about commenting systems. Well, we run [an anti-spam API](https://www.oopspam.com) service and they are an essential part of our product as many requests to the OOPSpam anti-spam API come from comment systems.

At first I thought about writing an article about how to integrate a spam filter into one of these open source comment systems. Then I was convinced that it would be more helpful to make a nice list of open source (and free) comment systems and describe how they fight spam.

There are a lot of options, some serve a lot of ads on your blog, some collect as much data as possible about your visitors. Some require registration, some don't. I will list a few good ones, you can of course go ahead and check their functionality on their website or various blogs. But this blog post will talk about how they approach spam protection in their system.

{% include toc.md %}

## Open-source and free comment systems

### [Isso](https://posativ.org/isso/)

Isso is open source, self-hosted, and completely free. It comes out as "a commenting server similar to Disqus". Instead of writing a long paragraph, I'll list the main points: 

- It's written in Python
- Supports all major browsers including IE10 (yes, people still use it)
- Comments support Markdown
- Admin panel to moderate comments
- Works with SQLite database
- Supports Disqus & WordPress import
- Small size 40kb (12kb gzipped)
- Basic spam protection

![Isso comment system](/blog/assets/posts/Isso_comment_system.png "Isso comment system")

Why choose Isso as your commenting system?

- No ads, no tracking
- Open source, free and self-hosted
- Allows anonymous comments
- Fast and lightweight

#### Spam Filtering in the Isso Comment System

Now let's talk more about anti-spam features. Isso comes with basic built-in spam protection. There is no content or IP analysis. The only way to protect yourself is to have a rate limit per IP. Let's say 2 comments per minute. This is the place where you could also require email, author and email fields so no more anonymous comments.
You can enable these limits in your config file (e.g. isso.conf) by adding the *Guard* parameter with the appropriate fields:

```config
[guard]
enabled = true
ratelimit = 2
direct-reply = 3
reply-to-self = false
require-author = false
require-email = false
```
Read more about *Guard* parameters in [the official Isso documentation](https://posativ.org/isso/docs/configuration/server/#guard).

### [Schnack](https://schnack.cool/)

Here is another alternative to paid commenting systems. Like Isso, Schnack is an open source, free, self-hosted commenting system. Here are the main features:

- Written in Javascript (Node.js)
- Really small package, 8KB
- Does not allow anonymous comments
- Supports third party authentication (Github, Twitter, etc.)
- Works with SQLite database
- Admin panel to moderate comments
- No explicit spam protection, requires authentication
- Supports Disqus & WordPress import

![Schnack comment system](/blog/assets/posts/schnack_comment_system.png "Schnack comment system")

Why choose Schnack for your commenting system?

- No ads, no tracking
- Open source, free & self-hosted
- Integration with third party authentication services (Github, Twitter, Google and Facebook)
- Trusted list (a way to allow some people to comment without admin approval)
- Fast and lightweight

As you can see, Schanck and Isso are pretty similar in that they are both self-hosted, open source, and free. So it is hard to say why someone would choose one over the other. However, there are some differences such as Schanck's backend is based on Node.js while Isso's is based on Python. Schanck is smaller in terms of package size. While Isso supports anonymous comments, Schanck doesn't.

#### Spam Filtering in the Schanck Comment System

The author of Schanck answers this concern in [his blog post](https://web.archive.org/web/20230220195955/https://www.vis4.net/blog/2017/10/hello-schnack/).  

![Spam protection for Schanck comment system](/blog/assets/posts/schnack_anti_spam.png "Spam protection for Schanck comment system")

Since Schnack doesn't support anonymous commenting and requires you to sign up through one of the third-party providers, this prevents spambots from commenting on your blog. But spammers are not always spambots. Many spammers are real people. There are services where you can hire people very cheaply ($1 per hour) to spam. For these types of spammers, there is not much you can do with third-party authentication.

### [Remark42](https://remark42.com/)

Remark42 looks quite promising. It is self-hosted and lightweight. The backend is written in Go and the frontend in Node.js. 
Remark42 supports anonymous commenting, social login through Twitter, Github, etc, voting, moderating comments, and a bunch of other features. I would say Remark42 has it all and more than all 2 options above.  Check out [the official website](https://remark42.com/) for the full list of features.

![Remark42 comment system](/blog/assets/posts/remark42_comment_system.png "Remark42 comment system")

#### Spam filtering in the Remark42 comment system

Because Remark42 allows optional anonymous commenting, anti-spam measures must be taken. There is no built-in spam filter unless you disable anonymous commenting.


## Spam filter for open-source comment systems

One of the most liberal benefits of open source projects is the ability to integrate.You can build your own anti-spam filter with different rules like [honeypot](https://en.wikipedia.org/wiki/Honeypot_(computing)), [captcha](https://en.wikipedia.org/wiki/CAPTCHA) or use third party solutions like [OOPSpam Anti-Spam API](https://oopspam.com).
The main reason people don't want to use paid services like Disqus is privacy. For many, it is important to keep their data on your server while providing ad-free comments.Having anonymous comments is certainly good to have in your commenting system, but it also allows spammers to post on your blog post. 
That said, some paid commenting systems like [Commento](https://commento.io/) are a privacy-focused solution. They rely on a subscription model instead of advertising. Commento uses Akismet as a spam filter, which is a red flag 🚩 considering Akismet requires you to submit your blog URL, user's IP and user agent in addition to other optional parameters such as server information (like ``$_SERVER``` in PHP). Read more about the difference between Akismet and the OOPSpam Anti-Spam API on the [A better Akismet alternative](https://www.oopspam.com/akismet-alternative.html) page.


All in all, these are the major open-source, self-hosted, free commenting systems in the wild. 
If you decide to try OOPSpam Anti-Spam API as your spam filter, go ahead and [test it in your browser](https://app.oopspam.com/Identity/Account/Login?ReturnUrl=%2F#test-with-your-data). You can also contact us at contact@oopspam.com. We'll be happy to help.

Happy spam-free day!