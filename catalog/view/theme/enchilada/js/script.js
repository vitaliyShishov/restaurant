// preloader select table page
$('.select_table').css('height', $('.preloader_bg').height())



$('.select_table_next').on('click', function () {
    $('.preloader').animate({
        opacity: 0,
    }, 300)

    setTimeout(function() {
        $('.preloader').css('display', 'none')}, 300)


})




///
var cat_prod_width = $('.category_product').width();
$('.category_product').css('height', $('.category_product').width())
$(window).on('resize', function () {
    $('.category_product').css('height', $('.category.active .category_product').width())
    cat_prod_width = $('.category.active .category_product').width();
})



//



$('.header_field').on('click', function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        $(this).parent().find('.category_product').animate({
            height: 0
        })
    } else {
        $(this).addClass('active');
        $(this).parent().find('.category_product').animate({
            height: cat_prod_width
        })
    }
})







$('.tab_1, .tab_2, .tab_3').on('click', function () {
    if (!$(this).hasClass('active')) {
        var prev = $(this).parent().find('>.active');
        var tab_type = prev.attr('category');
        var category = $(this).parent().parent().find('.category');
        category.each(function () {
            if ($(this).attr('category') == tab_type) {
                $(this).css('display', 'none');
                $(this).removeClass('active')
            }
        })
        prev.removeClass('active');
        $(this).addClass('active');
        tab_type = $(this).attr('category');
        category.each(function () {
            if ($(this).attr('category') == tab_type) {
                $(this).css('display', 'block');
                $(this).addClass('active')
            }
        })
    }
})


var actual_product;

$('.cat_order').on('click', function () {
    close_product();
    actual_product = $(this).parent();
    actual_product.addClass('active');
    actual_product.find('.cat_calc').css('display', 'flex');
    if (actual_product.find('.cat_veg')) {
        actual_product.find('.cat_veg').attr('hidden', '')
    }
    actual_product.find('.cat_close').removeAttr('hidden');
    $(this).attr('hidden', '');
})



$('.cat_order').on('click', function () {
    if (actual_product.find('.cat_amount').text() < 1) {
        actual_product.find('.cat_amount').text('1');
    }
    /*создание объекта*/
})


var close_product = function () {
    if (actual_product) {
        actual_product.removeClass('active');
        actual_product.find('.cat_calc').css('display', 'none');
        if (actual_product.find('.cat_veg')) {
            actual_product.find('.cat_veg').removeAttr('hidden')
        }
        actual_product.find('.cat_order').removeAttr('hidden');
        actual_product.find('.cat_close').attr('hidden', '');
    }
}


$('.cat_close').on('click', function () {
    close_product();
})


/*$('.cat_order').on('click', function () {
    $(this).parent().addClass('active');
    $(this).parent().find('.cat_calc').css('display', 'flex');
    if ($(this).parent().find('.cat_veg')) {
        $(this).parent().find('.cat_veg').attr('hidden', '')
    }
    $(this).parent().find('.cat_close').removeAttr('hidden');
    $(this).attr('hidden', '');
    $(this).find('.cat_amount').text('1');
    /*создание объекта*/
/*})



$('.cat_close').on('click', function () {
    $(this).parent().removeClass('active');
    $(this).parent().find('.cat_calc').css('display', 'none');
    if ($(this).parent().find('.cat_veg')) {
        $(this).parent().find('.cat_veg').removeAttr('hidden')
    }
    $(this).parent().find('.cat_order').removeAttr('hidden');
    $(this).attr('hidden', '');
})*/

/* работа минус плюс в товаре */



$('.cat_minus').on('click', function () {
    var amount_block = $(this).parent().find('.cat_amount');

    var amount_num = amount_block.text();
    if (+amount_num > 0) {
        amount_block.text(+amount_num - 1)
    } else close_product();


})

$('.cat_plus').on('click', function () {
    var amount_block = $(this).parent().find('.cat_amount');
    var amount_num = amount_block.text();
    amount_block.text(+amount_num + 1)

})



/*при открытии корзины, если количество в объекте = 0, то объект не выводить*/









//$('.full_cart').css('height', $(window).height() - $('header').innerHeight())








$('.scroll_block').css('height', $(window).height() - ($(window).width() * 0.13 * 1.3))

$('.modal_trigger').on('click', function () {

    var full_list = $('.modal_single_product_ingr li').innerHeight() * $('.modal_single_product_ingr li:not(:empty)').length + parseInt($('.modal_single_product_ingr').css('padding-top'));

    var full_height = parseInt($('.modal_content.scroll_container').css('padding-top')) +
        $(".modal_single_product_title").innerHeight() +
        $(".modal_single_product_weight").innerHeight() + $('.scroll_container .empty').innerHeight() + full_list;

    console.log($(window).height())
    console.log($(".modal_single_product_title").innerHeight())
    var runner_height = 100 / full_height * $(window).height() + '%';

    $('.scroll_runner').css('height', runner_height);



})


$('.footer_cart').on('click', function () {
    $('.full_cart').animate({

        height: $(window).height() - $('header').innerHeight(),
    })

    $('.full_cart_products').css('height', $(window).height() - $('header').innerHeight() - $('.full_cart_header').innerHeight() - $('.full_cart_payment').innerHeight() - $('.full_cart_footer').innerHeight())





    productsTransfer(0);



})

$('.full_cart_close').on('click', function () {
    $('.full_cart').animate({

        height: 0,
    })
    $('.full_cart .full_cart_products .product').css('left', '-100%')



})



$('.full_cart_payment >div').on('click', function () {
    if (!$(this).hasClass('active')) {
        $(this).parent().find('.active').removeClass('active');
        $(this).addClass('active');

    }


})


function productsTransfer(n) {
    var prod = document.querySelectorAll('.full_cart .full_cart_products .product');
    setTimeout(function () {
        if (n < prod.length) {
            prod[n].style.left = "0";
            productsTransfer(n + 1);
        }
    }, 200)
}






$('.full_cart_products .cart_product_close').on('click', function () {
    $(this).parent().animate({
        opacity: 0,
        height: 0,
    })




})