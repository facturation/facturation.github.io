---
layout: default
nav_title: modifier
title: Modifier un fournisseur
parent: Fournisseurs
nav_order: 400
---
{% assign request = site.data.urls.suppliers.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un fournisseur existant.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"city":"Palo Alto","country":"US","street": "1 infinite loop"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
