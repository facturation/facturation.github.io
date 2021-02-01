---
layout: default
nav_title: 'télécharger'
title: 'Télécharger une facture'
parent: 'Factures'
nav_order: 600
---
{% assign request = site.data.urls.invoices.download -%}
## {{ request.method }} {{ request.url }}

Télécharger la facture n° ID au format PDF

### Remarques

Lorsqu'une facture est réglée, le système vous retourne par défaut la facture acquittée. Si vous souhaitez obtenir la facture originale (sans les informations de règlement), ajoutez le paramètre `original=1` à l'url.

## Requête

{% api_block %}
{% curl_cmd -%}
 -o facture.pdf "{{ request.url | api_url }}?original=1"
{% endapi_block %}

## Réponse

Vous obtenez le fichier PDF de la facture demandée
