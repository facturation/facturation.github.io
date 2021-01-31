---
layout: default
nav_title: 'créer'
title: 'Créer un devis'
parent: 'Devis'
nav_order: 200
---
{% assign request = site.data.urls.quotes.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouveau devis. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué.<br/>
Un devis doit contenir au moins une ligne de facturation (champs `items`)<br/>
Le total de chaque ligne de facturation ainsi que le total du devis sont calculés automatiquement et ne doivent pas être transmis.

## Requête

{% api_block %}
{% curl_cmd(write: true)-%}
-X POST -d '{
"currency": "EUR",
"customer_id": <%= api_customer_id %>,
"invoiced_on": "2013-07-29",
"language": "fr",
"pay_before": "60fm",
"penalty": "0.0",
"title": "Facturation mensuelle",
"items": [{
"position": 1,
"quantity": "1.0",
"title": "Affichage pub 1",
"unit_price": "500",
"vat": "0.200"
}, {
"position": 2,
"quantity": "1.0",
"title": "Affichage pub 2",
"unit_price": "200",
"vat": "0.200"
}]
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/quotes/411585.json

{
  "amount_invoiced": "0.0",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "discount": null,
  "draft": false,
  "fully_invoiced": false,
  "id": 411585,
  "ignore_quote": false,
  "information": null,
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "pay_before": "60fm",
  "penalty": "0.0",
  "precompte": null,
  "quote_ref": 4,
  "quote_status": 0,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-08-28",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "vat_exemption": null,
  "items": [
    {
    "id": 949162,
    "nature": 9,
    "optional": false,
    "position": 1,
    "product_id": null,
    "quantity": "1.0",
    "style": null,
    "title": "Affichage pub 1",
    "total": "500.0",
    "unit_price": "500.0",
    "vat": "0.200"
    }, {
    "id": 949163,
    "nature": 9,
    "optional": false,
    "position": 2,
    "product_id": null,
    "quantity": "1.0",
    "style": null,
    "title": "Affichage pub 2",
    "total": "200.0",
    "unit_price": "200.0",
    "vat": "0.200"
    }
  ]
}
{% endapi_block %}
