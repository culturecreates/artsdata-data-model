---
title: Footlight Console
layout: architecture-doc
---

{% include base.html %}

Footlight is a tool & service developed by Culture Creates to convert web pages with events into structured and linked data.  Footlight started in 2018 and is in closed beta with 25 arts organizations in Canada.

The goal of Footlight is to have a "one hour" learning curve.  For this reason, Culture Creates built the Footlight Console, an easy to use UI for arts organizations to review their event data. Culture Creates accompanies arts organizations by configuring the back end (Condenser - very technical and scary) so that all the heavy lifting is done and the arts organization only has to review the results using the Footlight Console (friendly).

*  [Publication](https://www.societybyte.swiss/2019/06/27/how-art-institutions-can-manage-their-metadata/)  "How art institutions can manage their metadata", Gregory Saumier-Finch (June, 2019) 


![image]({{ base }}/images/footlight-index.png)

### Workflow
An arts organization starts by creating a user account on Footlight.  Once accepted into the closed beta program, Footlight crawls the web site for events ([technical video](https://youtu.be/1oEmv1448tA) of initial setup of crawlers by a technical person at Culture Creates) and presents a dashboard of automatically structured events. Footlight uses Artsdata.ca to detect and look up named entities such as Artist, Organization, and Venue. The manager reviews and adjusts the event data and links to named entities using the Footlight console. 

![image]({{ base }}/images/footlight-event.png)

Footlight re-crawls the web site every 24 hrs.  Any changes are shown in the Footlight console. Most changes (like an updated description) are published immediately, however breaking changes (like a missing date) will prevent the event from publication and request a new review by the manager at the Arts Organization.

![image]({{ base }}/images/footlight-dates.png)

New properties are added "as needed" depending on the evolution of Schema.org and players like Google ([technical video](https://youtu.be/316XYGsZwRw) of adding additional property to Footlight).  New properties need to be reviewed by the arts organization manager before they are published.

### Output
Footlight publishes linked open data in 2 places:

##### 1. Event JSON-LD on Web Site
Footlight provides a generic Javascript "code snippet" that can be placed on the web site of the arts organisation ([doc](https://docs.google.com/document/d/16PjkLCwSn9kY_pAr1UTSMUdsOrw_Pyc6jiQIpw8B0h8/edit?usp=sharing)). This Javascript dynamically includes the JSON-LD generated by Footlight, into each individual event web page. [JSON-LD 1.1 Framing](https://www.w3.org/2018/jsonld-cg-reports/json-ld-framing/) is used to convert the RDF triples into a format recommended by Google.

Once published on the web site, search engines like Google are immediately able to use this data to create rich snippets and add events to the Google Knowledge Graph.  The Google Search Console generates reports on which pages have Event data and their status inside Google.


##### 2. Artsdata.ca
Footlight publishes RDF to Artsdata.ca for each event that is reviewed in the Footlight Console. 

Note: EventSeries and Events are linked using schema:subEvent property. 

