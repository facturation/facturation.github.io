---
layout: default
title: 'Devis'
parent: "Langage Liquid"
nav_order: 200
---

Les informations spécifiques à un devis sont disponibles via l'objet `bill`.

| Attribut | Infos |
|----------|-------|
{% for item in site.data.quote -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}
{% endfor -%}
