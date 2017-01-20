<div class="panel-heading">
    <h3 class="panel-title">
        <i class="fa fa-shopping-cart"></i>
        <?php echo $text_products . ' (' . $info['date'] . ')'; ?>
    </h3>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        <?php if (!empty($products)) { ?>
        <?php foreach ($products as $product) { ?>
        <div class="panel panel-default col-sm-12 non-padding">
            <div class="col-sm-3 non-padding">
                <a href="javascript:void(0);" class="img-thumbnail">
                    <img src="<?php echo $product['image']; ?>" alt="" title=""/>
                </a>
            </div>
            <div class="col-sm-9 non-padding">
                <div class="col-sm-12 non-padding">
                    <div class="col-sm-6">
                        <p href="#"><?php echo $text_title; ?></p>
                    </div>
                    <div class="col-sm-6">
                        <p><?php echo $product['name']; ?></p>
                    </div>
                </div>
                <div class="col-sm-12 non-padding">
                    <div class="col-sm-6">
                        <p href="#"><?php echo $text_category; ?></p>
                    </div>
                    <div class="col-sm-6">
                        <p><?php echo $product['category_name']; ?></p>
                    </div>
                </div>
                <div class="col-sm-12 non-padding">
                    <div class="col-sm-6">
                        <p href="#"><?php echo $text_price; ?></p>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-default"><?php echo $product['price']; ?></span>
                    </div>
                </div>
                <div class="col-sm-12 non-padding">
                    <div class="col-sm-6">
                        <p href="#"><?php echo $text_quantity_products; ?></p>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-info"><?php echo $product['quantity']; ?></span>
                    </div>
                </div>
                <div class="col-sm-12 non-padding">
                    <div class="col-sm-6">
                        <p href="#"><?php echo $text_total_sales; ?></p>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-primary"><?php echo $product['total']; ?></span>
                    </div>
                </div>
            </div>
            <?php if ($info['graphic']) { ?>
            <div class="col-sm-12 non-padding">
                <button type="button" class="btn btn-success btn-block show-it"
                        data-id="<?php echo $product['product_id']; ?>">
                    <?php echo $text_show_graphic; ?>
                </button>
                <button type="button" class="btn btn-warning btn-block hide-it"
                        data-id="<?php echo $product['product_id']; ?>" style="display: none;">
                    <?php echo $text_hide_graphic; ?>
                </button>
            </div>
            <?php } ?>
            <div class="col-sm-12" id="div_<?php echo $product['product_id']; ?>"></div>
        </div>
        <?php } ?>
        <?php } else { ?>
        <div class="col-sm-12">
            <p class="text-center"><?php echo $text_no_results; ?></p>
        </div>
        <?php } ?>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.hide-it').on('click', function () {

            var id = $(this).attr('data-id');
            $(this).prev().show();
            $('#div_' + id).html('');
            $(this).hide();
        });

        $('.show-it').on('click', function () {

            var id = $(this).attr('data-id');
            var element = $(this);
            $.ajax({
                url: 'index.php?route=statistic/bill/showGraphic&token=' + token,
                type: 'post',
                data: {'product_id': id, 'item': array[id]},
                dataType: 'json',
                success: function (json) {
                    $('#div_' + id).html(json.html);
                    $(element).next().show();
                    $(element).hide();
                }
            });
        });
        var array = <?php echo isset($graphic) ? json_encode($graphic) : json_encode(array()); ?>;

    });
</script>