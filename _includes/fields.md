
Certains champs peuvent avoir des [valeurs spécifiques](/values/)

| Champs | libellé | Type | Accès |
|:-------|:--------|:-----|:------|
{% for item in include.fields -%}
| {{ item.key }} | {{ item.title }}{% if item.help and item.help != '' %}<br/>{{item.help}}{% endif -%} | {{ item.type}} | {{ item.mode}} |
{% endfor -%}
