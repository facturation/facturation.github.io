---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un achat'
parent: 'Achats'
nav_order: 500
---
{% assign request = site.data.urls.purchases.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime l'achat identifié par son ID.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
