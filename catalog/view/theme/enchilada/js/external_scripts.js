/* !!! Settings of external modules begins */


// настройки слайдера
$(document).ready(function () {
    $('.slider').slick({
        autoplay: true,
        dots: true,
        mobileFirst: true,
        swipeToSlide: true

    });


// бегунок в фильтрах

$('.slider_price').jRange({
    from: 1,
    to: 20,
    step: .1,
    scale: [1, 20],
    format: '%s',
    width: "100%",
    theme: "theme-red",
    showLabels: false,
    ondragend: function () {
        $('.slider_price').parent().find('.total .total_num').next().val($('.slider_price').jRange('getValue'))
        $('.slider_price').parent().find('.total .total_num').next().trigger('input');
    },
    onstatechange: function() {
        $('.slider_price').parent().find('.total .total_num').text($('.slider_price').jRange('getValue'));
    },
    onbarclicked: function() {
        $('.slider_price').parent().find('.total .total_num').next().val($('.slider_price').jRange('getValue'))
        $('.slider_price').parent().find('.total .total_num').next().trigger('input');
    }


});

$('.slider_kcal').jRange({
    from: 50,
    to: 1000,
    step: 50,
    scale: [50, 1000],
    format: '%s',
    width: "100%",
    theme: "theme-red",
    showLabels: false,
    ondragend: function () {
        $('.slider_kcal').parent().find('.total .total_num').next().val($('.slider_kcal').jRange('getValue'));
        $('.slider_kcal').parent().find('.total .total_num').next().trigger('input');
    },
    onstatechange: function() {
        $('.slider_kcal').parent().find('.total .total_num').text($('.slider_kcal').jRange('getValue'));
    },
    onbarclicked: function() {
        $('.slider_kcal').parent().find('.total .total_num').next().val($('.slider_kcal').jRange('getValue'));
        $('.slider_kcal').parent().find('.total .total_num').next().trigger('input');
    }

});

    /* !!! Range relativity begins */

    $('input.slider_price').each(function () {
        setRightRange(this)
    });
    $('input.slider_kcal').each(function () {
        setRightRange(this)
    });

    function setRightRange(obj) {
        var value = +$(obj).attr('value');
        var active_bar = $(obj).parent().find('.selected-bar');
        var min_value = +active_bar.parent().parent().find('.scale span:first-of-type ins').text();
        var max_value = +active_bar.parent().parent().find('.scale span:last-of-type ins').text();
        var pointer = active_bar.parent().find('.pointer.high');
        var length = max_value - min_value;
        var offset = 98  + '%';
        active_bar.width(offset);
        pointer.css('left', offset)
    }
});

/* Settings of external modules ends !!! */