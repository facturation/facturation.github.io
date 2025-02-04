**Libellé du champ :** `{{ include.field }}`

| Clé | libellé |
|:-----|:---------|
{% for item in include.entries -%}
| {{ item[1] }} | {{ item[0] }}|
{% endfor %}
