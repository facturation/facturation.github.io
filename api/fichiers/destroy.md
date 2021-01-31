---
layout: default
nav_title: 'supprimer'
title: 'Supprimer un fichier'
parent: 'Fichiers'
nav_order: 600
---
{% assign request = site.data.urls.files.destroy -%}
## {{ request.method }} {{ request.url }}

Supprime le fichier identifié par son ID.

## Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}
