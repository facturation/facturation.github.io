---
layout: default
nav_title: 'télécharger'
title: 'Télécharger un devis'
parent: 'Devis'
nav_order: 600
---
{% assign request = site.data.urls.quotes.download -%}
## {{ request.method }} {{ request.url }}

Télécharger le devis n° ID au format PDF.

## Requête

{% api_block %}
{% curl_cmd -%}
 -o devis.pdf "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

Vous obtenez le fichier PDF du devis demandé.
