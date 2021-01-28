---
layout: default
title: 'Exemples'
parent: "Langage Liquid"
nav_order: 1000
---

Voici quelques exemples d'utilisation de Liquid pour vos contenus dynamiques.

## Contenu en plusieurs langues

Si vous souhaitez utiliser plusieurs langues pour les informations complémentaires globales de vos documents, vous pouvez utiliser le code suivant :

{% raw %}
```liquid
{% if bill.language == 'en' %}
Your satisfaction is our priority
{% else %}
Votre satisfaction est notre priorité
{% end %}
```
{% endraw %}

## RIB différent en fonction du client

Si vous pratiquez l'affacturage, ou bien que vous avez besoin de communication des informations de règlement différentes selon les clients, vous pouvez activer le système de champs clients personnalisés (dans la page Paramètres / Expert de votre compte), et utiliser l'un de ces champs pour détermine les informations à communiquer.

{% raw %}
```liquid
{% if customer.field1 == 'affacturage' %}
Voici le RIB à utiliser pour nous régler :
FR11 1234 1234 1234 1234 1234 123
{% elsif customer.field1 == 'cheque' %}
Veuillez nous régler uniquement par chèque à l'ordre de WORLD COMPANY
{% else %}
Vous pouvez nous régler par chèque ou par virement à l'aide du RIB suivant :
FR55 5678 5678 5678 5678 5678 789
{% end %}
```
{% endraw %}
