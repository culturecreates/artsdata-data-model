---
title: "@id Property and URIs"
layout: default
nav_order: 1
---

<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

## Artsdata Guidelines about the @id property and URIs

The Schema.org documentation does not, unfortunately, say much about the `"@id"` property, nor how to generate URIs for them. In order to make up for these shortfalls, Artsdata prepared the following guidelines. These guidelines are intended primarily for web developers.

In these guidelines, the word “Thing” is borrowed from the Schema terminology to designate any real-world object, such as a specific event, place or person. It is synonymous with the term “entity” (commonly used in Artsdata documentation), in the sense of an object with an identity.

### General documentation for the @id property

|  |  |
| ---------- | --------------------------------- |
| Data type | [xsd:anyURI](https://www.datypic.com/sc/xsd/t-xsd_anyURI.html) |
| Instructions | The value should be a URI constituting a unique persistent identifier for the Thing (for example, an Event or Place entity) within the website domain. |
| Note | Do not populate the same URI under both `@id` and `url`.<br>A webpage URL is the unique persistent identifier for that webpage, and nothing else. It should not be used to identify any of the things described on that webpage. In Schema structured data (and in any other RDF-based ontologies), a “real-world object” (such as an Event or Place entity) and the web document describing it are two distinct things: they each deserve their own URI. |
 
Scroll down to learn how to generate functional URIs.

### Benefits of using @id to assign URIs to Things

* @ids with URIs are to Things what canonical URLs are to webpages. They make it possible to identify a single Thing, to locate and retrieve resources describing it (i.e. a JSON-LD representation), and to refer to it in other information systems (i.e. “link” to it).
* URIs make it easier to reconcile datasets. Once a match is found between a Thing’s local URI and that Thing’s Artsdata ID, we can write a schema:sameAs link in Artsdata and never need to repeat this reconciliation process ever again.
* URIs can ensure that data lasts over time. Even when an event page is unpublished from a website, the URI identifying this event can be preserved in Artsdata and continue to be accessed (along with the associated structured data).
  
## How to generate a functional URI

For the purpose of identifying a Thing, a URI is functional if it uniquely identifies a single real-world object AND if this real-world object is assigned a single URI within the web domain. In other words, the cardinality must be one-to-one. While it is preferable that the URI resolves to some representation (HTML, JSON-LD or other) of the Thing, Artsdata can use any type of functional URI to refer to external Things, even if these URIs lead to "404 Not Found" responses.

### Webpage-based HashURIs

*Note: This method may not be suitable for websites with language negotiation, with dynamic content, or with multiple entities on the same webpage.*

* It is possible to generate a functional URI by appending a hash (`#`) at the end of an existing webpage URL, followed by a string of characters that acts as a unique identifier for a Thing described on the page (an event, a place or a performer). This string is called a fragment identifier.
* The fragment identifier should preferably be unique within the website domain. At a minimum, it should be unique within the page.
* Only append fragment identifiers to canonical URLs. If a given Thing is described across several webpages, it must always have the same URI, no matter where it is referenced on your website.
* It is not necessary for the fragment identifier to point to a tail anchor within the page’s body (for example, an id or name attribute). As a matter of fact, it is not even necessary for the HashURI to resolve to a webpage.

#### Examples of webpage-based HashURIs

Here are a few examples of improper and proper uses of URIs derived from webpage URLs:

| Example | Suitability as URI |
| - | - |
| <br>`"@id": "https://someorg.ca/events/eventname/"`<br>(Where the value is the same as the page URL, without a fragment identifier) | <span style="color:red">**Critical Error**</span><br>The `"@id"` and `"url"` values should not be the same. |
| <br>`"@id": "https://someorg.ca/events/eventname/#event"`<br><br>(Where the same fragment identifier is used for all entities of the same type.) | <span style="color:orange">**Good**</span><br>Note: This naming convention won’t work if more than one event is listed on the same page, because multiple events would be assigned the same URI. |
| <br>`"@id": "https://someorg.ca/events/eventname/#123abc"`<br><br>(Where the fragment identifier `123abc` follows a naming convention that guarantees  uniqueness within the webpage.) | <br><span style="color:green">**Better!**</span> |
| <br>`"@id": "https://someorg.ca/events/eventname/#key"`<br><br><small>(Where `key` is the primary key identifying the event entity in your local database.)</small> | <br><span style="color:green">**Even better!**</span> |

Basing the fragment identifier on the Thing’s primary key in your database is a simple and efficient means of ensuring that the fragment identifier is unique within the site’s domain.

If you can’t base your fragment identifier on database keys, we recommend using a naming convention that will ensure the uniqueness of the fragments identifier today and in the future. For example, you could base your fragment identifier on the `startDate` string and the `location.name` string, as in this naming convention: `YYMMDDHH-SOMEPLACE` *(Note: If you opt for a fragment identifier based on data points, make sure it remains stable even if these data points are edited: once it is dynamically generated, make it static by storing it in field where it won't change)*.

### Other strategies to generate URIs

HashURIs based on existing webpage URLs, as described above, are only one of many ways of generating functional URIs to identify the things described on your website. Here are other strategies for generating flexible, stable and persistent URIs:

* HashURIs can be based on a URL path that is independent of any existing webpage. URIs that are independent from the website’s structure are more stable over time than webpage-based HashURIs. In other words, if the site structure changes, you can still continue to use the same naming convention. 
  Example: `"https://someorg.ca/id/#123456"` 
  (Reminder: This HashURI is functional even if it does not resolve to any resource.)
* For websites with dynamic content, you may use rewrite rules to ensure the URI is independent from the site’s current implementation. 
  Example: `"https://someorg.ca/event/123456"` rewritten to `"https://someorg.ca/index.php?event=123456"`
* Redirection rules are commonly used to generate [303 URIs](https://en.wikipedia.org/wiki/HTTP_303). The 303 server response signals that the URI does not identify a regular web document and then redirects the request to another URI, usually with content negotiation.
* You may implement content negotiation to direct a request to different HTML, JSON-LD and/or RDF representations, depending on client preference.
* You may also use an external service to generate URIs on another domain and redirect them to your web domain. Such services include [Digital Object Identifiers](https://www.doi.org/) (DOI), [Archival Resource Keys](https://arks.org/) (ARK) and [PURL](https://purl.archive.org/).

### External resources on URIs

* [Cool URIs for the Semantic Web](https://www.w3.org/TR/cooluris/), W3C Interest Group Note 03 December 2008
* [Identifiants pérennes pour les ressources culturelles : Vade-mecum pour les producteurs de données](https://www.culture.gouv.fr/Espace-documentation/Publications-revues/Identifiants-perennes-pour-les-ressources-numeriques), Version 1.0, 2015.


## If you are unable to generate your own URIs…

Don’t worry. Artsdata can handle data without URIs.

As an alternative (or in complement to `"@id"`), consider using the `"sameAs"` property to assign an external persistent identifier to your Place, Person and Organization entities. This is a simple and highly effective way to identify a Thing, and to provide a link to more data about it.

See: [Artsdata guidelines regarding the sameAs property]({{ base }}/identifiers-guidelines/sameas.html)

