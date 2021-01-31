---
layout: default
nav_title: 'lister'
title: 'Liste des règlements'
parent: Règlements
nav_order: 100
---
{% assign request = site.data.urls.settlements.find -%}
## {{ request.method }} {{ request.url }}

Liste les différents règlements enregistrés pour la facture n° INVOICE_ID.

## Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
[
  {
  "id": 14064,
  "invoice_id": 1,
  "total": "1000.0",
  "payment_mode": 2,
  "paid_on": "2015-09-07",
  "payment_ref": null
  }, {
  "id": 14065,
  "invoice_id": 1,
  "total": "2000.0",
  "payment_mode": 4,
  "paid_on": "2015-09-03"
  "payement_ref": "ma référence"
  }
]
{% endapi_block %}
