---
layout: default
nav_title: 'champs'
title: 'Liste des champs'
parent: 'Devis'
nav_order: 10000
---

{% include fields.md fields=site.data.fields.quote %}


## Ligne de facturation

Les lignes de facturations sont transmises sous forme d'un tableau de lignes, dans le champ ```items``` du devis.

{% include fields.md fields=site.data.fields.item %}