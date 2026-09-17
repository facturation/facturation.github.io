---
layout: default
nav_title: 'acompte'
title: 'Etablir un acompte sur un devis'
parent: 'Devis'
nav_order: 700
---
{% assign request = site.data.urls.quotes.partial_invoice -%}
## {{ request.method }} {{ request.url }}

Factuation d'un acompte sur le devis ID.

## Paramètres obligatoires

- `amount` : montant HT de l'acompte
- `vat` : taux de TVA appliqué à l'acompte si c'est un devis avec TVA
- `nature` : nature de la prestation si c'est un devis émis par un micro-entrepreneur.

Vous devez obligatoirement fournir soit le taux de TVA, soit la nature de la prestation (selon le type d'entreprise que vous gérez). Le montant de l'acompte doit être strictement inférieur au montant total restant à facturer pour ce taux de TVA ou cette nature de prestation.

Notre outil ne propose pas de faire d'acomptes avec plusieurs taux de TVA ou plusieurs natures de prestation. Il faut si besoin faire un acompte distinct pour chaque taux de TVA ou chaque nature de prestation.

## Paramètres optionnels

- `invoiced_on` : date de la facture d'acompte (par défaut la date du jour)
- `purchase_number` : référence eventuelle du bon de commande à indiquer sur la facture d'acompte
- `api_id` : mémorisation d'un ID spécifique pour l'acompte
- `api_custom` : mémorisation d'une information libre pour l'acompte


## Requête

{% api_block 'shell' %}
{% curl_cmd write: true-%}
-X POST -d '{"vat": 0.2, "amount": "100","invoiced_on": "2026-06-06"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block 'plaintext' %}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/INVOICE_ID.json
{% endapi_block %}

{% api_block 'json' %}
{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 411584,
  "information": null,
  "invoice_ref": "201307-4",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": null,
  "pay_before": "60fm",
  "payment_mode": 0,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "vat_exemption": null,
  "items": [
    {
      "id": 949167,
      "nature": 9,
      "optional": false,
      "position": 1,
      "product_id": null,
      "quantity": "1.0",
      "style": null,
      "title": "Affichage pub 1",
      "total": "500.0",
      "unit_price": "500.0",
      "vat": "0.200"
    },
    {
      "id": 949168,
      "nature": 9,
      "optional": false,
      "position": 2,
      "product_id": null,
      "quantity": "1.0",
      "style": null,
      "title": "Affichage pub 2",
      "total": "200.0",
      "unit_price": "200.0",
      "vat": "0.200"
    }
  ]
}
{% endapi_block %}
