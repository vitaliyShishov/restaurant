<?php // echo "<pre>"; var_dump($tree); die; ?>
<?php echo $header; ?>
<div class="landscape_warning">
    <div><?php echo $text_turn_screen; ?></div>
</div>
<section class="menu"
         ng-cloak
         ng-controller="productsController as productsController"
         ng-init="productsController.init(<?php echo $tree; ?>, <?php echo $url; ?>);">
    <?php echo $content_top; ?>

    <div class="search">
        <input type="text" placeholder="Поиск по блюдам">
    </div>

    <div class="tabs">
        <div ng-repeat="category in productsController.tree track by $index"
             class="tab_{{ $index + 1 }} {{$index == 0 ? 'active' : ''}}"
             category="{{category.name}}">
            <svg ng-if="$index == 0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 43 33">
                <path class="cls-1" d="M41.56,28.68H39.245a2.113,2.113,0,0,0,.143-0.616l0.638-8.2a0.678,0.678,0,0,0-.255-0.587l1.707-3.955a0.683,0.683,0,0,0,.006-0.528,0.692,0.692,0,0,0-.373-0.377l-2.05-.867a0.7,0.7,0,0,0-.53-0.007,0.684,0.684,0,0,0-.112-0.508,0.7,0.7,0,0,0-.447-0.287l-2.192-.4a0.7,0.7,0,0,0-.395.042l-0.059-.835a0.7,0.7,0,0,0-.743-0.64l-2.223.154a0.7,0.7,0,0,0-.477.236,0.685,0.685,0,0,0-.169.5l0.1,1.377-0.071-.242a0.7,0.7,0,0,0-.863-0.471l-2.141.613a0.694,0.694,0,0,0-.416.329,0.684,0.684,0,0,0-.059.524l1.515,5.187h-0.1a0.7,0.7,0,0,0-.511.221,0.685,0.685,0,0,0-.183.521L29.378,25H28.187a0.7,0.7,0,0,0-.539.252,0.685,0.685,0,0,0-.144.572L28.08,28.68H24.734a2.856,2.856,0,0,0,.435-1.517V27a2.152,2.152,0,0,0,0-4.093V21.055a1.423,1.423,0,0,0,.743-1.246V18.338c0-.921-0.649-2.234-3.74-3.254a26.88,26.88,0,0,0-8.1-1.113,26.879,26.879,0,0,0-8.1,1.113c-3.092,1.02-3.74,2.332-3.74,3.254v1.471a1.423,1.423,0,0,0,.743,1.246V22.91a2.153,2.153,0,0,0,0,4.093v0.159a2.856,2.856,0,0,0,.435,1.517H1.44A1.434,1.434,0,0,0,0,30.1v1.471A1.434,1.434,0,0,0,1.44,33H41.56A1.434,1.434,0,0,0,43,31.575V30.1A1.434,1.434,0,0,0,41.56,28.68Zm-4.01-9.886a0.672,0.672,0,0,0,.035-0.069l1.57-3.636,0.769,0.325-1.6,3.707H37.489Zm-1.887-2.031a0.682,0.682,0,0,0,.013-0.069l0.536-2.868,0.822,0.15L36.073,19.12h-0.85Zm-1.677-4.427,0.3,4.224L33.806,19.12H33.627l-0.475-6.726ZM38.579,20.5L38,27.958a0.79,0.79,0,0,1-.787.721H34.98l0.576-2.852a0.684,0.684,0,0,0-.144-0.572A0.7,0.7,0,0,0,34.874,25h-4.1l-0.35-4.5h8.154ZM30.6,13.982l1.5,5.138h-0.87l-1.434-4.908Zm3.428,12.4-0.457,2.261a0.046,0.046,0,0,1-.045.037H29.539a0.046,0.046,0,0,1-.045-0.037l-0.457-2.261h4.987Zm-30.4-8.043c0-.757,1.5-1.522,2.788-1.946a17.4,17.4,0,0,1,1.963-.512l0,0,2.229,2.206a0.7,0.7,0,0,0,.985,0,0.684,0.684,0,0,0,0-.975L10.061,15.6c0.512-.067,1.041-0.12,1.582-0.161l3.42,3.385a0.7,0.7,0,0,0,.985,0,0.684,0.684,0,0,0,0-.975l-2.521-2.5q0.27,0,.543,0,0.617,0,1.221.023l2.745,2.717a0.7,0.7,0,0,0,.985,0,0.684,0.684,0,0,0,0-.975l-1.609-1.593a21.111,21.111,0,0,1,4.319.87c1.286,0.424,2.788,1.188,2.788,1.946v1.471a0.046,0.046,0,0,1-.046.046H3.668a0.046,0.046,0,0,1-.046-0.046V18.338Zm20.153,2.9V22.8H22.531l-1.579-1.563h2.823ZM20.561,22.8H18.074l-1.579-1.563h2.488Zm-4.458,0H13.616l-1.579-1.563h2.488Zm-4.458,0H9.158L7.579,21.234h2.488Zm-4.458,0H4.365V21.234H5.609Zm-4.309,2.16a0.786,0.786,0,0,1,.789-0.781h20.8a0.781,0.781,0,1,1,0,1.563H3.668A0.786,0.786,0,0,1,2.879,24.957Zm20.9,2.16v0.046a1.526,1.526,0,0,1-1.532,1.517H5.9a1.526,1.526,0,0,1-1.532-1.517V27.117h19.41Zm17.832,4.458a0.046,0.046,0,0,1-.047.046H1.44a0.046,0.046,0,0,1-.046-0.046V30.1a0.046,0.046,0,0,1,.046-0.046H41.56a0.046,0.046,0,0,1,.047.046v1.471ZM12.631,8.046a3.268,3.268,0,0,0,.9,2.268,1.947,1.947,0,0,1,.59,1.406,0.7,0.7,0,0,0,1.393,0,3.269,3.269,0,0,0-.9-2.268,1.972,1.972,0,0,1,0-2.814,3.324,3.324,0,0,0,0-4.54A1.952,1.952,0,0,1,14.024.689a0.7,0.7,0,0,0-1.393,0,3.275,3.275,0,0,0,.9,2.27,1.976,1.976,0,0,1,0,2.817A3.271,3.271,0,0,0,12.631,8.046Zm3.76,0.689a0.7,0.7,0,0,0,.546-0.261,6.172,6.172,0,0,0,1.545-4.1,6.08,6.08,0,0,0-.514-2.493,0.7,0.7,0,0,0-.919-0.352,0.687,0.687,0,0,0-.356.909,4.723,4.723,0,0,1,.4,1.936,4.781,4.781,0,0,1-1.235,3.238,0.682,0.682,0,0,0-.159.439A0.693,0.693,0,0,0,16.391,8.735Zm-5.587,2.2a0.7,0.7,0,0,0,.279-0.058,0.687,0.687,0,0,0,.359-0.908,4.719,4.719,0,0,1-.389-1.922A4.788,4.788,0,0,1,12.293,4.8c0.013-.016.024-0.032,0.036-0.048a0.691,0.691,0,0,0,0-.769,0.7,0.7,0,0,0-.966-0.191,0.691,0.691,0,0,0-.2.2,6.14,6.14,0,0,0-1.5,4.053,6.077,6.077,0,0,0,.506,2.475A0.7,0.7,0,0,0,10.8,10.934Z" />
            </svg>
            <svg ng-if="$index == 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 34">
                <path d="M18.081,33H5.462a0.5,0.5,0,0,1-.5-0.443L2.349,9.9a0.5,0.5,0,0,1,.5-0.557H20.692a0.506,0.506,0,0,1,.376.167,0.5,0.5,0,0,1,.125.39L18.582,32.556A0.5,0.5,0,0,1,18.081,33ZM5.911,32h11.72l2.5-21.654H3.415ZM20.125,15.275H3.495a0.5,0.5,0,1,1,0-1h16.63A0.5,0.5,0,1,1,20.125,15.275ZM11.1,22.354H7.983a0.5,0.5,0,0,1-.5-0.5V18.765a0.5,0.5,0,0,1,.5-0.5H11.1a0.5,0.5,0,0,1,.5.5v3.089A0.5,0.5,0,0,1,11.1,22.354Zm-2.612-1h2.108V19.265H8.487v2.089Zm6.248,7.281a0.5,0.5,0,0,1-.262-0.073l-2.661-1.606a0.5,0.5,0,0,1-.168-0.687l1.62-2.639a0.505,0.505,0,0,1,.693-0.167l2.661,1.606a0.5,0.5,0,0,1,.168.687L15.166,28.4A0.5,0.5,0,0,1,14.735,28.635Zm-1.968-2.274,1.8,1.086,1.1-1.784-1.8-1.086ZM20.72,15.9c-0.2,0-.4-0.009-0.591-0.026a0.5,0.5,0,0,1-.455-0.545,0.507,0.507,0,0,1,.55-0.451c0.163,0.016.329,0.022,0.5,0.022a5.218,5.218,0,1,0-5.261-5.217,0.5,0.5,0,0,1-1.009,0A6.271,6.271,0,1,1,20.72,15.9ZM7.982,10.183a0.5,0.5,0,0,1-.5-0.415L5.962,1H0.512a0.5,0.5,0,1,1,0-1H6.386a0.5,0.5,0,0,1,.5.415L8.48,9.6a0.5,0.5,0,0,1-.411.578A0.515,0.515,0,0,1,7.982,10.183Zm12.71,0.163a0.5,0.5,0,0,1-.5-0.5V3.965a0.5,0.5,0,0,1,1.009,0V9.846A0.5,0.5,0,0,1,20.692,10.346Zm4.089,3.864a0.509,0.509,0,0,1-.357-0.146L16.3,6.009a0.5,0.5,0,0,1,0-.707,0.507,0.507,0,0,1,.713,0l8.123,8.055a0.5,0.5,0,0,1,0,.707A0.509,0.509,0,0,1,24.781,14.21Zm-4.088-3.864a0.508,0.508,0,0,1-.357-0.146,0.5,0.5,0,0,1,0-.707l4.113-4.078a0.508,0.508,0,0,1,.713,0,0.5,0.5,0,0,1,0,.707L21.048,10.2A0.5,0.5,0,0,1,20.692,10.346Zm5.793-.163H20.692a0.5,0.5,0,1,1,0-1h5.793A0.5,0.5,0,1,1,26.485,10.183Z" />
            </svg>
            <svg ng-if="$index == 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 34">
                <path d="M23.793,10.348c-2.443-1.946-5.9-1.407-8.644-.72a6.738,6.738,0,0,1-1.346.184c-0.072-.366-0.162-0.734-0.271-1.1l2.118-.319a6.2,6.2,0,0,0,5.213-5.278L21.175,0.99A0.575,0.575,0,0,0,21.208.761L21.32,0l-3.076.464a6.2,6.2,0,0,0-5.213,5.278L12.847,7a6.819,6.819,0,0,0-2.78-2.965A0.564,0.564,0,0,0,9.3,4.27a0.578,0.578,0,0,0,.234.777,6.851,6.851,0,0,1,3.1,4.728,6.649,6.649,0,0,1-.787-0.147c-2.741-.687-6.2-1.226-8.644.72C1.018,12.092-.032,15.543-0.005,20.9A15.386,15.386,0,0,0,5.467,32a7.638,7.638,0,0,0,6.572,1.842,6.6,6.6,0,0,1,2.921,0A6.545,6.545,0,0,0,16.418,34,8.179,8.179,0,0,0,21.532,32,15.39,15.39,0,0,0,27,20.9C27.031,15.542,25.981,12.092,23.793,10.348ZM15.482,7.257l-0.5.075,4.829-4.889-0.074.5A5.059,5.059,0,0,1,15.482,7.257ZM18.411,1.6l0.738-.111L14.044,6.661l0.11-.748A5.061,5.061,0,0,1,18.411,1.6ZM20.826,31.1a6.661,6.661,0,0,1-5.616,1.62,7.736,7.736,0,0,0-3.42,0A6.669,6.669,0,0,1,6.174,31.1,14.368,14.368,0,0,1,1.13,20.891c-0.026-4.977.883-8.13,2.778-9.64,1.6-1.278,3.971-1.434,7.671-.508a7.872,7.872,0,0,0,1.252.2c0.032,0.294.054,0.584,0.063,0.866a0.57,0.57,0,0,0,.566.556h0.018a0.571,0.571,0,0,0,.549-0.592C14.018,11.5,14,11.228,13.97,10.952a7.886,7.886,0,0,0,1.451-.207c3.7-.926,6.066-0.77,7.671.508,1.895,1.51,2.8,4.663,2.778,9.641A14.367,14.367,0,0,1,20.826,31.1ZM7.937,11.6c-2.816,0-5.106,2.577-5.106,5.744a0.567,0.567,0,1,0,1.135,0c0-2.534,1.782-4.6,3.971-4.6A0.574,0.574,0,0,0,7.937,11.6Zm7.193,0.168a2.412,2.412,0,0,1-3.444,0,0.562,0.562,0,0,0-.8,0,0.579,0.579,0,0,0,0,.812,3.536,3.536,0,0,0,5.049,0,0.579,0.579,0,0,0,0-.812A0.562,0.562,0,0,0,15.131,11.767Z" />
            </svg>
            <div class="title">{{category.name}}</div>
        </div>
    </div>

    <!-- full category begins  -->
    <section class="category category_food {{$index == 0 ? 'active' : ''}}"
             ng-repeat="parent in productsController.tree track by $index"
             category="{{parent.name}}">

        <!-- single category begins  -->
        <div class="category_1">
            <div ng-repeat="child in parent.children track by $index">
                <div class="header_field">
                    <h1 class="category_h">
                        {{child.name}}
                        <img ng-src="{{child.image}}" alt=" " class="icon" />
                    </h1>
                    <div class="category_arrow"></div>
                </div>

            <!-- products begins -->
                <div class="category_products">
                <!-- single product begins -->
                <div class="category_product"
                     ng-repeat="product in child.products track by $index"
                     ng-show="productsController.checkFlag(product.flag)">
                    <img ng-src="{{product.image}}" alt=" ">
                    <h3 class="category_product_title">
                        {{product.name}}
                    <div class="cat_kcal">
                        <img src="catalog/view/theme/default/images/cat_prod_icon_1.png" alt=" "
                                               class="icon">
                        <div class="value">{{product.energy}}</div>
                    </div>
                        <?php $i = 0; ?>
                    <div ng-repeat="ingredient in product.ingredients track by $index"
                         ng-if="ingredient.allergen[<?php echo $i; ?>]" class="cat_allerg">
                        <img src="catalog/view/theme/default/images/cat_prod_icon_2.png" alt=" "
                                                 class="icon">
                        <div class="value">aln</div>
                        <?php $i++; ?>
                    </div>
                    </h3>

                    <div class="cat_price">{{product.price}}</div>
                    <div class="cat_order"
                         data-product-id="{{product.id}}"
                         ng-click="productsController.addCart(product.id)">
                        <?php echo $button_cart; ?>
                    </div>
                    <div class="cat_calc">
                        <div class="cat_minus" ng-click="productsController.updateCart(product.id, productsController.minus)">-</div>
                        <div class="cat_amount" ng-bind="product.quantity"></div>
                        <div class="cat_plus" ng-click="productsController.updateCart(product.id, productsController.plus)">+</div>
                    </div>
                    <div class="cat_info modal_trigger" data-modal-id="{{product.id}}">?</div>
                    <div class="cat_close" hidden>&#x2715;</div>
                    <div ng-if="product.is_vegan > 0" class="cat_veg"><img src="catalog/view/theme/default/images/cat_prod_icon_3.png" alt=" "></div>
                </div>
                <!-- single product ends -->
        </div>
            </div>
        <!-- products ends -->

        </div>
        <!-- single category ends  -->

    </section>
    <input style="display:none;" type="text" id="product_for_cart" ng-model="productsController.productId"/>
    <div class="empty"></div>

</section>
<?php echo $footer; ?>
