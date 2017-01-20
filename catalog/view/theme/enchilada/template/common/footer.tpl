
<footer  ng-controller="cartController as cartController">
    <div class="footer_menu">
        <div class="footer_line"></div>
        <div class="footer_price">
            <img src="catalog/view/theme/enchilada/images/footer_icon_1.png" alt=" ">
            <div class="price" ng-bind="cartController.total"></div>
        </div>
        <div class="footer_cart">
            <img src="catalog/view/theme/enchilada/images/footer_icon_2.png" alt=" ">
            <div class="cart_title"><?php echo $text_cart; ?></div>
        </div>
    </div>
    <?php echo $cart; ?>

    <!-- modal window for cart confirm order starts -->

    <div class="modal modal_confirm" id="modal_confirm" hidden>
        <div class="modal_content">

            <h3 class="modal_confirm_header"><?php echo $confirm_text; ?></h3>
            <p><?php echo $confirm_warning; ?></p>
            <div class="modal_order_summ"><?php echo $confirm_summ; ?>{{cartController.total}}</div>

            <div class="modal_confirm_button" ng-click="cartController.addOrder();"><?php echo $confirm_confirm; ?></div>
            <div class="modal_edit_button modal_close"><?php echo $confirm_edit; ?></div>
        </div>
    </div>

    <!-- modal window for cart confirm order ends -->

</footer>

<!-- filters begins -->
<section class="filters modal"
         id="modal_filters"
         hidden
         ng-controller="filterController as filterController"
         ng-init="filterController.init(<?php echo $ingredients; ?>, <?php echo $allergens; ?>);">
    <div class="filters_main_wrapper modal_content">
        <div class="filters_main">
            <h2 class="filters_header"><?php echo $filter_text; ?></h2>
            <div class="sort_by_price">
                <h5 class="filters_title"><?php echo $filter_price; ?></h5>
                <div class="total"><?php echo $filter_to; ?>
                    <div class="total_num">20.00</div>
                    <input type="text" style="display:none;" ng-model="filterController.filterPrice"/>
                    €
                </div>
                <div class="clear"></div>
                <input type="hidden" class="slider_price" value="20.00" />
            </div>
            <div class="sort_by_kcal">
                <h5 class="filters_title"><?php echo $filter_calories; ?></h5>
                <div class="total"><?php echo $filter_to; ?>
                    <div class="total_num">1000</div>
                    <input style="display:none;" type="text" id="kcal_filter" ng-model="filterController.filterKcal"/>
                    kcal
                </div>
                <div class="clear"></div>
                <input type="hidden" class="slider_kcal" value="1000" />
            </div>
            <div class="filter_button_ingr active"><?php echo $filter_ingredients; ?></div>
            <div class="filter_button_alerg"><?php echo $filter_allergens; ?></div>
        </div>
        <div class="filters_main_bottom_buttons">
            <div class="filters_close modal_close"><img src="catalog/view/theme/enchilada/images/icon_filters_close.png" alt=" "></div>
            <div class="filters_found"><span ng-bind="filterController.productsAmount"></span> <?php echo $filter_results; ?></div>
            <div class="filters_reset" ng-click="filterController.initFilterValues()">
                <img src="catalog/view/theme/enchilada/images/refresh.png" alt=" ">
            </div>
        </div>
    </div>

    <div class="filters_ingridients">
        <h3 class="filters_header"><?php echo $filter_ingredients; ?></h3>
        <!-- Category begins -->
        <div class="filters_category" ng-repeat="filter in filterController.filters track by $index">
            <div class="filters_title">{{filter.name}}</div>
            <div class="filters_toggle">
                <img src="catalog/view/theme/enchilada/images/icon_filters_close.png" alt=" ">
            </div>
            <ul class="{{$index == 0 ? 'active': ''}}"  ng-if="filter.ingredients.length > 0">
                <li ng-repeat="item in filter.ingredients">
                    <div class="filter_add" ng-click="filterController.changeNoneIngredient(item.attribute_id);"></div>
                    <div class="filter_remove" ng-click="filterController.changeIngredient(item.attribute_id);"></div>
                    <div class="filter_item_name" ng-click="filterController.changeAll(item.attribute_id);">{{item.name}}</div>
                </li>
            </ul>
        </div>
        <div class="empty"></div>
    </div>

    <!-- allergens begins -->
    <div class="filters_allergens">
        <h3 class="filters_header">allergens</h3>
        <div class="allergens_single_category"
             ng-repeat="allergen in filterController.allergens"
             ng-class="{{allergen.allergens.length > 0 ? '' : 'allergens_single'}}">
            <div class="allergens_category_title" ng-click="filterController.changeAllergens(allergen.id);">
                <div class="filter_delete"></div>
                <h3 class="allergens_category">{{allergen.name}}</h3>
                <div class="allerg_description">{{allergen.description}}</div>
            </div>
            <ul ng-if="allergen.allergens.length > 0">
                <li class="allergens_category_block"
                    ng-repeat="item in allergen.allergens"
                    ng-click="filterController.changeAllergens(allergen.id);">
                    <div class="filter_delete"></div>
                    <h5 class="allergens_subcategory">{{item.name}}</h5>
                    <div class="allerg_description">{{item.description}}</div>
                </li>
            </ul>
        </div>
        <div class="empty"></div>
    </div>

    <!-- allergens ends -->

    <div class="filters_footer">
        <div class="filters_footer_back"><img src="catalog/view/theme/enchilada/images/icon_filters_back.png" alt=" "></div>
        <div class="filter_footer_found"><span ng-bind="filterController.productsAmount"></span> results has founded</div>
    </div>

