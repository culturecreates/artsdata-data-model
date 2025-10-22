<p>{% include back-button.html %}</p>
{% include identifier-recommendations-languages.html %}

# Lignes directrices d’Artsdata à propos des identifiants pérennes

Conformément aux spécifications du RDF pour les données ouvertes et liées, chaque entité nommée (comme par exemple un événement, un lieu ou une personne), classe et propriété chargée dans le triple store d’Artsdata doit être désignée par un identifiant pérenne exprimé sous la forme d’une adresse URI ([voir cet article](https://www.artsdata.ca/fr/ressources/bien-identifie) pour en apprendre plus à propos des identifiants pérennes).

### Identifiants pérennes supportés et recommandés
Artsdata attribue ses propres identifiants pérennes (URI) aux entités nommées lorsqu’elles satisfont aux exigences minimale pour l’attribution d’identifiants. Les utilisateurs enregistrés peuvent créer eux-mêmes des URI pour les entités déjà chargées dans Artsdata. Ils peuvent aussi créer une URI Artsdata à partir d’une URI Wikidata. 

Artsdata s’appuie aussi sur des URI externes. Artsdata supporte tous les identifiants pérennes de base de connaissances ouvertes, incluant :
- Wikidata ;
- ISNI ;
- VIAF ;
- Musicbrainz.

Artsdata accepte aussi les URI locales générées par un fournisseur de données (voir plus bas).

Afin d’aider les fournisseurs de données dans l’adoption et la mise en œuvre d’identifiants pérennes, voici quelques recommandations d’identifiants pérennes selon les classes d’entités.

| Type | ID Artsdata | ID Wikidata | ISNI | URI locale |
| - | - | - | - | - |
| [schema:Person](https://schema.org/Person) | <span style="color:green">**Recommandé**</span> | <span style="color:green">**Recommandé**</span> | <span style="color:green">**Recommandé**</span> | Optionnel |
| [schema:Organization](https://schema.org/Organization)<br>[schema:PerformingGroup](https://schema.org/PerformingGroup) | <span style="color:green">**Recommandé**</span> | <span style="color:green">**Recommandé**</span> | Optionnel | Optionnel |
| [schema:Place](https://schema.org/Place) | <span style="color:green">**Recommandé**</span> | <span style="color:green">**Recommandé**</span> | Non-valide pour ce type | Optionnel |
| [schema:Event](https://schema.org/Event) | <span style="color:green">**Recommandé**</span> | Optionnel | Non-valide pour ce type | Optionnel |

L'identifiant Artsdata, l'identifiant Wikidata et l'ISNI sont des identifiants pérennes globalement uniques : ils sont destinés à référencés dans plusieurs systèmes d'informations, hors de leurs domaine web. En ce sens, on les désigne parfois d'identifiants « globaux », identifiants « passerelles » ou identifiants « externes ». Dans ces lignes directrices, on les appelle _URI externes_. 

Par opposition, les identifiants « locaux » (par exemple, les clés d'une base de données relationnelle), sont destinés à être référencés à l'interne, à l'intérieur d'un système d'information local. Les identifiants locaux peuvent aussi être exprimés sous la forme d'une URI à l'intérieur du domaine web ou le système d'information est hébergé. Ces _URI locales_ peuvent être réconciliées (c.-à-d. mises en correspondance ou _matchées_) avec des _URI externes_ afin de préciser que deux URI désignent la même entité du monde réel (par exemple, une personne, un lieu ou un événement).

Dans les données structurées Schema et dans le [modèle de données Artsdata]({{ base }}), les URI locales sont la cible (c.-à-d. la valeur attendue) de la propriété `@id`, alors que les URI externes sont la cible de la propriété `sameAs`.

### Comment intégrer une URI locale à des données structurées

Voir : [Lignes directrices concernant la propriété @id et les URI locales]({{ base }}/id.fr.html)

### Comment intégrer des URI externes à des données structurées

Voir : [Lignes directrices concernant la propriété sameAs et les URI]({{ base }}/sameas.fr.html)

### Comment récupérer des URI d'identifiants pérennes

Voir : [Comment récupérer les URI d’identifiants pérennes]({{ base }}/retrieve-uri.fr.html)

### Comment entreposer des URI externes dans une base de données

À venir...

## À propos de l’identifiant Artsdata

L'identifiant Artsdata est un identifiant globalement unique et pérenne pouvant désigner tout concept ou toute entité nommée dans le graphe de connaissances Artsdata. Il peut notamment être assigné à des entités pour lesquelles il n'existe à l'heure actuelle aucun identifiant passerelle approprié, notamment les entités de type Event. Toute entité satisfaisant à une validation SHACL peut se voir assigner un identifiant. 

Il est possible pour des tiers de contribuer à l’assignation d’identifiants Artsdata. Les utilisateurs enregistrés peuvent notamment : 
- Utiliser la fonction “Minter”, dans l’interface d’Artsdata, pour assigner ou lier un identifiant à une entité déjà chargée dans Artsdata;
- Utiliser la fonction “Mint using Wikidata”, dans l’interface d’Artsdata, pour charger une entité depuis Wikidata et lui assigner un identifiant Artsdata; 
- Utiliser l’API Mint pour assigner des identifiants à des entités qui ne sont pas encore chargées dans Artsdata.

### Spécifications de l’identifiant Artsdata

- Format de l’URI : `http://kg.artsdata.ca/resource/$1` 
- Regex l’identifiant : `^K\d+-\d+$`
- Exemple d’URI : `http://kg.artsdata.ca/resource/K12-438`
- Note : Le format d’URI d’Artsdata n’inclut pas un protocole sécurisé “https”, comme c’est souvent le cas pour les identifiants pérennes avec négociation de contenu.
