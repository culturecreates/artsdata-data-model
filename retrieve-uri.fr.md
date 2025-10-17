{% include back-button.html %}

{% include retrieve-uri-languages.html %}

# Comment récupérer les URI d’identifiants pérennes

Lorsque vous travaillez avec des données ouvertes liées, il est important de référencer les entités culturelles (comme les organismes, les personnes, les lieux et les événements) à l’aide d’identifiants stables.

Artsdata fournit des identifiants uniformes de ressource (URI) pour les entités culturelles au Canada. Ces URI sont conçues pour être pérennes et interopérables sur le Web.

Cette page vous montre comment trouver et utiliser une URI d’identifiant pérenne Artsdata.

## Récupérer des URI Artsdata

### Option 1 : Récupération manuelle

Tout le monde peut utiliser l’outil de recherche d’Artsdata sur l’interface du graphe de connaissances pour trouver une entité et récupérer son URI Artsdata. Une fois le processus maîtrisé, il faut moins de 10 secondes pour récupérer une URI d’identifiant pérenne.

#### Vidéo tutorielle

Regarder la vidéo “[Comment récupérer un URI Artsdata](https://youtu.be/sICvNpBHroE)” ([Version anglaise](https://youtu.be/HRv1GCegFws))
Durée : 3,5 minutes. Sous-titres disponibles en français et en anglais.

Cette vidéo présente un exemple réel : une travailleuse culturelle de Tangente (un diffuseur de danse basé à Montréal) récupère l’URI de son organisme dans Artsdata afin de documenter correctement une série de spectacles à l’Édifice Wilder.

#### Étapes rapides

1. Allez sur [kg.artsdata.ca](https://kg.artsdata.ca/).
2. Recherchez la _chose_ (ou « entité ») dans la boîte de recherche, dans le coin supérieur droit de l’écran. Vous pouvez effectuer votre recherche selon :
    - Le nom de l’organisme, du lieu ou de la personne ;
    - L'URL du site Web ;
    - Un identifiant Artsdata existant (ex. : K10-337).
3. Identifiez la bonne entité parmi la liste de résultats, en vérifiant :
    - le type (Organisme, Personne, Lieu, Événement) ;
    - la description (ex. : ville ou occupation).
4. Cliquez sur l’URI compacte en bleu, ex. : `ad:K10-337`
5. Sur la page de l'entité, repérez l’URI sous le nom de l'entité :
    - Exemple : `http://kg.artsdata.ca/resource/K10-337`
6. Cliquez sur l’icône « copier » pour copier sur l’URI sur votre babillard.
7. Collez l'URI dans vos données structurées, dans votre dossier de presse électronique, sur votre page de profil, etc.

### Option 2 : Récupération automatisée via le service de réconciliation Artsdata

Les développeurs peuvent également utiliser l’API de réconciliation d’Artsdata pour récupérer automatiquement les URI d’identifiants pérennes.

Selon la configuration de l’application, cela peut fonctionner de façon similaire à la saisie semi-automatique de Google :

* L’utilisateur tape le nom d’un artiste ;
* Le service de réconciliation retourne une liste d’entités similaires avec leurs URI Artsdata ;
* L’utilisateur sélectionne une entité, et le nom complet ainsi que l’URI Artsdata sont automatiquement intégrés ;
* D’autres données, comme des identifiants supplémentaires, peuvent aussi être récupérées avec l’URI.

## Récupérer des URI à partir d’autres bases de connaissances

D'autres bases de connaissances ouvertes fournissent également des identifiants pérennes pour les entités culturelles. Ceux-ci peuvent être utilisés en complément des URI Artsdata pour enrichir vos métadonnées.

Exemples :
- **Wikidata**: [https://www.wikidata.org](https://www.wikidata.org)
- **ISNI (International Standard Name Identifier)**: [https://isni.org](https://www.wikidata.org)
- **MusicBrainz** (for performers and recordings): [https://musicbrainz.org](https://www.wikidata.org)

Pour récupérer un identifiant :
1. Recherchez l’entité par nom ou autre information connue ;
2. Vérifiez que la fiche correspond (type, lieu, description) ;
3. Copiez l’URI qui apparaît sur la page ou dans la barre de navigation.

## Comment savoir si vous avez trouvé le bon URI ?

En suivant ces étapes, vous ne récupérez pas simplement un lien. Vous obtenez un identifiant vérifié et unique qui pointe vers une entité culturelle précise dans le graphe de connaissances Artsdata.

Pour vous assurer que c’est le bon :

* Format : L'URI débute par `http://` or `https://`. Si vous n'avez récupéré que le nom de code alphanumérique, recherchez une adresse `http` sur la page ou dans la barre de navigation.
* Correspondance de l’entité : Le type et la description de la fiche correspondent à ce que vous recherchez.
    * Type : L’entité a-t-elle le bon type ? Parfois, une organisation (type Organisme) et un lieu (type Lieu) peuvent porter le même nom. De même, plusieurs événements (type Événement) ont le même nom que leur artiste principal (type Personne ou Organisation).
    * Description : Le lieu, l’occupation ou l’étiquette correspondent-ils ?
* Emplacement de l’URI : Dans le graphe de connaissance Artsdata, l'URI et l'URL de la page Web ont des formats radicalement différents. Assurez-vous de récupérer l'URI qui apparaît sous le nom de l'entité.
* Source fiable : L’URI provient de la base de connaissance officielle et authoritative d’Artsdata ([kg.artsdata.ca](https://kg.artsdata.ca)).

## Que faire si je ne trouve pas mon organisme ?

Si votre entité n’est pas encore présente dans Artsdata ou si votre fiche doit être mise à jour :
* Écrivez-nous à [artsdata@capacoa.ca](mailto:artsdata@capacoa.ca)

L’équipe d’Artsdata peut vous aider à ajouter ou corriger l’information.
