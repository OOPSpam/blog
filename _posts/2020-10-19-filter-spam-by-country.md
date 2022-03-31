---
layout: post
title:  "Introducing Country Restrictions"
author: "Onar A."
image: /assets/posts/connected_world.png


description: "Block countries with OOPSpam"
# modified: 
---
<center>
<img width="772" style="height: 200px;object-fit: cover;" alt="Connected world illustration" src="/blog/assets/posts/connected_world.png">
</center>
<br/>

Up until now, OOPSpam API could spam score messages based on language, Machine Learning models, IP, content & URL analyses, and many more custom rules.
Today, we are excited to announce a new shiny feature, Country Restrictions. 

Let's say you are only interested in getting messages from people in the United States and Canada, you can pass a two-letter country code to ```allowedCountries``` parameter along with ```senderIP```. OOPSpam will return a maximum Spam Score 6 if the message sender's IP isn't originated from one of those countries in ```allowedCountries```.

Check out [the official documentation](https://www.oopspam.com/docs) for example request and how to use the feature.

### Why blocking countries is a powerful way to eliminate spam?

Here is the list of [top 5 spam-bots countries](https://www.spamhaus.org/statistics/botnet-cc/):

1. China
2. United States of America
3. India
4. Viet Nam
5. United Kingdom of Great Britain and Northern Ireland

The majority of the spam on the internet is coming from these countries.

Considering most businesses operate in certain countries you could limit the amount of spam you get dramatically. Any spam that passes this filter will be detected by other analyses.

Give a try and let us know if you have any questions via [contact@oopspam.com](mailto:contact@oopspam.com).

Happy spam-free day!