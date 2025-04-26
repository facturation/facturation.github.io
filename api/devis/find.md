---
layout: default
nav_title: "lister"
title: "Liste des devis"
parent: "Devis"
nav_order: 100
---

{% assign request = site.data.urls.quotes.find -%}

## {{ request.method }} {{ request.url }}

Liste des devis, par groupe de {{ site.api.per_page }} résultats.<br/>
Chaque devis est composé d'un ensemble de lignes de facturation (items).

## Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque devis, sauf les lignes de facturation et les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir les lignes de facturation d'un devis spécifique (ou bien la liste des pièces jointes), il vous suffit de faire une requête sur le devis concerné.

Vous avez la possibilité d'inclure les lignes de facturation et la liste des fichiers joints de chaque devis retourné dans la réponse en utilisant le paramètre suivant :

- `with_details` :
  - 1 pour inclure les lignes de facturation et la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure les lignes de facturation et la liste des pièces jointes

## Paramètres optionnels

- `page` : numéro de page
- `api_id` : recherche exacte sur le champ api_id
- `api_custom` : recherche partielle sur le champ api_custom
- `quote_ref` : recherche partielle sur le numéro de devis
- `full_quote_ref` : recherche exacte sur le numéro de devis
- `customer_id` : afficher uniquement les devis d'un client spécifique
- `title` : recherche partielle sur le l'objet du devis
- `company` : recherche partielle sur le nom de société
- `last_name` : recherche partielle sur le nom de famille
- `status`: recherche sur un statut de devis. Les valeurs possibles sont:
  {% for item in site.data.specific.quote_statuses_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `category_id` : recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les devis sans catégorie)
- `followup_id` : recherche sur l'ID d'un suivi commercial spécifique
- `accounting_entry` : recherche par code d'imputation (abonnement Entreprise)
- `user_id` : limiter les résultats aux devis gérés par un collaborateur spécifique

### Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:

- `period_start` : période de début
- `period_end` : période de fin

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

### Tri

Par défaut, les devis sont triés par ordre décroissant de numéro de devis.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants:

- `sort`:
  - asc: tri croissant
  - desc: tri décroissant
- `order` : type de tri
  - customer: tri par nom mnémotechnique de client
  - total: tri par montant total de facturation
  - billed: tri par date de devis
  - created: tri par date de création d'un devis (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un devis (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
[
  {
    "amount_invoiced": "0.0",
    "api_custom": null,
    "api_id": null,
    "category_id": null,
    "currency": "EUR",
    "customer_id": 180369,
    "discount": "0.0",
    "draft": false,
    "fully_invoiced": false,
    "id": 411583,
    "ignore_quote": false,
    "information": "",
    "invoiced_on": "2013-07-29",
    "language": "fr",
    "pay_before": "30",
    "penalty": "0.0",
    "precompte": null,
    "quote_ref": 2,
    "quote_status": 0,
    "rebate_percentage": "0.0",
    "service_personne": false,
    "tax_percent": null,
    "tax_title": null,
    "term_on": "2013-08-28",
    "title": null,
    "total": "459.0",
    "vat_exemption": null,
    "invoice_ids": [],
    "items": [
      {
        "id": 949159,
        "nature": 9,
        "optional": false,
        "position": 1,
        "product_id": null,
        "quantity": "1.0",
        "style": null,
        "title": "Affichage publicitaire - Appel \u00e0 facture n\u00b03148",
        "total": "459.0",
        "unit_price": "459.0",
        "vat": "0.200"
      }
    ]
  },
  {
    "amount_invoiced": "0.0",
    "api_custom": null,
    "api_id": null,
    "category_id": 4867,
    "currency": "EUR",
    "customer_id": 180366,
    "discount": "0.0",
    "draft": false,
    "fully_invoiced": false,
    "id": 411582,
    "ignore_quote": false,
    "information": "",
    "invoiced_on": "2013-07-29",
    "language": "fr",
    "pay_before": "60fm",
    "penalty": "0.0",
    "precompte": null,
    "quote_ref": 1,
    "quote_status": 0,
    "rebate_percentage": "0.0",
    "service_personne": false,
    "tax_percent": null,
    "tax_title": null,
    "term_on": "2013-08-28",
    "title": null,
    "total": "1458.27",
    "vat_exemption": null,
    "invoice_ids": [],
    "items": [
      {
        "id": 949158,
        "nature": 9,
        "optional": false,
        "position": 1,
        "product_id": 0,
        "quantity": "1.0",
        "style": null,
        "title": "Affichage de publicit\u00e9 d\u00e9cembre 2012",
        "total": "1458.27",
        "unit_price": "1458.27",
        "vat": "0.200"
      }
    ]
  }
]
{% endapi_block %}
