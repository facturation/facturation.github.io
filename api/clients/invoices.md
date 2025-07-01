---
layout: default
nav_title: factures
title: Factures d'un client
parent: Clients
nav_order: 2000
---
{% assign request = site.data.urls.customers.invoices -%}
## {{ request.method }} {{ request.url }}

liste des {{ site.api.per_page }} factures les plus récentes du client ID.

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

Cette fonction est un raccourci vers la liste des factures, liste restreinte aux factures du client ID.
La réponse est donc une redirection vers la requête à exécuter sur la liste des factures. Pour obtenir les résultats suivants et/ou filtrer ces résultats, vous devez appliquer les paramètres sur l'URL de redirection plutôt que sur l'url d'origine.

{% api_block 'plaintext' %}
Status: 302 Redirected
Location: /firms/{FIRM_ID}/invoices.json?customer_id=180371
{% endapi_block %}