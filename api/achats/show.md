---
layout: default
nav_title: détails
title: Détails d'un achat
parent: 'Achats'
nav_order: 300
---
{% assign request = site.data.urls.purchases.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail de l'achat n° ID

## Requête

{% api_block 'shell' %}
  {% curl_cmd -%}
  "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
{
  "api_custom": null,
  "api_id": null,
  "category_id": 4852,
  "id": 125459,
  "supplier_id": 1,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 20,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "H\u00e9bergement Cloud juin 2013",
  "total_with_vat": "231.4",
  "vat_amount": "37.92"
}
{% endapi_block %}
