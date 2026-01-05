## Vocabulaire contrôlé Artsdata pour les genres

| <!-- --> | <!-- --> |
| - | - |
| Schéma de concepts | [adr:ArtsdataGenres](http://kg.artsdata.ca/resource/ArtsdataGenres) |
| Version | 1.0 |
| Date de publication | novembre 2025 |

Cette page décrit le vocabulaire contrôlé utilisé dans le graphe de connaissances Artsdata pour différencier les genres dans le secteur des arts et culture, et plus spécifiquement dans les arts de la scène.

Ce vocabulaire contrôlé représente une liste de valeurs pour la propriété schema:genre, dont le domaine est schema:CreativeWork. Il s'agit donc d'un vocabulaire contrôlé qui peut être employé tant pour décrire des œuvres faisant parti du continuum OEMI (par exemple, une pièce de théâtre en tant que texte dramatique), que des œuvres-spectacles (ado:LivePerformanceWork) qui intègrent des expressions d'œuvres OEMI (par exemple, une production théâtrale). Cela peut donner lieu à de la confusion dans des cas où une œuvre-spectacle associée à un genre intègre une œuvre ou est dérivée d'une œuvre associée à un autre genre (par exemple, un spectacle de cirque dérivé de Roméo et Juliette). Il convient alors d'associer à chaque entité œuvre la déclaration de genre qui lui revient. Cela peut aussi occasionner de la confusion dans le cas de récitals d'opéra: même si les airs d'opéras proviennent d'œuvres musico-dramatiques, la facette principale mise de l'avant lors du récital est la musique plutôt que l'intrigue dramatique associée à chaque air (d'où le fait que l'opéra est parfois, et à juste titre, considéré comme un genre musical).

Il s'agit d'un vocabulaire avec plusieurs niveaux de hiérarchie (le vocabulaire initial comporte deux niveaux mais il serait possible d'ajouter d'autres niveaux). Les relations skos:narrower/skos:broader entre les concepts ont une cardinalité « plusieurs à plusieurs » : un concept peut avoir aucun, un seul ou plusieurs parents.

Les identifiants des concepts sont opaques. Cela permet d'assurer la stabilité des URI tout en offrant la flexibilité de changer libellés aussi souvent que nécessaire.

Le vocabulaire contrôlé Artsdata pour les genres est davantage un vocabulaire « de service » qu'un vocabulaire « de référence ». Il n'a pas la prétention de favoriser une normalisation des concepts de genres mais est plutôt destiné à favoriser l'interopérabilité entre les nombreux vocabulaires de genres. Artsdata l'utilise en conjonction avec le service de réconciliation afin reconnaître de façon programmatique des chaînes de caractères désignant des genres et les mettre en correspondance avec les concepts de genres d'Artsdata ainsi que des concepts externes. Le vocabulaire contrôlé d'Artsdata est mis en correspondance avec les vocabulaires suivants :

* Wikidata
* Art and Architecture Thesaurus
