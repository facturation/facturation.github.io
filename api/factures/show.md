---
layout: default
nav_title: détails
title: Détails d'une facture
parent: Factures
nav_order: 300
---
{% assign request = site.data.urls.invoices.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail de la facture n° ID<br/>
Chaque facture est composée d'une ou plusieurs lignes de facturation (items)

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 1,
  "information": null,
  "invoice_ref": "201307-4",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": null,
  "pay_before": "60fm",
  "payment_mode": 0,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "paid_in_main_currency": null,
  "vat_exemption": null,
  "items": [
    {
      "id": 949167,
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
    },
    {
      "id": 949168,
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
{% endapi_block -%}