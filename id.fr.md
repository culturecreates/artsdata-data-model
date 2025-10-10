<p>{% include back-button.html %}</p>
<a href='id.html'><img src='https://img.shields.io/badge/lang-en-blue.svg'></a>
<a href='id.fr.html'><img src='https://img.shields.io/badge/lang-fr-green.svg'></a>

## Ligne directrices d’Artsdata concernant la propriété @id et les URI locales

Malheureusement, la documentation Schema.org ne dit pas grand-chose sur la propriété `"@id"`, ni sur la manière de générer des URI pour eux. Afin de combler ces lacunes, Artsdata a préparé les lignes directrices suivantes. Ces lignes directrices s'adressent principalement aux développeurs web.

Dans ces lignes directrices, le mot « Chose » est emprunté à la terminologie Schema ([schema:Thing](https://schema.org/Thing)) afin de désigner n'importe quel objet du monde réel, tel qu'un événement, un lieu ou une personne spécifique. Il est synonyme du terme entité ( fréquemment utilisé dans la documentation d'Artsdata), dans le sens d'un objet ayant une identité.

### Documentation générale sur la propriété @id

|  |  |
| ---------- | --------------------------------- |
| Type de données | [xsd:anyURI](https://www.datypic.com/sc/xsd/t-xsd_anyURI.html) |
| Instructions | La valeur doit être une URI constituant un identifiant unique pérenne pour la Chose (par exemple, une entité Event ou Place) dans le domaine du site web. |
| Remarque | Ne renseignez pas la même URI sous `@id` et `url`. <br>L'URL d'une page web est l'identifiant unique pérenne de cette page web, et rien d'autre. Elle ne doit pas être utilisée pour identifier les éléments décrits sur cette page web. Dans les données structurées Schema (et dans toute autre ontologie basée sur le RDF), un « objet du monde réel » (tel qu'un événement ou un lieu) et le document web qui le décrit sont deux choses distinctes : elles méritent chacune leur propre URI. |
 
Faites défiler vers le bas afin d'apprendre comment générer des URI fonctionnels.

### Avantages d'utiliser @id pour attribuer des URI aux Choses

* Les @ids avec les URI sont aux Choses ce que les URL canoniques sont aux pages web. Ils permettent d'identifier un objet unique, de localiser et de récupérer les ressources qui le décrivent (c'est-à-dire une représentation JSON-LD) et de s'y référer dans d'autres systèmes d'information (c'est-à-dire d'établir un « lien » avec lui).
* Les URI facilitent la réconciliation des jeux de données. Une fois qu'une correspondance est trouvée entre l'URI locale d'une chose et l'identifiant Artsdata de cette Chose, nous pouvons écrire un lien [`schema:sameAs`](https://schema.org/sameAs) dans Artsdata et ne plus jamais avoir besoin de répéter ce processus de réconciliation.
* Les URI peuvent garantir la pérennité des données. Même lorsqu'une page d'événement n'est plus publiée sur un site web, l'URI identifiant cet événement peut être conservée dans Artsdata et peut continuer à être consultée (ainsi que les données structurées qui y sont associées).

## Comment générer une URI fonctionnelle

Aux fins de l'identification d'une Chose, une URI est fonctionnelle si elle identifie de manière univoque un seul objet du monde réel ET si cet objet du monde réel n’est associé qu’à une seule URI au sein du domaine web. En d'autres termes, la cardinalité entre l’URI et la Chose doit être biunivoque (“one-to-one”). Bien qu'il soit préférable que l'URI renvoie à une représentation (HTML, JSON-LD ou autre) de la Chose qu’elle désigne, Artsdata peut utiliser n'importe quel type d'URI fonctionnelle pour se référer à des Choses externes, même si ces URI mènent à des réponses « 404 non-trouvé ».

### URI croisillons basées sur une page web
*Remarque : cette méthode peut ne pas convenir aux sites web avec négociation linguistique, avec un contenu dynamique ou décrivant plusieurs entités sur une même page.*

* Il est possible de générer une URI fonctionnelle en ajoutant un croisillon (`#`) à la fin de l'URL d'une page web existante, suivi d'une chaîne de caractères qui sert d'identifiant unique pour une Chose décrite sur la page (un événement, un lieu ou un interprète). Cette chaîne est appelée un [identificateur de fragment](https://fr.wikipedia.org/wiki/Identificateur_de_fragment).
* L'identificateur de fragment doit préférablement être unique au sein du domaine du site web. Au minimum, il doit être unique au sein de la page.
* N'ajoutez les identificateurs de fragments qu'aux URL canoniques. Si une Chose est décrite sur plusieurs pages web, elle doit toujours avoir la même URI, quel que soit l'endroit où elle est référencée sur votre site web.
* Il n'est pas nécessaire que l'identificateur de fragment pointe vers un point d'ancrage dans le corps de la page (par exemple, un identifiant ou un attribut de nom). En fait, il n'est même pas nécessaire que l'URI renvoie à une page web (tel que mentionné plus haut).

#### Exemples d’URI croisillons basées sur une page web

Voici quelques exemples d’utilisations incorrectes et correctes d’URI dérivées d’URL de pages web&nbsp;:

| Exemple | Adéquation en tant qu'URI |
| - | - |
| <br>`"@id": "https://someorg.ca/events/eventname/"`<br><br>(Où la valeur est la même que celle de la page URL, sans identificateur de fragment) | <span style="color:red">**Erreur critique**</span><br>Les valeurs `@id` et `url` ne devraient pas être les mêmes. |
| <br>`"@id": "https://someorg.ca/events/eventname/#event"`<br><br>(Où le même identificateur de fragment est utilisé pour toutes entités du même type.) | <span style="color:orange">**Bien**</span><br>Remarque : cette convention de nommage est simple et facile à mettre en œuvre. Cependant, elle ne fonctionnera pas si plusieurs événements sont répertoriés sur la même page, car plusieurs événements se verraient attribuer la même URI.
| <br>`"@id": "https://someorg.ca/events/eventname/#123abc"`<br><br>(Où l'indentificateur de fragment `123abc` suit une convention de nommage qui garantit l'unicité au sein de la page web.) | <span style="color:green">**Mieux !**</span> |
| <br>`"@id": "https://someorg.ca/events/eventname/#key"`<br><br><small>(Où `key` est la clé primaire de l'événement dans votre base de données locale)</small> | <span style="color:green">**Encore mieux !**</span> |

Utiliser la clé primaire de la Chose dans votre base de données pour l'identificateur de fragment est un moyen simple et efficace de garantir l’unicité de l'identificateur de fragment au sein du domaine du site.

Si vous ne pouvez pas utiliser les clés de la base de données comme nom pour l'identificateur de fragment, vous pouvez opter pour une convention de nommage qui garantira le caractère univoque de l'identificateur de fragment aujourd'hui et à l'avenir. Par exemple, vous pouvez baser votre identificateur de fragment sur la chaîne `startDate` et la chaîne `location.name`, comme dans cette convention de nommage : `YYMMDDHH-LIEU` *(Remarque : Si vous optez pour un identificateur de fragment basé sur des points de données, veillez à ce qu'il demeure stable même si les points de données sont édités : après l'avoir généré, entreposez l'identificateur de fragment dans un champ dédié)*.

### Autres stratégies pour générer des URI

Les URI croisillons basées sur les URL de pages web existantes, telles que décrites ci-dessus, ne sont qu'une des nombreuses façons de générer des URI fonctionnelles afin d'identifier les entités décrites sur votre site web. Voici d'autres stratégies pour générer des URI flexibles, stables et pérennes :

* L'URI croisillon peut être basée sur un chemin d'URL qui est indépendant de toute page web existante. Les URI indépendants de la structure du site web sont plus stables dans le temps que les URI croisillons basées sur une page web. En effet, même si la structure du site devait changer, la convention de nommage, elle, peut demeurer inchangée. 
 Exemple : « `https://example.org/id/#123456` » 
 (Rappel : Cet URI croisillon est fonctionnelle même si elle ne mène à aucune ressource).
* Pour les sites web avec un contenu dynamique, vous pouvez utiliser des règles de réécriture pour vous assurer que l'URI est indépendante de l'implémentation actuelle du site. 
 Exemple : « `https://example.org/event/123456` » réécrit comme « `https://example.org/index.php?event=123456` »
* Les règles de redirection sont fréquemment utilisées afin de générer des [URI 303](https://en.wikipedia.org/wiki/HTTP_303). La réponse du serveur 303 indique que l'URI n'identifie pas un document web ordinaire et redirige la requête vers une autre URI, généralement avec une négociation de contenu.
* Vous pouvez mettre en œuvre de la négociation de contenu afin de diriger une requête vers différentes représentations HTML, JSON-LD et/ou RDF de la même Chose, selon les préférences du client.
* Vous pouvez également utiliser un service externe afin de générer des URI sur un autre domaine et les rediriger vers votre domaine web. Ces services comprennent les [Digital Object Identifiers](https://www.doi.org/) (DOI), les [Archival Resource Keys](https://arks.org/) (ARK) et les [PURL](https://purl.archive.org/).

### Ressources externes au sujet des URI

* [Cool URI for the Semantic Web](https://www.w3.org/TR/cooluris/), W3C Interest Group Note 03 December 2008
* [Identifiants pérennes pour les ressources culturelles : Vade-mecum pour les producteurs de données](https://www.culture.gouv.fr/Espace-documentation/Publications-revues/Identifiants-perennes-pour-les-ressources-numeriques), Version 1.0, 2015.

## Si vous ne pouvez pas générer votre propre URI...

Ne vous inquiétez pas. Artsdata peut très bien gérer des données sans URI.

Comme alternative (ou en complément de `@id`), envisagez d'utiliser la propriété `sameAs` pour assigner un identifiant pérenne externe à vos entités Place, Person et Organization. Il s'agit d'un moyen simple et très efficace d'identifier une Chose, et de fournir un lien vers davantage de données à son sujet.


[En savoir plus]({{ base }}sameas.fr.html)
