---
layout: default
nav_title: 'créer'
title: 'Créer un suivi commercial'
parent: 'Suivis commerciaux'
nav_order: 200
---
{% assign request = site.data.urls.followups.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouveau suivi commercial. On obtient en retour le code JSON du suivi créé, avec l'ID qui lui a été attribué.

## Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"title":"En attente de réponse","status":"1"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/followups/1234.json

{
  "id": 1234,
  "status": 1,
  "title": "En attente de réponse"
}
{% endapi_block %}
