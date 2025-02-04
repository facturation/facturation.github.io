---
layout: default
title: 'Facture'
parent: 'Personnalisation des contenus'
nav_order: 100
---

Les informations spécifiques à une facture sont disponibles via l'objet `bill`.


| Attribut | Infos |
|:---------|:------|
{% for item in site.data.invoice -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}|
{% endfor %}
