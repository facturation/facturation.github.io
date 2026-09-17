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
    "id": 1,
    "customer_id": 1,
    "title": null,
    "language": "fr",
    "category_id": 1,
    "followup_id": -1,
    "invoiced_on": "2025-09-08",
    "term_on": null,
    "draft": true,
    "balance_year": null,
    "total": "500.0",
    "total_with_vat": "500.0",
    "currency": "EUR",
    "rebate_percentage": "0.0",
    "exchange_rate": null,
    "estimated_rate": false,
    "vat_exemption": "Autoliquidation art. 196 directive UE 2006/112/CE",
    "vat_country": "FR",
    "tax_title": null,
    "tax_percent": null,
    "penalty": null,
    "pay_before": "15",
    "discount": null,
    "precompte": null,
    "activity_title": null,
    "service_personne": false,
    "accounting_entry": "706200",
    "information": "",
    "internal_note": "",
    "purchase_number": "",
    "created_at": "2025-09-08T14:42:01.191+02:00",
    "updated_at": "2025-09-08T14:42:01.191+02:00",
    "api_id": null,
    "api_custom": null,
    "soft_deleted": false,
    "hard_delete_on": null,
    "mailing": false,
    "payment_mode": 3,
    "paid_on": null,
    "next_run_on": "2025-09-09",
    "last_run_on": "2025-08-09",
    "occurrence": null,
    "frequency": 30
  },
  {
    "id": 2,
    "customer_id": 2,
    "title": null,
    "language": "fr",
    "category_id": 8116,
    "followup_id": -1,
    "invoiced_on": "2015-01-20",
    "term_on": null,
    "draft": false,
    "balance_year": null,
    "total": "10000.0",
    "total_with_vat": "12000.0",
    "currency": "EUR",
    "rebate_percentage": "0.0",
    "exchange_rate": null,
    "estimated_rate": false,
    "vat_exemption": null,
    "vat_country": "FR",
    "tax_title": null,
    "tax_percent": null,
    "penalty": "0.0",
    "pay_before": "60",
    "discount": "0.0",
    "precompte": null,
    "activity_title": null,
    "service_personne": false,
    "accounting_entry": "706000",
    "information": "",
    "internal_note": "",
    "purchase_number": "",
    "created_at": "2015-01-20T16:57:06.000+01:00",
    "updated_at": "2015-04-15T04:05:10.205+02:00",
    "api_id": null,
    "api_custom": null,
    "soft_deleted": false,
    "hard_delete_on": null,
    "mailing": false,
    "payment_mode": 0,
    "paid_on": null,
    "next_run_on": "2015-07-15",
    "last_run_on": "2015-04-15",
    "occurrence": null,
    "frequency": 90
  }
]
{% endapi_block %}
