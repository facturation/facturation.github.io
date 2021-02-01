---
layout: default
nav_title: 'supprimer'
title: 'Supprimer une facture'
parent: 'Factures'
nav_order: 500
---
{% assign request = site.data.urls.invoices.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime la facture identifiée par son ID à condition que cette facture soit un brouillon.
Si la facture a été finalisée, elle ne sera pas supprimée et vous recevrez un message d'erreur.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
