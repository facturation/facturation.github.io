---
layout: default
nav_title: 'créer'
title: 'Créer une facture récurrente'
parent: 'Factures récurrentes'
nav_order: 200
---
{% assign request = site.data.urls.recurring_invoices.create -%}
## {{ request.method }} {{ request.url }}

Création d'une nouvelle facture. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué.<br/>
Une facture doit au moins contenir une ligne de facturation (champs items)<br/>
Le total de chaque ligne de facturation ainsi que le total de la facture sont calculés automatiquement et ne doivent pas être transmis.

### Remarques

* Si vous souhaitez créer une facture en mode brouillon, ajoutez le paramètre `type_doc=draft` à l'url.
* Si vous souhaitez **importer une facture externe** (i.e. enregistrer dans votre compte une **facture créée dans un autre outil**, pour en tenir compte dans les statistiques et les exports de votre entreprise), ajoutez le paramètre `external=1` à l'url. Dans ce cas, vous devez obligatoirement préciser le numéro de la facture d'origine dans le champs "external_ref".

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true-%}
-X POST -d '{
  "frequency": "30",
  "draft": "0",
  "customer_id": "1",
  "next_run_on": "2026-09-09",
  "currency": "EUR",
  "title": "Emplacement publicitaire",
  "items": [
    {
      "position": "1",
      "style": "",
      "title": "Affichage publicité",
      "product_id": "",
      "quantity_measure": "1",
      "vat": "0.2",
      "unit_price": "250",
      "nature": "9"
    }
  ],
  "rebate_percentage": "0",
  "language": "fr",
  "pay_before": "30",
  "mailing": "1",
  "email_attributes": {
    "to": "laurent@test.com",
    "cc": "",
    "bcc": "",
    "subject": "Votre facture",
    "message": "Bonjour\r\n\r\nVeuillez trouver ci-joint la facture %{reference} à régler avant le %{echeance}.\r\nEn vous remerciant,\r\n\r\nCordialement,\r\nAds Corp"
  }
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' -%}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/1.json
{% endapi_block %}

{% api_block 'json' -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 180366,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 411588,
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
{% endapi_block %}
