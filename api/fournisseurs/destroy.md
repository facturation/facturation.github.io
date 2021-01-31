---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un fournisseur'
parent: 'Fournisseurs'
nav_order: 500
---
{% assign request = site.data.urls.suppliers.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le fournisseur identifié par son ID, **ainsi que tous les achats associés** à ce fournisseur.

### Remarque

Certains fournisseurs sont gérés automatiquement par l'application (RSI, URSSAF, Facturation.pro, ...) et ne peuvent pas être supprimé dès lors que des achats ont été enregistrés pour ce fournisseur. Ces fournisseurs sont créés (ou recréés en cas de suppression) par le système quand c'est nécessaire.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
