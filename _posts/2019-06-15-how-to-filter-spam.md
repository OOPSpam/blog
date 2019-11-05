---
layout: post
title:  "How to use OOPSpam Anti-Spam API to filter spam"
author: "Onar A."
image: https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/No_JunkMail_Valletta.JPG/512px-No_JunkMail_Valletta.JPG
---
<center><a title="Stefan Bellini [CC0], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:No_JunkMail_Valletta.JPG"><img width="512" alt="No JunkMail Valletta" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/No_JunkMail_Valletta.JPG/512px-No_JunkMail_Valletta.JPG"></a></center>

If you have ever owned a website with a form submission or a blog (Wordpress etc.) then you probably experienced a huge amount of spam comments/submission almost daily. In fact, these are two cases I personally had experience and decided to build OOPSpam API to detect and filter spam.

Deciding which content is spam solely based on content is a hard problem. Even well-trained machine learning algorithms have a good chance of making a false positive. Hence, OOPSpam API allows you to pass the following values to make  a better decision :
- ```sender_ip``` 
- ```content```
- ```content_lang```

Let's see how the API makes a decision and which fields are important even though passing all values increase accuracy greatly.

* ```sender_ip```  is an _optional_ field representing the IP of the content sender. Whether you got a form submission or a comment on your blog, get sender's IP and pass it to OOPSpam API via this parameter. Although this field optional, if you let us know what IP sent you the content then the API will check that IP in multiple lists of blocked IPs. It is safe to assume that in case IP is present in one of those blocked lists, the sender is a spammer. Note that OOPSpam uses daily-updated, powerful blacklisted IP lists which are also used by notable email provides such as Gmail, Outlook Thus if a content sender IP (```sender_ip```) is in one of those lists, no matter what other parameters you passed the spam score will be maximum (6).

* ```content``` is a _required_ field representing actual content (form submission, a blog comment) you received. The machine learning algorithm will look for a pattern of similarity with other type of spam and decide whether the content is spam or not.

* ```content_lang``` is an _optional_ parameter, however, can be a powerful way to prevent spam. 

    ***What is ```content_lang```  and how it helps to prevent spam?***

    Well, let's say you have a website in English and you serve your content (article, news, service, etc.) in English. It would make sense that you expect your form submission in English. In this case, you pass ```en```  (short for English aka ISO 639-1 two-letter code) to ```content_lang``` parameter as an array (```["en"]```). OOPSpam API has built-in Language Detection algorithm which will check your content and determine whether your content actually in English or not. Content in a different language other than English will be marked as spam.  In addition, say you expect your content to be in English and Italian then your ```content_lang```  would look like as ```["en", "it"]```.
    Check out [OOPSpam API docs](https://rapidapi.com/oopspam/api/oopspam-spam-filter/details) for supported languages and their ISO 639-1 two-letter codes.

OOPSpam API scores your content based on the parameters mentioned above.  As you may see, the more information you provide, the more accurate the final spam score will be. 
