---
layout: default
nav_title: 'créer'
title: 'Créer une catégorie'
parent: 'Catégories'
nav_order: 200
---
{% assign request = site.data.urls.categories.create -%}
## {{ request.method }} {{ request.url }}

Création d'une nouvelle catégorie. On obtient en retour le code JSON de la catégorie créé, avec l'ID qui lui a été attribué.

## Requête

{% api_block %}
{% curl_cmd(write: true)-%}
-X POST -d '{"title":"Prestation de services","status":"1"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/categories/5010.json

{
  "id": 5010,
  "status": 1,
  "title": "Prestation de services"
}
{% endapi_block %}
