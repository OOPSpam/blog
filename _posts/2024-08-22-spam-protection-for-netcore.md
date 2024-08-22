---
layout: post
title:  "Adding Spam Protection To ASP.NET Core Web App Forms Using C#"
author: "Onar A."
image: /assets/posts/netcore/meta.png
tags: [signup, spam]


description: "Learn how to add a spam filter to .NET Core Web App forms to prevent bots and manual spam using C#"
# modified: 
---
<center>
<img loading="lazy" width="772" style="height: 200px;object-fit: cover;" alt="OOPSpam illustration" src="/blog/assets/ways-to-stop-spam.png">
</center>
<br/>

[.NET Core](https://dotnet.microsoft.com/en-us/download) is one of the most popular platforms out there. It comes with everything you need to get going with building applications, including authentication, authorization, and identity management.

When you build a web application with ASP.NET Core, it generates complete registration, login and other user management capabilities using the ASP.NET Core Identity feature. The great thing about this feature is that it already comes with security measures built in. All the good stuff like role management, password hashing, two-factor authentication (2FA), token-based authentication, and claims-based authorization.

This all sounds great! We launch our application to the world and our website starts to get some traffic. At this point, you may notice an increasing number of fake emails in your database and a high bounce rate with email delivery. If you are using third party email delivery services like Postmark, you can quickly reach your quota limit.

To [automatically block malicious emails and IPs](https://www.oopspam.com/blog/stop-bot-signups) before they can create fake accounts, let's integrate with the [OOPSpam Anti-Spam API](https://www.oopspam.com/). You can also use the same integration to protect other types of forms.

Nice to have beforehand:

- Visual Studio Code (or Visual Studio)
- ASP.NET Core Web Application
- Basic C# knowledge
- An API key from your OOPSpam account

You probably already have a web application and just want to see the integration, so I will just dive in.

## Creating an ASP.NET Core Web App

I am quickly creating a web application with __Individual Accounts__ as the authentication type. I choose .NET 8.0 as the framework, but you should be fine with an older version since we are not doing anything fancy.

![New ASP NET Core Web App](/blog/assets/posts/netcore/new-project.png "New ASP NET Core Web App")

Let me run this app to see if everything works before we continue with the rest of the article. After trusting a local SSL certification prompt and restarting Visual Studio, it let me open the app and I was able to create an account. Yay! 🎉

![Registration page in ASP NET Core Web App](/blog/assets/posts/netcore/new-account.png "Registration page in ASP NET Core Web App")

### Scaffolding Identity

[As of ASP.NET Core 2.1](https://devblogs.microsoft.com/dotnet/aspnetcore-2-1-identity-ui/), all files related to Identity are provided as a library/package, so you don't have registration, login, and account management UI elements and code in your project. You will need to use the Identity Scaffolder to generate and add these files. Since I'm using Visual Studio, I just __Right-clicked on the project -> Add -> Add New Scaffolded Item -> Identity__.

![Scaffolded Identity in ASP NET Core Web App](/blog/assets/posts/netcore/scaffolded.png "Scaffolded Identity in ASP NET Core Web App")

On this page you have the option to pick the file you want to edit. I'm going to select /Account/Register because that's where we're going to implement spam protection. The file __Register.cshtml__ will be added to your project.

![Scaffolded Identity in ASP NET Core Web App](/blog/assets/posts/netcore/scaffolded-identity.png "Scaffolded Identity in ASP NET Core Web App")

## Integrate spam protection

First, let's create an account on [the OOPSpam Dashboard](https://app.oopspam.com/) and grab our API key.

![OOPSpam Dashboard](/blog/assets/posts/netcore/apikey-dashboard.png "OOPSpam Dashboard")

We will have two parameters to check with OOPSpam API:

- senderIP
- email

In other types of forms like contact form you could also use the _content_ field. While you are at it, have a look at the OOPSpam API documentation for more ways to harden your registration form.

We'll secure our registration form by

- Blocking malicious and abusive IPs and emails
- Blocking some high risk countries like Russia, China
- Blocking disposable emails

Back to the topic, add a class to your project:

```csharp
    public class OOPSpamRequestBody
    {
        public string senderIP { get; set; }
        public string email { get; set; }
        public string content { get; set; }
        public string userId { get; set; }
        public bool checkForLength { get; set; }
        public List<object> allowedLanguages { get; set; }
        public List<object> allowedCountries { get; set; }
        public List<string> blockedCountries { get; set; }
        public bool blockTempEmail { get; set; }
        public bool shouldBeSpam { get; set; }
        public bool urlFriendly { get; set; }
        public bool logIt { get; set; }
        public string source { get; set; }
    }
```

We will use this class to pass the data from the form to the API. Now that we have our class, we need to create a method that will call the OOPSpam API and return a spam score.

```csharp
 public async Task<int> GetSpamScoreWithOopSpam(string email, string userIp)
        {
            OOPSpamRequestBody myObject = new OOPSpamRequestBody
            {
                senderIP = userIp,
                email = email,
                content = "",
                blockedCountries = new List<string>(new []{"ru", "cn"}),
                blockTempEmail = true,
                checkForLength = false,
                logIt = true, // To see logs in the OOPSpam Dashboard
                source = "My Website Registration" // Uniquely identify your website in the OOPSpam Dashboard logs
            };

            var jsonContent = JsonConvert.SerializeObject(myObject);

            // Set up HttpClient
            using HttpClient client = new HttpClient();
            // Define the base URL
            client.BaseAddress = new Uri("https://api.oopspam.com/v1/");

            // Add X-API-Key header
            client.DefaultRequestHeaders.Add("X-API-Key", "YOUR_API_KEY");

            // Define the endpoint
            var endpoint = "spamdetection";

            // Create the HTTP content (JSON)
            HttpContent content = new StringContent(jsonContent, System.Text.Encoding.UTF8, "application/json");

            // Send the POST request
            var response = await client.PostAsync(endpoint, content);

            // Check if the response is successful
            if (response.IsSuccessStatusCode)
            {
                // Read the response content
                var jsonString = await response.Content.ReadAsStringAsync();
                var oopSpamResponse = JsonConvert.DeserializeObject<OOPSpamResponseBody>(jsonString);

                return oopSpamResponse.Score;
            }
            else
            {
                // Let registration through if something is wrong
                return 0;
            }
        }
```

We are missing the _OOPSpamResponseBody_ class, which we need to do the deserialization of our response from the OOPSpam API. Let's create the _OOPSpamResponseBody_ class.

```csharp
  public class OOPSpamResponseBody
  {
      public int Score { get; set; }
      Detail Details { get; set; }

      OOPSpamResponseBody()
      {
          Score = 0;
          Details = new Detail();
      }
  }
  public class Detail
  {
      bool isIPBlocked { get; set; }
      bool isEmailBlocked { get; set; }
      bool langMatch { get; set; }
      bool countryMatch { get; set; }
      string isContentSpam { get; set; }
      bool isContentTooShort { get; set; }
      private int numberOfSpamWords = 0;
      List<string> spamWords { get; set; }

  }
```

We only need the spam score to decide whether to reject the registration or not.

Now we edit the file _Register.cshtml.cs_ and call __GetSpamScoreWithOopSpam__ with the necessary parameters (email and IP) in the _OnPostAsync_ method. We will reject the submission if the spam score is equal to or greater than 3 and return a custom message to the UI.

```csharp
public async Task<IActionResult> OnPostAsync(string returnUrl = null)
{
    returnUrl ??= Url.Content("~/");
    ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
    if (ModelState.IsValid)
    {
        // Get the IP address
        var userIpAddress = "";
        if (HttpContext.Connection.RemoteIpAddress != null)
        {
          userIpAddress = HttpContext.Connection.RemoteIpAddress.ToString();
        }
           
        // Spam & abuse check with the OOPSpam API before creating an account
        var spamScore = await GetSpamScoreWithOopSpam(Input.Email, userIpAddress);

        // Return an error if the Score is higher or equal to 3
        if (spamScore >= 3)
        {
            ModelState.AddModelError(string.Empty, "We couldn't process your registration due to suspicious IP or email activity. Please contact us through admin@example.com. Thank you!");
            return Page();
        }

        // The default code
        var user = CreateUser();
        // ....rest of the default code
}
```

I promise, we are almost there. Let's submit a form with a disposable email and see if it works.

![Blocked registration in ASP.NET Core Web App](/blog/assets/posts/netcore/blocked.png "Blocked registration in ASP.NET Core Web App")

It seems to work. Two things happened:

- An error message about being blocked is displayed in the UI.
- The blocked submission can be seen in the logs in the OOPSpam dashboard.

![Logs in the OOPSpam Dashboard](/blog/assets/posts/netcore/log-dashboard.png "Logs in the OOPSpam Dashboard")

## Wrapping this up

<iframe src="https://giphy.com/embed/5XKm5cq4Kik9O" width="480" height="281" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/christmas-merry-presents-5XKm5cq4Kik9O">via GIPHY</a></p>

So we took a simple web application and added spam protection to it. You could do the same for other forms like quote, contact or comment system.There are other parameters you can use to make your forms even more secure, like using the _allowedCountries_ filter to only allow submissions from your target country.

Hope this was helpful.