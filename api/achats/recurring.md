---
layout: default
nav_title: achats récurrents
title: Gestion des achats récurrents
parent: Achats
nav_order: 700
---
Les achats récurrents sont gérés uniquement via l'interface web. Cependant, vous pouvez obtenir des informations sommaires sur la liste des achats récurrents configurés à l'aide des méthodes suivantes:

{% assign request = site.data.urls.purchases.recurring_list -%}
## {{ request.method }} {{ request.url }}

Obtenir la liste des achats récurrents

{% assign request = site.data.urls.purchases.recurring_show -%}
## {{ request.method }} {{ request.url }}

Obtenir des informations sur l'achat récurrent ID
