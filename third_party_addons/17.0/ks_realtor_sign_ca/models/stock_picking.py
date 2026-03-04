# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import _, api, fields, models
import logging

_logger = logging.getLogger(__name__)

class KsRealtorSignStockMove(models.Model):
    _inherit = 'stock.picking'

    is_picking_type_realtor_sign_installation = \
        fields.Boolean(string='Is Picking Type Realtor Sign Installation',
                       store=True,
                       default=False)
    
    @api.onchange('picking_type_id')
    def _onchange_picking_type_id(self):
        realtor_sign_installation_picking_type_id = \
            self.env.ref('ks_realtor_sign_ca.picking_type_realtor_sign_installation')
        _logger.info('[KRSCA] Id: {} - Self Id: {}'.format(realtor_sign_installation_picking_type_id, 
                                       self.picking_type_id))
        if self.picking_type_id.id == realtor_sign_installation_picking_type_id.id:
            self.is_picking_type_realtor_sign_installation = True
        else:
            self.is_picking_type_realtor_sign_installation = False