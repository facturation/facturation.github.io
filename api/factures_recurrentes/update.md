---
layout: default
nav_title: modifier
title: Modifier une facture récurrente
parent: 'Factures récurrentes'
nav_order: 400
---
{% assign request = site.data.urls.recurring_invoices.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour de la facture récurrente n° ID. Il n'est pas nécessaire de fournir tous les champs, vous pouvez inclure uniquement ceux que vous souhaitez modifier dans la requête. Les champs non inclus resteront inchangés.


## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Emplacement publicitaire premium", "information": "Vous bénéficiez désormais d'un emplacement premium pour votre publicité."}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' -%}
Status: 200 OK
{% endapi_block %}

Le corps de la réponse contient l'objet JSON mis à jour.
