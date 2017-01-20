;
(function () {
$(document).ready(function() {

    $('.filter_add, .filter_remove, .filter_item_name').on('click', function (e) {
        // var plus = $(this).parent().find('.filter_add');
        // var minus = $(this).parent().find('.filter_remove');
        // var local_plus = $(this).parent().find('.filter_add');
        // var local_minus = $(this).parent().find('.filter_remove');
        //
        // if (plus.hasClass('active')) {
        //     plus.animate({
        //         opacity: 0,
        //     })
        //     plus.removeClass('active');
        //
        //
        // } else if (e.target.classList.contains('filter_add')) {
        //     $(this).addClass('active');
        //     $(this).animate({
        //         opacity: 1,
        //     });
        //     if (local_minus.hasClass('active')) {
        //         local_minus.animate({
        //             opacity: 0,
        //         });
        //         local_minus.removeClass('active');
        //     }
        // } else if (minus.hasClass('active')) {
        //     minus.animate({
        //         opacity: 0,
        //     });
        //     minus.removeClass('active');
        //
        //
        // } else if (e.target.classList.contains('filter_remove')) {
        //     $(this).addClass('active');
        //     $(this).animate({
        //         opacity: 1,
        //     });
        //
        //     if (local_plus.hasClass('active')) {
        //         local_plus.animate({
        //             opacity: 0,
        //         });
        //         local_plus.removeClass('active');
        //     }
        // }

        /**
         * Не правильно работал код в случае, когда сначала выбрать "минус" в ингридиенте,
         * потом нажать на том же ингридиенте "плюс".
         * Красный цвет убирался с "минуса", но зеленый на "плюсе" не появлялся
         * Можешь исправить свой код и удалить мой.
         */
        if($(this).hasClass('active')) {
            $(this).removeClass('active');
            if(!$(this).hasClass('filter_item_name')) {
                $(this).animate({opacity: 0});
            }
        } else {
            $(this).addClass('active');

            if(!$(this).hasClass('filter_item_name')) {
                $(this).animate({opacity: 1});
            }

            $(this).siblings().removeClass('active');

            $(this).siblings().each(function() {
                if(!$(this).hasClass('filter_item_name')) {
                    $(this).animate({opacity: 0});
                }
            });
        }
    })
});
})();