---
layout: default
nav_title: 'champs'
title: 'Liste des champs'
parent: 'Factures récurrentes'
nav_order: 10000
---

{% include fields.md fields=site.data.fields.recurring_invoice %}

## Ligne de facturation

Les lignes de facturations sont transmises sous forme d'un tableau de lignes, dans le champ ```items``` de la facture récurrente

{% include fields.md fields=site.data.fields.item %}