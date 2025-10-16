<p>{% include back-button.html %}</p>
{% include location-languages.html %}

# Lignes directrices Artsdata pour les valeurs `location`

## Bonnes pratiques concernant la granularité de `place`

Lorsqu’un bâtiment contient plusieurs salles de spectacle, Artsdata peut rencontrer des problèmes de rapprochement si les données structurées décrivent le bâtiment plutôt que la salle de spectacle spécifique. Cela peut donner l’impression que deux représentations ont lieu au même moment et au même endroit, alors qu’il s’agit en réalité de deux lieux différents.

Voici la logique suivie par le processus de création automatique (auto-minting) d’Artsdata :
* Si deux événements sont associés au même `Place` ; ET
* Si leur `startTime` diffère de moins d’une heure ; ALORS
* Marquer les deux événements comme `ado:PotentialDuplicate` ET ne pas générer automatiquement un nouvel identifiant.

### Recommandations

Selon les [instructions d’Artsdata]([https://docs.google.com/spreadsheets/d/1zGMVtrMO6Ja82jblir2AUjzSYAciCXBwoNzi-pomGok/edit?gid=0#gid=0](https://culturecreates.github.io/artsdata-data-model/classes/event.fr.html#properties)), il est préférable d’être aussi précis que possible lors de la saisie d’un champ `location` imbriqué sous une entité `@type Event`. Autrement dit, il vaut mieux indiquer les valeurs `name` et `sameAs` de la salle de spectacle où l’événement a lieu, plutôt que celles du bâtiment dans son ensemble. 

Cependant, une organisation peut préférer utiliser le nom du bâtiment dans ses données structurées – particulièrement si le nom du bâtiment est plus connu que celui de la salle, ou si la salle porte le même nom qu’une autre située dans un bâtiment différent.

Dans ces cas, deux solutions sont possibles :

#### 1. Fournir des valeurs différentes pour `name` et `sameAs`

Indiquer le nom du bâtiment sous `name`, mais ajouter un champ `sameAs` qui pointe vers une URI décrivant la salle de spectacle. Ainsi, le nom du bâtiment sera utilisé comme libellé principal, mais les systèmes pourront reconnaître que le lieu physique réel est la salle située dans le bâtiment, et non le bâtiment lui-même.
   Exemple :
   ```
"location":
         {
            "@type":"Place",
            "name":"Centre des arts Juliette-Lassonde",
            "sameAs":[
               "http://kg.artsdata.ca/resource/K2-227",
               "http://www.wikidata.org/entity/Q111668872"],
            "address":{
               "@type":"PostalAddress",
               "addressLocality":"Saint-Hyacinthe",
               "addressRegion":"QC",
               "postalCode":"J2S 9E2",
               "streetAddress":"1705 Rue Saint-Antoine",
               "addressCountry":"CA"
            }
    },
```
*Remarque : les URI d’Artsdata et de Wikidata sous `sameAs` pointent vers la salle Desjardins située à l’intérieur du Centre des arts Juliette-Lassonde.*

#### 2. Ajouter une valeur `alternateName`

Indiquer le nom de la salle sous `name` et ajouter le nom du bâtiment sous `alternateName`, ou inversement, selon lequel vous préfériez utiliser en tant que libellé principal.
   Exemple :
   ```
"location":
         {
            "@type":"Place",
            "name":"Salle Desjardins",
            "alternateName":"Centre des arts Juliette-Lassonde",
            "sameAs":[
               "http://kg.artsdata.ca/resource/K2-227",
               "http://www.wikidata.org/entity/Q111668872"],
            "address":{
               "@type":"PostalAddress",
               "addressLocality":"Saint-Hyacinthe",
               "addressRegion":"QC",
               "postalCode":"J2S 9E2",
               "streetAddress":"1705 Rue Saint-Antoine",
               "addressCountry":"CA"
            }
    },
```
*Remarque : les URI d’Artsdata et de Wikidata sous `sameAs` pointent vers la salle Desjardins située à l’intérieur du Centre des arts Juliette-Lassonde.*

#### 3. Ajouter une entité `containedinPlace`

Indiquer le nom de la salle de spectacle sous `name`. Ajouter une entité imbriquée `containedinPlace` avec le nom du bâtiment sous `name`, ainsi qu’une valeur `sameAs`pointant vers une URI décrivant le bâtiment. Cela permet aux systèmes de reconnaître que la salle fait partie intégrante du bâtiment, et non qu’elle constitue un lieu distinct. 

Exemple :
```
 "location":
         {
            "@type":"Place",
            "name":"Salle Desjardins",
            "sameAs":[
               "http://kg.artsdata.ca/resource/K2-227",
               "http://www.wikidata.org/entity/Q111668872"],
            "address":{
               "@type":"PostalAddress",
               "addressLocality":"Saint-Hyacinthe",
               "addressRegion":"QC",
               "postalCode":"J2S 9E2",
               "streetAddress":"1705 Rue Saint-Antoine",
               "addressCountry":"CA"
            },
            "containedInPlace":{
               "@type":"Place",
               "name":"Centre des arts Juliette-Lassonde",
               "sameAs":"http://kg.artsdata.ca/resource/K5-796"
            }
    },
```
*Remarque : comme la salle et le bâtiment partagent la même adresse, il n’est pas nécessaire de répéter les champs `address` dans `containedInPlace`.*


## Bonnes pratiques concernant la propriété `sameAs`

- [Lignes directrices d'Artsdata concernant la propriété sameAs]({{ base }}/sameas.html)
  - [Récupérer les URIs d’identifiants pérennes]({{ base }}/retrieve-uri.fr.html)
