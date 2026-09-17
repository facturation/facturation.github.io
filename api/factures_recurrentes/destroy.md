---
layout: default
nav_title: 'supprimer'
title: 'Supprimer une facture récurrente'
parent: 'Factures récurrentes'
nav_order: 500
---
{% assign request = site.data.urls.recurring_invoices.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime la facture identifiée par son ID à condition que cette facture soit un brouillon.
Si la facture a été finalisée, elle ne sera pas supprimée et vous recevrez un message d'erreur.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
