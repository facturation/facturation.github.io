---
layout: default
nav_title: "lister"
title: "Liste des factures récurrentes"
parent: 'Factures récurrentes'
nav_order: 100
---

{% assign request = site.data.urls.recurring_invoices.find -%}

## {{ request.method }} {{ request.url }}

Liste des factures récurrentes, par groupe de {{ site.api.per_page }} résultats.<br/>
Chaque facture récurrente est composée d'un ensemble de lignes de facturation (items) ainsi que d'informations spécifiques à la récurrence et à la transmission éventuelle de la facture par courriel.

## Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque facture récurrente, sauf les lignes de facturation et le contenu des courriels, afin d'optimiser les performances de vos requêtes. Pour obtenir les lignes de facturation d'une facture spécifique (ou bien le contenu du courriel), il vous suffit de faire une requête sur la facture récurrente concernée.

Vous avez la possibilité d'inclure plus ou moins d'informations avec chaque facture récurrente retournée dans la réponse en utilisant les paramètres suivants :

- `with_details` :
  - 1 pour inclure les lignes de facturation et le courriel
  - 0 (par défaut) pour ne pas inclure les lignes de facturation et le contenu du courriel

## Paramètres optionnels

- `page` : numéro de page
- `title` : recherche partielle sur le l'objet de la facture
- `company` : recherche partielle sur le nom de société
- `last_name` : recherche partielle sur le nom de famille
- `email` : recherche partielle sur une adresse email utilisée dans le courriel associé à la facture récurrente
- `status`: recherche sur l'état des factures récurrentes. Les valeurs possibles sont :
  {% for item in site.data.specific.recurring_status.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `frequency` : recherche sur la fréquence de la facture récurrente. Les valeurs possibles sont :
  {% for item in site.data.specific.recurring_frequency.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `category_id`: recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les factures sans catégorie)

### Tri

Par défaut, les factures sont triées par ordre décroissant de numéro de facture.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants

- `sort` :
  - asc: tri croissant
  - desc: tri décroissant
- `order` : type de tri
  - customer: tri par nom mnémotechnique de client
  - paid: tri par date de paiement
  - total: tri par montant total de facturation
  - last_run: date de dernière exécution
  - next_run: date de prochaine exécution


### Obtention d'enregistrements spécifiques

Vous avez la possibilité d'obtenir un ensemble de factures spécifiques en transmettant une liste d'ID séparés par une virgule dans le champ `ids` (vous pouvez aussi transmettre un tableau d'ID). Dans ce cas, tous les paramètres optionnels sont ignorés à l'exception des paramètres de tri et de pagination.

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
[
  {
    "api_custom": null,
    "api_id": null,
    "category_id": null,
    "currency": "EUR",
    "customer_id": 180366,
    "customer_name": "Big Corp",
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
  },
  {
    "api_custom": null,
    "api_id": null,
    "category_id": null,
    "currency": "EUR",
    "customer_id": 180366,
    "customer_name": "Big Corp",
    "external_ref": null,
    "discount": null,
    "draft": false,
    "id": 411587,
    "information": null,
    "invoice_ref": "201307-3",
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
  }
]
{% endapi_block %}
