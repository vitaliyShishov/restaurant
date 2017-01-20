<script src="catalog/view/theme/default/js/modal.js"></script>
        <footer>
            <div class="footer_menu">

                <div class="footer_line">

                </div>

                <div class="footer_price">
                    <img src="catalog/view/theme/default/images/footer_icon_1.png" alt=" ">
                    <div class="price"><?php echo $cart; ?></div>

                </div>

                <div class="footer_cart">
                    <img src="catalog/view/theme/default/images/footer_icon_2.png" alt=" ">
                    <div class="cart_title"><?php echo $text_cart;?></div>
                </div>

            </div>






            <div class="full_cart">
                <div class="full_cart_header">

                    <div class="full_cart_title"> <img src="catalog/view/theme/default/images/footer_icon_3.png" alt=" "> <?php echo $text_just_cart; ?>
                    </div>
                    <div class="full_cart_close"><?php echo $text_hide; ?></div>



                </div>

                <div class="full_cart_payment">
                    <div class="payment_cash active"><?php echo $text_pay_cash; ?></div>
                    <div class="payment_card"><?php echo $text_pay_terminal; ?></div>


                </div>
                <div class="full_cart_products">
                    <!-- single product begins -->
                    <div class="product">
                        <img src="catalog/view/theme/default/images/product.jpg" alt=" ">
                        <div class="title">Кальцоне какое-то</div>
                        <div class="details">

                            <div class="cart_price">122.45$</div>

                            <div class="cart_amount">
                                <div class="cart_minus">-</div>
                                <div class="cart_num">15</div>
                                <div class="cart_plus">+</div>


                            </div>
                            <div class="cart_units">шт.</div>



                        </div>

                        <div class="cart_product_close">&#x2715;</div>
                    </div>


                    <!-- single product ends -->

                    <!-- single product begins -->
                    <div class="product">
                        <img src="catalog/view/theme/default/images/product.jpg" alt=" ">
                        <div class="title">Кальцоне какое-то</div>
                        <div class="details">

                            <div class="cart_price">122.45$</div>

                            <div class="cart_amount">
                                <div class="cart_minus">-</div>
                                <div class="cart_num">15</div>
                                <div class="cart_plus">+</div>


                            </div>
                            <div class="cart_units">шт.</div>



                        </div>

                        <div class="cart_product_close">&#x2715;</div>
                    </div>


                    <!-- single product ends -->


                    <!-- single product begins -->
                    <div class="product">
                        <img src="catalog/view/theme/default/images/product.jpg" alt=" ">
                        <div class="title">Кальцоне какое-то</div>
                        <div class="details">

                            <div class="cart_price">122.45$</div>

                            <div class="cart_amount">
                                <div class="cart_minus">-</div>
                                <div class="cart_num">15</div>
                                <div class="cart_plus">+</div>


                            </div>
                            <div class="cart_units">шт.</div>



                        </div>

                        <div class="cart_product_close">&#x2715;</div>
                    </div>


                    <!-- single product ends -->





                </div>
                <div class="empty"></div>

                <div class="full_cart_footer">
                    <div class="full_cart_total">Итого:<span class="full_cart_total">1160$</span></div>
                    <div class="full_cart_order">Оформить заказ</div>


                </div>

            </div>

        </footer>


    </section>




<?php foreach ($product_array as $products){ ?>
    <?php $i=0; ?>
        <div class="modal scroll_container_wrapper" id="<?php echo $i; ?>" hidden>
            <?php echo "<pre>"; var_dump($products); die;?>
            <div class="modal_content scroll_container">
                <div class="modal_background"><img src="images/single_product.jpg" alt=""></div>
                <h2 class="modal_single_product_title"><?php echo $product['name']; ?></h2>

                <p class="modal_single_product_weight"><?php echo $product['weight']; ?></p>

                <ul class="modal_single_product_ingr">
                    <?php foreach($products[$i]['ingredients'] as $ingredient){ ?>
                    <li><?php echo $ingredient['attribute']['name']; ?></li>
                    <?php }?>
                    <li>Древесина
                        <div class="single_page_allergen">B</div>
                    </li>
                </ul>
                <div class="empty"></div>

            </div>
        </div>
    <?php $i++;?>
<?php } ?>


            <div class="pop_allergens">
        <h3 class="allergens_category">G</h3>
        <div class="allerg_description">Содержащие клейковину крупы</div>

        <h5 class="allergens_subcategory">G-W</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Пшеница) и изделия из нее </div>
        <h5 class="allergens_subcategory">G-R</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Рожь) и изделия из нее</div>
        <h5 class="allergens_subcategory">G-G</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Ячмень) и изделия из него</div>
        <h5 class="allergens_subcategory">G-H</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Овес) и изделия из него</div>
        <h5 class="allergens_subcategory">G-D</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Злак) и изделия из него</div>
        <h5 class="allergens_subcategory">G-K</h5>
        <div class="allerg_description">Содержащие клейковину крупы (Камут) и изделия из него</div>

        <h3 class="allergens_category">K</h3>
        <div class="allerg_description">Ракообразные и продукты из ракообразных</div>


        <h3 class="allergens_category">E</h3>
        <div class="allerg_description">Яйца и продукты из яиц</div>


        <h3 class="allergens_category">F</h3>
        <div class="allerg_description">Рыба и рыбные продукты</div>

        <h3 class="allergens_category">ER</h3>
        <div class="allerg_description">Aрахис и продукты из арахиса</div>


        <h3 class="allergens_category">S</h3>
        <div class="allerg_description">Соя и продукты из сои (соевые продукты)</div>


        <h3 class="allergens_category">M</h3>

        <div class="allerg_description">Молоко и молочные продукты</div>


        <h3 class="allergens_category">Sch</h3>
        <div class="allerg_description">Кожура плодов</div>
        <h5 class="allergens_subcategory">Sch-M</h5>
        <div class="allerg_description">Кожура плодов (Миндальный) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-H</h5>
        <div class="allerg_description">Кожура плодов (Общий орешник) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-W</h5>
        <div class="allerg_description">Кожура плодов (Грецкий) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-K</h5>
        <div class="allerg_description">Кожура плодов (Анакард) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-P</h5>
        <div class="allerg_description">Кожура плодов (Пекан) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-PA</h5>
        <div class="allerg_description">Кожура плодов (Бразильский) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-PI</h5>
        <div class="allerg_description">Кожура плодов (Фисташковый) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-Q</h5>
        <div class="allerg_description">Кожура плодов (Королевский) и изделия из него</div>
        <h5 class="allergens_subcategory">Sch-Mac</h5>
        <div class="allerg_description">Кожура плодов (Макадами) и изделия из него</div>




        <h3 class="allergens_category">SL</h3>

        <div class="allerg_description">Сельдерей и продукты из сельдерея</div>

        <h3 class="allergens_category">SE</h3>
        <div class="allerg_description">Горчица и продукты из горчицы</div>


        <h3 class="allergens_category">SES</h3>
        <div class="allerg_description">Кунжут и продукты из кунжута</div>

        <h3 class="allergens_category">SUL</h3>
        <div class="allerg_description">Двуокись серы и сульфиты концентрации более чем 10 мг – кг – 1 порядка 10 мг – I – 1 как SO2</div>

        <h3 class="allergens_category">L</h3>
        <div class="allerg_description">Волчий (относятся к бобовым)</div>


        <h3 class="allergens_category">W</h3>
        <div class="allerg_description">Моллюсков (мидии, улитки, кальмар)</div>
        
       
         
       <div class="allerg_close">&#x2716;
         
        </div>







    </div>



</body>

</html>