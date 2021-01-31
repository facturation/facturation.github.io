---
layout: default
title: 'lister'
custom_title: 'Liste des achats'
parent: 'Achats'
nav_order: 100
---
{% assign request = site.data.urls.purchases.find -%}
## {{ request.method }} {{ request.url }}

Liste des achats, par groupe de {{ site.api.per_page }} résultats.

## Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque achat, sauf les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir la liste des fichiers joints à un achat spécifique, il vous suffit de faire une requête sur l'achat concerné.

Vous avez la possibilité d'inclure la liste des fichiers joints de chaque achat retourné dans la réponse en utilisant le paramètre `with_details`:
* `with_details` :
  - 1 pour inclure la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure la liste des pièces jointes

## Paramètres optionnels

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom du fournisseur
* `title` : recherche partielle par libellé
* `invoice_ref`: recherche partielle sur le numéro de facture
* `payment_ref`: recherche partielle sur la référence de paiement
* `serial_number` : recherche exact sur le numéro de pièce
* `purchase_type` : recherche sur l'état du règlement. Les valeurs possibles sont:
  {% for item in site.data.specific.purchases_type_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
* `accounting_entry`: recherche sur le code d'imputation (abonnement Entreprise)

## Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:
* `period_start` : période de début
* `period_end` : période de fin
* `period_type` : si ce champ est vide, la recherche par période se fait sur les périodes d'encaissement. Pour faire une recherche par périodes de facturation, utiliser la valeur `billed`

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

## Tri

Par défaut, les achats sont triés par ordre décroissant de date d'achat.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - paid: tri par date de paiement
  - total: tri par montant total de l'achat
  - term: tri par date d'échéance
  - created: tri par date de création d'un achat (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un achat (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)


## Requête

{% api_block %}
  {% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
  [{
  "api_custom": null,
  "api_id": null,
  "category_id": 4852,
  "id": 125459,
  "supplier_id": 49087,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 20,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "H\u00e9bergement Cloud juin 2013",
  "total_with_vat": "231.4",
  "vat_amount": "37.92"
  }, {
  "api_custom": null,
  "api_id": null,
  "category_id": 4860,
  "id": 125474,
  "supplier_id": 49088,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 2,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "Domiciliation janvier 2013",
  "total_with_vat": "73.39",
  "vat_amount": "12.03"
  }]
{% endapi_block %}
