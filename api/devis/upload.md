---
layout: default
nav_title: upload
title: Ajouter une fichier
parent: Devis
nav_order: 1100
---
{% assign request = site.data.urls.quotes.upload -%}
## {{ request.method }} {{ request.url }}

Ajoute une pièce jointe au devis ID.

## Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie "multipart/form-data"), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`
* Si vous souhaitez rendre visible ce fichier au client, il suffit de l'indiquer en affectant la valeur 1 la variable `visible`

## Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local au devis possédant l'ID 1, en le renommant en "justificatif.pdf" et en le rendant visible par le client

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}filename=justificatif.pdf&visible=1"
{% endapi_block %}

## Réponse

{% api_block %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json

{
  "id": 1,
  "quote_id": 1,
  "document_name":"justificatif.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "visible": true
}
{% endapi_block %}

Ajoute une pièce jointe au devis ID.<br/>

### Paramètres

### Requête


### Réponse

<%= api_block(false) do %>

<% end %>
