---
layout: default
nav_title: modifier
title: Modifier un achat
parent: Achats
nav_order: 400
---
{% assign request = site.data.urls.purchases.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un achat existant.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title": "Serveur virtuel"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
