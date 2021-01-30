---
layout: default
title: 'Dates'
parent: "Langage Liquid"
nav_order: 500
---

Notre outil vous propose différentes périodes qui sont calculées par rapport à la date de facturation (ou de génération dans le cas d'une facture récurrente ou d'un achat récurrent), via l'objet `period`.

| Attribut | Infos | Exemple |
|:---------|:------|:--------|
{% for item in site.data.dates -%}
| \{\{ period.{{ item.key }} \}\} | {{ item.title }} | {{ item.example }}
{% endfor -%}