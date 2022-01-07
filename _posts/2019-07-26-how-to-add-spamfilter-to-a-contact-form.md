---
layout: post
title:  "How to add a powerful spam filter to your contact form"
author: "Onar A."
image: ../blog/assets/howtoaddspamfilter.png
---
<center><img width="512" alt="A contact form illustration" src="/blog/assets/howtoaddspamfilter.png"></center>
<br/>
> This is a blog post on how to integrate a spam filter with non-WordPress websites. If you are WordPress user check out [our WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/).



{% include toc.md %}

## Why should you add a spam filter to your contact form?

If you have a contact form then you already know the amount of spam one can get daily. Usually, bots scan websites looking for a contact form or a comment section on a website to fill and submit. As a result, the website gets so much spam from a different source with a different context. These spam bots are not only fill contact forms and comment sections but also save your website in their database for future use.
<center><blockquote class="twitter-tweet"><p lang="en" dir="ltr">Fun fact! There is a company with a database containing 25M websites. They fill up contact forms, solve the captcha for you and send 1M messages for $49. This is exactly what 

<a href="https://twitter.com/oopspamapi?ref_src=twsrc%5Etfw">@oopspamapi</a> fights against.</p>&mdash; 🐾 Onar (@OnarAlili) <a href="https://twitter.com/OnarAlili/status/1147141090023284736?ref_src=twsrc%5Etfw">July 5, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> </center>

Besides all this madness, bots are improving and overcoming spam prevention techniques. The honeypot technique is obsolete for this reason. Another example would be reCaptcha by Google, Google itself stated that reCAPTCHA v2 can be bypassed by their own AI tools. Later Google announced reCAPTCHA v3 which introduced an extra layer on top of the v2 by making it invisible. Google claims V3 is more powerful in terms of accuracy and user-friendliness. However, there are several major problems with it. 

- Spammers are not always bots, there are captcha solving services (captcha farms) like 2Captcha and many others that solves reCaptcha for a low-rate.
- Performance issues (loading extra JavaScript files)
- Privacy issues (tracking user's behavior)

Therefore, it makes sense not to rely on user behavior (reCAPTCHA) or on the chance that the bot is too dumb to figure which field is hidden (honeypot). 

OOPSpam API is an alternative to above solutions. It built with privacy in mind. It is accurate and accessible as it stays in your backend and flags messages silently.

## How to integrate a contact form with OOPSpam API

Let's assume we run a digital agency website in English and your target market is in the US. You got a contact form in your homepage:

```html
<form action="/send" method="post">
        <div class="fields">
            <input type="text" name="name" id="input-name" placeholder="Name">
            <input type="email" name="email" id="input-email" placeholder="Email address">
            <input type="text" name="subject" id="input-subject" placeholder="Subject">
            <textarea name="message" type="text" id="input-message" placeholder="Message"></textarea>
        </div>
    <input type="submit" value="Submit" id="input-submit" class="button-primary">
    </form>
```

As you may already know, once the _submit_ button is clicked the ```form``` element collects the value of all fields within the form tag and post them to the path assigned in ```action```. It means you have to have a backend code to receive these values and handle them (e.g send email, spam check). This is where we have to write our spam filter API to check for spam.
Besides contact form field values, we have to get the user's IP, this is important because it allows us to check IP against multiple blacklisted IPs via the spam filter.

Handling contact form submissions in the backend is different in various languages, however, the concept is similar. Here is how it may look like for you:

1. A user fills and submits a contact form message
2. The user gets Success message no matter what (spam or not)
3. You receive contact form information in your backend
4. Get the user's IP address
5. Send the user's IP and the contact form message to the OOPSpam API
6. The API returns a spam score
7. Forward contact form information to your email or ignore based on the spam score.
8. Done! 💪🏼

We are going to use [Node.js](https://nodejs.org/) with [Nodemailer](https://nodemailer.com/) module (to send emails) for our backend but you can use any programming language you feel comfortable with.

> 🚧 Make sure you get user's IP in the server-side. Don't assign the API to a form field since a spammer (or bot) may alter IP address. 

To get started quickly, I'm going to fork [one of the contact form example projects](https://github.com/germancutraro/Contact-Form-nodejs) from GitHub and add OOPSpam API integration to it.
As mentioned above, we have to get a user's IP in the server-side. This is done differently in every language.
In Node.js with express framework environment it would be as simple as checking under ```req.ip```.

In PHP like so:

```php
<?php echo $_SERVER['REMOTE_ADDR']; ?>
```

Java:

```java
import javax.servlet.http.HttpServletRequest;

String ipAddress = request.getRemoteAddr();
```

C#:

```csharp
string ipAddress = Request.UserHostAddress;
```

It is usually easy and straightforward.

Once you have the user's IP,  you are ready to make an HTTP request to OOPSpam API and forward legit contact form submission to your email. To request OOPSpam API, you have to have an API key. You get an API key by registering on [OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Register). 

> 🗂 Check out [the documentation](https://oopspam.com/docs) to learn more about the API.

```javascript
unirest.post("https://api.oopspam.com/")
.header("X-Api-Key", "YOUR_API_KEY")
.header("Content-Type", "application/json")
.send({"senderIP":"31.184.238.111","content":"Dear Agent, We are a manufacturing company which specializes in supplying Aluminum Rod with Zinc Alloy Rod to customers worldwide, based in Japan, Asia.We have been unable to follow up payments effectively for transactions with debtor customers in your country due to our distant locations, thus our reason for requesting for your services representation.", 
"allowedCountries": ["us"], "allowedLanguages": [ "en"]})
.end(function (result) {
  console.log(result.status, result.headers, result.body);
});
```

As you can see above sample request, the payload contains two parameters:

- The sender IP (a user's IP)
- The message (a contact form message)
- Allowed language (English)
- Allowed country (US)

> 🚧 Make sure you change the value of ```X-Api-Key``` from ```YOUR_API_KEY``` to your API key.

In the case of a successful request, you will get a response similar to the following with HTTP status code ```200```:

```json
{
"Score":4
    "Details":{
        "isIPBlocked":true
        "isContentSpam":"spam"
        "numberOfSpamWords":1
    }
}
```

Any other type of HTTP status needs to be handled accordingly.

> ℹ️ Flag a content solely based on ```Score``` (aka Spam Score). We recommend assuming Spam Score 3 or higher to be spam.

In the response above, the root field ```Score``` has a value of 4. It is safe to assume that a score equal to 3 or above is spam.  Thus, we are going to have a simple _if statement_ to consider this and do all the email forwarding inside this statement. In the example below we consider ```Score``` that is less than 3 as ham (not spam) and send email, otherwise, ignore the message.

<script src="https://gist.github.com/onaralili/b4d8238f31fff719cb7d845fcba4851b.js"></script>

### Error handling

In this example, if a returned status code anything other than ```200``` then we console out the body of the response. In case you didn't include necessary headers in your requests, for example, an API key then you will get error with status code ```401```  (Unauthorized) with an explanatory ```message``` as the part of response's body. Other possible errors can be :

- An invalid JSON format
- Too many request
- Generic error message

With all cases, you will get a JSON object with an error ```code``` and ```message``` which looks like this:

```json
{
    "code":"5740538",
    "message":"Invalid JSON format. Please verify and resubmit."
}
````

Check out [the documentation](https://oopspam.com/docs) to learn in detail about response parameters and much more.
You can also access the example project code on [Github](https://github.com/OOPSpam/Contact-Form-nodejs).

[Let us know](https://www.oopspam.com/#contact) if you have any questions.
