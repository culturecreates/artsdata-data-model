{% include base.html %}
{% include last-modified.html %}

## SHACL Reports
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

The Artsdata.ca Databus uses SHACL shapes to validate input data.

It is possible to pass in the name of a SHACL shape to use, but the default shape is `shacl_events_shape.ttl` located in Github [here] (https://github.com/culturecreates/artsdata-data-model/blob/master/shacl/event/)

Sample event JSON-LD files to play around with are located in the samples directory.

Playground
===========

To try out SHACL validation head over to [shacl-playground](https://shacl-playground.zazuko.com) on the zazuko.com website. 
1. Copy/paste the `shacl_events_shape.ttl` file into the Shape Graph
2. Copy/paste one of the sample event JSON-LD files into the Data Graph  
3. Check out the validation report at the bottom of the screen.
