---
title: Culture Creates Wringer
layout: architecture-doc
---

Wringer (code name) is a tool & service developed by Culture Creates to extract web pages with existing JSON-LD event data into Artsdata.ca.

This tool is used with web sites that already have good JSON-LD, or a technical team with which Culture Creates can work with to guide the additional of JSON-LD event data to their web site.

The National Arts Centre in Ottawa, Canada is a great example of how we collaborated together to guide the creation of JSON-LD on to their web pages.  Not only was Artsdata.ca able to collect and aggregate this data, but Culture Creates also build a pilot Chat Bot using the JSON-LD as the data source ([Chat bot video](https://youtu.be/WalOgD41kDE))

There are many different ways a website can be crawled: crawling the entire website and extracting data following a URL pattern, a list of webpages from scraping a listing page, or a site map with a URL pattern.  The end result is stored in a table with one webpage per row.  Each row contains the extracted metadata in JSON-LD format, URL, page name, extraction date.