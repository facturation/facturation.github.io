---
layout: default
nav_title: détails
title: Détails d'un règlement
parent: Règlements
nav_order: 300
---
{% assign request = site.data.urls.settlements.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du règlement n° ID pour la facture n° INVOICE_ID

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "id": 14064,
  "invoice_id": 1,
  "total": "1000.0",
  "payment_mode": 2,
  "paid_on": "2015-09-07",
  "payment_ref": null
}
{% endapi_block %}
