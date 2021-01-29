---
layout: default
title: 'RIB multiples'
custom_title: 'Personnaliser un RIB par client ou facture'
grand_parent: "Langage Liquid"
parent: 'Exemples'
nav_order: 200
---

Si vous pratiquez l'affacturage, ou bien que vous avez besoin de communiquer des informations de règlement différentes selon les clients, vous pouvez activer le système de champs clients personnalisés (dans la page Paramètres / Expert de votre compte), et utiliser l'un de ces champs pour déterminer les informations à communiquer.

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
{% endif %}
```
{% endraw %}

Si vous avez besoin de déterminer cela au niveau de chaque facture et non par client, alors vous pouvez au choix affecter une catégorie ou un suivi commercial spécifique à chaque facture concernée et dans ce cas faire des tests sur l'id ou le libellé de la catégorie ou du suivi commercial.

{% raw %}
```liquid
{% if bill.followup == 'affacturage' %}
Voici le RIB à utiliser pour nous régler :
FR11 1234 1234 1234 1234 1234 123
{% elsif bill.category_id == 14289 %}
Veuillez nous régler uniquement par chèque à l'ordre de WORLD COMPANY
{% else %}
Vous pouvez nous régler par chèque ou par virement à l'aide du RIB suivant :
FR55 5678 5678 5678 5678 5678 789
{% endif %}
```
{% endraw %}
