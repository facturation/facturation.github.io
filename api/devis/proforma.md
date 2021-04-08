---
layout: default
nav_title: 'proforma'
title: 'Télécharger une facture pro-forma'
parent: 'Devis'
nav_order: 600
---
{% assign request = site.data.urls.quotes.download -%}
## {{ request.method }} {{ request.url }}?proforma=1

Une facture proforma n'est rien d'autre qu'un devis pour lequel vous vous engagez à appliquer les prix indiqué dans ce devis. Cette methode vous permet donc de télécharger le devis n° ID sous forme de facture PDF proforma .

## Requête

{% api_block %}
{% curl_cmd -%}
 -o proforma.pdf "{{ request.url | api_url }}?proforma=1"
{% endapi_block %}

## Réponse

Vous obtenez le fichier PDF de la facture proforma demandée.