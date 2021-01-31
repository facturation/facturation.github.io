---
layout: default
title: 'lister'
custom_title: 'Liste des suivis commerciaux'
parent: 'Suivis'
nav_order: 100
---
{% assign request = site.data.urls.followups.find -%}
## {{ request.method }} {{ request.url }}

liste des suivis commerciaux, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels

* `page` : numéro de page
* `title` : recherche partielle sur le libellé du suivi
* `status` : rechercher par type de suivi (i.e. type d'affectation)

## Remarques:

Il existe deux codes de suivis gérés par le système, qui sont non modifiables et non supprimables, et qui n'apparaissent donc pas dans la liste des suivis que vous avez défini. Il s'agit des codes suivants:

* En cours (id: 0)
* Terminé (id: -1)

Ces codes s'utilisent sur les devis et les factures comme n'importe lequel de vos suivis personnalisés, en utilisant l'id indiqué ci dessus dans le champs `followup_id` du devis ou de la facture.

## Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
[
  {
  "id": 4866,
  "status": 1,
  "title": "A facturer"
  }, {
  "id": 4867,
  "status": 0,
  "title": "A relancer"
  }, {
  "id": 4857,
  "status": 2,
  "title": "Envoyer produits"
  }
]
{% endapi_block %}
