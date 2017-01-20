$(document).ready(function () {
/* !!! --- Preloader begins */



/* !!! Showing/hiding preloader begins */


/**
 * скрытие прелоадера
 */


showFirstStage();

function showFirstStage() {
    hidePreloader();
    showMenu();
    setProductHeight();
    $('header').css('display', 'block')

}



function hidePreloader() {
    $('.preloader_main').animate({
        opacity: 0,
    }, 300)
    setTimeout(function () {
        $('.preloader_main').css('display', 'none')
    }, 300)
}

/*$('.select_table_next').on('touchstart click', function () {
    showMenu();
    hidePreloader();
    setProductHeight();
    $('header').css('display', 'block')
})*/




/* Showing/hiding and calc sizing in preloader ends !!! */


/* !!! Langs in preloader begins */
var lang_img, lang_text, lang_code;

function changeLang(obj) {
    lang_img = $(obj).find('img').attr('src');
    lang_text = $(obj).find('span').text();
    lang_code = $(obj).find('input').val();
    $('.lang_wrapper .lang').find('img').attr('src', lang_img);
    $('.lang_wrapper .lang span').text(lang_text);
    $('.lang_wrapper .lang input').val(lang_code);
}

function hidePreloaderLangs() {
    $('.pop_langs').css('opacity', '0');
    setTimeout(function () {
        $('.pop_langs').css('display', 'none')
    }, 500)
}

function showPreloaderLangs() {
    $('.pop_langs').css('display', 'block');
    setTimeout(function () {
        $('.pop_langs').css('opacity', '1')
    }, 500)
}


/**
 * открываем модальное окно языков в прелоадере
 * @param {[[Type]]} '.lang_wrapper .lang').on('click' [[Description]]
 * @param {[[Type]]} function (                        [[Description]]
 */
$('.lang_wrapper .lang').on('click', function () {
    showPreloaderLangs();
})


/**
 * скрываем модальное окно языков в прелоадере
 * @param {[[Type]]} '.internal_lang_wrapper .lang').on('click' [[Description]]
 * @param {[[Type]]} function (                                 [[Description]]
 */
$('.internal_lang_wrapper .lang').on('click', function () {
    changeLang(this);
    hidePreloaderLangs();
})

/* Langs in preloader ends !!! */



/* Preloader ends !!! --- */



/* !!! Menu begins */


function hideMenu() {
    setTimeout(function () {
        $('section.menu').css('display', 'none')
    }, 400)
}

function showMenu() {
    $('section.menu').css('display', 'block')
}




var cat_prod_width;



/**
 * при скрытии прелоадера размер элементов - блюд вычисляется и ставится
 */
function setProductHeight() {
    cat_prod_width = $('.category.active .category_product').width();
    $('.category_product').css('height', $('.category_product').width())
}

/*$(window).on('resize', function () {
    // при изменении размеров окна размер элементов - блюд пересчитывается
    $('.category_product').css('height', $('.category.active .category_product').width());
    cat_prod_width = $('.category.active .category_product').width()
});*/



$('.category_product').each(function () {
    if ($(this).parent().prev('.header_field').hasClass('active')) {
        $(this).css('height', $('.category_product').width());
    } else {
        $(this).css('height', 0);
    }
});


/**
 * переключение между табами меню
 * @param {[[Type]]} '.tab_1, .tab_2, .tab_3').on('click' [[Description]]
 * @param {[[Type]]} function (                           [[Description]]
 */
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


//сворачивание категории продуктов при нажатии на заголовок
$('.header_field').on('click', function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        $(this).next().find('.category_product').animate({
            height: 0
        })
    } else {
        $(this).addClass('active');
        $(this).next().find('.category_product').animate({
            height: cat_prod_width
        })
    }
})



//при нажатии кнопки "заказать" на продукте меняется отображение его 

var actual_product;

