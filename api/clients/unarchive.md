---
layout: default
nav_title: 'désarchiver'
title: 'Restaurer un client'
parent: 'Clients'
nav_order: 1050
---
{% assign request = site.data.urls.customers.unarchive -%}
## {{ request.method }} {{ request.url }}

Restaure le client archivé, identifié par son ID. Ce client peut à nouveau être facturé et redevient visible dans la liste des clients.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
-X POST "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
