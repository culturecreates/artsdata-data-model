---
nav_exclude: true
lang: fr
---
{% include back-button.html %}

{% include language-switcher.html %}

## Vocabulaire contrôlé Artsdata pour les genres

| <!-- --> | <!-- --> |
| - | - |
| Schéma de concepts | [adr:ArtsdataGenres](http://kg.artsdata.ca/resource/ArtsdataGenres) |
| Version | 1.0 |
| Date de publication | janvier 2026 |

Cette page décrit le vocabulaire contrôlé utilisé dans le graphe de connaissances Artsdata pour différencier les genres dans le secteur des arts et culture, et plus spécifiquement dans les arts de la scène.

Ce vocabulaire contrôlé représente une liste de valeurs pour la propriété [schema:genre](https://schema.org/genre), dont le domaine est [schema:CreativeWork](https://schema.org/CreativeWork). Il s'agit donc d'un vocabulaire contrôlé qui peut être employé tant pour décrire des œuvres faisant parti du continuum OEMI (par exemple, une pièce de théâtre en tant que texte dramatique), que des œuvres-spectacles ([ado:LivePerformanceWork](http://kg.artsdata.ca/ontology/LivePerformanceWork)) qui intègrent des expressions d'œuvres OEMI (par exemple, une production théâtrale). Cela peut donner lieu à de la confusion dans des cas où une œuvre-spectacle associée à un genre intègre une œuvre ou est dérivée d'une œuvre associée à un autre genre (par exemple, un spectacle de cirque dérivé de Roméo et Juliette). Il convient alors d'associer à chaque entité œuvre la déclaration de genre qui lui revient.

Il s'agit d'un vocabulaire avec plusieurs niveaux de hiérarchie (le vocabulaire initial comporte deux niveaux mais il serait possible d'ajouter d'autres niveaux). Les relations skos:narrower/skos:broader entre les concepts ont une cardinalité « plusieurs à plusieurs » : un concept peut avoir aucun, un seul ou plusieurs parents.

Les identifiants des concepts sont opaques. Cela permet d'assurer la stabilité des URI tout en offrant la flexibilité de changer libellés aussi souvent que nécessaire.

Le vocabulaire contrôlé Artsdata pour les genres est davantage un vocabulaire « de service » qu'un vocabulaire « de référence ». Il n'a pas la prétention de favoriser une normalisation des concepts de genres mais est plutôt destiné à favoriser l'interopérabilité entre les nombreux vocabulaires de genres. Artsdata l'utilise en conjonction avec le service de réconciliation afin reconnaître de façon programmatique des chaînes de caractères désignant des genres et les mettre en correspondance avec les concepts de genres d'Artsdata ainsi que des concepts externes. Le vocabulaire contrôlé d'Artsdata est mis en correspondance avec les vocabulaires suivants :

* Wikidata
* Art and Architecture Thesaurus (partiel)
* Musicbrainz (par le biais de Wikidata)

La version inaugurale de ce vocabulaire contrôlé a été proposée en novembre 2025. Les débats entourant sa création sont consignés dans [cette discussion](https://github.com/culturecreates/artsdata-data-model/discussions/186).

### Concepts

La liste des genres (concepts SKOS) peut être consultée dans le [schéma de concepts](http://kg.artsdata.ca/resource/ArtsdataGenres), dans cette [feuille de calcul](https://docs.google.com/spreadsheets/d/1RSbTTJtjBW48BKVwQR9zcR4zr2wDEtoq-wvuAqYwiY0/edit?usp=sharing), ou dans le dans le tableau ci-dessous.

| CURI | Libellé préféré | Correspondance exacte | Correspondance approximative |
| - | - | - | - |
| [K6-100](http://kg.artsdata.ca/resource/K6-100) | Théâtre | [wd:Q11635](http://www.wikidata.org/entity/Q11635), [aat:300417582](http://vocab.getty.edu/aat/300417582) | |
| [K6-200](http://kg.artsdata.ca/resource/K6-200) | Danse | [wd:Q11639](http://www.wikidata.org/entity/Q11639), [aat:300054144](http://vocab.getty.edu/aat/300054144) | |
| [K6-201](http://kg.artsdata.ca/resource/K6-201) | Ballet | [wd:Q41425](http://www.wikidata.org/entity/Q41425) | [wd:Q1020618](http://www.wikidata.org/entity/Q1020618) |
| [K6-202](http://kg.artsdata.ca/resource/K6-202) | Contemporaine | [wd:Q186035](http://www.wikidata.org/entity/Q186035) | |
| [K6-203](http://kg.artsdata.ca/resource/K6-203) | Moderne | [wd:Q850130](http://www.wikidata.org/entity/Q850130) | |
| [K6-204](http://kg.artsdata.ca/resource/K6-204) | Danse culturelle | [wd:Q201022](http://www.wikidata.org/entity/Q201022) | |
| [K6-300](http://kg.artsdata.ca/resource/K6-300) | Musique | [wd:Q638](http://www.wikidata.org/entity/Q638), [aat:300054146](http://vocab.getty.edu/aat/300054146) | |
| [K6-301](http://kg.artsdata.ca/resource/K6-301) | Classique | [wd:Q9730](http://www.wikidata.org/entity/Q9730) | |
| [K6-302](http://kg.artsdata.ca/resource/K6-302) | Country | [wd:Q83440](http://www.wikidata.org/entity/Q83440) | |
| [K6-303](http://kg.artsdata.ca/resource/K6-303) | Folk | | [wd:Q43343](http://www.wikidata.org/entity/Q43343) |
| [K6-304](http://kg.artsdata.ca/resource/K6-304) | Jazz | [wd:Q8341](http://www.wikidata.org/entity/Q8341) | |
| [K6-305](http://kg.artsdata.ca/resource/K6-305) | Blues | [wd:Q9759](http://www.wikidata.org/entity/Q9759) | |
| [K6-306](http://kg.artsdata.ca/resource/K6-306) | Musique Contemporaine | | [wd:Q8011523](http://www.wikidata.org/entity/Q8011523) |
| [K6-307](http://kg.artsdata.ca/resource/K6-307) | Populaire | [wd:Q373342](http://www.wikidata.org/entity/Q373342) | |
| [K6-308](http://kg.artsdata.ca/resource/K6-308) | Traditionnelles du monde | [wd:Q205049](http://www.wikidata.org/entity/Q205049) | |
| [K6-309](http://kg.artsdata.ca/resource/K6-309) | Chanson | [wd:Q1062400](http://www.wikidata.org/entity/Q1062400) | |
| [K6-310](http://kg.artsdata.ca/resource/K6-310) | Instrumentale | [wd:Q639197](http://www.wikidata.org/entity/Q639197) | |
| [K6-311](http://kg.artsdata.ca/resource/K6-311) | Alternative | [wd:Q1695023](http://www.wikidata.org/entity/Q1695023) | |
| [K6-312](http://kg.artsdata.ca/resource/K6-312) | Électronique | [wd:Q9778](http://www.wikidata.org/entity/Q9778) | |
| [K6-313](http://kg.artsdata.ca/resource/K6-313) | Métal | [wd:Q12326776](http://www.wikidata.org/entity/Q12326776) | |
| [K6-314](http://kg.artsdata.ca/resource/K6-314) | Rap | [wd:Q11401](http://www.wikidata.org/entity/Q11401) | |
| [K6-315](http://kg.artsdata.ca/resource/K6-315) | Rhythm and blues | [wd:Q45981](http://www.wikidata.org/entity/Q45981) | |
| [K6-316](http://kg.artsdata.ca/resource/K6-316) | Rock | [wd:Q11399](http://www.wikidata.org/entity/Q11399) | |
| [K6-400](http://kg.artsdata.ca/resource/K6-400) | Musico-dramatique | | [wd:Q123777276](http://www.wikidata.org/entity/Q123777276) |
| [K6-401](http://kg.artsdata.ca/resource/K6-401) | Comédie musicale | | [wd:Q1370345](http://www.wikidata.org/entity/Q1370345) |
| [K6-402](http://kg.artsdata.ca/resource/K6-402) | Opéra | [wd:Q1344](http://www.wikidata.org/entity/Q1344) | |
| [K6-500](http://kg.artsdata.ca/resource/K6-500) | Parlé | | |
| [K6-501](http://kg.artsdata.ca/resource/K6-501) | Conte | | [wd:Q989963](http://www.wikidata.org/entity/Q989963) |
| [K6-502](http://kg.artsdata.ca/resource/K6-502) | Poésie | | [wd:Q482](http://www.wikidata.org/entity/Q482) |
| [K6-503](http://kg.artsdata.ca/resource/K6-503) | Slam | | [wd:Q2293670](http://www.wikidata.org/entity/Q2293670) |
| [K6-504](http://kg.artsdata.ca/resource/K6-504) | Art de la parole | [wd:Q1428637](http://www.wikidata.org/entity/Q1428637) | |
| [K6-900](http://kg.artsdata.ca/resource/K6-900) | Art de la scène | | [wd:Q184485](http://www.wikidata.org/entity/Q184485) |
| [K6-901](http://kg.artsdata.ca/resource/K6-901) | Cirque | | [wd:Q713197](http://www.wikidata.org/entity/Q713197) |
| [K6-902](http://kg.artsdata.ca/resource/K6-902) | Humour | | [wd:Q3492850](http://www.wikidata.org/entity/Q3492850) |
| [K6-903](http://kg.artsdata.ca/resource/K6-903) | Variétés | [wd:Q117187901](http://www.wikidata.org/entity/Q117187901) | |
| [K6-904](http://kg.artsdata.ca/resource/K6-904) | Marionnette | [wd:Q588750](http://www.wikidata.org/entity/Q588750), [aat:300248147](http://vocab.getty.edu/aat/300248147) | |
| [K6-905](http://kg.artsdata.ca/resource/K6-905) | Mime | [wd:Q39818](http://www.wikidata.org/entity/Q39818), [aat:300417615](http://vocab.getty.edu/aat/300417615) | |
| [K6-906](http://kg.artsdata.ca/resource/K6-906) | Magie | [wd:Q148442](http://www.wikidata.org/entity/Q148442), [aat:300417618](http://vocab.getty.edu/aat/300417618) | |
