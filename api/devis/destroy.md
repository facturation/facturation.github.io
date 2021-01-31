---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un devis'
parent: 'Devis'
nav_order: 500
---
{% assign request = site.data.urls.quotes.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le devis identifié par son ID.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
