---
layout: default
nav_title: avoir
title: Avoir sur une facture
parent: Factures
nav_order: 700
---
{% assign request = site.data.urls.invoices.refund -%}
## {{ request.method }} {{ request.url }}

Effectue un avoir de la facture n° ID

## Paramètres optionnels

* `api_id` : mémorisation d'un ID spécifique pour l'avoir
* `api_custom` : mémorisation d'une information libre pour l'avoir

## Requête


{% api_block %}
{% curl_cmd write: true -%}
-X POST "{{ request.url | api_url }}?api_id=32&api_custom=remboursement+suite+plainte+client"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
{
  "api_custom": 'remboursement suite plainte client',
  "api_id": 32,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 180366,
  "external_ref": null,
  "discount": "0.0",
  "draft": false,
  "id": 411589,
  "information": null,
  "invoice_ref": "201307-5",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": "2013-07-29",
  "pay_before": "60fm",
  "payment_mode": 99,
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
  "total": "-700.0",
  "paid_in_main_currency": "-837.2",
  "vat_exemption": null
}
{% endapi_block %}
