<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>

    <!--<link rel="stylesheet" href="catalog/view/theme/enchilada/stylesheets/jquery.custom-scrollbar.css">-->
    <link rel="stylesheet" href="catalog/view/theme/enchilada/stylesheets/style_admin.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!--<script defer src="catalog/view/theme/enchilada/js/jquery.custom-scrollbar.min.js"></script>-->
    <script defer src="catalog/view/theme/enchilada/js/script_admin.js"></script>
    <script defer src="catalog/view/theme/enchilada/js/clever_custom_scroll.js"></script>

</head>

<body>
<header>
    <div class="wrapper">
        <img src="catalog/view/theme/enchilada/images/logo.png" alt=" " class="logo">
        <h1 class="main_h"><?php echo $heading_title; ?></h1>
        <div class="user">
            <img src="<?php echo $image; ?>" style="width: 45px" alt=" " class="user_icon">
            <span class="user_name"><?php echo $lastname." ".$firstname; ?></span>
            <a href="index.php?route=checkout/operator_login&action=logout"><img src="catalog/view/theme/enchilada/images/icon_user_exit.png" alt=" " class="user_exit"></a>
        </div>
    </div>

</header>

<main>
    <div class="wrapper">

        <div class="content_header">
            <div class="tab tab_1 active" data-tab="tab_1"><?php echo $tab_active; ?></div>
            <div class="tab tab_2" data-tab="tab_2"><?php echo $tab_archive; ?></div>
            <div class="tab tab_3" data-tab="tab_3"><?php echo $tab_statistics; ?></div>

            <div class="orders_amount"><?php echo $text_active_orders; ?><span><?php echo count($orders); ?></span></div>

        </div>
        <div class="content" data-counter="<?php echo (int)$check_changes;?>">

            <!-- Tab 1 begins -->
            <div class="tab_1_content active" data-tab="tab_1" style="z-index: 10; position:relative">
                <div class="scroll_container">
                    <?php foreach($orders as $order) { ?>
                <!-- Single order begins -->
                <section class="order">
                        <div class="info">
                            <div class="manage_info">
                                <div class="general_info">
                                    <span class="table_num"><?php echo $order['table_id'] ?> <span><?php echo $text_table; ?></span></span>
                                    <br>
                                    <span class="order_id"><?php echo $order['order_id']; ?></span>
                                </div>
                                <div class="payment_info cash">
                                    <div class="price"><span><?php echo $order['total']; ?></span>€</div>
                                    <div class="payment_status"><?php echo ($order['payment_method'] == 1 ?  $text_pay_cash : $text_pay_card); ?></div>
                                </div>
                                <div class="close_order_button"><?php echo $text_close; ?></div>
                                <div class="time_info">
                                    <div>
                                        <div class="time">00:15:45</div>
                                        <br>
                                        <span class="time_comment"><?php echo $text_wait_time; ?></span>
                                    </div>

                                </div>

                            </div>
                            <div class="order_info">

                                <!-- Single product begins -->
                                    <?php foreach($order['products'] as $product){ ?>
                                <div class="single_order">
                                    <span class="product_name"><?php echo $product['name']; ?></span>
                                    <div class="product_amount"><?php echo $product['quantity']; ?></div>
                                </div>
                                    <?php } ?>
                                <!-- Single product ends -->

                            </div>

                        </div>
                        <div class="comment">
                            <?php foreach($order['products'] as $product) { ?>
                                <?php if (!empty($product['comment'])) { ?>
                                    <div class="text"><?php echo $text_appendix.$product['name'].": ".$product['comment'].";" ; ?></div>
                                <?php } ?>
                            <?php } ?>
                            <div class="date"><?php echo $order['date_added']; ?></div>
                        </div>

                </section>
                <!-- Single order ends -->
                    <?php } ?>
                </div>

                <div class="scroll_block">
                    <div class="scroll_runner"></div>

                </div>
            </div>

            <!-- Tab 1 ends -->

            <!-- Tab 2 begins -->

            <div class="tab_2_content" data-tab="tab_2">
                <div class="scroll_container">
                <!-- Single archive order begins -->
                <?php foreach ($archive_orders as $archive_order) { ?>
                    <section class="archive">
                        <div class="stat_info">
                            <div class="general_info">
                                <h3 class="order_id"><?php echo $text_order; ?><span><?php echo $archive_order['order_id'] ?></span>
                                </h3> <?php echo $text_table; ?>: <span><?php echo $archive_order['table_id']; ?>
                                </span><?php echo $text_price; ?><span><?php echo $archive_order['total']; ?>€</span>
                            </div>
                            <div class="time_info">
                                <p><?php echo $text_opened; ?><span><?php echo $archive_order['date_added']; ?></span></p>
                                <?php echo $text_closed ?><span><?php echo $archive_order['date_modified']; ?></span>
                            </div>
                        </div>
                        <div class="stat_order">
                            <h3 class="stat_header"><?php echo $text_contents; ?></h3>
                            <?php foreach($archive_order['products'] as $archive_product) { ?>
                                <?php echo $archive_product['name']; ?><span>(<?php echo $archive_product['quantity']; ?><?php echo $text_pieces; ?>)</span>,
                            <?php } ?>
                        </div>
                        <div class="stat_comment">
                            <?php foreach($archive_order['products'] as $archive_product) { ?>
                                <?php if (!empty($archive_product['comment'])) { ?>
                                <h3 class="stat_header"><?php echo $text_comment; ?></h3>
                                <?php echo $archive_product['comment']; ?>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </section>
                <?php } ?>
                    <!-- Single archive order ends -->
                </div>

                <div class="scroll_block">
                    <div class="scroll_runner"></div>

                </div>
            </div>

            <!-- Tab 2 ends -->

            <!-- Tab 3 begins -->

            <div class="tab_3_content" data-tab="tab_3">
                <div class="scroll_container">
                <div class="stat_wrapper">

                <?php foreach($table_orders as $table_order) { ?>
                    <!-- Single table begins -->
                    <section class="stat_table">
                        <div class="general_info"><span class="table_num"><?php echo $table_order['table_id']; ?>
                                <?php echo $text_table; ?></span>
                            <div class="proceeds"><?php echo $table_order['total_sum']; ?>€</div>
                        </div>
                        <div class="order_amount"><?php echo $table_order['total_orders']; ?> <?php echo $text_orders; ?></div>
                        <div class="time_borders">Last 12 hours</span>
                        </div>

                    </section>
                    <!-- Single table ends -->
                    <?php } ?>

                </div>

                </div>

                <div class="scroll_block">
                    <div class="scroll_runner"></div>

                </div>

            </div>
            <!-- Tab 3 ends -->

        </div>

    </div>
</main>

<script>


    $(document).ready(function () {

    /* AJAX запрос туда же в контроллер оператора (метод updateOnlineOrder), который вызовет в модели
     проверку на приход нового заказа*/
    function check(){

        $.ajax({
            type: 'POST',
            url: 'index.php?route=checkout/operator/updateOnlineOrders',
            dataType: 'json',
            data: {
                counter:$('.content').data('counter')
            },
            success: function( response ) {
                /* обновление счетчика */
                $('.content').data('counter',response.current);
                /* проверяем, приходят ли новые заказы с ответом */
                if (response.update == true) {
                    $(".orders_amount").load("index.php?route=checkout/operator .orders_amount");
                    //var res = JSON.parse(response);
                    $(".tab_1_content .scroll_container").prepend(response.order);
                    scrollInit();
                }
            }
        });
    }
    //проверка будет осуществляться каждые 10 секунд
    setInterval(function() { if
            (tab_index="tab_1") {
                check()}
            } , 10000);

    $('.tab').on('click', function() {
        if($(this).attr('data-tab') == 'tab_1') {
            check();
            tab_index = "tab_1";
            scrollInit();
        }
    })



        $(document).on("click", ".close_order_button", (function() {
            // Достаем айдишник заказа
            var prod_id = $(this).parent().find('.order_id').text();
            console.log(prod_id);

            //Аякс запросы нужно делать на контроллер, а не на модель.
            //route=..../..../.... - система ищет контроллер по запрашиваему пути.
            // см. system->engine->action.php, как конструктор класса "режет" route
            $.ajax({
                url: 'index.php?route=checkout/operator/updateOrder',
                type: 'post',
                data: {order_id: prod_id},
                success:  function(response) {
                    if(response.success) {
                        $(".orders_amount").load("index.php?route=checkout/operator .orders_amount");
                        $(".tab_2_content .scroll_container").load("index.php?route=checkout/operator .archive");
                    } else {
                        alert("Something went wrong ;(");
                    }
                }
            });
        }));
});
//        setInterval(function(){
//            $(".tab_1_content .overview").load("index.php?route=checkout/operator .order");
//        }, 5000);

    var orderIds;
    var activeProducts;
    var activePayments;

    //Далее идут Стасины функции перевода строки в массив, чтоб дописывать новые значения в конец :)
    //Это нужно, чтобы перезагрузки буфер памяти не обнулял старые значения

    function ids111() {
        if ( sessionStorage.getItem("orderIds") ) {
            orderIds = sessionStorage.getItem("orderIds").split(',')
        }
                else orderIds = []

    }
    ids111();

    function ids222() {
        if ( sessionStorage.getItem("activeProducts") ) {
            activeProducts = sessionStorage.getItem("activeProducts").split(',')
        }
        else activeProducts = []

    }
    ids222();

    function ids333() {
        if ( sessionStorage.getItem("activePayments") ) {
            activePayments = sessionStorage.getItem("activePayments").split(',')
        }
        else activePayments = []

    }
    ids333();


    var orderId = sessionStorage.getItem("orderIds");
    var activeProduct = sessionStorage.getItem("activeProducts");
    var activePayment = sessionStorage.getItem("activePayments");

    //console.log(orderId);



    $(function(){ // по клику на блюда или на оплату - записываем их содержимое

        $('.single_order').click(function()
        {
            var id = $(this).parent().parent().find('.order_id').text(); //определяем айдишник данного заказа

            orderIds.push($(this).parent().parent().find('.order_id').text());

            activeProducts.push($(this).find('.product_name').text()+id);
            //console.log(activeProducts);
            orderId = orderIds.join(',');
            sessionStorage.setItem("orderIds", orderId);
            //console.log(sessionStorage.getItem("orderIds")); //Тут все хорошо, приходят переменные
            sessionStorage.setItem("activeProducts", JSON.stringify(activeProducts));
            //console.log(sessionStorage.getItem("orderIds")); //Тут все хорошо, приходят переменные
        });

        $('.payment_info').click(function()
        {
            var id = $(this).parent().parent().find('.order_id').text();

            orderIds.push($(this).parent().parent().find('.order_id').text());

            console.log($(this).find('.price').text()+id);
            activePayments.push($(this).find('.price').text()+id);

            orderId = orderIds.join(',');
            sessionStorage.setItem("activePayments", JSON.stringify(activePayments));

            //console.log(sessionStorage.getItem("activePayments"));
        });
    });

    // var elements = document.querySelectorAll('.single_order');

//    orderId = sessionStorage.getItem("orderIds");
//    activeProduct = sessionStorage.getItem("activeProducts");
//    activePayment = sessionStorage.getItem("activePayments");
//    console.log(orderId);
//    console.log(activeProduct);
    if(orderId !== null) {
    $('.order').each(function() {
                var product = [];
                var payment = [];
                if (orderId.indexOf($(this).find('.order_id').text()) !== -1) {
                    //console.log($(this).find('.order_id').text());
                    $(this).find('.single_order .product_name').each(
                            function () {
                                var id = $(this).parent().parent().parent().find('.order_id').text();
                                product.push($(this).text()+id);
                                //console.log(product);
                            }
                    )

                    $(this).find('.payment_info').each(
                            function () {
                                var id = $(this).parent().parent().parent().find('.order_id').text();
                                payment.push($(this).find('.price').text()+id);
                                console.log(payment);
                            }
                    )

// console.log(product);
                    for (var i = 0; i < product.length; i++) {
                        if (activeProduct.indexOf(product[i]) !== -1) {
                           // console.log(product[i]);
//                            console.log($(this).find('.single_order'));

                            $(this).find('.single_order').each(
                                function(){
                                    //console.log(this);
                                    var id = $(this).parent().parent().find('.order_id').text();
                                    if($(this).find('.product_name').text()+id == product[i]) {
                                        $(this).addClass('active');
                                    }
                                }
                            )
                        }
                    }

                    for (var i = 0; i < payment.length; i++) {
                        if (activePayment.indexOf(payment[i]) !== -1) {
                           // console.log(product[i]);
//                            console.log($(this).find('.single_order'));

                            $(this).find('.payment_info').each(
                                function(){
                                    //console.log(this);
                                    var id = $(this).parent().parent().parent().find('.order_id').text();
                                    if($(this).find($('.payment_info').find('.price').text()+id == payment[i])) {
                                        $(this).addClass('done');
                                    }
                                }
                            )
                        }
                    }
                }
            }
        );
    }
</script>

</body>

</html>