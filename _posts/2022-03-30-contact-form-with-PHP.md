---
layout: post
title:  "How to create a contact form with PHP and HTML"
author: "Onar A."
image: ../blog/assets/posts/contact-form-with-PHP/complete-contact-form-with-PHP.png
lead: 
description: Learn how to build complete contact form with PHP and HTML with this step-by-step tutorial. We will validate, sanitize and check for spam to ensure our form is secure and protected .
date: 2022-03-30
lastmod: 
---

Every website has some way for its visitors to contact the site owner. It could be an email address, a contact form, or a live chat. If you are building your website in PHP or perhaps you already have a website and want to add a contact form then this is the tutorial for you. Having your email publicly available on your website may attract a lot of spam. To avoid this, individuals and companies have a contact form for easy communication with their users.

This article will guide you on adding a complete and secure contact form with spam filter capabilities to your website. The post is primarily aimed at developers who have some experience with HTML, CSS, and PHP. However, even if you don't have experience with PHP, the guide should be enough to set up a contact form with spam protection.

{% include toc.md %}

## Creating a contact form with HTML

Before we start handling contact form submissions in PHP, we need to have a HTML form. Most forms starts with <code><form></code> and ends with <code></form></code>. <code>form</code> HTML tag has <code>action</code> and <code>method</code> parameters for us to set. These two parameters are important for processing a submission. 

- <code>action</code>: Where to send for the form data when a form is submitted. In our case, we submit data to submit.php. We will create this file later on to handle submissions.
- <code>method</code>: Which HTTP method to use when sending form data

Here is a simple HTML form with three inputs (Name, Email, Message). You could, of course, add as many inputs you like, just make sure they are all within <code>form</code> tag.

```html
<form action="submit.php" method="POST">
    <p>Name</p> <input type="text" name="name" class="input">
    <p>Email</p> <input type="email" name="email" class="input">
    <p>Message</p><textarea name="message" rows="6" cols="25" class="input"></textarea><br />
    <input type="submit" value="Send">
</form>
```

Here is how it looks like:

![HTML contact form](/blog/assets/posts/contact-form-with-PHP/contact-form.png "HTML contact form")

### Client-side input validation

It's important to add client-side validation on the form fields. As you may notice, __email__ field has <code>type="email"</code> that is to prevent user from submitting anything else but email. When possible define type for the fields. [HTML5 brought many specific types](https://developer.mozilla.org/en-US/docs/Learn/Forms/HTML5_input_types), check them out to see if any of them can be used for your fields. There are data types like <code>type="url"</code>, <code>type="number"</code>,  <code>type="tel"</code> and many more.

You could also include a Javascript file and add more complex validation. You may also utilize already built-in [pattern](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern) attribute to have a regex validation. For example, for <code>type="email"</code> field an email __a@b__ is a valid email. We can prevent submission for a such emails by adding <code>pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></code> to the email input which will enforce emails to be in __characters@characters.domain__ format.

If you have any other custom validation, you could do that on the server-side. Later in the article, we will see how to implement input validation in the backend.

## Styling the form using CSS

Now we have our simple contact form. Let's make it a bit prettier by using CSS. Nothing fancy, just some colors to make it more pleasant to look at. You could either use this styling with the color that fits your website style or check out many CSS examples for contact forms on the web.

```css
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700); -- optional

body { background:#fff; }
form { max-width:420px; margin:50px auto; }

h1 {
text-align:center;
}

.input {
  color:black;
  font-family: Helvetica, Arial, sans-serif;
  font-weight:500;
  font-size: 18px;
  border-radius: 5px;
  line-height: 22px;
  background-color: transparent;
  border:2px solid #CC6666;
  transition: all 0.3s;
  padding: 13px;
  margin-bottom: 15px;
  width:100%;
  box-sizing: border-box;
  outline:0;
}

.input:focus { border:2px solid #CC4949; }

textarea {
  height: 150px;
  line-height: 150%;
  resize:vertical;
}

[type="submit"] {
  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
  width: 100%;
  background:#CC6666;
  border-radius:5px;
  border:0;
  cursor:pointer;
  color:white;
  font-size:24px;
  padding-top:10px;
  padding-bottom:10px;
  transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}
[type="submit"]:hover { background:#CC4949; }
```

