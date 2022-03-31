---
layout: post
title:  "How to use OOPSpam Anti-Spam API to filter spam"
author: "Onar A."
image: https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/No_JunkMail_Valletta.JPG/512px-No_JunkMail_Valletta.JPG

description: "Learn how to use OOPSpam API to protect your website from spam."
# modified: 
---
<center><a title="Stefan Bellini [CC0], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:No_JunkMail_Valletta.JPG"><img width="512" alt="No JunkMail Valletta" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/No_JunkMail_Valletta.JPG/512px-No_JunkMail_Valletta.JPG"></a></center>
<br/>
If you have ever owned a website with a contact form or a blog with a comment section then you've probably experienced a huge amount of spam almost daily.  You are not alone. In 2017, we decided to do something about it and built OOPSpam API.

Deciding which content is spam solely based on content is a difficult problem. Even well-trained machine learning algorithms have a good chance of making a false positive. The better approach would be to analyze multiple factors and produce a single output such as a score. OOPSpam API allows you to pass the following values to make a better decision:

```json
{
    "senderIP": "91.203.67.110",
    "content": "Dear Agent, We are a manufacturing company which specializes in supplying Aluminum Rod with Zinc Alloy Rod to customers worldwide, based in Japan, Asia. We have been unable to follow up payments effectively for transactions with debtor customers in your country due to our distant locations, thus our reason for requesting for your services representation.",
    "checkForLength": true,
    "allowedLanguages" : ["en"],
    "allowedCountries" : ["it","us"]
}
````

Let's see how the API makes a decision and which fields are important even though passing all values increase accuracy greatly.

* ```senderIP```  is an _optional_ field representing sender IP (whoever submitted the content to you). Whether you got a contact form submission or a comment on your blog, get the sender's IP and pass it to OOPSpam API via this parameter. Although this field optional, it improves accuracy. The API will check the IP in multiple lists of blocked IPs. It is safe to assume that if the IP is present in one of those blocked lists, the sender is a spammer.

* ```content``` is a _required_ field representing actual content (form submission, a blog comment) you received. The machine learning algorithm will look for a pattern of similarity with other type of spam and decide whether the content is spam or not.

* ```checkForLength``` is an _optional_ parameter. If the content is shorter than 20 characters, it will be considered spam. You can disable this feature by passing ```false``` to it.

* ```allowedLanguages``` is an _optional_ parameter, however, it can be a powerful way to prevent spam.

### What is ```allowedLanguages```  and how it helps to prevent spam?

Well, let's say you have a website in English and you serve your content (article, news, service, etc.) in English. It would make sense that you expect your comments to be in English. In this case, you pass ```en```  (short for English ISO 639-1 two-letter code) to ```allowedLanguages``` parameter as an array (```["en"]```). OOPSpam API has built-in Language Detection algorithm which will check the comment and determine whether it's actually in English or not. A content in a different language other than English will be marked as spam.  In addition, say you expect your content to be in English and Italian then your ```allowedLanguages```  would look like  ```["en", "it"]```.

* ```allowedCountries``` is an _optional_ parameter. Similar to ```allowedLanguages```, it allows you to filter by a country or countries. instead of language. All you need to do is pass [the two-letter country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) as an array. This field requires ```senderIP``` to be included in the request body. 

OOPSpam API will returns ```Score``` along with a detailed report to let you know why it's spam or not. Here the all possible value you will get:

```json
{
  "Score": 6,
  "Details": {
    "isIPBlocked": false,
    "isContentSpam": "spam",
    "langMatch": true,
    "countryMatch": false,
    "numberOfSpamWords": 0,
    "isContentTooShort": false
  }
}
````
Have a look at our [Response Body Parameter](https://www.oopspam.com/docs/#http-response-body-parameters) section in our documentation to learn the definition of each field.

If you are a big fan of Postman like myself, here is Postman embed button that will load all the headers and request body for you. Make sure to [grab an API key](https://www.app.oopspam.com) and replace ```YOUR_API_KEY``` in the Headers tab.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/9739f63cd7bc67da898f?action=collection%2Fimport)

Once you get a response to your request, you are ready to flag messages. While it depends on the use case, we recommend considering ```Score``` 3 and above as spam.

Check out [OOPSpam API docs](https://www.oopspam.com/docs/#introduction) for more information.

Happy spam-free day!