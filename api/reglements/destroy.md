---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un règlement'
parent: 'Règlements'
nav_order: 500
---
{% assign request = site.data.urls.settlements.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le règlement identifié par son ID. A noter que la suppression de l'un des règlements d'une facture entièrement soldée remet automatiquement la facture dans l'état "non payée".

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
