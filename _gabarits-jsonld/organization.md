---
title: Organization Structured Data Templates
layout: gabarits-doc
---

Structured Data Templates for Organizations
=====================================

The contents of this document are under a Creative Commons - Attribution 4.0 license.

This is an evolving document in which CAPACOA provides a Schema structured data template for describing performing arts organizations. This template was developed as part of the Digital Discoverability Program. It was adapted from an initial template developed for the Indigenous Performing Arts Alliance, as well as recommendations in the Artsdata data model and in Google’s Organization Schema Markup guidelines.

If you try out this JSON-LD template please contact CAPACOA to let us know. We would love to see your structured data in action.

```
<script type="application/ld+json">
{
"@context": "http://schema.org/", 
"@type": "Organization",
"name": "--Title by which the organization is most likely to be known/searched for--",
"legalName": "--Official title of the organization in legal documents--",
"alternateName": "--Additional alias(es) by which the organization may be known/searched for--",
"additionalType": "--Artsdata URI of a category corresponding to the particular type of organization, for example http://kg.artsdata.ca/resource/PresentingOrganization. See the full list at https://kg.artsdata.ca/entity.html?uri=http%3A%2F%2Fkg.artsdata.ca%2Fresource%2FArtsdataOrganizationTypes--",
"description": "--Short text outlining the organization’s purpose or mission--",
"url": "--URL of the organization’s official website--",
"logo": "--URL of the organization’s logo image file--",
"foundingDate": "--Year or full date that the organization came into existence, in ISO 8601 format. For example, 1979-12-31--",
"knowsLanguage": "--main operating language(s) of the organization, in IETF BCP 47 format. For example, en for English--",
"knowsAbout": [
   {
   "@type": "Specialty",
   "name": "--Name of the organization’s principal genre, discipline or other specialization--",
   "sameAs": "--Wikidata URI of the speciality, in http://www.wikidata.org/entity/$1 format--"
      }
                            ],
"address": {
   "@type": "PostalAddress",
   "addressCountry": "CA",
   "addressRegion": "--Two-letter abbreviated name of the province or territory where the organization is based--",
   "addressLocality": "--Name of the city or town where the organization is based--",
   "streetAddress": "--Civic number and street of the organization’s business address--",
   "postalCode": "--Postal code of the organization’s business address--"
                        },
"areaServed": {
   "@type": "Place",
   "address": {
      "@type": "PostalAddress",
      "addressCountry": "CA",
      "addressRegion": "--Two-letter abbreviated name of the principal province(s) or territor-y(-ies) where the organization provides services--",
      "addressLocality": "--Municipality, county or other localized geographical region where the organization provides services--"
                        }
                              },
"naics": "--Six-digit North American Industry Classification System code. Most performing arts industry codes can be found in https://docs.google.com/spreadsheets/d/1Ddvz6r05IEBiXdfXyOYGDvI-1c6iIoiG-1OZsckgkvU/edit?gid=0#gid=0--",
"sameAs": [
   "--Link to one or more of the organization’s social media accounts, if available--",
   "--Artsdata.ca URI of the organization, obtained with the Reconciliation API or the search tool--",
   "--Wikidata URI of the organization, in http://www.wikidata.org/entity/$1 format--"
                   ]
}
</script>
```

# Add-Ons

## member/memberOf
member can be a helpful Schema property for performing groups who wish to connect data about each individual artist in their organizational structured data. If you decide to use this add-on, please insert it directly above the "isicV4" line.

```
"member": {
   "@type": "Person",
   "name": "--Full stage name of the artist--",
   "url": "--URL of the artist’s official website--",
   "sameAs": [
      "--Link to one or more of the artist’s social media accounts, if available--",
      "--Artsdata.ca URI of the artist, obtained with the Reconciliation API or the search tool--",
      "--Wikidata URI of the artist, in http://www.wikidata.org/entity/$1 format--"
                   ]
                     },	
```

Similarly, memberOf can be a helpful Schema property for any type of group or organization who is a member of an arts service organization. If you decide to use this add-on, please insert it directly above the "isicV4" line.

```
"memberOf": {
   "@type": "Organization",
   "name": "--Name of the arts service organization--",
   "url": "--URL of the arts service organization’s official website--",
   "sameAs": [
      "--Link to one or more of the organization’s social media accounts, if available--",
      "--Artsdata.ca URI of the organization, obtained with the Reconciliation API or the search tool--",
      "--Wikidata URI of the organization, in http://www.wikidata.org/entity/$1 format--"
                       ]
                           },
```

## parentOrganization/subOrganization

These two properties may be used to designate a larger organization that your organization is a division of (parentOrganization) and a smaller division within your organization (subOrganization), respectively. If you decide to use either of these add-ons, please insert them directly above the "isicV4" line.

```
"parentOrganization":	{
   "@type": "Organization",
   "name": "--Name of the parent organization--",
   "url": "--URL of the parent organization’s official website--",
   "sameAs": [
      "--Link to one or more of the parent organization’s social media accounts, if available--",
      "--Artsdata.ca URI of the parent organization, obtained with the Reconciliation API or the search tool--",
      "--Wikidata URI of the parent organization, in http://www.wikidata.org/entity/$1 format--"
                       ]
                                     },
```

```
"subOrganization": {
   "@type": "Organization",
   "name": "--Name of the sub-organization--",
   "url": "--URL of the sub-organization's official website--",
   "sameAs": [
      "--Link to one or more of the sub-organization’s social media accounts, if available--",
      "--Artsdata.ca URI of the sub-organization, obtained with the Reconciliation API or the search tool--",
      "--Wikidata URI of the sub-organization, in http://www.wikidata.org/entity/$1 format--"
                       ]
                                  },
```
