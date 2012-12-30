/**
* hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+
* <http://cherne.net/brian/resources/jquery.hoverIntent.html>
* 
* @param  f  onMouseOver function || An object with configuration options
* @param  g  onMouseOut function  || Nothing (use configuration options object)
* @author    Brian Cherne brian(at)cherne(dot)net
*/
/* hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+ // by Brian Cherne
* <http://cherne.net/brian/resources/jquery.hoverIntent.html> */
var j$ = jQuery.noConflict();

(function(j$){j$.fn.hoverIntent=function(f,g){var cfg={sensitivity:7,interval:100,timeout:0};cfg=j$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){j$(ob).unbind("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev])}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev])};var handleHover=function(e){var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t)}if(e.type=="mouseenter"){pX=ev.pageX;pY=ev.pageY;j$(ob).bind("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob)},cfg.interval)}}else{j$(ob).unbind("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob)},cfg.timeout)}}};return this.bind('mouseenter',handleHover).bind('mouseleave',handleHover)}})(jQuery);

function collapsePanel() {
    if (rightpanel) {
        rightpanel = false;
        j$('html').unbind('click');
        j$('#rightPanel').animate({width: '0px'}, 666,
		//j$('#rightpanelname').animate({width: '0px'}, 666,
            function() {
                j$('#rightPanel').toggleClass('expanded');
				//j$('#rightpanelname').toggleClass('expanded');
            }
        )
        j$('#rightPanel').click(expandPanel);
		//j$('#rightpanelname').click(expandPanel);
    }
};

function expandPanel() {
    if (! (rightpanel)) {
        rightpanel = true;
        j$('#rightPanel').unbind('click');
        j$('#rightPanel').toggleClass('expanded');
        j$('#rightPanel').animate({width: '550px'}, 666);
		
        //j$('#rightpanelname').unbind('click');
        //j$('#rightpanelname').toggleClass('expanded');
        //j$('#rightpanelname').animate({width: '550px'}, 666);		
       // j$('html').click(collapsePanel);
    }
    return false;
};

var rightpanel = false;

j$(document).ready(function() {
    /* expandPanel on click - good for mobile devices without mouse */
    j$('#rightPanel').click(expandPanel);
	j$('#rightpanelname').click(expandPanel);
    /* show+hide panel on mouse hover */
    j$('#rightPanel').hoverIntent({
        over: expandPanel,
        timeout: 700,
        out: collapsePanel
    });
    //j$('#rightpanelname').hoverIntent({
    //    over: expandPanel,
    //    timeout: 700,
    //   out: collapsePanel
    //});	
});
