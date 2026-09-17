---
layout: default
nav_title: 'facturer / solder'
title: 'Facturer / Solder un devis'
parent: 'Devis'
nav_order: 701
---
{% assign request = site.data.urls.quotes.invoice -%}
## {{ request.method }} {{ request.url }}

Si des acomptes ont été enregistrés pour le devis, ils seront pris en compte et cette méthode génère la facture de solde en tenant compte des acomptes déjà versés. Sinon l'intégralité du devis est facturé.

## Paramètres optionnels

- `invoiced_on` : date de la facture de solde (par défaut la date du jour)
- `purchase_number` : référence eventuelle du bon de commande à indiquer sur la facture de solde
- `api_id` : mémorisation d'un ID spécifique pour la facture de solde
- `api_custom` : mémorisation d'une information libre pour la facture de solde

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
 -X POST "{{ request.url | api_url }}?api_id=99&api_custom=fin_de_chantier"
{% endapi_block %}

### Réponse

{% api_block 'plaintext' %}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/INVOICE_ID.json
{% endapi_block %}

{% api_block 'json' %}
{
  "id": 14302656,
  "customer_id": 25185,
  "title": "Réparation toiture",
  "language": "fr",
  "category_id": 1,
  "followup_id": -1,
  "invoiced_on": "2026-09-17",
  "term_on": "2026-10-02",
  "draft": false,
  "balance_year": 2026,
  "total": "700.0",
  "total_with_vat": "840.0",
  "currency": "EUR",
  "rebate_percentage": "0.0",
  "exchange_rate": "1.0",
  "estimated_rate": false,
  "vat_exemption": null,
  "vat_country": "FR",
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
  "created_at": "2026-09-17T15:07:04.379+02:00",
  "updated_at": "2026-09-17T15:07:04.335+02:00",
  "items": [
    {
      "id": 36303848,
      "quantity": "1.0",
      "measure": null,
      "title": "Refection de votre toiture",
      "unit_price": "1000.0",
      "vat": "0.2",
      "product_id": null,
      "position": 1,
      "total": "1000.0",
      "optional": false,
      "style": null,
      "nature": 9,
      "sap_nature": null
    },
    {
      "id": 36303849,
      "quantity": "1.0",
      "measure": null,
      "title": "Acompte n°2026-61",
      "unit_price": "-300.0",
      "vat": "0.2",
      "product_id": null,
      "position": 2,
      "total": "-300.0",
      "optional": false,
      "style": null,
      "nature": 9,
      "sap_nature": null
    }
  ],
  "api_id": 99,
  "api_custom": "fin_de_chantier",
  "delivery_on": null,
  "quote_id": 14302654,
  "invoice_ref": "2026-62",
  "external_ref": null,
  "full_invoice_ref": "2026-62",
  "payment_mode": 0,
  "paid_on": null,
  "payment_ref": null,
  "paid_in_main_currency": null,
  "estimated_total_in_main_currency": 840,
  "refund_id": 0,
  "pay_url": null,
  "balance": "840.0",
  "external": false,
  "overdue_at": null,
  "recurring_invoice_id": null,
  "paid_in_euros": null,
  "estimated_total_euro_paid": 840,
  "settlements": [],
  "files": [],
}
{% endapi_block %}
