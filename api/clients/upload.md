---
layout: default
nav_title: upload
title: Ajouter une fichier
parent: Clients
nav_order: 1100
---
{% assign request = site.data.urls.customers.upload -%}
## {{ request.method }} {{ request.url }}

Ajouter un fichier à la fiche client ID.<br/>

## Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie `multipart/form-data`), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`

## Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local, avec le nom "contrat_123.pdf"

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}filename=contrat_123.pdf"
{% endapi_block %}

## Réponse

{% api_block %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json

{
  "id": 1,
  "customer_id": 1,
  "document_name":"contrat_123.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download"
}
{% endapi_block %}
