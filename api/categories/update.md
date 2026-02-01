---
layout: default
nav_title: modifier
title: Modifier une catégorie
parent: Catégories
nav_order: 400
---
{% assign request = site.data.urls.categories.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'une catégorie existante. Il n’est pas nécessaire de fournir tous les champs, vous pouvez inclure uniquement ceux que vous souhaitez modifier dans la requête. Les champs non inclus resteront inchangés.

## Requête

{% api_block 'shell' %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Outil SEO","status":"2"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 200 OK
{% endapi_block %}
