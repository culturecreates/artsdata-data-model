<p>{% include back-button.html %}</p>
{% include event-type-languages.html %}

## Vocabulaire contrôlé Artsdata pour les types d'événements

| <!-- --> | <!-- --> |
| - | - |
| Schéma de concepts | [adr:ArtsdataEventTypes](http://kg.artsdata.ca/resource/ArtsdataEventTypes) |
| Version | 4.0 |
| Date de modification | juillet 2025 |

_Remarque : Ceci est une page proposée pour la version 4.0 du vocabulaire des types d'événements d'Artsdata. Certains des concepts ci-dessous n'ont pas encore été implémentés dans Artsdata. Le déploiement de la version 4.0 devrait être terminé d'ici fin août 2025._

Cette page décrit le vocabulaire contrôlé utilisé dans le graphe de connaissances Artsdata pour différencier les types d'événements dans le secteur des arts et culture.

La version 4.0 du vocabulaire contrôlé représente une refonte significative par rapport à la version 3.4.5.

Les facettes d'un événement qui sont prises en compte dans la différenciation des types d'événements dans la version 4.0 de ce vocabulaire sont celles qui font référence à la conception, au format et/ou au fonctionnement d'un événement artistique donné, plutôt qu'à son contenu artistique.

Les facettes considérées comme hors d'application du vocabulaire contrôlé de type événement (comme la langue, le public, la période de l'année, etc.) doivent être représentées par d'autres moyens, tels que : l'utilisation des propriétés et concepts Wikidata existants ; l'utilisation de vocabulaires contrôlés externes ; et/ou la création de vocabulaires contrôlés Artsdata supplémentaires.

### Types d'événements

