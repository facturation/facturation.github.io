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
-X POST -d '{"vat": 0.2, "amount": "300","invoiced_on": "2026-09-17"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block 'plaintext' %}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/INVOICE_ID.json
{% endapi_block %}

{% api_block 'json' %}
{
  "id": 14302655,
  "customer_id": 25185,
  "title": "Réparation toiture",
  "language": "fr",
  "category_id": 1,
  "followup_id": -1,
  "invoiced_on": "2026-09-17",
  "term_on": "2026-10-02",
  "draft": false,
  "balance_year": 2026,
  "total": "300.0",
  "total_with_vat": "360.0",
  "currency": "EUR",
  "rebate_percentage": "0.0",
  "exchange_rate": "1.0",
  "estimated_rate": false,
  "vat_exemption": null,
  "vat_country": "IE",
  "tax_title": null,
  "tax_percent": null,
  "penalty": null,
  "pay_before": "15",
  "discount": null,
  "precompte": null,
  "activity_title": null,
  "service_personne": false,
  "accounting_entry": "706200",
  "information": null,
  "internal_note": null,
  "purchase_number": null,
  "created_at": "2026-09-17T15:06:54.711+02:00",
  "updated_at": "2026-09-17T15:06:54.684+02:00",
  "items": [
    {
      "id": 36303847,
      "quantity": "1.0",
      "measure": null,
      "title": "Acompte sur le devis n°1006",
      "unit_price": "300.0",
      "vat": "0.2",
      "product_id": null,
      "position": 0,
      "total": "300.0",
      "optional": false,
      "style": null,
      "nature": 9,
      "sap_nature": null
    }
  ],
  "api_id": null,
  "api_custom": null,
  "soft_deleted": false,
  "hard_delete_on": null,
  "delivery_on": null,
  "quote_id": 14302654,
  "invoice_ref": "2026-61",
  "external_ref": null,
  "full_invoice_ref": "2026-61",
  "payment_mode": 0,
  "paid_on": null,
  "payment_ref": null,
  "paid_in_main_currency": null,
  "estimated_total_in_main_currency": 360,
  "refund_id": 0,
  "pay_url": null,
  "balance": "360.0",
  "external": false,
  "overdue_at": null,
  "recurring_invoice_id": null,
  "paid_in_euros": null,
  "estimated_total_euro_paid": 360,
  "settlements": [],
  "files": []
}
{% endapi_block %}
