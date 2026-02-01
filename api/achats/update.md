---
layout: default
nav_title: modifier
title: Modifier un achat
parent: Achats
nav_order: 400
---
{% assign request = site.data.urls.purchases.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'un achat existant.
Il n'est pas nécessaire de fournir tous les champs, vous pouvez inclure uniquement ceux que vous souhaitez modifier dans la requête. Les champs non inclus resteront inchangés.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title": "Serveur virtuel"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
