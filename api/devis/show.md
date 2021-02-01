---
layout: default
nav_title: détails
title: Détails d'un devis
parent: Devis
nav_order: 300
---
{% assign request = site.data.urls.quotes.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du devis n° ID<br/>
Chaque devis est composé d'une ou plusieurs lignes de facturation (`items`)

## Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
{
  "amount_invoiced": "0.0",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "discount": "0.0",
  "draft": false,
  "fully_invoiced": false,
  "id": 1,
  "ignore_quote": false,
  "information": "",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "pay_before": "30",
  "penalty": "0.0",
  "precompte": null,
  "quote_ref": 2,
  "quote_status": 0,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-08-28",
  "title": null,
  "total": "459.0",
  "vat_exemption": null,
  "invoice_ids": [],
  "items": [{
  "id": 949159,
  "nature": 9,
  "optional": false,
  "position": 1,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage publicitaire - Appel \u00e0 facture n\u00b03148",
  "total": "459.0",
  "unit_price": "459.0",
  "vat": "0.200"
  }]
}
{% endapi_block %}