$('body').on('click','.cat_order', function () {
    close_product();
    actual_product = $(this).parent();
    actual_product.addClass('active');
    actual_product.find('.cat_calc').css('display', 'flex');
    if (actual_product.find('.cat_veg')) {
        actual_product.find('.cat_veg').attr('hidden', '')
    }
    actual_product.find('.cat_close').removeAttr('hidden');
    $(this).attr('hidden', '');
});

$('body').on('click', '.modal_single_product_order', function () {
    close_product();
    var element = $('.cat_order[data-product-id=' + $(this).attr('data-order-id')+ ']');
    actual_product = $(element).parent();
    actual_product.addClass('active');
    actual_product.find('.cat_calc').css('display', 'flex');
    if (actual_product.find('.cat_veg')) {
        actual_product.find('.cat_veg').attr('hidden', '')
    }
    actual_product.find('.cat_close').removeAttr('hidden');
    $(element).attr('hidden', '');
});

function close_product() {
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


$('body').on('click','.cat_close', function () {
    close_product();
});



// работа минус плюс в товаре 

$('body').on('click','.cat_minus', function () {
    var amount_block = $(this).parent().find('.cat_amount').text();
    if (+amount_block == 1) {
        close_product();
    }
});



/* Menu ends !!! */


/* ??? при открытии корзины, если количество в объекте = 0, то объект не выводить*/


//open cart
$('.footer_cart').on('click', function () {
    close_product();
    if (!header_state) {
        headerSlideDown();
        header_state = true;
    }

    $('.full_cart').animate({
        height: $(window).height() - $('header').innerHeight(),
    })
    $('.full_cart_products').css('height', $(window).height() - $('header').innerHeight() - $('.full_cart_header').innerHeight() - $('.full_cart_payment').innerHeight() - $('.full_cart_footer').innerHeight())
    productsTransfer(0);
    fixingFooterOnTop();
    hideMenu();
})



function fixingFooterOnTop() {
    setTimeout(function () {
        $('footer').css('top', -($('.footer_menu').innerHeight() - $('header').innerHeight()));
        $('footer').css('bottom', 'auto')
    }, 400)
}

function fixingFooterOnBottom() {
    $('footer').css('top', 'auto');
    $('footer').css('bottom', '0')
}


// choosing payment in cart
$('.full_cart_payment >div').on('click', function () {
    if (!$(this).hasClass('active')) {
        $(this).parent().find('.active').removeClass('active');
        $(this).addClass('active');
    }
})


// products smooth slide when cart is opening
function productsTransfer(n) {
    var prod = document.querySelectorAll('.full_cart .full_cart_products .product');
    setTimeout(function () {
        if (n < prod.length) {
            prod[n].style.left = "0";
            productsTransfer(n + 1);
        }
    }, 200)
}

// delete product from cart 
$('.full_cart_products .cart_product_close').on('click', function () {
    $(this).parent().parent().animate({
        opacity: 0,
        height: 0,
    })
})


// close cart
$('.full_cart_close').on('click', function () {
    fixingFooterOnBottom();
    $('.full_cart').animate({
        height: 0,
    })
    $('.full_cart .full_cart_products .product').css('left', '-100%');
    showMenu();

})


//textarea_fill 
$('.product_comment textarea').on('blur', function () {
    checkTextarea(this)
})

function checkTextarea(obj) {
    if ($(obj).attr('value') != 0) {
        $(obj).parent().find('img').css('display', 'block');
    } else {
        $(obj).removeAttr('value');
        $(obj).parent().find('img').css('display', 'none');
    }
}


/* Cart ends !!! */








/* !!! Single product modal window begins */



//set height on custom scrolling container
$('.scroll_block').css('height', $(window).height() - ($(window).width() * 0.13 * 1.3));



//set height on runner of custom scrolling container
$('.menu .modal_trigger').on('click', function () {
    var full_list = $('.modal_single_product_ingr li').innerHeight() * $('.modal_single_product_ingr li:not(:empty)').length + parseInt($('.modal_single_product_ingr').css('padding-top'));
    var full_height = parseInt($('.modal_content.scroll_container').css('padding-top')) +
        $(".modal_single_product_title").innerHeight() +
        $(".modal_single_product_weight").innerHeight() + $('.scroll_container .empty').innerHeight() + full_list;
    var runner_height = 100 / full_height * $(window).height() + '%';
    $('.scroll_runner').css('height', runner_height);
})


//show allergens modal window
$('.single_page_allergen').on('click', function () {
    $('.pop_allergens').css('display', 'block');
    setTimeout(function () {
        $('.pop_allergens').css('opacity', '1')
    }, 500)
})

//hide allergens modal window
$('.allerg_close').on('click', function () {
    $('.pop_allergens').css('opacity', '0');
    setTimeout(function () {
        $('.pop_allergens').css('display', 'none')
    }, 500)
})


/* Single product modal window ends !!! */





/* !!! Filters begins */

    /**
     *Перенесено в файл external_scripts.js
     */
    /* Set value of range in special field */

// $('.slider_price').parent().find('.total .total_num').text($('.slider_price').attr('value') + '.00');
// $('.slider_price').on('change', function () {
//     $(this).parent().find('.total .total_num').text($(this).attr('value') + '.00')
//     $(this).parent().find('.total .total_num').next().val($(this).attr('value'))
//     $(this).parent().find('.total .total_num').next().trigger('input');
// });
//
// $('.slider_kcal').parent().find('.total .total_num').text($('.slider_kcal').attr('value'));
// $('.slider_kcal').on('change', function () {
//     $(this).parent().find('.total .total_num').text($(this).attr('value'));
//     $(this).parent().find('.total .total_num').next().val($(this).attr('value'));
//     $(this).parent().find('.total .total_num').next().trigger('input');
// });



$('.filter_button').on('click', showFilter);

    $('.filters_close, .header_logo img, .filters_found').on('click', hideFilter);



function showFilter() {
    $('.filter_button').addClass('active');
    $('.filters').animate({
        height: $(window).innerHeight()
    });
    hideMenu();

}



function hideFilter() {
    showMenu();
    $('.filters').animate({
        height: 0
    }, 400);
    setTimeout(function () {
        $('.filter_button').removeClass('active');
    }, 400);
    $('body').removeClass('hidden')
}




$('.filter_button_ingr').on('click', function () {
    slideFilterTo('.filters_ingridients');
    $('.filters_ingridients').css('height', $('.filters_ingridients').innerHeight())

})

$('.filter_button_alerg').on('click', function () {
    slideFilterTo('.filters_allergens');
    $('.filters_allergens').css('height', $('.filters_allergens').innerHeight())
})


var filters_section_class;


/**
 * Slide ingridients and allergens to main screen
 */
function slideFilterTo(classname) {
    filters_section_class = classname;
    $(filters_section_class).css('left', '0');
    $('.filters_footer').css('left', '0');
}





$('.filters_footer_back').on('click', slideFilterFrom)

/**
 * Slide ingridients and allergens back
 */

function slideFilterFrom() {
    $(filters_section_class).css('left', '100%');
    $('.filters_footer').css('left', '100%');
}




$('.filters_title, .filters_toggle').on('click', function () {
    toggleList(this)
})

/**
 * Slide down and slide up list of ingridients and allergens
 * @param {[[Type]]} obj [[Description]]
 */

function toggleList(obj) {
    var li = $(obj).parent().find('li');
    if ($(obj).parent().find('ul').hasClass('active')) {
        $(obj).parent().find('ul').removeClass('active');
        $(obj).parent().find('ul').animate({
            height: 0,
        })
        $(obj).parent().find('.filters_toggle img').css('transform', 'rotate(180deg)');
    } else {
        $(obj).parent().find('ul').addClass('active');
        $(obj).parent().find('ul').animate({
            height: li.length * li.innerHeight(),
        });
        $(obj).parent().find('.filters_toggle img').css('transform', 'rotate(0deg)');
    }
}

    /**
     * Очистка активных фильтров при рэсете
     */
    $('.filters_reset').click(function() {
   $('.filters_category').each(function() {
      $(this).children('ul').find('div').removeClass('active');
       if(!$(this).children('ul').find('div').hasClass('filter_item_name')) {
           $(this).children('ul').find('div').animate({opacity: 0});
       }
   });

    $('.allergens_single_category').each(function() {
        $(this).children('div').removeClass('marker');
        $(this).children('div').find('.filter_delete').removeClass('active');
        $(this).children('ul').find('li').removeClass('marker');
        $(this).children('ul').find('.filter_delete').removeClass('active');
    });
});


$('.filters_allergens .filter_item_name').on('click', function () {
    toggleAllergens(this)
})


/**
 * Add and remove allergens
 * @param {[[Type]]} obj [[Description]]
 */
function toggleAllergens(obj) {
    if ($(obj).parent().find('.filter_delete').hasClass('active')) {
        $(obj).parent().find('.filter_delete').animate({
            opacity: 0
        })
        $(obj).parent().find('.filter_delete').removeClass('active')
    } else {
        $(obj).parent().find('.filter_delete').animate({
            opacity: 1
        })
        $(obj).parent().find('.filter_delete').addClass('active')
    }
}


/* Filters ends !!! */





/* !!! Sidebar begins */

$('.menu_button').on('click', function () {
    console.log('dsf');
    slideSidebarTo();
    console.log($('.sidebar_clickable_1 + p').innerHeight());
    calcSidebarParagraphsHeight();

    setHeightToParagraph(0);
    setDefaultImg();
    removeClassActiveFromLi()
})

function slideSidebarTo() {
    // $('.sidebar_wrapper').css('display', 'block');
    $('.sidebar_wrapper .shim').animate({
        opacity: 1
    });
    $('.sidebar_wrapper .sidebar').addClass('active');
}

$('.sidebar_wrapper .shim').on('click', slideSidebarFrom)

function slideSidebarFrom() {
    $('.sidebar_wrapper .sidebar').removeClass('active');
    $('.sidebar_wrapper .shim').animate({
        opacity: 0
    });
    $('body').removeClass('hidden');
    setTimeout(function () {
        // $('.sidebar_wrapper').css('display', 'none')
    }, 400)
}



/* Set parameters to default */

function setHeightToParagraph(height) {
    $('.sidebar ul li + p').css('height', height)
}


function setDefaultImg() { //put on sidebar open - work
    $('.sidebar ul li.active.sidebar_clickable_1 img').attr('src', $('.sidebar ul li.active.sidebar_clickable_1 img').attr('data-img'));
    $('.sidebar ul li.active.sidebar_clickable_2 img').attr('src', $('.sidebar ul li.active.sidebar_clickable_2 img').attr('data-img'));
}


function removeClassActiveFromLi() {
    if ($('.sidebar ul li.active')) {
        $('.sidebar ul li.active').removeClass('active')
    }
}


/*calc p height*/

var p_1_height, p_2_height;

function calcSidebarParagraphsHeight() {
    if (!p_1_height && !p_2_height) {
        p_1_height = $('.sidebar_clickable_1 + p').innerHeight();
        p_2_height = $('.sidebar_clickable_2 + p').innerHeight();
    }
}

/* Toggle li */


$('.sidebar_clickable_1, .sidebar_clickable_2').on('click', function () {
    toggleSidebarList(this)
})



function toggleSidebarList(obj) {
    if ($(obj).parent().find('.active')) {
        if ($(obj).hasClass('active')) {
            hideSidebarList();
            removeClassActiveFromLi();
            $(obj).find('img').attr('src', $(obj).find('img').attr('data-img'));
        } else {
            var img = $(obj).parent().find('.active img');
            img.attr('src', img.attr('data-img'));
            hideSidebarList();
            removeClassActiveFromLi();
            openLi(obj);
        }
    } else {
        openLi(obj);
    }
}


function openLi(obj) {
    $(obj).addClass('active');
    $(obj).find('img').attr('src', $(obj).find('img').attr('data-img-active'));
    showSidebarList(obj)
}

function showSidebarList(obj) { //put when li opening but after detele and add active
    if ($(obj).hasClass('sidebar_clickable_1'))
        $('.sidebar ul li.active + p').animate({
            height: p_1_height
        })
    else {
        $('.sidebar ul li.active + p').animate({
            height: p_2_height
        })
    }
}


function hideSidebarList() {
    $('.sidebar ul li.active + p').animate({
        height: 0
    })
}

/* Sidebar ends !!! */



/* !!! Header begins */

    var header_state = true,
        scroll_direction;

    $(window).on('scroll', function (e) {
        calcScrollDirection();
        if (window.pageYOffset > window.innerHeight / 2) {
            console.log(scroll_direction)
            if (scroll_direction == 'to bottom' && header_state) {
                headerSlideUp();
                header_state = false;
            } else if (scroll_direction == 'to top' && !header_state) {
                headerSlideDown();
                header_state = true;
            }
        }

    })

    var coord_1 = window.pageYOffset,
        coord_2 = 1;

    function calcScrollDirection() {
        coord_2 = window.pageYOffset;
        if ((coord_2 - coord_1 > 10)) {
            scroll_direction = 'to bottom';
            coord_1 = coord_2
        } else if ((coord_1 - coord_2 > 10)) {
            scroll_direction = 'to top';
            coord_1 = coord_2
        }
        /*else {
         console.log('something wrong' + ' ' + coord_2 + ' ' + coord_1)
         }*/
    }

    var header_full_height = $('.main_header').innerHeight() + $('.main_header .header_logo img').innerHeight() / 2;

    function headerSlideUp() {
        $('.main_header').animate({
            top: -header_full_height,
        })
    }


    function headerSlideDown() {
        $('.main_header').animate({
            top: 0,
        })
    }

/* Header ends !!! */



// /* !!! Range relativity begins */ Moved to external_script.js
//
// $('input.slider_price').each(function () {
//     setRightRange(this)
// });
// $('input.slider_kcal').each(function () {
//     setRightRange(this)
// });
//
// function setRightRange(obj) {
//     var value = +$(obj).attr('value');
//     var active_bar = $(obj).parent().find('.selected-bar');
//     var min_value = +active_bar.parent().parent().find('.scale span:first-of-type ins').text();
//     var max_value = +active_bar.parent().parent().find('.scale span:last-of-type ins').text();
//     var pointer = active_bar.parent().find('.pointer.high');
//     var length = max_value - min_value;
//     var offset = 98  + '%';
//     active_bar.width(offset);
//     pointer.css('left', offset)
// }


function addToCart(productId) {
    var quantity = 1;

    $.ajax({
        url: '/index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + productId + '&quantity=' + quantity,
        dataType: 'json',
        success: function (json) {
            if(json.success) {}
        }
    });
}

function quantityCart(productId, flag) {
    var quantity = (flag) ? 1 : -1;

    $.ajax({
        url: '/index.php?route=checkout/cart/edit',
        type: 'post',
        data: 'product_id=' + productId + '&quantity=' + quantity,
        dataType: 'json',
        success: function (json) {
            if(json.success) {
                $('.footer_price .price').html(json.total_cart);
            }
        }
    });
}

/* Range relativity ends !!! */

$(document).ready(function() {

    $('#continue_button').on('click', function() {
        var languageId = $('#language_id').val();

        var tableId;

        if ( typeof parseInt($('#table_id').val()) === 'number' && parseInt($('#table_id').val()) > 0) {
            $('.table-error').hide();
            tableId = $('#table_id').val();

            $.ajax({
                type: "POST",
                url: 'index.php?route=common/home/saveAndRedirect',
                data: {table_id: tableId, language_id: languageId},
                dataType: 'json',
                success: function (response) {
                    window.location.href = response.href;
                }
            });
        } else {
            $('.table-error').show();
        }
    });
});

});