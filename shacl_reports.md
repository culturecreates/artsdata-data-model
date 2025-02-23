{% include base.html %}
{% include last-modified.html %}

## SHACL Reports
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

The Artsdata.ca Databus uses SHACL shapes to validate input data. The SHACL shapes used to validate input is passed as a parameter to the Databus. A report is generated with each POST to the Databus. The SHACL report is a summary of data graph nodes in violation and the related shapes.  The URIs of the nodes and shapes in the report are dereferencable and can be looked up to help debug the violation.

The default SHACL shapes (when no URL to a SHACL file is passed) are defined by the Artsdata Platform (Artsdata API repo in Github) in a file called `shacl_artsdata.ttl`. The rules can be browsed visualy in Artsdata [here] (https://kg.artsdata.ca/query/show?sparql=https://raw.githubusercontent.com/artsdata-stewards/artsdata-actions/main/queries/artsdata_SHACL_validation_rules.sparql).

Sample event JSON-LD files are available in the samples directory. You can play around with these sample events in the SHACL Playground. 

When calling the Artsdata Databus it is possible to pass in the name of a SHACL shape as a parameter. This will override the default SHACL shape used to validate your data graph.

### SHACL Playground
To try out SHACL validation head over to [shacl-playground](https://shacl-playground.zazuko.com) on the zazuko.com website. 
1. Copy/paste the `shacl_events_shape.ttl` file into the Shape Graph.
2. Copy/paste one of the sample event JSON-LD files into the Data Graph.
3. Check out the validation report at the bottom of the playground.
