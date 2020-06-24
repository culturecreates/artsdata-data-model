
{% include base.html %}
{% include architecture-diagram.html %}

Data Clients
--------------

Data Clients use the data in Artsdata.ca to create listing sites, enrich data in their CMS, or build recommendation engines and intelligent assistants.

Currently Google is the main data client using distributed graphs of Artsdata.ca on individiual web sites published as JSON-LD by Footlight. Artsdata.ca maps to Schema.org vocabularies for this reason. In the future we anticipate a point in time where Google and other search engines will want to work directly with Artsdata.ca.

As regions of Canada are included in Artsdata.ca and reach critical mass, we hope to see more data clients appear.


##### City of Laval

* The city of Laval in Quebec was the first data client with their own [http://laval.footlight.io](http://laval.footlight.io) knowledge graph built using Footlight on two principle website co-motion.ca and laval.ca. 
* The web site called [Signé Laval](https://signelaval.com/fr/evenements) is a cultural calendar that displays event data from Laval's kn owledge graph.  The calendar uses a CMS that refreshes it's data from the knowledge graph weekly.  In the CMS, the event data is manually tagged with categories which are then published in the Signé Laval cultural calendar.  
* A future project was documented [here](https://linkeddigitalfuture.ca/fr/2020/04/02/lier-des-jeux-de-donnees-afin-dameliorer-les-calendriers-culturels/) that describes how the auto-assembling of additional data sources could further improve the categories in the cultural calendar.

##### Culture inTime Demo

* Demo [Culture inTime](https://culture-intime.herokuapp.com) built in a 2 day Swiss #GLAMhack2020 hackathon - see [GitGub repository](https://github.com/saumier/GLAMhack2020-Culture-inTime)
