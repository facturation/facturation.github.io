---
layout: default
nav_title: modifier
title: Modifier un produit
parent: Catalogue produits
nav_order: 400
---
{% assign request = site.data.urls.products.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un produit existant.

## Requête

{% api_block %}
{% curl_cmd(write: true) -%}
-X PATCH -d '{"title":"Optimisation module Prestashop","api_custom":"CUSTOM_SHOP"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
