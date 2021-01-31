---
layout: default
title: 'supprimer'
custom_title: 'Supprimer une catégorie'
parent: 'Catégories'
nav_order: 500
---
{% assign request = site.data.urls.categories.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime la catégorie identifiée par son ID. Cette opération ne supprime pas les documents rattachés à cette catégorie.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
