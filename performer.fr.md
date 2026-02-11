---
nav_exclude: true
lang: fr
---
{% include back-button.html %}

{% include language-switcher.html %}

# Lignes directrices Artsdata pour la propriété `performer`

La propriété 'performer' fournit des informations extrêmement précieuses sur un événement des arts de la scène. Par exemple, elle peut être utilisée pour récupérer d’autres représentations associées au même interprète ou pour filtrer des événements en fonction de l’origine de l’interprète.

### Bonnes pratiques pour le choix des valeurs de performer

Sélectionner la ou les bonnes valeurs pour la propriété `performer` n'est pas toujours chose aisée. C'est pourquoi nous avons conçu cette série de [bonnes pratiques]({{ base }}/performer-values.fr.html)

### Bonnes pratiques concernant le @type des interprètes

Déterminer si un interprète doit être typé comme [`Person`](https://schema.org/Person), [`PerformingGroup`](https://schema.org/PerformingGroup), ou [`Organization`](https://schema.org/PerformingGroup) n’est pas toujours une tâche simple.

La confusion survient souvent lorsqu’un artiste solo se produit accompagné d’autres musiciens dont les noms ne sont pas précisés.

Prenons un exemple : Susan Aglukark [ad:K12-296](http://kg.artsdata.ca/resource/K12-296) est en tournée avec quatre musiciens, mais nous ne savons pas qui ils sont, et leur composition peut même varier d’une représentation à l’autre. Dans un tel cas, l’entité performer doit-elle être une 'Person' ou un 'PerformingGroup' ?

**Si le nom de l’entité interprète est celui d’une personne physique, alors le type doit être 'Person'.**

Voici pourquoi.

PerformingGroup est une sous-classe de 'Organization' et n’a aucune relation directe ou indirecte avec la classe Person dans l’ontologie Schema.org. Par conséquent, si le type était 'PerformingGroup', les moteurs de recherche, Artsdata et d’autres agents utilisateurs qui lisent ces données tenteront de faire correspondre la chaîne de caractères du nom – « Susan Aglukark » dans l’exemple ci-dessus – avec d’autres entités de type PerformingGroup ou Organization présentes dans des fichiers d’autorité. Or, puisque Susan Aglukark est considérée comme une personne dans Wikidata, MusicBrainz, VIAF et ISNI (ainsi que dans Artsdata), aucune correspondance ne sera trouvée.

Autrement dit, si vous souhaitez que vos données structurées aient du sens pour les machines, vous devez utiliser le même type que celui que l’on retrouve dans les fichiers d’autorité tels que [Wikidata](https://www.wikidata.org/) et [VIAF](https://viaf.org/).

Dans les situations où il n’est pas possible d’assigner un type précis à une entité 'performer', ou si vous souhaitez définir un type par défaut valable pour tous les objets 'performer', Artsdata recommande la modélisation suivante pour l’entité imbriquée :

    {
        "@type": "Thing",
        "additionalType": [
            "http://dbpedia.org/ontology/Agent",
            "http://xmlns.com/foaf/0.1/Agent",
            "http://www.cidoc-crm.org/cidoc-crm/E39_Actor"],
        "name": "--Nom de l'entité : Name of the entity--",
        "sameAs": ""--URI Artsdata.ca, obtenue avec l'API de réconciliation ou l'outil de recherche : Artsdata.ca URI, obtained with the Reconciliation API or the search tool--"
        }

Dans cette modélisation proposée, les types additionnels « Agent » et « Actor » sont des classes désignant « une entité qui agit » et constituent des super-classes englobant les personnes, les groupes et les organisations. Le serveur de réconciliation Artsdata permet la réconciliation avec la classe [`dbo:Agent`](https://dbpedia.org/ontology/Agent). 

Même si 'Thing' n’est pas un type attendu pour les objets imbriqués sous la propriété 'performer' dans Schema.org, la communauté Schema considère qu’il est acceptable d’utiliser un type plus large (ou d’omettre le type), lorsqu’un type plus spécifique ne peut être défini ([en savoir plus](https://github.com/culturecreates/artsdata-data-model/discussions/127#discussioncomment-12947634)).

En complément de l’utilisation de 'Thing' comme type générique par défaut, nous recommandons de fournir une propriété 'sameAs' pointant vers un identifiant Artsdata. Si l’objet performer utilise Thing comme type générique et inclut un sameAs vers un identifiant Artsdata (où un type plus précis est toujours indiqué), les moteurs de recherche peuvent comparer les deux enregistrements de données et choisir d’utiliser le type plus spécifique pour l’entité interprète.

### Bonnes pratiques concernant la propriété 'sameAs' des interprètes

- [Lignes directrices concernant la propriété sameAs et les URI]({{ base }}/sameas.fr.html)
  - [Comment récupérer les URI d’identifiants pérennes]({{ base }}/retrieve-uri.fr.html)
