<?php echo $header ?>
<div class="landscape_warning">
  <div><?php echo $text_turn_screen; ?>
  </div>
</div>
<!-- gratitude for cart begins-->
<div class="cart_gratitude">
  <div class="cart_gratitude_header"><?php echo $heading_title; ?></div>
  <p class="cart_gratitude_text"> <?php echo $text_gratitude; ?></p>
  <div class="cart_gratitude_buttons">
    <div class="waiting_time">0:45:36
      <br><span><?php echo $text_wait; ?></span></div>
    <div class="table_num"><?php echo $table_id; ?>
      <br><span><?php echo $text_table_id; ?></span></div>
    <div class="order_id"><?php echo $order_id; ?>
      <br><span><?php echo $text_order_id; ?></span></div>
  </div>
  <div class="cart_gratitude_share_block">
    <div class="cart_gratitude_share_header"><?php echo $text_share_header; ?></div>
    <p class="cart_gratitude_share_text"><?php echo $text_share_text; ?></p>
    <div class="cart_gratitude_share_icons">
      <img src="../../images/icon_fb.png" alt=" ">
      <img src="../../images/icon_tw.png" alt=" ">
      <img src="../../images/icon_g+.png" alt=" ">
    </div>
    <a href="<?php echo $continue; ?>">
      <div class="cart_gratitude_share_button_back"><?php echo $button_continue; ?></div>
    </a>
  </div>
</div>
<!-- gratitude for cart ends -->

</body>

</html>