</section>

<!-- filters ends -->

<!-- sidebar begins -->
<div class="sidebar_wrapper modal" id="modal_full_sidebar" hidden>
    <div class="shim modal_close">
        <div class="sidebar_close">&#x2716;</div>
    </div>
    <section class="sidebar">
        <header class="sidebar_header">
            <!-- Block for guest begins -->
            <div class="sidebar_guest" hidden>
                <img src="catalog/view/theme/enchilada/images/avatar.png" alt=" ">

                <span class="register_text">вы не авторизованы</span>
                <br>
                <div class="sign_in">Вход</div>
                <div class="sign_up">Регистрация</div>
                <div></div>
            </div>
            <!-- Block for guest ends -->

            <!-- Block for user begins -->

            <div class="sidebar_user">
                <img src="catalog/view/theme/enchilada/images/avatar.png" alt=" ">
                <span class="name"><?php echo $account_name; ?></span>
                <br>
                <div class="points"><?php echo $account_points; ?></div>
            </div>


            <!-- Block for user ends -->
        </header>




        <div class="sidebar_time"><img src="catalog/view/theme/enchilada/images/sidebar_icon_0.png" alt=" ">
            <span class="time">0:13:43</span>
            <br>
            <span class="text"><?php echo $account_timer; ?></span></div>

        <ul>
            <li class="active sidebar_clickable_1"><img src="catalog/view/theme/enchilada/images/sidebar_icon_4_active.png" alt=" "
                                                        data-img-active="catalog/view/theme/enchilada/images/sidebar_icon_4_active.png"
                                                        data-img="catalog/view/theme/enchilada/images/sidebar_icon_4.png"><?php echo $information_points; ?>
            </li>
            <p><?php echo $information_points_text; ?></p>
            <li class="active sidebar_clickable_2"><img src="catalog/view/theme/enchilada/images/sidebar_icon_2_active.png" alt=" "
                                                        data-img-active="catalog/view/theme/enchilada/images/sidebar_icon_2_active.png"
                                                        data-img="catalog/view/theme/enchilada/images/sidebar_icon_2.png"><?php echo $information_get_points; ?>
            </li>
            <p><?php echo $information_get_points_text; ?></p>
            <li><a href="index.php?route=information/information" style="color: #333"><img src="catalog/view/theme/enchilada/images/sidebar_icon_3.png" alt=" "><?php echo $information_offers; ?></a></li>
            <li class="modal_trigger" data-modal-id="modal_sidebar"><img src="catalog/view/theme/enchilada/images/sidebar_icon_1.png" alt=" "><?php echo $information_about_us; ?></li>
        </ul>

    </section>

</div>

<div class="modal sidebar_modal" id="modal_sidebar" hidden>
    <div class="modal_content">
        <img src="catalog/view/theme/enchilada/images/logo.png" alt=" ">
        <h1 class='sidebar_modal_header'>enchilada</h1>
        <p style="text-align: justify;">Klassisch mexikanische Streetfood Tacos, saftige Burger und knackige Salate –
            die reichhaltige Küche Mexikos ist unsere Passion. Wir bieten reichlich Platz für dich und deine Amigos.
            Genießt bei unseren hausgemachten Köstlichkeiten einen unvergesslichen Abend und taucht ein in die Cocina de México.
            Im Enchilada Aalen warten pikante Spezialitäten rund um Fajitas,
            Burritos und weitere Klassiker wie Nachos mit Red Salsa, Chimichangas oder Churros auf dich.
            Frische Küche, die für jeden Geschmack etwas bereithält. Wir verleihen traditionellen Gerichten die gewisse
            Prise Caramba und servieren dir mexikanisches Essen für Herz und Seele. </p><hr>
        <a href="http://www.crepla.com"><img src="catalog/view/theme/enchilada/images/crepla_logo.png" alt=" "></a>
        <p style="text-align: justify;">CREPLA is an international digital agency which specializes in Web/Mobile development and Designer services.
            We create high-quality products which transfer your business to next level.
            We make your dreams workable. You are changing the world - we are helping you with it!</p>
        <a href="http://www.crepla.com" style="color: black">Website: crepla.com</a><hr>
        <img src="catalog/view/theme/enchilada/images/myfmyo.png" alt=" ">
        <p style="text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>

    <div class="modal_close">&#x2716;</div>
</div>

<!-- sidebar ends -->

<script src="catalog/view/theme/enchilada/js/modal.js"></script>
<script src="catalog/view/theme/enchilada/js/filter_allergens.js"></script>
</body>

</html>