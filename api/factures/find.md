---
layout: default
nav_title: "lister"
title: "Liste des factures"
parent: "Factures"
nav_order: 100
---

{% assign request = site.data.urls.invoices.find -%}

## {{ request.method }} {{ request.url }}

Liste des factures, par groupe de {{ site.api.per_page }} résultats.<br/>
Chaque facture est composée d'un ensemble de lignes de facturation (items).

## Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque facture, sauf les lignes de facturation et les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir les lignes de facturation d'une facture spécifique (ou bien la liste des pièces jointes), il vous suffit de faire une requête sur la facture concernée.

Vous avez la possibilité d'inclure plus ou moins d'informations avec chaque facture retournée dans la réponse en utilisant les paramètres suivants :

- `with_details` :
  - 1 pour inclure les lignes de facturation et la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure les lignes de facturation et la liste des pièces jointes
- `with_settlements` :
  - 1 pour inclure la liste des règlements partiels enregistrés pour chaque facture
  - 0 (par défaut) pour ne pas inclure la liste des règlements partiels

## Paramètres optionnels

- `page` : numéro de page
- `api_id` : recherche exacte sur le champ api_id
- `api_custom` : recherche partielle sur le champ api_custom
- `invoice_ref` : recherche partielle sur le numéro de facture
- `full_invoice_ref` : recherche exacte sur le numéro de facture (incluant son eventuel prefixe)
- `payment_ref` : recherche partielle sur la référence du paiement
- `title` : recherche partielle sur le l'objet de la facture
- `customer_id` : afficher uniquement les factures d'un client spécifique
- `company` : recherche partielle sur le nom de société
- `last_name` : recherche partielle sur le nom de famille
- `bill_type`: recherche sur un type de facture spécifique. Les valeurs possibles sont :
  {% for item in site.data.specific.bills_type_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `category_id`: recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les factures sans catégorie)
- `followup_id`: recherche sur l'ID d'un suivi commercial spécifique
- `accounting_entry`: recherche par code d'imputation (abonnement Entreprise)
- `user_id` : limiter les résultats aux factures gérées par un collaborateur spécifique

### Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:

- `period_start` : période de début
- `period_end` : période de fin
- `period_type` : si ce champ est vide, la recherche par période se fait sur les périodes d'encaissement. Pour faire une recherche par périodes de facturation, utiliser la valeur "billed" (sans guillemets)

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

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
  - billed: tri par date de facturation
  - term: tri par date d'échéance
  - created: tri par date de création d'une facture (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'une facture (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

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
    "items": [
      {
        "id": 949165,
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
        "id": 949166,
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
]
{% endapi_block %}
