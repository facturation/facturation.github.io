---
layout: default
nav_title: infos
title: Compte utilisateur
parent: 'Compte'
nav_order: 100
---
{% assign request = site.data.urls.account.show -%}
## {{ request.method }} {{ request.url }}

Affiche les informations sur le compte de l'utilisateur.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "id": 1,
  "email": "moi@google.com",
  "firms": [
    {
      "id": 1,
      "name": "Ma petite entreprise"
    },
    {
      "id": 2,
      "name": "Ma grosse entreprise"
    }
  ]
}
{% endapi_block %}
