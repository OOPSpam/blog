---
layout: post
title:  "3 top open-source comment systems and their anti-spam capabilities"
author: "Onar A."
image: ../blog/assets/open-source-comment-systems.png
---
<center>
<a href="https://wordpress.org/plugins/oopspam-anti-spam/">
<img width="772" alt="Open-source comment systems and their anti-spam capabilities" src="/blog/assets/open-source-comment-systems.png">
</a>
</center>
<br/>

We'll talk about different comment systems and how they fight spam.	

Believe me, I read a lot about comment systems. Well, We run [an anti-spam API](https://www.oopspam.com) service and they are an essential part of our product as many requests to OOPSpam Anti-Spam API come from comment systems.

First I thought writing on how to integrate spam filter to one of those open-source comment systems. Then, I convinced that it would be probably more helpful to put together a nice list of open-source (and free) comment systems and describe the way they fight with spam.

There are many options, some runs hell a lot of ads on your blog, some collect as much data possible about your visitors. Some ask for sign up, some don't. I will list a few good ones, you can, of course, go ahead and check their functionality on their website or different blogs. But this blog post is going to talk about How they approach spam protection in their system.

{% include toc.md %}

## Open-source and free comment systems

### [Isso](https://posativ.org/isso/)

Isso is an open-source, self-hosted and completely free. It comes out as "a commenting server similar to Disqus". Instead of writing a long paragraph I'm going to list main points: 

- It's written in Python
- Supports all major browsers including IE10 (yep, people still use it).
- Comments support Markdown
- Admin panel to moderate comments
- Works with SQLite database
- Support Disqus & WordPress Import
- Small size 40kb (12kb gzipped)
- Basic spam protection

![Isso comment system](/blog/assets/posts/Isso_comment_system.png "Isso comment system")

Why choose Isso as your comment system:

- No ads, no tracking
- Open-source, free & self-hosted
- Allows anonymous comments
- Fast and lightweight

#### Spam filtering in Isso comment system

Now, let's talk more about anti-spam capabilities. Isso comes with basic built-in spam protection. There are not any content or IP analyses. The only way you can protect yourself is to have a rate limit per IP. Let's say, 2 comments per minute. This is the place where you could also require email, author and email fields so no more anonymous comment.
You can activate these limitations on your config file (e.g isso.conf) by adding *Guard* parameter with appropriate fields :

```config
[guard]
enabled = true
ratelimit = 2
direct-reply = 3
reply-to-self = false
require-author = false
require-email = false
```
Read more about *Guard* parameters on [the Isso official documentation.](https://posativ.org/isso/docs/configuration/server/#guard)

### [Schnack](https://schnack.cool/)

Here is another alternative to paid comment systems. Just like Isso, Schnack is an open-source, free, self-hosted comment system. Here are the main points:

- It's written in Javascript (Node.js)
- Really small packaging, 8KB
- Doesn't allow anonymous comments
- Supports third-party authentication (Github, Twitter, etc.)
- Works with SQLite database
- Admin panel to moderate comments
- No explicit spam protection, asks for authentication
- Support Disqus & WordPress Import

![Schnack comment system](/blog/assets/posts/schnack_comment_system.png "Schnack comment system")

Why choose Schnack as your comment system:

- No ads, no tracking
- Open-source, free & self-hosted
- Integration with third-party authentication providers (Github, Twitter, Google, and Facebook)
- Trust list (a way to allow some people to comment without approval from admin)
- Fast and lightweight

As you can see, Schanck and Isso are pretty alike as both of them self-hosted, open-source and free. So, it is hard to tell why someone would choose one over the other. However, there are some differences such as Schanck's backend is on Node.js while Isso's is on Python. Schanck is smaller in terms of package size. While Isso supports anonymous commenting Schanck doesn't.

#### Spam filtering in Schanck comment system

The author of Schanck answers this concern on [his blog post](https://vis4.net/blog/2017/10/hello-schnack/#how-schnack-is-protecting-against-spam).  

![Spam protection for Schnack comment system](/blog/assets/posts/schnack_anti_spam.png "Spam protection for Schnack comment system")

As Schanck doesn't support anonymous commenting and requires to sign up through one of the third-party providers which prevents spambots to comment on your blog. However, spammers are not always spambots. Many spammers are real people. There are services where you can hire people very cheap ($1 per hour) to spam. For these kinds of spammers, you cannot do much with third-party authentication. 

### [Remark42](https://remark42.com/)

Remark42 looks pretty promising. It is self-hosted and lightweight. The backend is written in Go and the frontend is in Node.js. 
Remark42 supports an anonymous comment, social login through Twitter, Github, etc, Voting, moderating comments and a bunch of other features. I would say Remark42 offers everything and more than all 2 options above.  Check [the official website](https://remark42.com/) for the full list of features.

![Remark42 comment system](/blog/assets/posts/remark42_comment_system.png "Remark42 comment system")

#### Spam filtering in Remark42 comment system

As Remark42 allows optional anonymous commenting, anti-spam measurements need to be taken. There is not any built-in spam filter unless you disable anonymous commenting.


## Spam filter for open-source comments system

One of the most liberal perks that come with open-source projects is the ability to integrate. You can build own anti-spam filter with various rules such as [honeypot](https://en.wikipedia.org/wiki/Honeypot_(computing)), [captcha](https://en.wikipedia.org/wiki/CAPTCHA) or use third-party solutions like [OOPSpam Anti-Spam API](https://oopspam.com).
The main reason why people don't want to use paid services like Disqus is privacy. For many, It is important to keep your data on your server while serving ad-free comments. Having anonymous comments are certainly good to have in your comment system, however, this also enables spammer to post on your blog post. 
That being said, some paid comment systems such as [Commento](https://commento.io/) is a privacy-focused solution. They rely on a subscription model instead of an advertisement. Commento uses Akismet as a spam-filter which is a red flag 🚩 considering Akismet requires to submit your blog URL, user's IP and user agent on top of the other optional parameters such as server information (such as ```$_SERVER``` in PHP). Read more about the difference between Akismet and OOPSpam Anti-Spam API on [A better Akismet alternative](https://www.oopspam.com/akismet-alternative.html) page.


All in all, these are the main open-source, self-hosted and free comment systems in the wild. 
If you decide to give a try to OOPSpam Anti-Spam API as your spam filter, go ahead and [test it on your browser](https://app.oopspam.com/Identity/Account/Login?ReturnUrl=%2F#test-with-your-data). You could also reach me out via onar@oopspam.com. I'd be happy to help.

Happy spam-free day!