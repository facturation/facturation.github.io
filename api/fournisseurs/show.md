---
layout: default
nav_title: détails
title: Détails d'un fournisseur
parent: Fournisseurs
nav_order: 300
---
{% assign request = site.data.urls.suppliers.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du fournisseur n°ID.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "account_code": "401APPLE",
  "category_id": 4857,
  "city": "",
  "civility": null,
  "company_name": "apple",
  "country": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 49090,
  "last_name": "",
  "mobile": "",
  "notes": "",
  "phone": "",
  "short_name": "apple",
  "siret": null,
  "street": "",
  "vat_number": null,
  "website": null,
  "zip_code": ""
}
{% endapi_block %}
