---
layout: default
title: détails
custom_title: Détails d'un client
parent: 'Clients'
nav_order: 300
---
{% assign request = site.data.urls['customers']['show'] -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du client n° ID

## Paramètres optionnels :

* `with_sepa` : par défaut, les données SEPA ne sont pas retournée par l'API. Seule la clé API de l'administrateur de la société permet d'accéder aux données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1. Lorsque vous demandez à accéder aux informations SEPA avec une clé API autre que celle de l'administrateur du compte, le système retourne une erreur de type 403

## Requête

{% api_block %}
  {% curl_cmd -%}
  "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
{
  "account_code": "411PANDORA",
  "api_custom": null,
  "api_id": null,
  "category_id": 4847,
  "city": "Neuilly-sur-Seine",
  "civility": null,
  "company_name": "pandora",
  "country": "FR",
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": ID,
  "individual": false,
  "language": null,
  "last_invoiced_on": "2012-07-28",
  "last_name": "",
  "mobile": "",
  "pay_before": "30fm",
  "penalty": null,
  "phone": "",
  "short_name": "pandora",
  "siret": "53165179200016",
  "street": "171 avenue Charles de Gaulle",
  "validity": null,
  "vat_exemption": null,
  "vat_number": "",
  "website": null,
  "zip_code": "92200"
}
{% endapi_block %}
