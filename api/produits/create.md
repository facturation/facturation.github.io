---
layout: default
nav_title: 'créer'
title: 'Créer un produit'
parent: 'Catalogue produits'
nav_order: 200
---
{% assign request = site.data.urls.products.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouveau produit. On obtient en retour le code JSON du produit créé, avec l'ID qui lui a été attribué.

## Requête

{% api_block %}
{% curl_cmd(write: true)-%}
-X POST -d '{"ref":"PAIMENT","title":"Developpement passerelle de paiement","unit_price":200.0,"vat":0.200}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/products/46127.json

{
  "id": 46127,
  "ref": "PAIMENT",
  "title": "Developpement passerelle de paiement",
  "unit_price": "200.0",
  "vat": "0.200"
}

{% endapi_block %}
