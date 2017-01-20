<?php echo $header; ?>

  <section class="menu">
    <div class="slider">

      <?php echo $content_top; ?>
  </section>

  <?php echo $search; ?>

  <div class="tabs">
    <?php $i = 1; ?>
    <?php foreach ($tree as $parent_id => $parent_array) { ?>
      <div class="tab_<?php echo $i; ?> <?php echo ($i == 1) ? 'active' : ''; ?>" category="<?php echo $parent_array['name']; ?>">
      <div style = "margin: 50px; padding-left: 30px;"><img src="<?php echo $parent_array['image']; ?>" /></div>
              <div class="title"><?php echo $parent_array['name']; ?></div>
      </div>
    <?php $i++; ?>
    <?php } ?>
  </div>

  <!-- full category begins  -->
<?php $j = 0; ?>
  <?php foreach ($tree as $parent_id => $parent_array) { ?>
    <section class="category category_food <?php echo (!$j) ? 'active' : ''; ?>" category="<?php echo $parent_array['name']; ?>">

    <!-- single category begins  -->
    <div class="category_1">
      <?php $c = 0; ?>
      <?php foreach ($parent_array['children'] as $child) { ?>
      <div class="header_field <?php echo (!$c) ? 'active' : ''; ?>">
        <h1 class="category_h">
          <?php echo $child['name']; ?>
          <img src="catalog/view/theme/default/images/category_icon_1.png" alt=" " class="icon" />
        </h1>
        <div class="category_arrow"></div>
      </div>

      <!-- products begins -->
      <div class="category_products">
        <?php $t = 0; ?>
        <?php foreach ($child['products'] as $product) { ?>
        <!-- single product begins -->
        <div class="category_product">
          <img src="<?php echo $product['product_image']?>" alt=" ">
          <h3 class="category_product_title"><?php echo $product['name']; ?></h3>

          <div class="cat_kcal"><img src="catalog/view/theme/default/images/cat_prod_icon_1.png" alt=" "
                                     class="icon">
            <div class="value"><?php echo $product['energy_value']?></div>
          </div>
          <div class="cat_allerg"><img src="catalog/view/theme/default/images/cat_prod_icon_2.png" alt=" "
                                       class="icon">
            <div class="value">shr</div>
          </div>
          <div class="cat_price"><?php echo $currency_by_code['symbol_right'].$product['price']; ?></div>
          <div class="cat_order">bestellen</div>
          <div class="cat_calc">
            <div class="cat_minus">-</div>
            <div class="cat_amount"></div>
            <div class="cat_plus">+</div>
          </div>
          <div class="cat_info modal_trigger" data-modal-id="single_product">?</div>
          <div class="cat_close" hidden>&#x2715;</div>
          <div class="cat_veg"><img src="catalog/view/theme/default/images/cat_prod_icon_3.png" alt=" "></div>
        </div>
        <!-- single product ends -->
        
          <div class="modal_single_product_footer">
            <div class="modal_single_product_total">Цена: <?php echo $product['price'];?></div>
            <div class="modal_single_product_order">Купить</div>
          </div>

          <div class="scroll_block">
            <div class="scroll_runner"></div>
          </div>


          <div class="modal_close">&#x2716;
            <!-- can be inside prev block -->
          </div>
        </div>
      <?php } ?>
      </div>
      <?php $c++; ?>
      <?php } ?>
      <!-- products ends -->

    </div>
    <!-- single category ends  -->

  </section>
  <?php $j++;  ?>
  <?php } ?>
<div class="empty"></div>
<!-- full category ends  -->
<?php echo $footer; ?>
