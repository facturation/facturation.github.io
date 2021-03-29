---
layout: default
nav_title: 'créer'
title: 'Créer un règlement'
parent: 'Règlements'
nav_order: 200
---
{% assign request = site.data.urls.settlements.create -%}
## {{ request.method }} {{ request.url }}

Enregistre un nouveau règlement partiel pour la facture n° INVOICE_ID. On obtient en retour le code JSON du règlement créé, avec l'ID qui lui a été attribué

### Remarque

Lorsque le règlement enregistré solde la facture, la facture est automatiquement marquée comme payée à la date et avec le mode de règlement du dernier règlement enregistré.

## Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{
"invoice_id": 1,
"total": "100.0",
"payment_mode": 1,
"paid_on": "2021-01-15",
"payment_ref": "XYZ"
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/1/settlements/1.json

{
  "id": 1,
  "invoice_id": 1,
  "total": "100.0",
  "payment_mode": 1,
  "paid_on": "2021-01-15",
  "payment_ref": "XYZ"
  }
{% endapi_block %}
