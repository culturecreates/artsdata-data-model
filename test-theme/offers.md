<p>{% include back-button.html %}</p>

{% include language-switcher.html %}

# Artsdata Guidelines Regarding the `offers` Property

The `offers` property is highly recommended for performing arts events. It enables robots to navigate to the official ticketing page and can also identify additional information, such as the lowest ticket price, the currency of that price, and the date/time when ticket purchasing becomes available.

For Artsdata purposes, there are two main @types associated with this property: `Offer` and `AggregateOffer`.

### Offer

Identifies a single ticket price for a single ticketing URL.

Example for [Whose Lineage is it Anyway? An Improvised Shakspearean History](https://www.showpass.com/whose-lineage-is-it-anyway-an-improvised-shakspearean-history-3/), presented by Little Mountain Gallery, which includes a single General Admission price:
   ```
"offers":
         {
            "@type":"Offer",
            "name":"General Admission",
            "url":"https://www.showpass.com/whose-lineage-is-it-anyway-an-improvised-shakspearean-history-3/",
            "price":"16.94",
            "priceCurrency":"CAD",
            "availability":"http://schema.org/InStock",
            "validFrom":"2025-09-09T16:53:19-07:00",
            "validThrough":"2025-11-07T20:15:00-08:00"
    },
   ```

### AggregateOffer

Identifies multiple ticket prices for a single ticketing URL.

Example for [Adolescentes de Venezuela Live Concert Ottawa](
https://www.eventbrite.ca/e/adolescentes-de-venezuela-live-concert-ottawa-tickets-1747846177969?aff=ebdssbcategorybrowse), presented by DDB Production, which includes a General Admission and a VIP price:
   ```
"offers":
         {
            "@type":"AggregateOffer",
            "url":"https://www.eventbrite.ca/e/adolescentes-de-venezuela-live-concert-ottawa-tickets-1747846177969",
            "lowPrice":"65.4",
            "highPrice":"86.73",
            "priceCurrency":"CAD",
            "availability":"http://schema.org/InStock",
            "validFrom":"2025-09-26T15:00:00+00:00",
    },
   ```
