---
layout: default
nav_title: 'créer'
title: 'Créer un client'
parent: 'Clients'
nav_order: 200
---
{% assign request = site.data.urls.customers.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouveau client. On obtient en retour le code JSON du client créé, avec l'ID qui lui a été attribué.

### Remarque

Par défaut, en l'absence d'indication spécifique, chaque client créé est de type professionnel, et si vous n'avez pas indiqué de nom d'entreprise, celui ci est automatiquement dérivé du prénom et du nom du client. Lorsque vous créez un client particulier, vous devez donc le préciser en affectant la valeur `true` au champ `individual`.

## Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"company_name":"A small company","individual":false}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/customers/ID.json

{
  "account_code": "411ASMALLCO",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "city": null,
  "civility": null,
  "company_name": "A small company",
  "country": null,
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": null,
  "first_name": null,
  "id": ID,
  "individual": false,
  "language": null,
  "last_invoiced_on": null,
  "last_name": null,
  "mobile": null,
  "pay_before": null,
  "penalty": null,
  "phone": null,
  "short_name": "A small company",
  "siret": null,
  "street": null,
  "validity": null,
  "vat_exemption": null,
  "vat_number": null,
  "website": null,
  "zip_code": null
}
{% endapi_block %}
