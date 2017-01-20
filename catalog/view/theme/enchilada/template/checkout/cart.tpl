<!-- cart begins -->
<div class="full_cart"
     ng-init="cartController.init(<?php echo $products; ?>, <?php echo $total_cart; ?>)">
    <div class="full_cart_header">
        <div class="full_cart_title">
            <img src="catalog/view/theme/enchilada/images/footer_icon_3.png" alt=" ">
            <?php echo $text_just_cart; ?>
        </div>
        <div class="full_cart_close"><?php echo $button_hide; ?></div>
    </div>
    <div class="full_cart_payment">
        <div class="payment_cash active" ng-click="cartController.changeMethod('1');"><?php echo $button_pay_cash; ?></div>
        <div class="payment_card" ng-click="cartController.changeMethod('2');"><?php echo $button_pay_terminal; ?></div>
    </div>
    <div class="full_cart_products">
        <!-- single product begins -->
        <div class="product" ng-repeat="product in cartController.products">
            <div class="product_wrapper">
                <img ng-src="{{product.image}}" alt=" ">
                <div class="title">{{product.name}}</div>
                <div class="details">
                    <div class="cart_price">{{product.price}}</div>
                    <div class="cart_amount">
                        <div class="cart_minus" ng-click="cartController.updateCart(product.id, cartController.minus)">-</div>
                        <div class="cart_num" ng-bind="product.quantity"></div>
                        <div class="cart_plus" ng-click="cartController.updateCart(product.id, cartController.plus)">+</div>
                    </div>
                    <div class="cart_units"><?php echo $text_quantity; ?></div>
                </div>
                <div class="cart_product_close" ng-click="cartController.deleteFromCart(product.id)">&#x2715;</div>
            </div>
            <div class="product_comment">
                <textarea ng-model="product.comment" id="" cols="30" rows="10" placeholder="<?php echo $text_comment;?>"
                          value="<?php echo $comment; ?>" maxlength="250">{{product.comment}}</textarea>
                <img src="catalog/view/theme/enchilada/images/cart_icon_edit.png" alt=" ">
            </div>
        </div>
    </div>
    <div class="empty"></div>
    <div class="full_cart_footer">
        <div class="full_cart_total"><?php echo $text_pay_total; ?><span class="full_cart_total" ng-bind="cartController.total"></span></div>
        <div class="full_cart_order modal_trigger" data-modal-id="modal_confirm"><?php echo $button_checkout; ?></div>
    </div>
</div>
<!-- cart ends -->