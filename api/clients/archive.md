---
layout: default
nav_title: 'archiver'
title: 'Archiver un client'
parent: 'Clients'
nav_order: 1000
---
{% assign request = site.data.urls.customers.archive -%}
## {{ request.method }} {{ request.url }}

Archive le client identifié par son ID, ce qui permet de le masquer de la liste des clients.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
-X POST "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}