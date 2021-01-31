---
layout: default
title: abonnement
custom_title: Liste des commandes d'abonnement
parent: 'Compte'
nav_order: 200
---
{% assign request = site.data.urls.account.orders -%}
## {{ request.method }} {{ request.url }}

Retourne la liste des factures d'abonnements payées pour la société ID.

## Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
[
  {
  "title": "Abonnement Entreprise - 12 mois",
  "amount": 48.00,
  "payment_date": "2021-01-15",
  "invoice_url": "/firms/ID/orders/11111111-4c0e-455d-9801-6aa2a9afcf34.pdf",
  "refunded": false
  },
  {
  "title": "Abonnement Premium - 12 mois",
  "amount": 30.00,
  "payment_date": "2020-01-15",
  "invoice_url": "/firms/ID/orders/11111111-6acb-479e-937f-2889dc4c3f59.pdf",
  "refunded": false
  }
]
{% endapi_block %}
