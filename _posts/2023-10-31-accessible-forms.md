---
layout: post
title:  "Building Accessible Forms: 6 Tips"
author: "Onar A."
image: /assets/posts/accessible-form/meta.png
tags: [captcha, contact_form, accessible]


description: "Learn 6 essential tips for building accessible web forms. Enhance user experience and inclusivity with these best practices."
# modified: 
---
<center>
<img loading="lazy" width="600" alt="An image of a computer keyboard." src="/blog/assets/posts/accessible-form/header.jpeg">
</center>
<br/>

When considering accessibility on your website it's important to consider your web forms— whether it is a [contact form](https://www.oopspam.com/blog/accessible-forms), sign-up form or newsletter form. Accessible forms are important for high conversion, better SEO and user experience. In this article we will look at common mistakes and general tips to be aware of them when creating a form.

The overall goal for a form is one that is complete, easy to understand and navigable with ```Tab```. Be sure to check the [Web Accessibility Initiative by W3C guide](https://www.w3.org/WAI/tutorials/forms/).

Here is an example [Accessible form on Codepen](https://codepen.io/oopspam/pen/JjxXvWM).

![Accessible Form](/blog/assets/posts/accessible-form/form.png "Accessible Form")

{% include toc.md %}

## 1. Use Input Labels

A form field should have an associated label with them. It is common to see forms where there is no label, just ```placeholder```. ```placeholder``` is not enough alone as it disappears as you type. Providing a label, helps users to understand what information is expected in each field. To add a label to your form, use [label](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label) tag in HTML. The ``for`` attribute should always be the same as the ``id``.

```html
<!-- Bad -->
<input type="text" placeholder="Enter your email">

<!-- Good -->
<label for="email">Email:</label>
<input type="text" id="email" name="email" placeholder="Enter your email">
```

Alternatively, you can use [aria-label](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-label) to identify form controls. 

## 2. Avoid Using Color Alone to Indicate Errors

Relying on color alone (e.g., red text) to indicate errors can be problematic for users with visual impairments. It's important to provide text or other visual cues in addition to color. For both success and error, a form should display some sort of notification. In the case of an error, an error message should provide clear instructions on how to resolve the error. Ideally, an error message should appear both in the form header and next to the field. An error in the form header can be linked to the problematic field using [aria-describedby](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-describedby).

Here is an example:

```html
<div role="alert">
  <h4>There are 1 error in this form</h4>
  <ul>
  	<li>
  		<a href="#firstname" id="firstname_error">
  			The First name field is empty; it is a required field and must be filled in.
  		</a>
  	</li>
  </ul>
</div>


<label for="firstname">First Name:</label>
<input type="text" id="firstname" aria-describedby="firstname_error">
```
  
In this example, when a user clicks on the error message in the header, they are navigated to the _First Name_ field. This helps the user understand where the problem is and quickly navigate there.

Client-side validation is another aspect we need to focus on. To add input validation to our form, we use the [required](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required) HTML attribute.

```html
<label for="name">Name (required): </label>
<input type="text" name="name" id="name" required aria-required="true">
```

HTML5 comes with input types such as _email_, _password_, _date_, _number_ and [more](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#input_types). Whenever possible use ```<input> types``` to validate fields.

```html
<input type="date" name="date"/>
```

## 3. Getting Tab Order Right

__Tab order__ is crucial for navigating your website with a keyboard.  You should be able to navigate both forms and the complete website using only the ```Tab``` key. Your tab order needs to be intuitive, logical, and follow the visual flow of the page. Getting keyboard accessibility right is important. Many users navigate web pages using only a keyboard. Incorrect tab placement can confuse users or cause them to miss information on your website.

The tab order is defined using [tabindex] (https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex).

To make your forms keyboard accessible, follow these 4 steps:

- Make sure fields are navigatable in order. No jumping around. Just clean step-by-step navigation from top to bottom or left to right.
- There should be visible indication where is the tab focus currently is
- Use only __tabindex= "0"__ or __tabindex= "-1"__. Tabindex values of 1 or higher should NOT be used.

```html
<label>Fisrt in tab index<input type ="text"></label>
<div tabindex ="0">Second in tab order: tabbable because tabindex was added</div>
<div>Not focusable because no tabindex is added to the div</div>
<button>Third in tab order</button>
```

## 4. Use ARIA Roles and States

It is important to tell a screen reader what the purpose and role of a web element is. [ARIA annotations](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Techniques) is a way to define web elements on a web page. Both HTML and ARIA are used to convert web elements to an accessible alternative format (Braille, text-to-speech). Many of us know HTML, but not ARIA.

> 📌 It is recommend to use standard HTML elements whenever possible instead of ARIA

ARIA's main features are _roles_, _properties_ and _states_.

__Roles__: ARIA roles help assistive technologies like screen reader to understand the structure of a page. For example, you can use roles like _button_, _menu_, _dialog_, _alert_, etc., to provide context about specific elements.

```html
<button aria-label="Close" role="button">X</button>
```

__States__: ARIA states describe the current condition or state of an element, and they can change over time based on user interaction. States can be used to communicate information such as whether an element is expanded or collapsed, whether it's selected, and more.

```html
<div aria-expanded="true">Content is expanded</div>
```

__Properties__: ARIA properties are similar to states, but they provide additional information about an element that doesn't change dynamically. They can be used to convey static information.

```html
<input aria-labelledby="input-label" aria-required="true">
<span id="input-label">Name:</span>
```

ARIA attributes are especially important for web applications that rely heavily on JavaScript and dynamic content updates. They help ensure that users with disabilities can effectively navigate and interact with your web form. However, you should always use HTML instead of ARIA where appropriate, as [improper implementation of ARIA creates more problems than it solves] (https://webaim.org/projects/million/#aria).

```html
<label>Email address (required): <input type="email" required aria-describedby="email-validation"> <span id="email-validation" class="validation-message">Please provide a valid email address using the format name@place.com</span></label>
```

## 5. Include Autocomplete Attribute

Unless you have a reason, make sure to add [autocomplete](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete) attribute to your form fields. Manually filling forms can be time-consuming and result more errors. Autocomplete helps in to auto-populate fields based on the previous inputs. The Web Content Accessibility Guidelines (WCAG) recommend using _autocomplete_ to improve the overall accessibility of web content.

```html
<form action="/submit" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" autocomplete="name">
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" autocomplete="email">
    
    <label for="phone">Phone:</label>
    <input type="tel" id="phone" name="phone" autocomplete="tel">
</form>
```

By providing meaningful values for the autocomplete attribute, you're guiding the browser to suggest relevant information based on the user's input history. This helps users, especially those with disabilities, to fill out forms more efficiently and accurately.

## 6. Don't use Captcha

[According to Builtwith](https://trends.builtwith.com/widgets/captcha), 96% of the top 1 million websites use captcha. Most of them use reCAPTCHA and hCAPTCHA. Visual turing tests such as CAPTCHA [are allowed](https://www.w3.org/TR/turingtest/#:~:text=CAPTCHAs%20are%2C%20allowed%20under,sensory%20perception%20are%20provided%20to) by the Web Content Accessibility Guidelines (WCAG) with some important restrictions.

>  For example, asking users who are blind, visually impaired or dyslexic to identify textual characters in a distorted graphic is asking them to perform a task they are intrinsically least able to accomplish.

![Inaccessible CAPTCHA example](/blog/assets/posts/accessible-form/inaccessible-captcha.png "Inaccessible CAPTCHA example")

WCAG requires that any CAPTCHA solution provide an alternative approach to accommodate different disabilities. In addition, all images must have a text alternative that explains the image and a text describing the CAPTCHA challenge (what to solve, what to do). In general, image-based CAPTCHA puzzles like reCAPTCHA and hCAPTCHA should be avoided whenever possible.

Unfortunately, CAPTCHAs are inaccessible by design. They are designed to prevent bots from submitting a form by obscuring images and text. Even if you use an invisible captcha, it is likely that users will be blocked or asked to solve a puzzle if their IP or browsing behavior is detected as suspicious.

On top of this, CAPTCHAs can often be a source of cultural misunderstanding. Anyone in UX or Visual Design knows the true difficulty in finding completely universal visual cues for icons. What is a 'mailbox' in one country or subculture may look completely different in another. Often CAPTCHA visuals are USA-centric which can be frustrating and inefficient for those who's world looks different. 

![hCaptcha example](/blog/assets/posts/spam-signups/hcaptcha.png "hCaptcha example")

Another problem with CAPTCHA solutions is that they require injecting javascript code into your website. This will have a negative impact on page load speed, as we have demonstrated in our performance analysis of [reCaptcha](https://www.oopspam.com/blog/recaptcha-performance-analyses) and [hCaptcha](https://www.oopspam.com/blog/hcaptcha-performance-analyses).

One way to make your forms accessible while still having spam and fraud detection is to use server-side solutions like [OOPSpam](https://www.oopspam.com/).

### Try Our Accessible Captcha Alternative

We designed [OOPSpam](https://www.oopspam.com/) to be an accessible and privacy-friendly alternative to reCAPTCHA, hCAPTCHA and other similar solutions. By design OOPSpam works in your server and never interacts with your visitors. Instead it looks at form message content, IP and email to filter spam and fraud. This approach eliminates the burden on users to prove their humanity and has 0 impact on your website performance. Instead, we allow form submissions without any challenge or puzzle which later are analyzed and categorized as spam or not. [OOPSpam WordPress plugin](https://wordpress.org/plugins/oopspam-anti-spam/) (that's us 👋) does this automatically. Check out [other integrations](https://www.oopspam.com/help/).

I hope this article was helpful for you in creating accessible forms which may be available to everyone.
