<div class="modal scroll_container_wrapper info_product"
     id="<?php echo $product['id']; ?>"
     hidden>

    <div class="modal_content">
        <div class="modal_background"><img src="<?php echo $product['image']; ?>" alt=""></div>
        <h2 class="modal_single_product_title"><?php echo $product['name']; ?></h2>

        <p class="modal_single_product_weight"><?php echo $text_weight . $product['weight']." ".($product['weight_class_id'] == 1 ?  $text_weight_class1 : $text_weight_class2); ?></p>

        <ul class="modal_single_product_ingr">
            <?php foreach ($ingredients as $item) { ?>
            <li>
                <?php echo $item['name']; ?>
                <br>
                    <?php if (!empty($item['allergen'])) { ?>

                        <div class="single_page_allergen">
                            <ul>
                        <?php foreach ($item['allergen'] as $allergen) { ?>
                                <li>
                                    <?php echo $allergen['name']; ?>
                                </li>
                        <?php } ?>
                                </ul>
                        </div>

                <?php } ?>
            </li>
            <?php } ?>
        </ul>
        <div class="empty" style="height: 15rem"></div>
    </div>

    <div class="modal_single_product_footer">
        <div class="modal_single_product_total"><?php echo $text_price . $product['price']; ?>€</div>
        <div class="modal_single_product_order" data-order-id="<?php echo $product['id']; ?>" onclick="addToCart('<?php echo $product['id']; ?>')">
            <?php echo $text_buy; ?>
        </div>
    </div>

    <div class="modal_close">&#x2716;
        <!-- can be inside prev block -->
    </div>

</div>

<div class="pop_allergens">
    <?php foreach ($allergen_list as $item) { ?>
        <h3 class="allergens_category"><?php echo $item['name']; ?></h3>
        <div class="allerg_description"><?php echo $item['description']; ?></div>
            <?php if($item['allergens']) { ?>
            <?php foreach ($item['allergens'] as $_item) { ?>
            <h5 class="allergens_subcategory"><?php echo $_item['name']; ?></h5>
            <div class="allerg_description"><?php echo $_item['description']; ?></div>
            <?php } ?>
        <?php } ?>
    <?php } ?>
    <div class="allerg_close">&#x2716;

    </div>
    </div>

</div>

<script>

    //Куски из script.js

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

   /*
   //set height on custom scrolling container //Вот эта хрень работает некорректно на данный момент (22.12.2016)
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
*/




function addToCart(productId) {
//    console.log(productId);
//    var quantity = 1;
//    $.ajax({
//        url: '/index.php?route=checkout/cart/add',
//        type: 'post',
//        data: 'product_id=' + productId + '&quantity=' + quantity,
//        dataType: 'json',
//        success: function (json) {
//            if(json.success) {
//            $('.footer_price .price').html(json.total_cart);
//            }
//        }
//    });
    $('#product_for_cart').val(productId);
    $('#product_for_cart').trigger('input');
}
</script>

