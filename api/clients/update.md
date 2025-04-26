---
layout: default
nav_title: modifier
title: Modifier un client
parent: Clients
nav_order: 400
---
{% assign request = site.data.urls.customers.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un client existant.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"company_name":"A big company","email":"boss@bigcompany.com"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
  Status: 200 OK
{% endapi_block %}
