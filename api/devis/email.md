---
layout: default
nav_title: 'email'
title: 'Envoyer un devis par courriel'
parent: 'Devis'
nav_order: 800
---
{% assign request = site.data.urls.quotes.email -%}
## {{ request.method }} {{ request.url }}

Permet d'envoyer un devis par courriel.

* Si vous avez définit un modèle d'envoi, ce modèle est utilisé pour générer le mail. Vous pouvez modifier le contenu du mail en précisant son titre et son message.
* Le champ `to` est automatiquement rempli avec l'adresse email enregistrée dans la fiche du client si vous ne précisez rien.
* Les champs `cc` et `bcc` sont automatiquement remplis avec les adresses que vous avez renseignées dans la page Paramètres / Email de votre compte si vous ne précisez rien.

### Remarques

Cette fonctionnalité n'est accessible que si vous avez configuré votre propre serveur SMTP dans l'onglet "Paramètres" / "Email" de votre entreprise.

## Requête

{% api_block %}
{% curl_cmd write: true -%}
-d '{
"to": "machin@test.com",
"cc": "bidule@test.com",
"bcc": "boss@test.com",
"subject": "Votre devis",
"message": "Comme convenu, veuillez trouver ci-joint le devis pour nos travaux."
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
{% endapi_block %}
