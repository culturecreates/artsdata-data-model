---
title: Architecture Overview
layout: default
---
{% include base.html %}
{% include back-button.html %}
{% include architecture-diagram.html %}
<ul>
{% for page in site.architecture %}
  {% if page.layout == "architecture-doc" %}
   <li> <a href="{{ base }}{{ page.url }}"> {{ page.title}}</a></li>
  {% endif %}
{% endfor %}
</ul>