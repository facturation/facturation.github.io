---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un client'
parent: 'Clients'
nav_order: 500
---
{% assign request = site.data.urls.customers.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le client identifié par son ID, ainsi que tous les devis associés à ce client.
<strong>Un client ne peut être supprimé que s'il n'a jamais été facturé.</strong>

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
