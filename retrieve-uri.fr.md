{% include back-button.html %}

{% include retrieve-uri-languages.html %}

# Comment récupérer les URI d’identifiants pérennes Artsdata

Lorsque vous travaillez avec des données ouvertes liées, il est important de référencer les entités culturelles (comme les organismes, les personnes, les lieux et les événements) à l’aide d’identifiants stables.

Artsdata fournit des identifiants uniformes de ressource (URI) pour les entités culturelles au Canada. Ces URI sont conçus pour être pérennes et interopérables sur le Web.

Cette page vous montre comment trouver et utiliser un URI d’identifiant pérenne Artsdata.

## Qu’est-ce qu’un URI d’identifiant pérenne Artsdata ?

Un URI (Identifiant uniforme de ressource) est une adresse Web stable qui identifie de manière unique une ressource, comme une organisme, un lieu, une personne ou un événement.

Plutôt que de répéter notre explication complète ici, nous vous invitons à consulter notre [aperçu des identifiants pérennes](https://www.artsdata.ca/fr/ressources/bien-identifie).

Vous pouvez également explorer nos [recommandations sur les identifiants](https://culturecreates.github.io/artsdata-data-model/identifier-recommendations) pour des conseils plus techniques.

## Récupérer des URI Artsdata

### Option 1 : Récupération manuelle

Tout le monde peut utiliser l’outil de recherche d’Artsdata sur l’interface du graphe de connaissances pour trouver une entité et récupérer son URI Artsdata. Une fois le processus maîtrisé, il faut moins de 10 secondes pour récupérer un URI d’identifiant pérenne.

#### Vidéo tutorielle

Regarder la vidéo “[Comment récupérer un URI Artsdata](https://youtu.be/sICvNpBHroE)” ([Version anglaise](https://youtu.be/HRv1GCegFws))
Durée : 3,5 minutes. Sous-titres disponibles en français et en anglais.

Cette vidéo présente un exemple réel : une travailleuse culturelle de Tangente (un diffuseur de danse basé à Montréal) récupère l’URI de son organisme dans Artsdata afin de documenter correctement une série de spectacles à l’Édifice Wilder.

#### Étapes rapides

1. Aller sur [kg.artsdata.ca](https://kg.artsdata.ca/)
2. Rechercher à l’aide de :
    - Le nom de l’organisme, du lieu ou de la personne ;
    - Leur URL de site Web ;
    - Un identifiant Artsdata existant (ex. : K10-337).
3. Identifier la bonne fiche en vérifiant :
    - Type (Organisme, Personne, Lieu, Événement) ;
    - Description (ex. : ville ou occupation).
4. Cliquer sur l’ID bleu, ex. : `ad:K10-337`
5. Sur la page de la fiche, repérer l’URI sous le titre :
    - Exemple : https://kg.artsdata.ca/resource/K10-337
6. Copier et coller cet URI dans vos métadonnées, documentation ou données structurées.

### Option 2 : Récupération automatisée via le service de réconciliation Artsdata

Les développeurs peuvent également utiliser l’API de réconciliation d’Artsdata pour récupérer automatiquement les URI d’identifiants pérennes.

Selon la configuration de l’application, cela peut fonctionner de façon similaire à la saisie semi-automatique de Google :

* L’utilisateur tape le nom d’un artiste ;
* Le service de réconciliation retourne une liste d’entités similaires avec leurs URI Artsdata ;
* L’utilisateur sélectionne une entité, et le nom complet ainsi que l’URI Artsdata sont automatiquement intégrés ;
* D’autres données, comme des identifiants supplémentaires, peuvent aussi être récupérées avec l’URI.

## Récupérer des URI à partir d’autres bases de connaissances

À compléter...

## Comment savoir si vous avez trouvé le bon URI ?

En suivant ces étapes, vous ne récupérez pas simplement un lien. Vous obtenez un identifiant vérifié et unique qui pointe vers une entité culturelle précise dans le graphe de connaissances Artsdata.

Pour vous assurer que c’est le bon :

* Exactitude de la recherche : Vous avez utilisé un nom, une URL ou un ID spécifique.
* Correspondance de l’entité : Le type et la description de la fiche correspondent à ce que vous recherchez.
    * Type : L’entité a-t-elle le bon type ? Parfois, une organisation (type Organisme) et un lieu (type Lieu) peuvent porter le même nom. De même, plusieurs événements (type Événement) ont le même nom que leur artiste principal (type Personne ou Organisation).
    * Description : Le lieu, l’occupation ou l’étiquette correspondent-ils ?
* Emplacement de l’URI : Il figure juste sous le titre — c’est l’identifiant canonique, pas simplement une URL.
* Source fiable : L’URI provient de la base de données officielle d’Artsdata ([kg.artsdata.ca](https://kg.artsdata.ca)).

## Que faire si je ne trouve pas mon organisme ?

Si votre entité n’est pas encore présente dans Artsdata ou si votre fiche doit être mise à jour :
* Visitez [artsdata.ca](https://artsdata.ca)
* Écrivez-nous à [artsdata@capacoa.ca](mailto:artsdata@capacoa.ca)

L’équipe d’Artsdata peut vous aider à ajouter ou corriger l’information.
