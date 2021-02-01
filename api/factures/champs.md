---
layout: default
nav_title: 'champs'
title: 'Liste des champs'
parent: 'Factures'
nav_order: 10000
---

{% include fields.md fields=site.data.fields.invoice %}

## Ligne de facturation
{% include fields.md fields=site.data.fields.item %}