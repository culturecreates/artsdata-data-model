---
nav_exclude: true
lang: fr
---
{% include back-button.html %}

# Bonnes pratiques pour le choix des valeurs de performer

#### Table des matières
* [Aperçu] (#aperçu)
* [Pourquoi ces lignes directrices sont nécessaires] (#pourquoi-ces-lignes-directrices-sont-nécessaires)
* [Lignes directrices générales] (#lignes directrices générales)
* [Recommandations par genre] (#recommandations par genre)
* [Notes complémentaires] (#notes complémentaires)

## Aperçu

Ces lignes directrices sont principalement conçues pour des cas d’usage liés à la promotion et à la découvrabilité. Elles peuvent ne pas convenir à des contextes d’archivage ou de distribution artistique nécessitant des crédits détaillés ou des ensembles complets.

Ce document présente un ensemble de bonnes pratiques pour sélectionner les valeurs permettant de renseigner la propriété [`performer`](https://docs.artsdata.ca/performer.fr.html) dans le contexte des données d’événements en arts de la scène. Il s’appuie sur le travail continu de l’équipe Artsdata auprès des organismes culturels et des développeurs du secteur canadien des arts de la scène.

## Pourquoi ces lignes directrices sont nécessaires

Alors que des propriétés comme `location` ou `organizer` sont relativement simples à renseigner — grâce à des options limitées ou à des menus déroulants — la propriété `performer` est plus complexe. Elle exige souvent une compréhension nuancée de la représentation et de sa structure, en particulier dans les genres multidisciplinaires ou basés sur des ensembles, comme la danse, la musique orchestrale ou le théâtre.

Les travailleuses et travailleurs culturels peuvent hésiter à renseigner cette propriété en raison de :

- L’ambiguïté entourant ce qui constitue un « interprète » ;
- L’absence de listes prédéfinies ;
- L’incertitude quant à la notoriété ou aux conventions de nommage.

Ces lignes directrices visent à réduire ces frictions et à offrir des repères clairs.

## Lignes directrices générales

### 1. S’aligner sur la présentation publique

Sélectionnez des valeurs de performer qui correspondent à la manière dont le spectacle est présenté au public :

- Vérifiez le titre, le sous-titre et la description sur la page web de l’événement ;
- Utilisez le nom des artistes ou des compagnies mis de l’avant dans le matériel promotionnel.

### 2. Entités principales sur scène

De façon générale, la propriété `performer` devrait inclure l’entité ou les entités principales qui se produisent physiquement sur scène lors de l’événement.

### 3. Utiliser Role pour plus de clarté

Lorsque plusieurs interprètes sont pertinents (par exemple, une tête d’affiche et une première partie), utilisez [`schema:Role`](https://schema.org/Role) afin de préciser leurs rôles respectifs.

#### Exemple tiré d’un événement fictif en JSON-LD :

```
  "performer": [
    {
      "type": "Role",
      "roleName": "Headliner",
      "performer": {
        "type": "PerformingGroup",
        "name": "Main Band"
      }
    },
    {
      "type": "Role",
      "roleName": "Opening Act",
      "performer": {
        "type": "PerformingGroup",
        "name": "Up-and-coming Band"
      }
    }
  ]
```

#### 4. Solution de repli pour les systèmes à valeur unique

Si votre CMS ou votre outil de publication ne permet de renseigner qu’une seule valeur pour `performer` :

- Choisissez l’entité ayant la plus grande reconnaissance publique ;
- Priorisez les noms susceptibles d’être reconnus par les moteurs de recherche et le public.

## Recommandations par genre

### Spectacles de danse

Les valeurs acceptables pour `performer` peuvent inclure :

- La compagnie de danse (valeur par défaut recommandée) ;
- Une interprète solo ou vedette ;
- Des artistes invité·e·s ;
- Les danseur·euse·s principal·e·s ;

**Une liste de danseur·euse·s individuels (si connue et pertinente).

En cas de doute, indiquez la compagnie de danse** — cela facilite l’identification de l’origine du spectacle et favorise la découvrabilité.

### Concerts orchestraux

Les valeurs acceptables pour `performer` peuvent inclure :

- L’orchestre (valeur par défaut recommandée) ;
- Le ou la soliste (par exemple : pianiste, violoniste) ;
- Le ou la chef·fe invité·e.

Si une seule valeur peut être utilisée, **choisissez l’orchestre** pour assurer la cohérence et la découvrabilité.

## Notes complémentaires

- Utilisez des liens `sameAs` (par exemple vers Wikidata, ISNI ou des URI Artsdata) pour identifier les entités performer et améliorer l’interopérabilité.

Voir : [Lignes directrices Artsdata concernant la propriété `sameAs`]({{ base }}/sameas-guidelines.fr)
