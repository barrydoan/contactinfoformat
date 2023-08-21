sap.ui.define(["sap/ui/model/Filter", "sap/ui/model/FilterOperator"], function(Filter, FilterOperator) {
	"use strict";

	return {
		onReady: function(oEvent) {
            // remove strikethrough format
            var oSource = oEvent.getSource()
            // remove front-style button group
            oSource.removeButtonGroup("font-style");
            // add font-style button group without strike through
            oSource.addButtonGroup({
                name: "font-style",
                visible: true,
                priority: 5,
                customToolbarPriority: 20,
                buttons: [
                    "bold", "italic", "underline"
                ]
            });
		}
	};
});
