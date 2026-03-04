# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

{
    'name': 'Koala Systems Realtor Signs',
    'version': '1.0',
    'category': 'Inventory/Koala Systems Invoicing',
    'sequence': 15,
    'summary': 'Add extra functionalities to the Inventory app based on real state sign installation business.',
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

        'data/stock_picking_types.xml',
        'data/products.xml',

        # 'wizard/crm_lead_lost_views.xml',

        'views/stock_picking_views.xml',
        'views/stock_move_line_views.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install': False
}