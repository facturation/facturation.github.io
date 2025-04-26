---
layout: default
nav_title: modifier
title: Modifier un suivi commercial
parent: 'Suivis commerciaux'
nav_order: 400
---
{% assign request = site.data.urls.followups.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un suivi commercial existante.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Relancer le client","status":"2"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
