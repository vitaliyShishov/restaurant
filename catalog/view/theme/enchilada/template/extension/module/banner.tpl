<section>
  <div class="slider">

  <?php foreach ($banners as $banner) { ?>
    <div class="slide">
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
      <h3 class="slide_title">
        <?php echo $banner['title']; ?>
      </h3>
      <div class="slide_button"><a href="<?php echo $banner['link']?>" style="color: white"><?php echo $text_more; ?></a></div>
    </div>
  <?php } ?>

  </div>
</section>
