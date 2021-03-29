---
layout: default
nav_title: 'email'
title: 'Envoyer une facture par courriel'
parent: 'Factures'
nav_order: 800
---
{% assign request = site.data.urls.invoices.email -%}
## {{ request.method }} {{ request.url }}

Permet d'envoyer une facture finalisée par courriel.

* Si vous avez définit un modèle d'envoi, ce modèle est utilisé pour générer le mail. Le système utilise le modèle "Factures" pour les factures non payées et non échues, le modèle "Relance" pour les factures non payées et échues, et enfin le modèle "Confirmation de règlement" pour les factures réglées.<br/>Vous pouvez modifier le contenu du mail en précisant son titre et son message.
* Le champ `to` est automatiquement rempli avec l'adresse email enregistrée dans la fiche du client si vous ne précisez rien.
* Les champs `cc` et `bcc` sont automatiquement remplis avec les adresses que vous avez renseignées dans la page Paramètres / Email de votre compte si vous ne précisez rien.


### Remarques

* Cette fonctionnalité n'est accessible que si vous avez configuré votre propre serveur SMTP dans l'onglet "Paramètres" / "Email" de votre entreprise.
* Seules les factures finalisées peuvent être envoyée par courriel: les brouillons ou les factures externes ne peuvent pas être transmise par courriel.

## Requête

{% api_block %}
{% curl_cmd write: true -%}
-d '{
"to": "machin@test.com",
"cc": "bidule@test.com",
"bcc": "boss@test.com",
"subject": "Votre facture",
"message": "Veuillez trouver ci-joint la facture pour nos travaux."
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
Status: 201 Created
{% endapi_block %}
