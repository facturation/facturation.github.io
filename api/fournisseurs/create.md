---
layout: default
nav_title: 'créer'
title: 'Créer un fournisseur'
parent: Fournisseurs
nav_order: 200
---
{% assign request = site.data.urls.suppliers.create -%}
## {{ request.method }} {{ request.url }}

Création d'un nouveau fournisseur. On obtient en retour le code JSON du fournisseur créé, avec l'ID qui lui a été attribué.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true-%}
-X POST -d '{"company_name":"Office Depot"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' -%}
Status: 201 Created
Location: /firms/FIRM_ID/suppliers/49097.json
{% endapi_block %}

{% api_block 'json' %}
{
  "account_code": "401OFFICEDE",
  "category_id": null,
  "city": null,
  "civility": null,
  "company_name": "Office Depot",
  "country": null,
  "email": null,
  "fax": null,
  "first_name": null,
  "id": 49097,
  "last_name": null,
  "mobile": null,
  "notes": null,
  "phone": null,
  "short_name": "Office Depot",
  "siret": null,
  "street": null,
  "vat_number": null,
  "website": null,
  "zip_code": null
}
{% endapi_block %}
