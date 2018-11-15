var scroll_pos = 0;
var scroll_time;

$(window).scroll(function() {
    clearTimeout(scroll_time);
    var current_scroll = $(window).scrollTop();

    if (current_scroll >= $('#topNav').outerHeight()) {
        if (current_scroll <= scroll_pos) {
            $('.navbar-wagon').removeClass('hidden');
        }
        else {
            $('.navbar-wagon').addClass('hidden');
        }
    }

    scroll_time = setTimeout(function() {
        scroll_pos = $(window).scrollTop();
    }, 100);
});
