---
layout: default
nav_title: modifier
title: Modifier un devis
parent: Devis
nav_order: 400
---
{% assign request = site.data.urls.quotes.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un devis existant.

Un devis doit toujours contenir au moins une ligne de facturation:
* Pour ajouter une ligne de facturation, l'id de l'item doit être vide.
* Pour modifier une ligne de facturation, l'id de l'item doit être spécifié.
* Pour supprimer une ligne de facturation, il suffit de passer l'id et un champ `_destroy` avec la valeur "1"

## Requête

{% api_block %}
{% curl_cmd(write: true) -%}
-X PATCH -d '{
"id": "ID",
"api_custom": null,
"api_id": null,
"customer_id": 1,
"title": "Creation internet",
"quote_status": "1",
"discount": "0.0",
"information": "TEST",
"pay_before": "30",
"penalty": "3.0",
"items": [{
"position": "1",
"product_id": "10",
"quantity": "1.0",
"title": "Campagne pub",
"unit_price": "300.0",
"nature": "2"
}, {
"id": "889",
"_destroy": "1"
}]
}'
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 200 OK
{% endapi_block %}
