---
layout: default
nav_title: détails
title: Détails d'une facture récurrente
parent: 'Factures récurrentes'
nav_order: 300
---
{% assign request = site.data.urls.recurring_invoices.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail de la facture récurrente n° ID.<br/>
Chaque facture est composée d'une ou plusieurs lignes de facturation (items)

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "id": 1,
  "customer_id": 1,
  "title": null,
  "language": "fr",
  "category_id": 1,
  "followup_id": -1,
  "invoiced_on": "2025-09-08",
  "term_on": null,
  "draft": true,
  "balance_year": null,
  "total": "500.0",
  "total_with_vat": "500.0",
  "currency": "EUR",
  "rebate_percentage": "0.0",
  "exchange_rate": null,
  "estimated_rate": false,
  "vat_exemption": "Autoliquidation art. 196 directive UE 2006/112/CE",
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
  "information": "",
  "internal_note": "",
  "purchase_number": "",
  "created_at": "2025-09-08T14:42:01.191+02:00",
  "updated_at": "2025-09-08T14:42:01.191+02:00",
  "api_id": null,
  "api_custom": null,
  "soft_deleted": false,
  "hard_delete_on": null,
  "mailing": false,
  "payment_mode": 3,
  "paid_on": null,
  "next_run_on": "2025-09-09",
  "last_run_on": "2025-08-09",
  "occurrence": null,
  "frequency": 30,
  "items": [
    {
      "id": 10000,
      "quantity": "1.0",
      "measure": null,
      "title": "Prestation %{mois}",
      "unit_price": "500.0",
      "vat": "0.0",
      "product_id": null,
      "position": 1,
      "total": "500.0",
      "optional": false,
      "style": null,
      "nature": 9,
      "sap_nature": null
    }
  ],
  "invoice_ids": [
    10,
    25
  ],
  "email": {
    "id": 222,
    "to": "laurent@test.com",
    "cc": null,
    "bcc": null,
    "subject": "Votre facture",
    "message": "Bonjour Laurent\r\n\r\nVeuillez trouver ci-joint la facture %{reference} à régler avant le %{echeance}.\r\nEn vous remerciant,\r\n\r\nCordialement,\r\nJohn\r\nTest Corp"
  }
}

{% endapi_block -%}