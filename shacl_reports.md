{% include base.html %}
{% include last-modified.html %}

## SHACL Reports
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

The Artsdata.ca Databus uses SHACL shapes to validate input data. A report is generated with each call to the Databus. The SHACL report is a summary of data graph nodes in violation and the related shapes.  The URIs of the nodes and shapes in the report are dereferencable and can be looked up to help debug the violation.

The default SHACL shape that validates all data graphs is `shacl_events_shape.ttl` located in this [Github repository](https://github.com/culturecreates/artsdata-data-model/blob/master/shacl/event/).

Sample event JSON-LD files are available in the samples directory. You can play around with these sample events in the SHACL Playground. 

When calling the Artsdata Databus it is possible to pass in the name of a SHACL shape as a parameter. This will override the default SHACL shape used to validate your data graph.

### SHACL Playground
To try out SHACL validation head over to [shacl-playground](https://shacl-playground.zazuko.com) on the zazuko.com website. 
1. Copy/paste the `shacl_events_shape.ttl` file into the Shape Graph.
2. Copy/paste one of the sample event JSON-LD files into the Data Graph.
3. Check out the validation report at the bottom of the playground.
