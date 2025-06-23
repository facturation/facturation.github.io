---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un suivi commercial'
parent: 'Suivis commerciaux'
nav_order: 500
---
{% assign request = site.data.urls.followups.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le suivi commercial identifié par son ID. Cette opération ne supprime pas les documents rattachés à ce suivi.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
