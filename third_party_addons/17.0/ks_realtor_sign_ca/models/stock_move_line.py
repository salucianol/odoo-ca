# -*- coding: utf-8 -*-

from odoo import models, fields

class KsRealtorSignStockMoveLine(models.Model):
    _inherit = 'stock.move.line'

    installation_address = fields.Text(string='Installation Address')