La liste des types (concepts SKOS) peut être consultée dans le [schéma de concepts](http://kg.artsdata.ca/resource/ArtsdataEventTypes), dans cette [feuille de calcul](https://docs.google.com/spreadsheets/d/1cwNQIHcU0iBUi2dLdh1tnOFDxrYCA-DKxnLiXrOXYug/edit?usp=sharing), ou dans le dans le tableau ci-dessous .

| CURI | Libellé préféré | Description |
| - | - | - |
| [adr:Event](http://kg.artsdata.ca/resource/Event) | Événement | Une activité organisée qui a lieu à une heure et un lieu précis. |
| [adr:EventSeries](http://kg.artsdata.ca/resource/EventSeries) | Série d'événements | Une série cohérente d'événements individuels, de spectacles, de rassemblements et/ou de performances avec une continuité organisationnelle. |
| [adr:Class](http://kg.artsdata.ca/resource/Classes) | Cours | Une série d'événements offrant une expérience d'apprentissage structurée à un moment et un lieu spécifiques. |
| adr:TalkEvent | Discussion | Un événement au cours duquel une ou plusieurs personnes parlent devant un public. |
| [adr:PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent) | Représentation | Un événement au cours duquel une œuvre scénique est exécutée en publique. |
| [adr:RehearsalEvent](http://kg.artsdata.ca/resource/RehearsalEvent) | Répétition devant public | Un événement où le processus de création d’une œuvre de spectacle et sa préparation en vue de sa présentation sont partagés avec le public. |
| [adr:CircusPerformance](http://kg.artsdata.ca/resource/CircusPerformance) | Représentation de cirque | Une représentation qui implique une série de prestations affichant des compétences humaines, du courage, de l'humour et/ou des astuces avec des animaux. |
| [adr:ComedyPerformance](http://kg.artsdata.ca/resource/ComedyPerformance) | Représentation d’humour | Une représentation mettant en vedette un ou plusieurs comédiens racontant et/ou jouant des blagues destinées à faire rire un public. |
| [adr:DancePerformance](http://kg.artsdata.ca/resource/DancePerformance) | Représentation de danse | Une représentation présentant l’exécution d’une œuvre chorégraphique. |
| [adr:MusicalTheatrePerformance](http://kg.artsdata.ca/resource/MusicalTheatrePerformance) | Représentation de théâtre musical | Une représentation présentant la représentation d'une œuvre musico-dramatique du genre du théâtre musical, combinant musique, chant et jeu d'acteur pour raconter une histoire. |
| [adr:OperaPerformance](http://kg.artsdata.ca/resource/OperaPerformance) | Représentation d'opéra | Une représentation présentant la représentation d'une œuvre musico-dramatique du genre opéra, mêlant chant, mise en scène et narration scenique. |
| [adr:MusicPerformance](http://kg.artsdata.ca/resource/MusicPerformance) | Concert | Un représentation mettant en vedette l'exécution d'une œuvre musicale impliquant un ou plusieurs artistes chantant et/ou jouant des instruments. |
| [adr:SpokenWordPerformance](http://kg.artsdata.ca/resource/SpokenWordPerformance) | Représentation de création parlée | Une représentation mettant en vedette de la poésie interprétée devant un public. |
| [adr:TheatrePerformance](http://kg.artsdata.ca/resource/TheatrePerformance) | Représentation de théâtre | Une représentation dans lequel des acteurs jouent une pièce écrite pour la scène. |
| [adr:StorytellingPerformance](http://kg.artsdata.ca/resource/Storytelling) | Représentation de conte | Une représentation qui utilise des mots et des actions pour transmettre au public les éléments et le contenu d'une narration spécifique. |
| [adr:VarietyPerformance](http://kg.artsdata.ca/resource/VarietyShow) | Représentation de variétés | Un événement des arts de la scène mettant en vedette plusieurs performances d'art ou de genres différents. |
| [adr:PerformanceArt](http://kg.artsdata.ca/resource/PerformanceArt) | Performance artistique | Une représentation qui produise une œuvre éphémère au cours de son exécution. |
| [adr:Festival](http://kg.artsdata.ca/resource/Festival) | Festival | Un événement avec un ensemble organisé d’activités axées sur un thème qui dure de quelques heures à plusieurs semaines. |
| [adr:ChildrensEvent](http://kg.artsdata.ca/resource/ChildrensEvent) | Événement pour enfants | Un événement mettant en vedette le contenu éducatif et/ou artistique approprié a tous âges. |
| [adr:ExhibitionEvent](http://kg.artsdata.ca/resource/ExhibitionEvent) | Exposition | Un événement où une collection d'objets sélectionnés est regroupée selon un thème dans le but d'être présentée au public. |
| [adr:ResidencyEvent](http://kg.artsdata.ca/resource/ResidencyActivity) | Résidence | Un événement dans laquelle une organisation artistique parraine un ou plusieurs artistes et soutient leur travail en leur donnant accès aux ressources dont dispose l'organisation. |
| [adr:ScreeningEvent](http://kg.artsdata.ca/resource/ScreeningEvent) | Projection | Un événement qui présente du contenu audiovisuel à un public. |
| [adr:SocialEvent](http://kg.artsdata.ca/resource/SocialEvent) | Événement social | Un événement organisé pour qu'un groupe de personnes se rencontre et/ou interagisse les unes avec les autres. |
| [adr:WorkshopEvent](http://kg.artsdata.ca/resource/WorkshopEvent) | Atelier | Un événement où les gens apprennent et/ou pratiquent un sujet ou une activité spécifique. |
| [adr:MasterclassEvent](http://kg.artsdata.ca/resource/MasterclassEvent) | Cours de maître | Un événement d'atelier mettant en vedette un expert dans un domaine spécifique qui enseigne et/ou conseille d'autres artistes dans le même domaine, et offre aux nouveaux artistes l'avantage de l'expérience de l'expert. |
| [adr:PostshowTalk](http://kg.artsdata.ca/resource/PostshowTalk) | Discussion après-spectacle | Un événement mettant en vedette des artistes discutant avec le public après une performance. |
| [adr:PreshowTalk](http://kg.artsdata.ca/resource/PreshowTalk) | Discussion avant-spectacle | Un événement mettant en vedette des artistes discutant avec le public avant une performance. |
| adr:PowWow | Pow-wow | Un festival célébré par les communautés autochtones d'Amérique du Nord, respectant des protocoles cérémoniels précis et incluant des danses, des chants et du tambour. |
| adr:Competition | Concours | Un événement dans lequel les gens s'affrontent pour remporter des prix. |
| adr:Convention | Congrès | Une série d'événements comprenant des activités de prise de parole en direct, y compris des conférences, des ateliers et/ou des événements sociaux. |
| adr:SocialDance | Danse sociale | Un événement social où des personnes se réunissent pour danser ensemble dans un cadre structuré ou informel. |
| adr:AwardsEvent | Événement de remise de prix | Un événement social où des personnes, groupes, organismes ou oeuvres se voient décerner des distinctions. |
| adr:LiveFilmConcert | Ciné-concert | Un événement de projection où des musiciens en direct interprètent la bande-son d’un film en temps réel. |
| adr:FestivalSeries | Série de festivals | Une série d'événements de festivals répétitifs. |
| adr:SaleEvent | Vente | Un événement où d'art et/ou des produits culturels sont achetés et vendus. |

### Comment utiliser

Le vocabulaire contrôlé du type d'événement Artsdata est utilisé avec le type d'événement schema.org. Un événement dans Artsdata est un http://schema.org/Event (schema:Event ou schema:EventSeries) et éventuellement un type supplémentaire issu du vocabulaire contrôlé d'événements Artsdata à l'aide de la propriété schema:additionalType.

Par example:

```
ex:Event1 un schema:Event ; 
schema:additionalType <http://kg.artsdata.ca/resource/PerformingArtsEvent> .
```

Pour implémenter les propriétés schema:Event et schema:additionalType dans vos données structurées, veuillez consulter les [modèles de données structurées d'Artsdata](https://culturecreates.github.io/artsdata-data-model/gabarits-jsonld/README.html).

### Principaux changements dans la version 4.0

L'équipe Artsdata a défini la version 4.0 du vocabulaire contrôlé d'Artsdata pour les types d'événements, en consultation avec le groupe communautaire Artsdata (
veuillez consulter [le rapport du projet](https://docs.google.com/document/d/1XMi70zjJBwu_dMSPUhf_Po6pymYcOUvgSQxXwW9vXO4/edit?usp=sharing) ). 

La version 4.0 du vocabulaire contrôlé des types d'événements d'Artsdata marque une avancée majeure dans l'alignement de nos données avec les meilleures pratiques du secteur et l'amélioration de la clarté sémantique. Lancée en réponse aux incohérences généralisées et aux chevauchements conceptuels de la version précédente, cette refonte introduit un modèle de catégorisation basé sur le format qui prend mieux en charge les applications de données ouvertes liées et la découvrabilité numérique.

[Ce document](https://docs.google.com/document/d/1nvSysesvUv_ksaR31YaVhx0gHEHQySzjWwRr-zC7Cow/edit?usp=sharing) décrit les directives suivies par l'équipe Artsdata lors de la refonte du vocabulaire contrôlé d'Artsdata pour les types d'événements, ainsi que les principaux changements apportés dans la version 4.0.

Les types basés sur le genre sont obsolètes. Bien que certains types d'événements soient obsolètes, leurs URI resteront accessibles aux utilisateurs de la version 3.4.5. Quelques types basés sur la discipline ont été conservés dans la version 4.0, mais sont désormais annotés comme « proposés pour être abandonnés » dans une version ultérieure du vocabulaire.

De même, toutes les relations sémantiques `skos:exactMatch` avec la taxonomie discipline/genre de Scène Pro ont été supprimées.

De nouveaux types ont été ajoutés, notamment Pow-wow, Concours, Vente, Danse sociale, Événement de remise de prix, Ciné-concert, Série de festivals et Discussion.

Les URI ont été modifiés pour les concepts suivantes: `adr:StorytellingPerformance` (de `adr:Storytelling`), `adr:VarietyPerformance` (de `adr:VarietyShow`), `adr:Class` (de `adr:Classes`), `adr:TalkEvent` (de `adr:Conference`) et `adr:ResidencyEvent” (de `adr:ResidencyActivity`).

En raison de la confusion entourant altLabels lors des commentaires de la communauté, cette refonte a ajouté la propriété `skos:hiddenLabel` et a commencé à utiliser cette propriété avec `skos:altLabels`.

Les labels et les définitions ont été harmonisés pour rendre la terminologie et la syntaxe cohérentes.

Certaines définitions d'eventType incluent désormais des notes de portée avec la propriété `skos:scopeNote` pour fournir des informations « encyclopédiques » utiles à l'utilisateur, ainsi que `skos:editorialNote` pour transmettre des informations générales sur le raisonnement et les éventuelles modifications futures prévues pour la version 5.0.

La hiérarchie des sous-classes de certains types a été mise à jour. Par exemple, `adr:PreshowTalk` et `adr:PostshowTalk` sont devenus des sous-classes d'un nouveau concept `adr:TalkEvent`.

Une feuille de calcul détaillant toutes les modifications apportées entre la version 3.4.5 et la version 4.0 peut être trouvée [ici](https://docs.google.com/spreadsheets/d/1cwNQIHcU0iBUi2dLdh1tnOFDxrYCA-DKxnLiXrOXYug/edit?usp=sharing).
