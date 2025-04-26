---
layout: default
nav_title: 'factures'
title: 'Liste des pièces jointes aux factures'
parent: 'Fichiers'
nav_order: 200
---
{% assign request = site.data.urls.files.invoices -%}
## {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux factures, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels

* `page` : numéro de page
* `invoice_id` : ID de de la facture, cela permet de récupérer la liste des pièces jointes d'une facture spécifique, sachant que cette liste est aussi renvoyée dans la requête permettant d'obtenir le détail d'une facture.

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

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
[
  {
    "id": 1,
    "invoice_id": 1,
    "document_name": "contrat prestation.pdf",
    "document_size": 18884,
    "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
    "title": "Facture n°1"
  },
  {
    "id": 2,
    "invoice_id": 2,
    "document_name": "contrat vente.pdf",
    "document_size": 33442,
    "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
    "title": "Facture n°2"
  }
]
{% endapi_block %}
