---
title: Google Sheets
layout: architecture-doc
---

{% include base.html %}

Google spreadsheets are an easy way to get started loading data into Artsdata.ca.

For example, event organizer can use the [Google Sheet-to-Artsdata tool]({{base}}/architecture/google-sheet-to-artsdata.html) to convert their event information into Schema structured data. This structured data can then be loaded to the Artsdata knowledge graph via the Artsdata databus.

Other kinds of Google Sheets can also be loaded to Artsdata, provided they meet a few conditions:

- The first row sheet must contain column headings.
- The heading names must match the machine name of properties within the [Artsdata data model]({{base}}). Property names are always written in camel case. For example, the heading for an artist's given name should be `givenName`.
- The cell values must match the expected data type for the property. For example, the value for the `sameAs` property should be a full URI.

If you wish to upload a Google Sheet to the Artsdata knowledge graph, please send your are spreadsheet to [**artsdata@capacoa.ca**](mailto:artsdata@capacoa.ca). We will happily assess its suitability for upload, and offer guidance as needed.
