---
layout: default
nav_title: 'RIB multiples'
title: 'Personnaliser un RIB par client ou facture'
grand_parent: 'Personnalisation des contenus'
parent: 'Exemples'
nav_order: 200
---

Si vous pratiquez l'affacturage, ou bien que vous avez besoin de communiquer des informations de règlement différentes selon les clients, vous pouvez activer le système de champs clients personnalisés dans votre compte (menu Paramètres / Expert). Ces champs personnalisés sont alors éditables dans chaque fiche client, et cela vous permet d'utiliser l'un de ces champs pour déterminer les informations à communiquer.

Il vous suffit alors d'utiliser un code similaire au code ci-dessous dans le texte d'informations complémentaires global (menu Paramètres / Facturation) :

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

Si vous avez besoin de déterminer cela au niveau de chaque facture et non par client, alors vous pouvez au choix affecter une catégorie ou un suivi commercial spécifique à chaque facture concernée et dans ce cas faire des tests sur l'id ou le libellé de la catégorie ou du suivi commercial. Le code à utiliser comme texte d'informations complémentaires (menu Paramètres / Facturation) sera alors similaire au code suivant :

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
