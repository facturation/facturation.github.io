---
layout: default
nav_title: modifier
title: Modifier une facture
parent: Factures
nav_order: 400
---
{% assign request = site.data.urls.invoices.update -%}
## {{ request.method }} {{ request.url }}

Mise à jour d'une facture. Lorsque la facture est un brouillon, l'ensemble des données est modifiable, par contre, une fois la facture finalisée, tout ce qui influe sur le montant de la facturation ne peut plus être modifié. Pour annuler une facture, vous devez faire un avoir.

La mise à jour d'une facture sert essentiellement à enregistrer le règlement de la facture lorsque le règlement est différé, ou bien à mettre à jour le champ d'informations et les conditions de règlement.

## Paramètres

* `type_doc` : par défaut une facture reste dans son état (brouillon ou finalisée) lors de sa mise à jour. Si vous souhaitez changer le status d'une facture brouillon, utilisez la valeur `final` pour finaliser la facture, ou bien `draft` pour rester en mode brouillon. Une facture finalisée ne peut pas changer de status.

### Remarques

Pour enregistrer différents modes de règlement sur une facture, utilisez le mécanisme des [règlements multiples](/api/reglements). Veuillez noter que le système de règlement multiple est uniquement prévu pour enregistrer les différents modes de règlement d'une facture, il ne s'agit pas d'un système de gestion des paiements en plusieurs fois. Pour un paiement en plusieurs fois, les méthodes légales sont de facturer vos prestations sous forme de X factures d'acompte et d'une facture de solde, ou bien de passer par un organisme de crédit pour mettre en place des solutions de crédit gratuit ou payant pour vos clients.

## Requête

Dans l'exemple ci dessous, on enregistre le règlement de la facture par Paypal le 6 juin 2020

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"paid_on":"2020-04-06","payment_mode":1}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 200 OK
{% endapi_block %}
