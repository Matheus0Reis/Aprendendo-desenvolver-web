/*80aafe1c6569180ef3ff2cc247da0e6d*/
if ($.browser.msie && parseFloat($.browser.version) < 8) {
    $(window).load(function () {
        $("div.top_bar").css("position", "fixed");
        $("div.top_shadow").css("position", "fixed");
        var view = $(window);
        view.bind("scroll resize", function () {
            $("div.top_bar").css("margin-top", (-1) * view.scrollTop() + "px");
            $("div.top_shadow").css("margin-top", (-1) * view.scrollTop() + "px")
        })
    })
} else if (navigator.platform != 'iPad' && navigator.platform != 'iPhone' && navigator.platform != 'iPod') $(window).load(function () {
    if (typeof (topmenuIsAlwaysVisible) != "undefined" && topmenuIsAlwaysVisible == true) {
        var view = $(window);
        if (typeof (userCSS) == "undefined" || !userCSS) view.bind("scroll resize", function () {
            $("div#topContainer").css("margin-left", (-1) * view.scrollLeft() + "px")
        })
    }
});
$(window).load(function () {
    var view = $(window);
    if (navigator.platform != 'iPad' && navigator.platform != 'iPhone' && navigator.platform != 'iPod') {
        $("#SkyScraperAd, #SkyScraperAdLeft").css("height", view.height() - 85 + "px");
        view.bind("scroll resize", function () {
            $("#SkyScraperAd, #SkyScraperAdLeft").css("height", view.height() - 85 + "px")
        })
    } else {
        var skyScraperAd = $("#SkyScraperAd");
        skyScraperAd.css("position", "absolute");
        skyScraperAd.css("height", view.height() - 85 + "px");
        skyScraperAd.css("top", Math.max(view.scrollTop() + 10, 60) + "px");
        var offset = $("#SkyScraperAdCell").offset();
        skyScraperAd.css("left", offset.left + "px");
        window.setTimeout("repositionAd()", 100)
    };
    var skyLeft = $("#SkyScraperAdLeft");
    skyLeft.css('margin-left', '-' + (skyLeft.width() - 5) + 'px')
})

function repositionAd() {
    var view = $(window),
        skyScraperAd = $("#SkyScraperAd");
    skyScraperAd.css("height", view.height() - 85 + "px");
    skyScraperAd.css("top", Math.max(view.scrollTop() + 10, 60) + "px");
    var offset = $("#SkyScraperAdCell").offset();
    skyScraperAd.css("left", offset.left + "px");
    window.setTimeout("repositionAd()", 100)
};
$(document).ready(function () {
    if (mobile_on_normal) {
        $("#footer").css("position", "static").css("margin-top", "10px");
        $("body").css("padding-bottom", 0)
    }
});
$(function () {
    $("#ds_body").swipe({
        fingers: 2,
        threshold: 600,
        allowPageScroll: 'auto',
        swipeLeft: function () {
            document.location.replace($('#village_switch_left').attr('href'))
        },
        swipeRight: function () {
            document.location.replace($('#village_switch_right').attr('href'))
        }
    })
})

function supportsFixed() {
    var testDiv = document.createElement("div");
    testDiv.id = "testingPositionFixed";
    testDiv.style.position = "fixed";
    testDiv.style.top = "0px";
    testDiv.style.right = "0px";
    document.body.appendChild(testDiv);
    var offset = 1,
        supported = false;
    if (typeof testDiv.offsetTop == "number") if (testDiv.offsetTop != null) if (testDiv.offsetTop != "undefined") offset = parseInt(testDiv.offsetTop);
    if (offset === 0) supported = true;
    document.body.removeChild(testDiv);
    return supported
}