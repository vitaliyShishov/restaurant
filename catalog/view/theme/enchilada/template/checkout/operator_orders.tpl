<script defer src="catalog/view/theme/enchilada/js/script_admin.js"></script>
<section class="order">
    <div class="info">
        <div class="manage_info">
            <div class="general_info">
                <span class="table_num"><?php echo $last_order['table_id'] ?> <span><?php echo $text_table; ?></span></span>
                <br>
                <span class="order_id"><?php echo $last_order['order_id']; ?></span>
            </div>
            <div class="payment_info cash">
                <div class="price"><span><?php echo $total; ?></span>€</div>
                <div class="payment_status"><?php echo ($last_order['payment_method'] == 1 ?  $text_pay_cash : $text_pay_card); ?></div>
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
        <?php foreach ($products as $product) { ?>
        <div class="single_order">
            <span class="product_name"><?php echo $product['name']; ?></span>
            <div class="product_amount"><?php echo $product['quantity']; ?></div>
        </div>
        <?php } ?>
        <!-- Single product ends -->

    </div>

    </div>
    <div class="comment">
        <?php foreach($products as $product) { ?>
        <?php if (!empty($product['comment'])) { ?>
        <div class="text"><?php echo $text_appendix.$product['name'].": ".$product['comment'].";" ; ?></div>
        <?php } ?>
        <?php } ?>
        <div class="date"><?php echo $last_order['date_added']; ?></div>
    </div>

</section>