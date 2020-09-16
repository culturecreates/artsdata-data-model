---
class_name: Organization
layout: class-doc
---

## Adding organizations to Artsdata.ca

### Required

* [name](https://schema.org/name) - indicate language @en, @fr
* [url](https://schema.org/url) - Official URL of the organization
* [address](https://schema.org/address) - Use [PostalAddress](https://schema.org/PostalAddress)

### Recommended

* [alternateName](https://schema.org/alternateName) - indicate language @en, @fr
* [sameAs](https://schema.org/sameAs)
* [areaServed](https://schema.org/areaServed) (pending)
* [contactPoint](https://schema.org/contactPoint) (pending)
* [subOrganization](https://schema.org/subOrganization) (pending)
* [parentOrganization](https://schema.org/parentOrganization) (pending)
* [legalName](https://schema.org/legalName) (pending) - indicate language @en, @fr
* [identifier](https://schema.org/identifier) - Canadian Business Number. For example: ({ "@type": "PropertyValue", "propertyID": "Canadian Business Number (BN)", "value":  "801228875"})
* [leiCode](https://schema.org/leiCode) (pending)
* [isicV4](https://schema.org/isicV4) (pending)
* [naics](https://schema.org/naics) (pending)


 We recommend linking social media profiles with schema:sameAs, and external global IDs like ISNI, but these are not mandatory.
 
