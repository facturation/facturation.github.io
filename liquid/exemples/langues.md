---
layout: default
nav_title: 'Plusieurs langues'
title: 'Contenus en plusieurs langues'
grand_parent: 'Personnalisation des contenus'
parent: 'Exemples'
nav_order: 100
---

Si vous souhaitez utiliser plusieurs langues pour les informations complémentaires globales de vos documents, vous pouvez utiliser le code suivant :

{% raw %}
```liquid
{% case bill.language %}
{% when 'en' %}
Your satisfaction is our priority
{% when 'es %}
Su satisfacción es nuestra prioridad
{% else %}
Votre satisfaction est notre priorité
{% endcase %}
```
{% endraw %}
