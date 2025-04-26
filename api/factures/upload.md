---
layout: default
nav_title: upload
title: Ajouter un fichier
parent: Factures
nav_order: 1100
---
{% assign request = site.data.urls.invoices.upload -%}
## {{ request.method }} {{ request.url }}

Ajoute une pièce jointe à la facture ID.

## Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie "multipart/form-data"), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`
* Si vous souhaitez rendre visible ce fichier au client, il suffit de l'indiquer en affectant la valeur 1 la variable `visible`

## Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local à la facture possédant l'ID 1, en le renommant en "justificatif.pdf" et en le rendant visible par le client

{% api_block 'shell' %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=justificatif.pdf&visible=1"
{% endapi_block %}

## Réponse

{% api_block 'plaintext' -%}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json
{% endapi_block %}

{% api_block 'json' -%}
{
  "id": 1,
  "invoice_id": 1,
  "document_name":"justificatif.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "visible": true
}
{% endapi_block %}