## Building backend with PHP

Our front-end is ready to receive submissions from visitors. We need to create the _submit.php_ file that we indicated in <code>action</code> attribute. This file is responsible for sanitizing, validating, spam filtering, and finally sending an email.

It is important to validate and sanitize every input. By doing so, you ensure to have a secure and stable contact form. Ignoring these steps may cause you data breaches, compromised accounts, and messy or irregular inputs.

By now, you should have three files:

1. __submit.php__: PHP file for handling backend.
2. __index.html__: HTML structure containing the contact form.
3. __style.css__:  CSS for styling the form. Make sure to include this file within <code>head</code> tag of the HTML file.

We are ready to put them all together to have a working contact form.

### Never trust any input! Sanitizing inputs

![xkcd comics: Exploits of a Mom](https://imgs.xkcd.com/comics/exploits_of_a_mom.png "xkcd comics: Exploits of a Mom")

Your form is public to everyone who visits your websites including malicious visitors. These malicious users or bots will try to inject harmful codes into your system. An injected code can steal your and the legitimate users' credentials, access to your database and server. That is why it is fundamental to sanitize your data before doing anything with it. Most programming languages have some sort of sanitization functions. In PHP, sanitizing an input is as easy as passing the value to the built-in function. Let's start with clearing out the inputs (*Name*, *Email*, *Message*) from potential harmful data.

To make sure we put together everything right, let's start by simply displaying all data we get from the contact form.

- Add the PHP code below to the _submit.php_ file.
- Visit the _index.html_ file, fill the form and click _Send_.

```php
<?php
var_dump($_POST);
?>
```

Once submitted, you should see all submitted data displayed in an array format.

![Contact form submission in PHP](/blog/assets/posts/contact-form-with-PHP/contact-form-submit.gif "Contact form submission in PHP")

We confirmed that the form works. Time to pick every input from [$_POST](https://www.php.net/manual/en/reserved.variables.post.php) and sanitize before moving on. For this, we use [filter_var()](https://www.php.net/manual/en/function.filter-var.php) function, this filter function takes a passed variable name from *$_POST* and returns sanitized value. In our example, we clean up each field one by one but you could alternatively use [filter_var_array()](https://www.php.net/manual/en/function.filter-var-array.php) to remove malicious data at once.

Here is an example use case for *filter_var()*:

```php
<?php
// Sanitize inputs
$nameSanitized = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
$emailSanitized = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
$messageSanitized = filter_var($_POST['message'], FILTER_SANITIZE_STRING);
?>
```

Al three variables (<code>$name</code>, <code>$email</code>, <code>$message</code>) now contain corresponding sanitized value and ready to validated in the server-side.

#### Why do we need to validate both on the client-side and server-side?

The client-side validation is for users to have a better user experience (UX) when filling a form. It can be easily bypassed by disabling Javascript. It is not required to have a client-side validation, however, client-side validation is a nice way to provide users feedback before submission.

We have no idea what kind of data we will get from a contact form submission. Even we have client-side validation, all it takes to submit any kind of data is to disable Javascript or even simply edit the web page source locally. That is why server-side validation is a crucial part of the process. It ensures that we have valid data. After sanitizing an input, we have not only a valid but also safe to store or send data.

> Important! Validation isn't sanitization. Validation doesn't remove any malicious data. It is no more than a confirmation that the information you are getting is in a valid format and meets the criteria you expect.

### Server-side input validation

PHP makes server-side validation easy too. The same function *filter_var* that we used for sanitization can be used for validation as well. Except for this time instead of *FILTER_SANITIZE_EMAIL*, we apply *FILTER_VALIDATE_EMAIL* filter.

Here is the complete code with both sanitization and validation using *filter_var*:

```php
<?php
// Sanitize email input
$emailSanitized = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);

// Validate $emailSanitized
if (!filter_var($emailSanitized, FILTER_VALIDATE_EMAIL) === false) {
  echo ("$emailSanitized is a valid email address");
  // The submitted email is clean and VALID. 
  // You may integrate anti-spam API and send email.
} else {
  // The submitted email is clean but INVALID.
  // You may ignore the submission.
  echo ("$emailSanitized is not a valid email address");
}
?>
```

You may noticed we didn't validate other fields (<code>name</code>, <code>message</code>) after sanitization. As these fields don't need to be in any specific format, we ignore them. However, if you have certain requirements for any fields you can validate them using [Validate filters](https://www.php.net/manual/en/filter.filters.validate.php).

Here are some of them:

- FILTER_VALIDATE_INT
- FILTER_VALIDATE_IP
- FILTER_VALIDATE_URL
- FILTER_VALIDATE_BOOL

### Integrating spam protection

Up until now, we made sure to have safe and genuine data. Spammers tend to submit valid and clean data because they want to stand out from other submissions and land in your inbox. If you have ever had a contact form, you may have already experienced the overwhelming amount of spam through it. To keep our inbox clean from spam entries, we need to implement some form of spam prevention. The most basic and straightforward solution would be [honeypot technique](https://www.oopspam.com/blog/ways-to-stop-spam#honeypot-filter-spam-with-a-hidden-field). It is the oldest trick in the book and easy to implement. Basically, we add a hidden field to our contact form and expect this field to be filled by bots only as it would invisible to legitimate users. This approach would protect your web forms from basic spam bots. As you may guess, nothing is preventing a bot from detecting this hidden field and avoiding filling it. And on top of that, once your website starts getting more traffic, it will attract manual spammers too which can easily bypass all kinds of client-side spam filtering. This is where [OOPSpam API](https://www.oopspam.com/) comes in and handles all form submissions in the backend without ever interacting with your visitors.

First things first, [register on OOPSpam Dashboard](https://app.oopspam.com/Identity/Account/Register) and grab the API key.

![OOPSpam Dashboard](/blog/assets/posts/contact-form-with-PHP/oopspam-dashboard.png "OOPSpam Dashboard")

Now, we are ready to start integration in the server-side *submit.php*. To make sending requests easier we will use the popular [GuzzleHttp](https://docs.guzzlephp.org/en/stable/) library to make an HTTP request. You can install Guzzle through [Composer](https://getcomposer.org/). If you are not familiar with Composer, it is a dependency manager for PHP.

Follow these steps to install Composer and GuzzleHTTP to your system:

1. Follow [the official Composer tutorial](https://getcomposer.org/download/) and install it.
2. Install GuzzleHttp by running <code>composer require guzzlehttp/guzzle:^7.0</code> in your project directory

At this point, we have everything we need to make an HTTP request with our data to the API and get a spam score. OOPSpam API requires only the **content** field, but you could provide additional information in the request body for better spam detection. Here is an example of all possible request body fields:

```json
{
    "senderIP": "91.203.67.110",
    "content": "Dear Agent, We are a manufacturing company which specializes in supplying Aluminum Rod with Zinc Alloy Rod to customers worldwide, based in Japan, Asia. We have been unable to follow up payments effectively for transactions with debtor customers in your country due to our distant locations, thus our reason for requesting for your services representation.",
    "checkForLength": true,
    "allowedLanguages" : ["en"],
    "allowedCountries" : ["it","us"]
}
```

We are going to supply **senderIP** in addition to **content**. **allowedLanguages** and **allowedCountries** are other useful fields that can be used to allow messages only from certain countries and languages. They are especially helpful if you don't expect a contact form submission from some areas and languages.

> ✨ Tip: Check out [OOPSpam documentation](https://www.oopspam.com/docs/#introduction) for more information on how to use other request fields.

Checking for spam should be done only after all fields are sanitized and validated. For our implementation, we check for spam if the submitted <code>email</code> is valid and free from bad data after all there is no point to accept any submission that doesn't have a valid email. That being said you could do a spam check at any point that makes sense for your use case. Next, we capture the user's IP and send an HTTP request to OOPSpam API.

Here is the function to capture a visitor's IP address in PHP:

```php
function getUserIpAddr(){
  if(!empty($_SERVER['HTTP_CLIENT_IP'])){
      //ip from share internet
      $ip = $_SERVER['HTTP_CLIENT_IP'];
  }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
      //ip pass from proxy
      $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
  }else{
      $ip = $_SERVER['REMOTE_ADDR'];
  }
  return $ip;
}
```

and finally, our spam checking function:

```php
function getSpamScore($message, $userIP) {
    try {
        $data = array(
          'content' => $message,
          'senderIP' => $userIP
      );

      $url = "https://api.oopspam.com/v1/spamdetection";

      // IMPORTANT! Remove ['verify' => false ] in production. 
      // Make sure you have valid SSL certificate installed in your server.
      // We use ['verify' => false ] only for testing purposes locally to avoid SSL error.
      $client = new \GuzzleHttp\Client(['verify' => false ]);
      $response = $client->request("POST", $url, [
          'headers' => ['Content-Type' => 'application/json', 
          'X-Api-Key' => 'YOUR_API_KEY'],
          'body'    => json_encode($data)
      ]); 
      $code = $response->getStatusCode();

      // Check if the request is successful
      if ($code === 200) {
        // Score field is always available in case of successful response
        // Capture it and make decision
        $score = json_decode($response->getBody()->getContents())->Score;
        return $score;
      }
    } catch (Exception $err) {
      echo ($err);
    }
}
```

The code is pretty straightforward but let's still quickly go through it. First, we put our message and user's IP in an array (<code>$data</code>) then we create a new instance of the GuzzleHTTP client and pass JSON encoded <code>$data</code> along with our API key from OOPSpam Dashboard.
<code>$code</code> variable holds HTTP response code from OOPSpam API. In case of successful response code (<code>200</code> ) from the API, we convert response body to JSON object and assign value of <code>Score</code> to <code>$score</code>. Finally, the function returns <code>$score</code>.


> 🚨 Important: For most cases, Score:3 or higher is considered spam.

Here is the complete code without email notification (we are going to integrate that next):

```php
<?php
require_once ("./vendor/autoload.php");
use GuzzleHttp\Client;

$SPAM_THRESHOLD = 3;

$nameSanitized = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
$emailSanitized = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
$messageSanitized = filter_var($_POST['message'], FILTER_SANITIZE_STRING);

// Validate $emailSanitized
if (!filter_var($emailSanitized, FILTER_VALIDATE_EMAIL) === false) {
    echo ("$emailSanitized is a valid email address");

    // Check for spam
    // returns: Spam Score from 0 to 6.
    // We consider $score value 3 or higher as spam
     $score = getSpamScore($messageSanitized, getUserIpAddr());
     
     if ($score >= $SPAM_THRESHOLD) {
      // It is spam
      // Reject submission or store for later use
      echo("It is SPAM!");
    } else {
      echo("It is HAM!");
      // It is not spam
      // Send a notification by email
    }

  } else {
    echo ("$emailSanitized is not a valid email address");
  }

function getUserIpAddr(){
  if(!empty($_SERVER['HTTP_CLIENT_IP'])){
      //ip from share internet
      $ip = $_SERVER['HTTP_CLIENT_IP'];
  }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
      //ip pass from proxy
      $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
  }else{
      $ip = $_SERVER['REMOTE_ADDR'];
  }
  return $ip;
}

function getSpamScore($message, $userIP) {
    try {
        $data = array(
          'content' => $message,
          'senderIP' => $userIP
      );

      $url = "https://api.oopspam.com/v1/spamdetection";

      // IMPORTANT! Remove ['verify' => false ] in production. 
      // Make sure you have valid SSL certificate installed in your server.
      // We use ['verify' => false ] only for testing purposes locally to avoid SSL error.
      $client = new \GuzzleHttp\Client(['verify' => false ]);
      $response = $client->request("POST", $url, [
          'headers' => ['Content-Type' => 'application/json', 
          'X-Api-Key' => 'YOUR_API_KEY'],
          'body'    => json_encode($data)
      ]); 
      $code = $response->getStatusCode();

      // Check if the request is successful
      if ($code === 200) {
        // Score field is always available in case of successful response
        // Capture it and make decision
        $score = json_decode($response->getBody()->getContents())->Score;
        return $score;
      }
    } catch (Exception $err) {
      echo ($err);
    }
}
?>
```

At this point, we have clean and valid data. We integrated spam protection and are ready to send an email to ourselves each time we get new contact form submission.

### Sending email using PHPMailer

There are a few ways to send email in PHP. One of them is using built-in [mail()](https://www.php.net/manual/en/function.mail.php) function. However, *mail()* is limited and in many cases, it is not flexible enough. In *mail()*, you need to escape special characters, use a local mail server so no SMTP. Another issue with *mail()* is deliverability as there is no authentication going on if you use "From:" in the email header. As a result, email spam filters will flag your emails as spam. In general, it is advised to avoid using *mail()* when possible and there are faster and [safer](https://exploitbox.io/paper/Pwning-PHP-Mail-Function-For-Fun-And-RCE.html) alternatives.

For the above reasons, we will go with the popular mail sender in [PHPMailer](https://github.com/PHPMailer/PHPMailer). It supports SMTP, security & authentication headers so your email doesn't end up in spam, attachments, and plan & HTML emails. Let's install PHPMailer using Composer:

```php
composer require phpmailer/phpmailer
```

and include PHPMailer at the beginning of the *submit.php* file.

```php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
```

We create our *sendEmail* function to send an email.

```php
function sendEmail($submission) {
  //PHPMailer Object
  $mail = new PHPMailer(true); //Argument true in constructor enables exceptions

  //From email address and name
  $mail->From = "someonewithgmail@gmail.com";
  $mail->FromName = "My Name";

  //To address and name
  $mail->addAddress($submission["email"], $submission["name"]);
  // $mail->addAddress($data); //Recipient name is optional

  //Address to which recipient will reply
  // $mail->addReplyTo("someonewithgmail@gmail.com", "Reply");

  //CC and BCC
  // $mail->addCC("cc@example.com");
  // $mail->addBCC("bcc@example.com");

  //Send HTML or Plain Text email
  $mail->isHTML(true);

  $mail->Subject = "New contact form submission from example.com";
  $mailContent = "<p>From: </p>".$submission["email"].
  "<p>Name: </p>".$submission["name"].
  "<p>Message: </p>".$submission["message"];

  echo $mailContent;

  $mail->Body = $mailContent;

  try {
      $mail->send();
      echo "Message has been sent successfully";
  } catch (Exception $e) {
      echo "Mailer Error: " . $mail->ErrorInfo;
  }
}
```

and we got our email:

![Email sent with PHPMailer](/blog/assets/posts/contact-form-with-PHP/GotEmail.png "Email sent with PHPMailer")

Once user inputs are cleaned from bad data and validated we call this function with an array as a parameter containing _email_, _name_, _message_. As PHPMailer supports HTML emails, we format our mail content with HTML tags. In this case, we use a local email server to send an email. As mentioned above, using a local email server almost guarantees that the email you sent will end up in the spam box. So to avoid it, use SMTP server from reputable services like [Postmark](https://postmarkapp.com/), [SendGrid](https://sendgrid.com/) (has free plan), [Mailgun](https://www.mailgun.com/).

Setting up PHPMailer with SMTP is straightforward. All you need to do is add the SMTP host address & port, username, and password. Here is one example where we set up PHPMailer with Gmail:

```php
$mail = new PHPMailer(true);

//Enable SMTP debugging.
$mail->SMTPDebug = 3;                               
//Set PHPMailer to use SMTP.
$mail->isSMTP();            
//Set SMTP host name                          
$mail->Host = "smtp.gmail.com";
//Set this to true if SMTP host requires authentication to send email
$mail->SMTPAuth = true;                          
//Provide username and password     
$mail->Username = "name@gmail.com";                 
$mail->Password = "super_secret_password";                           
//If SMTP requires TLS encryption then set it
$mail->SMTPSecure = "tls";                           
//Set TCP port to connect to
$mail->Port = 587;                                   

$mail->From = "name@gmail.com";
$mail->FromName = "Full Name";

$mail->addAddress("name@example.com", "Recipient Name");

$mail->isHTML(true);

$mail->Subject = "Subject Text";
$mail->Body = "<i>Mail body in HTML</i>";
$mail->AltBody = "This is the plain text version of the email content";

try {
    $mail->send();
    echo "Message has been sent successfully";
} catch (Exception $e) {
    echo "Mailer Error: " . $mail->ErrorInfo;
}
```

Another way to send mail in PHP using an SMTP server is to use a library provided by third-party SMTP services. For example, [SendGrid provides a PHP library to send an email with their services in less than 12 lines of code](https://docs.sendgrid.com/for-developers/sending-email/v2-php-code-example#using-sendgrids-php-library).

Here is the final code all put together:

```php
<?php
require_once ("./vendor/autoload.php");
use GuzzleHttp\Client;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$SPAM_THRESHOLD = 3;

$nameSanitized = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
$emailSanitized = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
$messageSanitized = filter_var($_POST['message'], FILTER_SANITIZE_STRING);

// Validate $emailSanitized
if (!filter_var($emailSanitized, FILTER_VALIDATE_EMAIL) === false) {
    echo ("$emailSanitized is a valid email address <br>");

    // Check for spam
    // returns: Spam Score from 0 to 6.
    // We consider $score value 3 or higher as spam
     $score = getSpamScore($messageSanitized, getUserIpAddr());
     
     if ($score >= $SPAM_THRESHOLD) {
      // It is spam
      // Reject submission or store for later use
      echo("It is SPAM! <br>");
    } else {
      echo("It is HAM! <br>");
      // It is not spam
      // Send a notification by email
      $submission = array(
        'message' => $messageSanitized,
        'name' => $nameSanitized,
        'email' => $emailSanitized
    );
      sendEmail($submission);
    }

  } else {
    echo ("$emailSanitized is not a valid email address");
  }

function getUserIpAddr(){
  if(!empty($_SERVER['HTTP_CLIENT_IP'])){
      //ip from share internet
      $ip = $_SERVER['HTTP_CLIENT_IP'];
  }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
      //ip pass from proxy
      $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
  }else{
      $ip = $_SERVER['REMOTE_ADDR'];
  }
  return $ip;
}

function getSpamScore($message, $userIP) {
    try {
        $data = array(
          'content' => $message,
          'senderIP' => $userIP
      );

      $url = "https://api.oopspam.com/v1/spamdetection";
      $client = new \GuzzleHttp\Client(['verify' => false ]);
      $response = $client->request("POST", $url, [
          'headers' => ['Content-Type' => 'application/json', 
          'X-Api-Key' => 'YOUR_API_KEY'],
          'body'    => json_encode($data)
      ]); 
      $code = $response->getStatusCode();

      // Check if the request is successful
      if ($code === 200) {
        // Score field is always available in case of successful response
        // Capture it and make decision
        $score = json_decode($response->getBody()->getContents())->Score;
        return $score;
      }
    } catch (Exception $err) {
      echo ($err);
    }
}

function sendEmail($submission) {
  //PHPMailer Object
  $mail = new PHPMailer(true); //Argument true in constructor enables exceptions

  //From email address and name
  $mail->From = "someonewithgmail@gmail.com";
  $mail->FromName = "My Name";

  //To address and name
  $mail->addAddress($submission["email"], $submission["name"]);
  // $mail->addAddress($data); //Recipient name is optional

  //Address to which recipient will reply
  // $mail->addReplyTo("someonewithgmail@gmail.com", "Reply");

  //CC and BCC
  // $mail->addCC("cc@example.com");
  // $mail->addBCC("bcc@example.com");

  //Send HTML or Plain Text email
  $mail->isHTML(true);

  $mail->Subject = "New contact form submission from example.com";
  $mailContent = "<p>From: </p>".$submission["email"].
  "<p>Name: </p>".$submission["name"].
  "<p>Message: </p>".$submission["message"];

  echo $mailContent;

  $mail->Body = $mailContent;

  try {
      $mail->send();
      echo "Message has been sent successfully";
  } catch (Exception $e) {
      echo "Mailer Error: " . $mail->ErrorInfo;
  }
}
?>
```

### Final thoughts

A contact form on your website is a great way to connect with your visitors. Unfortunately, it also attracts unwanted attention from spammers and bad actors (aka hackers). To safeguard ourselves we implemented data validation & sanitization with anti-spam capabilities in our contact form. This article was for people who want to build safe and secure contact forms on their own. If you are a WordPress user, you could use one of the popular contact form plugins and install [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) for spam protection.

Happy spam-free day!
