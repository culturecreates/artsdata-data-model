# Good Practices for Selecting `schema:performer` Values

## Overview

This document presents a set of good practices for selecting values to populate the [`schema:performer`](https://schema.org/performer) property in the context of performing arts event data. It is based on the Artsdata team’s ongoing work with cultural organizations and developers across the Canadian performing arts sector.

The goal is to improve data consistency and discoverability for live performance events, especially in promotional use cases.

## Why this guidance is needed

While properties like `schema:location` or `schema:organizer` are relatively easy to populate—thanks to limited options and dropdowns—`schema:performer` is more complex. It often requires a nuanced understanding of the performance and its structure, especially in multidisciplinary and ensemble-based genres like dance, orchestral music, or theatre.

Cultural workers may hesitate to populate this property due to:

- Ambiguity around what counts as a "performer"
- Lack of predefined lists
- Uncertainty around prominence or naming conventions

These guidelines aim to reduce friction and offer clarity.

## General Guidelines

### 1. Align with Public Presentation

Select performer values that match how the show is described to the public:

- Check the title, subtitle, and description on the event web page.
- Use the name(s) of artists or companies highlighted in promotional materials.

### 2. Main Entities on Stage

As a general rule, `schema:performer` should include the main entity or entities physically performing on stage during the event.

### 3. Use `schema:Role` for Clarity

If more than one performer is relevant (e.g., headliner and opener), use [`schema:Role`](https://schema.org/Role) to clarify their respective roles.

#### Example:

```json
{
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
}

### 4. Fallback for Single-Value Systems

If your CMS or publishing tool only allows for a single `schema:performer` value:

- Choose the entity with the most public recognition.
- Prioritize names that are likely to be recognized by search engines and audiences.

### 5. This is for Promotion, Not Archiving

These guidelines are designed primarily for promotional and discoverability use cases.

They may not be suitable for archival or casting contexts where detailed credits or full ensembles are needed.

## Genre-Specific Recommendations

### Dance Performances

Acceptable `schema:performer` values may include:

- The dance company (recommended default)
- A solo or featured performer
- Guest artist(s)
- Principal dancer(s)
- A list of individual dancers (if known and relevant)

**When in doubt, list the dance company** — this helps identify the show's origin and is usually discoverable.

### Orchestral Concerts

Acceptable `schema:performer` values may include:

- The orchestra (recommended default)
- Soloist(s) (e.g., pianist, violinist)
- Guest conductor(s)

If only one value can be used, **choose the orchestra** for consistency and discoverability.

## Genre-Specific Recommendations

### Dance Performances

Acceptable `schema:performer` values may include:

- The dance company (recommended default)
- A solo or featured performer
- Guest artist(s)
- Principal dancer(s)
- A list of individual dancers (if known and relevant)

**When in doubt, list the dance company** — this helps identify the show's origin and is usually discoverable.

### Orchestral Concerts

Acceptable `schema:performer` values may include:

- The orchestra (recommended default)
- Soloist(s) (e.g., pianist, violinist)
- Guest conductor(s)

If only one value can be used, **choose the orchestra** for consistency and discoverability.

## Additional Notes

- Use `sameAs` links (e.g., to Wikidata, ISNI, or Artsdata URIs) when identifying performer entities to enhance interoperability.
- Developers building CMS or event tools should consider enabling dropdowns or suggestions for known artistic companies and performers.
