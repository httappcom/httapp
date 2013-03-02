
//config map:
//  displayUp: true = bottom of overlay is even with top of anchor (displayed up), 
//                    otherwise top of overlay is even with top of anchor (displayed down)
//
//  manualClose: true = user must click close button on overlay to close it
//                      otherwise mouseout event closes overlay window
function initHoverPopups(parent, config, selector) {
	if (selector == null) selector = "a[rel]";
	if (config == null) config = {};
    jQuery(selector).overlay({
        fixed:false,
        onBeforeLoad: function() {
            var overlayConfig = this.getConf();
            var overlay = this.getOverlay();
            var trigger = this.getTrigger();
            var hoverObjOffset = trigger.offset();
            var hoverObjWidth = trigger.outerWidth();
            screenHeight = jQuery(window).height();
            screenWidth = jQuery(window).width();
            var docViewTop = jQuery(window).scrollTop();
            var docViewLeft = jQuery(window).scrollLeft();
            var docViewBottom = docViewTop + screenHeight;
            var docViewRight = docViewLeft + screenWidth;
            var overlayTop = hoverObjOffset.top;
            if (config.displayUp) {
            	overlayTop -= (overlay.outerHeight() - trigger.outerHeight());
            }
            var overlayLeft = hoverObjOffset.left+hoverObjWidth;
            var overlayRight = overlayLeft+overlay.outerWidth();
            var overlayBottom = overlayTop + overlay.outerHeight();
            if (overlayBottom > docViewBottom) {
                overlayTop -= (overlayBottom-docViewBottom);
            } else if (overlayTop < docViewTop) {
            	overlayTop = docViewTop;
            }
            if (overlayRight > docViewRight) {
                overlayLeft = hoverObjOffset.left-overlay.outerWidth();
            }
            overlayTop -= docViewTop;
            overlayConfig.top = overlayTop;//(overlayTop - overlay.parent().offset().top) - 20;
            overlayLeft -= docViewLeft;
            overlayConfig.left = overlayLeft; // - overlay.parent().offset().left;
            if (overlayConfig.left < 0) overlayConfig.left = 0;
        }
    });
    jQuery(selector).hover(function(e) {
    		jQuery(this).data('wasClicked', false);
        	jQuery(this).overlay().load();
        }, (config!=null && config.manualClose)?null:function () {
        	if (!jQuery(this).data('wasClicked')) {
        		jQuery(this).overlay().close();
        	}
        }
    );
    jQuery(selector).click(function(e) {
    	jQuery(this).data('wasClicked', true);
    	jQuery(this).overlay().load();
    }
);
}
