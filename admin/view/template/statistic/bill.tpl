<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-line-chart"></i><?php echo $text_orders_statistic; ?></h3>
            </div>
            <div class="panel-body">
                <ul class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#tab-bill" data-toggle="tab"><?php echo $tab_orders; ?></a></li>
                    <li><a href="#tab-products" data-toggle="tab"><?php echo $tab_products; ?></a></li>
                    <li onclick="showAllergens();"><a href="#tab-allergens" data-toggle="tab"><?php echo $tab_allergens; ?></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-bill">
                        <div class="col-sm-8" id="bill_info">
                            <?php echo $bill_info; ?>
                        </div>
                        <div class="col-sm-4">
                            <form action="" method="post" enctype="multipart/form-data" id="bill_info_form">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <i class="fa fa-calendar"></i>
                                        <?php echo $text_period; ?>
                                    </h3>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="col-sm-12 period">
                                                <select class="form-control choice" name="period[variant]">
                                                    <option value="day"><?php echo $text_day; ?></option>
                                                    <option value="month"><?php echo $text_month; ?></option>
                                                    <option value="period"><?php echo $text_period; ?></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 holder non-padding block_day">
                                            <div class="input-group date">
                                                <input type="text" name="period[day]" value="" data-date-format="YYYY-MM-DD"
                                                       class="form-control">
                                                <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 holder non-padding block_period" style="display:none">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="period_from">
                                                    <?php echo $text_from; ?>
                                                </label>
                                                <div class="input-group date col-sm-10">
                                                    <input type="text" name="period[day_from]" id="period_from" value=""
                                                           data-date-format="YYYY-MM-DD" class="form-control">
                                                    <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="period_to">
                                                    <?php echo $text_to; ?>
                                                </label>
                                                <div class="input-group date col-sm-10">
                                                    <input type="text" name="period[day_to]" id="period_to" value=""
                                                           data-date-format="YYYY-MM-DD" class="form-control">
                                                    <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block_month col-sm-12 non-padding holder" style="display: none">
                                            <select class="form-control" id="period_month" name="period[month]">
                                                <?php foreach ($months as $key => $title) { ?>
                                                    <option value="<?php echo $key; ?>"><?php echo $title; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="btn-group btn-group-justified non-padding">
                                            <p class="btn btn-primary"
                                               id="average_bill"><?php echo $text_average; ?></p>
                                            <p class="btn btn-default" id="summ">
                                                <i class="fa fa-angle-down pull-right"></i>
                                                <?php echo $text_sum; ?>
                                            </p>
                                            <input type="hidden" id="sum_variant" name="sum[variant]" value="average"/>
                                        </div>
                                        <div class="non-display non-padding col-sm-12" id="summ_value">
                                            <div class="col-sm-4">
                                                <select class="form-control" id="summ_choice" name="sum[flag]">
                                                    <option value="more">></option>
                                                    <option value="less"><</option>
                                                    <option value="more_less">><</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-8">
                                                <input type="text"
                                                       name="sum[value]"
                                                       value=""
                                                       placeholder="<?php echo $text_sum; ?>"
                                                       class="form-control"/>
                                            </div>
                                            <div class="col-sm-12" id="summ_info">
                                                <p><?php echo $text_warning; ?></p>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 non-padding">
                                            <button type="button"
                                                    onclick="showBill();return false;"
                                                    class="btn btn-primary btn-block">
                                                <?php echo $text_calculate; ?>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-products">
                        <div class="col-sm-8" id="product_info">
                            <?php echo $product_info; ?>
                        </div>
                        <div class="col-sm-4">
                            <form action="" method="post" enctype="multipart/form-data" id="product_info_form">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-calendar"></i>
                                    <?php echo $text_period; ?>
                                </h3>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-sm-12 period">
                                            <select class="form-control choice" name="period[variant]">
                                                <option value="day"><?php echo $text_day; ?></option>
                                                <option value="month"><?php echo $text_month; ?></option>
                                                <option value="period"><?php echo $text_period; ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 holder non-padding block_day">
                                        <div class="input-group date">
                                            <input type="text" name="period[day]" value="" data-date-format="YYYY-MM-DD"
                                                   class="form-control">
                                            <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 holder non-padding block_period" style="display:none">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="period_from">
                                                <?php echo $text_from; ?>
                                            </label>
                                            <div class="input-group date col-sm-10">
                                                <input type="text" name="period[day_from]" value=""
                                                       data-date-format="YYYY-MM-DD" class="form-control">
                                                <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="period_to">
                                                <?php echo $text_to; ?>
                                            </label>
                                            <div class="input-group date col-sm-10">
                                                <input type="text" name="period[day_to]" value=""
                                                       data-date-format="YYYY-MM-DD" class="form-control">
                                                <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="block_month col-sm-12 non-padding holder" style="display: none">
                                        <select class="form-control" name="period[month]">
                                            <?php foreach ($months as $key => $title) { ?>
                                            <option value="<?php echo $key; ?>"><?php echo $title; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12 period">
                                            <select class="form-control" name="category">
                                                <option value="00"><?php echo $text_all; ?></option>
                                                <?php foreach($categories as $category) { ?>
                                                <option value="<?php echo $category['category_id']; ?>">
                                                    <?php echo $category['name']; ?>
                                                </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 non-padding">
                                        <button type="button"
                                                onclick="showProduct();return false;"
                                                class="btn btn-primary btn-block">
                                            <?php echo $text_calculate; ?>
                                        </button>
                                    </div>
                                </div>
                            </div>
                                </form>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-allergens">
                        <div class="col-sm-8" id="allergens_info"></div>
                        <div class="col-sm-4">
                            <form action="" method="post" enctype="multipart/form-data" id="allergens_info_form">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-calendar"></i>
                                        <?php echo $text_period; ?>
                                    </h3>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="col-sm-12 period">
                                                <select class="form-control choice" name="period[variant]">
                                                    <option value="day"><?php echo $text_day; ?></option>
                                                    <option value="month"><?php echo $text_month; ?></option>
                                                    <option value="period"><?php echo $text_period; ?></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 holder non-padding block_day">
                                            <div class="input-group date">
                                                <input type="text" name="period[day]" value="" data-date-format="YYYY-MM-DD"
                                                       class="form-control">
                                                <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 holder non-padding block_period" style="display:none">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="period_from">
                                                    <?php echo $text_from; ?>
                                                </label>
                                                <div class="input-group date col-sm-10">
                                                    <input type="text" name="period[day_from]" value=""
                                                           data-date-format="YYYY-MM-DD" class="form-control">
                                                    <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="period_to">
                                                    <?php echo $text_to; ?>
                                                </label>
                                                <div class="input-group date col-sm-10">
                                                    <input type="text" name="period[day_to]" value=""
                                                           data-date-format="YYYY-MM-DD" class="form-control">
                                                    <span class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-calendar"></i>
                                            </button>
                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block_month col-sm-12 non-padding holder" style="display: none">
                                            <select class="form-control" name="period[month]">
                                                <?php foreach ($months as $key => $title) { ?>
                                                <option value="<?php echo $key; ?>"><?php echo $title; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="col-sm-12 non-padding">
                                            <button type="button"
                                                    onclick="showAllergens();return false;"
                                                    class="btn btn-primary btn-block">
                                                <?php echo $text_calculate; ?>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<style>
    .panel-heading {
        cursor: pointer;
    }

    .panel-group {
        margin-top: 15px;
    }

    .period {
        padding: 0;
    }

    .label {
        font-size: 100%;
    }

    .non-padding {
        padding: 7px 0 8px 0;
    }

    .progress {
        height: 25px;
    }

    .progress-bar {
        color: #0b0b0b;
    }

    .non-display {
        display: none;
    }

    #summ_info {
        display: none;
        margin-top: 15px;
    }

</style>
<script type="text/javascript"><!--

var token = '<?php echo $token?>';

$('.date').datetimepicker({
    pickTime: false
});

$('.choice').on('change', function () {
    $('.tab-content .active').find('.holder').hide();
    $('.tab-content .active').find('.block_' + $(this).children('option:selected').val()).show();
});

$('#summ').on('click', function () {
    if ($(this).hasClass('btn-default')) {
        $('#average_bill').addClass('btn-default').removeClass('btn-primary');
        $(this).toggleClass('btn-default').toggleClass('btn-primary');
        $('#summ_value').toggleClass('non-display');
        $('#sum_variant').val('sum');
    }
});

$('#average_bill').on('click', function () {
    if ($(this).hasClass('btn-default')) {
        $('#summ').addClass('btn-default').removeClass('btn-primary');
        $(this).toggleClass('btn-default').toggleClass('btn-primary');
        $('#summ_value').addClass('non-display');
        $('#sum_variant').val('average');
    }

});

$('#summ_choice').on('change', function () {
    if ($(this).children('option:selected').val() == 4) {
        $('#summ_info').show();
    } else {
        $('#summ_info').hide();
    }
});




function showBill() {
    $.ajax({
        url: 'index.php?route=statistic/bill/bill&token=' + token,
        type: 'post',
        data: $('#bill_info_form').serialize(),
        dataType: 'json',
        success: function (json) {
            $('#bill_info').html('');
            $('#bill_info').html(json.html)
        }
    });
}

function showProduct() {
    $.ajax({
        url: 'index.php?route=statistic/bill/products&token=' + token,
        type: 'post',
        data: $('#product_info_form').serialize(),
        dataType: 'json',
        success: function (json) {
            $('#product_info').html('');
            $('#product_info').html(json.html)
        }
    });
}

function showAllergens() {
    $.ajax({
        url: 'index.php?route=statistic/bill/allergens&token=' + token,
        type: 'post',
        data: $('#allergens_info_form').serialize(),
        dataType: 'json',
        success: function (json) {
            $('#allergens_info').html('');
            $('#allergens_info').html(json.html)
        }
    });
}

//--></script>
<?php echo $footer;?>