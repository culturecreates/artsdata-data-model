<p>{% include back-button.html %}</p>
# Good Practices for Selecting performer Values

#### Table of Contents
* [Overview](#overview)
* [Why This Guidance is Needed](#why-this-guidance-is-needed)
* [General Guidelines](#general-guidelines)
* [Genre-Specific Recommendations](#genre-specific-recommendations)
* [Additional Notes](#additional-notes)

## Overview

These guidelines are designed primarily for promotional and discoverability use cases. They may not be suitable for archival or casting contexts where detailed credits or full ensembles are needed.

This document presents a set of good practices for selecting values to populate the [`performer`](https://schema.org/performer) property in the context of performing arts event data. It is based on the Artsdata team’s ongoing work with cultural organizations and developers across the Canadian performing arts sector.

## Why This Guidance is Needed

While properties like `location` or `organizer` are relatively easy to populate—thanks to limited options and dropdowns—`performer` is more complex. It often requires a nuanced understanding of the performance and its structure, especially in multidisciplinary and ensemble-based genres like dance, orchestral music, or theatre.

Cultural workers may hesitate to populate this property due to:

- Ambiguity around what counts as a "performer";
- Lack of predefined lists;
- Uncertainty around prominence or naming conventions.

These guidelines aim to reduce friction and offer clarity.

## General Guidelines

### 1. Align with Public Presentation

Select performer values that match how the show is described to the public:

- Check the title, subtitle, and description on the event web page;
- Use the name(s) of artists or companies highlighted in promotional materials.

### 2. Main Entities on Stage

As a general rule, `performer` should include the main entity or entities physically performing on stage during the event.

### 3. Use `Role` for Clarity

If more than one performer is relevant (e.g., headliner and opener), use [`Role`](https://schema.org/Role) to clarify their respective roles.

#### This is an example from a fictitious event in JSON-LD:

```
  "performer": [
    {
      "type": "Role",
      "roleName": "Headliner",
      "performer": {
        "type": "PerformingGroup",
        "name": "Main Band"
      }
    },
    {
      "type": "Role",
      "roleName": "Opening Act",
      "performer": {
        "type": "PerformingGroup",
        "name": "Up-and-coming Band"
      }
    }
  ]
```
### 4. Fallback for Single-Value Systems

If your CMS or publishing tool only allows for a single `performer` value:

- Choose the entity with the most public recognition;
- Prioritize names that are likely to be recognized by search engines and audiences.

## Genre-Specific Recommendations

### Dance Performances

Acceptable `performer` values may include:

- The dance company (recommended default);
- A solo or featured performer;
- Guest artist(s);
- Principal dancer(s);
- A list of individual dancers (if known and relevant).

**When in doubt, list the dance company** — this helps identify the show's origin and is usually discoverable.

### Orchestral Concerts

Acceptable `performer` values may include:

- The orchestra (recommended default);
- Soloist(s) (e.g., pianist, violinist);
- Guest conductor(s).

If only one value can be used, **choose the orchestra** for consistency and discoverability.

## Additional Notes

- Use `sameAs` links (e.g., to Wikidata, ISNI, or Artsdata URIs) when identifying performer entities to enhance interoperability.

See: [Artsdata guidelines regarding the sameAs property]({{ base }}/sameas-guidelines)
