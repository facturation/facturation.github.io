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

## Email

Si vous activez l'envoi automatique des nouvelles factures (i.e. lorsque le paramètre `mailing` est à `1`), vous devez indiquer les informations relatives à l'email dans le champ ```email``` de la facture récurrente.

{% include fields.md fields=site.data.fields.email %}
