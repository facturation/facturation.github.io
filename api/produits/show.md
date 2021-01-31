---
layout: default
nav_title: détails
title: Détails d'un produit
parent: Catalogue produits
nav_order: 300
---
{% assign request = site.data.urls.products.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du produitn° ID.

## Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": 4868,
  "id": 1,
  "nature": 9,
  "ref": "PRESTASHOP",
  "title": "Developpement module Prestashop",
  "unit_price": "100.0",
  "vat": "0.200"
}
{% endapi_block %}
