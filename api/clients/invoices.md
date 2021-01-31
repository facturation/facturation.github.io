---
layout: default
title: factures
custom_title: Factures d'un client
grand_parent: Méthodes
parent: Clients
nav_order: 2000
---
{% assign request = site.data.urls.customers.invoices -%}
## {{ request.method }} {{ request.url }}

liste des factures du client ID, par groupe de {{ site.api.per_page }} résultats.

## Requête

{% api_block %}
  {% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

Cette fonction est un raccourci vers la liste des factures, liste restreinte aux factures du client ID.
La réponse est donc une redirection vers la requête à exécuter sur la <%= link_to("liste des factures", api_doc_url(id: 'factures')) %>.

{% api_block('json') %}
Status: 302 Redirected
Location: /firms/{FIRM_ID}/invoices.json?customer_id=180371
{% endapi_block %}