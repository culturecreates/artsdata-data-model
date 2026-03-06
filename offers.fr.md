---
nav_exclude: true
lang: fr
---
<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

# Lignes directrices Artsdata pour la propriété `offers`

La propriété `offers` est fortement recommandée pour les événements des arts de la scène. Elle permet aux robots d'accéder à la page officielle de billetterie et peut également identifier des informations supplémentaires, telles que le prix de billets le plus bas, la monnaie dans laquelle ce prix est exprimé et la date/heure à laquelle les billets seront mis en vente.

Pour les besoins d'Artsdata, deux types principaux sont associés à cette propriété : `Offer` et `AggregateOffer`.

### Offer

Identifie un prix de billet unique pour une URL de billetterie unique.

Exemple pour [Whose Lineage is it Anyway? An Improvised Shakspearean History](https://www.showpass.com/whose-lineage-is-it-anyway-an-improvised-shakspearean-history-3/), diffusé par Little Mountain Gallery, qui comprend un prix unique d'aucune place assignée :
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

Identifie plusieurs prix de billets pour une seule URL de billetterie.

Exemple pour [Adolescentes de Venezuela Live Concert Ottawa](
https://www.eventbrite.ca/e/adolescentes-de-venezuela-live-concert-ottawa-tickets-1747846177969?aff=ebdssbcategorybrowse), diffusé par DDB Production, qui comprend un prix d' aucune place assignée et un prix privilégié :
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
