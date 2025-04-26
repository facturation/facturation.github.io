---
layout: default
nav_title: devis
title: Devis d'un client
parent: Clients
nav_order: 2000
---
{% assign request = site.data.urls.customers.quotes -%}
## {{ request.method }} {{ request.url }}

liste des devis du client ID, par groupe de {{ site.api.per_page }}résultats.

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

Cette fonction est un raccourci vers la liste des devis, liste restreinte aux devis du client ID.
La réponse est donc une redirection vers la requête à exécuter sur la liste des devis.

{% api_block 'plaintext' %}
Status: 302 Redirected
Location: /firms/{FIRM_ID}/quotes.json?customer_id=180371
{% endapi_block %}
