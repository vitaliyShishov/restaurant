<?php echo $header; ?>
<div class="landscape_warning">
  <div><?php echo $text_turn_screen; ?>
  </div>
</div>

<!-- Proposals begins -->

<div class="proposals">

<?php foreach ($informations as $information) { ?>
  <div class="single_proposal">
    <?php if (isset($information['image'])){ ?>
      <img src="<?php echo HTTP_SERVER.'image/'.$information['image']; ?>" alt="">
    <?php } else { ?>
      <img src="catalog/view/theme/enchilada/images/logo.png" alt="">
    <?php } ?>
    <h3 class="proposal_title"><?php echo html_entity_decode($information['title']); ?></h3>
    <p><?php echo html_entity_decode($information['description']);?></p>
  </div>
<?php } ?>
</div>

<!-- Proposals ends -->