---
layout: default
nav_title: upload
title: Ajouter une pièce jointe
parent: Achats
nav_order: 600
---
{% assign request = site.data.urls.purchases.upload -%}
## {{ request.method }} {{ request.url }}

Ajouter une pièce jointe à l'achat ID.<br/>

## Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie `multipart/form-data`), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`

## Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local à l'achat possédant l'ID 1, avec le nom "achat_123.pdf"

{% api_block 'shell' %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=achat_123.pdf"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json
{% endapi_block %}

{% api_block 'json' %}
{
  "id": 1,
  "purchase_id": 1,
  "document_name":"achat_123.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download"
}
{% endapi_block %}
