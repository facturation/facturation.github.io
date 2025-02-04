---
layout: default
title: 'Client'
parent: 'Personnalisation des contenus'
nav_order: 300
---

Les informations spécifiques à un client sont disponibles via l'objet `customer`.
Cet objet n'est disponible que dans un contexte où vous manipulez un devis ou une facture.


| Attribut | Infos |
|:---------|:------|
{% for item in site.data.customer -%}
| \{\{ customer.{{ item.key }} \}\} | {{ item.title }}|
{% endfor %}