# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

{
    'name': 'Koala Systems Invoicing',
    'version': '1.2',
    'category': 'Accounting/Koala Systems Invoicing',
    'sequence': 15,
    'summary': 'Add extra functionalities to the Invoicing app based on Canad rules.',
    'description': "",
    'website': 'https://koala.systems/',
    'depends': [
        'account',
        'sale_management',
        'purchase',
    ],
    'data': [
        # 'security/crm_security.xml',
        # 'security/ir.model.access.csv',

        # 'data/crm_lead_prediction_data.xml',

        # 'wizard/crm_lead_lost_views.xml',

        'views/external_layout_standard.xml',
        'views/external_layout_bold.xml',
        'views/report_invoice.xml',
        'views/sale_order_views.xml',
        'views/report_payment_receipt_template.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install': False
}