// --
// OTOBO is a web-based ticketing system for service organisations.
// --
// Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
// Copyright (C) 2019-2024 Rother OSS GmbH, https://otobo.io/
// --
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later version.
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
// --

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};

/**
 * @namespace ITSM.Agent.Zoom
 * @exports TargetNS as Core.ITSM.TicketZoom
 * @description
 *      This namespace contains the special module functions for ITSM.
 */
ITSM.Agent.Zoom = (function (TargetNS) {

    /**
     * @function
     * @param {String} ITSMTableHeight - The heigth of the table.
     * @description
     *      This function initializes the special module functions.
     */
    TargetNS.Init = function (ITSMTableHeight) {

        Core.UI.Resizable.Init($('#ITSMTableBody'), ITSMTableHeight, function (event, ui, Height) {

            // remember new height for next reload
            window.clearTimeout(TargetNS.ResizeTimeOutScroller);
            TargetNS.ResizeTimeOutScroller = window.setTimeout(function () {
                Core.Agent.PreferencesUpdate('UserConfigItemZoomTableHeight', Height);
            }, 1000);
        });
    };

    return TargetNS;
}(ITSM.Agent.Zoom || {}));
