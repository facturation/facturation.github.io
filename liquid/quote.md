---
layout: default
title: 'Devis'
parent: 'Personnalisation des contenus'
nav_order: 200
---

Les informations spécifiques à un devis sont disponibles via l'objet `bill`.

| Attribut | Infos |
|:---------|:------|
{% for item in site.data.quote -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}
{% endfor -%}
