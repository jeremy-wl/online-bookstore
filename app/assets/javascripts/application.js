jQuery.expr[':'].Contains = function(a, i, m) {
    return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};

jQuery.expr[':'].contains = function(a, i, m) {
    return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
var toggleActiveClass = function() {
    $(".columns li:not('#sum')").hover(function() {
        $(this).toggleClass("active");
    });
};
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require jquery-ui/effect-blind
//= require bootstrap
//= require_tree .

// This toggles the active class in the header

//var toggleCartOnMouseEvents = function() {
//    $("[data-toggle=popover]").hover(function() {
//        $(this).popover('show');
//    });
//};

$(function() {
    // $(".navbar-default .navbar-nav > li>a:contains('My Cart')")
    toggleActiveClass();
    //toggleCartOnMouseEvents();
    $('#welcomeModal').modal('show'); // popup the welcome modal on page load
    $('h2').delay(3000).fadeOut('slow'); // fade it out after 3 sec
    //.modal('hide').delay(8000);
})

/* This disables the my cart link in the cart view. */
$(function() {
    if (document.URL.match(/\/carts\//)) {
        var $a_tag = $("li>a:contains(My cart)");
        $a_tag.attr("href", "#");
        $a_tag.parent().removeAttr("data-toggle");
    }
});
