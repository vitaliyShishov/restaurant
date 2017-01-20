$(document).ready(function () {

    $('.allergens_category_block').on('click', function () {
        var full_block = $(this).parent().parent();
        if ($(this).hasClass('marker')) {
            $(this).removeClass('marker');
            $(this).find('.filter_delete').removeClass('active');
            full_block.find('.allergens_category_title').removeClass('marker').find('.filter_delete').removeClass('active');

        } else {
            $(this).addClass('marker');
            $(this).find('.filter_delete').addClass('active');
            if (full_block.find('.active').length == full_block.find('li').length) {
                full_block.find('.allergens_category_title').addClass('marker').find('.filter_delete').addClass('active');
            }
        }

    });

    $('.allergens_category_title').on('click', function () {


        if ($(this).hasClass('marker')) {
            $(this).removeClass('marker');
            $(this).find('.filter_delete').removeClass('active');
            $(this).parent().find('.allergens_category_block').each(function () {
                $(this).removeClass('marker');
                $(this).find('.filter_delete').removeClass('active')
            })

        } else {
            $(this).addClass('marker');
            $(this).find('.filter_delete').addClass('active');
            $(this).parent().find('.allergens_category_block').each(function () {
                $(this).addClass('marker');
                $(this).find('.filter_delete').addClass('active')
            })
        }


    });

    $('.allergens_single').on('click', function () {
        if ($(this).hasClass('marker')) {
            $(this).removeClass('marker');
            $(this).find('.filter_delete').removeClass('active');

        } else {
            $(this).addClass('marker');
            $(this).find('.filter_delete').addClass('active')
        }


    });
});
