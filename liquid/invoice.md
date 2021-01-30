---
layout: default
title: 'Facture'
parent: "Langage Liquid"
nav_order: 100
---

Les informations spécifiques à une facture sont disponibles via l'objet `bill`.


| Attribut | Infos |
|:---------|:------|
{% for item in site.data.invoice -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}
{% endfor -%}
