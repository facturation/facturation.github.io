---
layout: default
nav_title: 'lister'
title: 'Liste des clients'
parent: 'Clients'
nav_order: 100
---
{% assign request = site.data.urls['customers']['find'] -%}
## {{ request.method }} {{ request.url }}

Affiche la liste des clients, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels :

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom de société
* `last_name` : recherche partielle sur le nom de famille
* `email` : recherche partielle sur l'email
* `category_id` : recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les clients sans catégorie)
* `with_sepa` : par défaut, les données SEPA ne sont pas exportées. Seule la clé API de l'administrateur de la société permet d'exporter les données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1.
* `account_code`: recherche sur une partie du code du compte client (abonnement Entreprise)
* `accounting_entry`: recherche sur le code d'imputation par défaut (abonnement Entreprise)
* `mode` : en l'absence de précision, le système retourne uniquement les clients actifs. Vous pouvez utiliser les valeurs suivantes pour retourner différents groupes de clients:
    - `all` : retourne tous les clients (actifs ou archivés)
    - `company` : retourne uniquement les professionnels actifs
    - `individual` : retourne uniquement les particuliers actifs
    - `archived` : retourne uniquement les clients archivés

### Tri

Par défaut, les clients sont triés par ordre croissant de nom mnémotechnique.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
    - `asc` : tri croissant
    - `desc` : tri décroissant
* `order` : type de tri
    - `last_invoice` : tri par date de dernière facture au client
    - `last_paid` : tri par date de dernier paiement du client
    - `created` : tri par date de création
    - `updated` : tri par date de dernière modification


## Requête

{% api_block %}
  {% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
[{
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
  "id": 180371,
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
}, {
  "account_code": "411SPOTIFY",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "city": "Paris",
  "civility": null,
  "company_name": "spotify",
  "country": "FR",
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 180369,
  "individual": false,
  "language": null,
  "last_invoiced_on": "2013-02-28",
  "last_name": "",
  "mobile": "",
  "pay_before": "30",
  "penalty": null,
  "phone": "",
  "short_name": "spotify",
  "siret": null,
  "street": "11 bis rue christophe colomb",
  "validity": null,
  "vat_exemption": null,
  "vat_number": "",
  "website": null,
  "zip_code": "75008"
}]
{% endapi_block %}
