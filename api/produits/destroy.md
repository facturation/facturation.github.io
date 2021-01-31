---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un produit'
parent: 'Catalogue produits'
nav_order: 500
---
{% assign request = site.data.urls.products.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le produit identifié par son ID. Cette opération ne supprime pas les lignes de facturation associées à ce produit.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
