---
layout: default
nav_title: 'achats'
title: 'Liste des pièces jointes aux achats'
parent: 'Fichiers'
nav_order: 300
---
{% assign request = site.data.urls.files.purchases -%}
## {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux achats, par groupe de {{ site.api.per_page }} résultats.<br/>

## Paramètres optionnels

* `page` : numéro de page
* `purchase_id` : ID de l'achat, cela permet de récupérer la liste des pièces jointes d'un achat spécifique, sachant que cette liste est aussi renvoyée dans la requête permettant d'obtenir le détail d'un achat.

### Tri

Par défaut, les pièces jointes sont triées par ordre décroissant de création.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - title: tri par nom de fichier
  - size: tri par taille de fichier
  - updated: tri par date de mise à jour
  - created: tri par date de création

## Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
[
  {
  "id": 1,
  "purchase_id": 1,
  "document_name": "facture_123.pdf",
  "document_size": 18884,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "title": "Location serveur dédié"
  },
  {
  "id": 2,
  "purchase_id": 2,
  "document_name": "bill_321.pdf",
  "document_size": 33442,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
  "title": "Comptabilité 05/2014"
  }
]
{% endapi_block %}
