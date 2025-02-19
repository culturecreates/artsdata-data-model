---
title: Minting API
layout: architecture-doc
---

The Minting API creates and assigns globally-unique persistent identifiers – Artsdata IDs – to entities. The API returns Artsdata IDs as URIs: 

- URI format: `http://kg.artsdata.ca/resource/$1` 
- Regex for the ID: `^K\d+-\d+$`
- Sample URI: `http://kg.artsdata.ca/resource/K12-438`

The Minting API works in conjunction with the Reconciliation API: an entity should first be passed through the reconciliation API to ensure no Artsdata URI has already been minted for the entity.

Minting URIs as a service is in alpha. It provides an API for developers to request new URIs for entities being added to Artsdata. 
