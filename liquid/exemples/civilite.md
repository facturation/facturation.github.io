---
layout: default
nav_title: 'Civilités'
title: 'Varier le contenu en fonction de la civilité'
grand_parent: 'Personnalisation des contenus'
parent: 'Exemples'
nav_order: 100
---

Lorsque vous souhaitez faire varier votre contenu en fonction du titre de votre interlocuteur, vous pouvez utiliser la syntaxe suivante

{% raw %}
```liquid
{% if customer.civility == 'Monsieur' -%}
Cher %{civilite} %{nom},
{% elsif customer.civility == 'Madame' or customer.civility == 'Mademoiselle' -%}
Chère %{civilite} %{nom},
{% else customer.civility == 'Maître' -%}
Cher Maître %{nom},
{% else %}
Bonjour %{nom}
{% endif -%}
```
{% endraw %}