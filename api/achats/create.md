---
layout: default
nav_title: 'créer'
title: 'Créer un achat'
parent: 'Achats'
nav_order: 200
---
{% assign request = site.data.urls.purchases.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouvel achat. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true-%}
-X POST -d '{"supplier_id": 1, "invoiced_on": "2013-06-28","title": "Restaurant","total_with_vat": "100","vat_amount": "16,39"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' -%}
Status: 201 Created
Location: /firms/FIRM_ID/purchases/ID.json
{% endapi_block %}

{% api_block 'json' -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "id": 125858,
  "invoiced_on": "2013-06-28",
  "notes": null,
  "paid_on": null,
  "payment_mode": 0,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "supplier_id": 1,
  "term_on": null,
  "title": "Restaurant",
  "total_with_vat": "100.0",
  "vat_amount": "16.39"
}
{% endapi_block %}
