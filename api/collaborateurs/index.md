---
layout: default
nav_title: 'Collaborateurs'
title: 'Liste des collaborateurs'
nav_order: 2000
---
{% assign request = site.data.urls.collaborators.find -%}
## {{ request.method }} {{ request.url }}

Liste des collaborateurs ayant accès au compte de la société. Cette méthode permet de récupérer la liste des ID des collaborateurs lorsque vous souhaitez attribuer une facture ou un devis à un collaborateur spécifique.

## Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') %}
[
  {
  "user_id":1,
  "email":"marc@test.com",
  "roles":["Comptable"],
  "full_name":"Marc Antoine"
  },
  {
  "user_id":2,
  "email":"pierre@test.com",
  "roles":["Clients","Devis","Factures"],
  "full_name":"Pierre Antoine"
  }
]
{% endapi_block %}
