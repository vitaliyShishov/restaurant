<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="catalog/view/theme/enchilada/stylesheets/style.css">
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/enchilada/slick/slick.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script  type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script  type="text/javascript" src="catalog/view/theme/enchilada/slick/slick.min.js"></script>

    <script defer src="catalog/view/theme/enchilada/js/script.js"></script>
    <script defer src="catalog/view/theme/enchilada/range/jquery.range.js"></script>
    <script defer src="catalog/view/theme/enchilada/js/external_scripts.js"></script>

    <script defer src="catalog/view/theme/enchilada/js/filters.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.js"></script>
    <script src="catalog/view/theme/enchilada/angular/app.js"></script>
    <script src="catalog/view/theme/enchilada/angular/services/categoryPageService.js"></script>
    <script src="catalog/view/theme/enchilada/angular/controllers/categoryPage.js"></script>
    <script src="catalog/view/theme/enchilada/angular/controllers/footerCart.js"></script>
    <script src="catalog/view/theme/enchilada/angular/controllers/footerProduct.js"></script>
    <script src="catalog/view/theme/enchilada/angular/controllers/footerFilter.js"></script>



</head>
<body ng-app="categoryPage">
    <?php if ($preloader) { ?>
        <?php echo $preloader; ?>
    <?php } else if ($proposals) { ?>
        <header class="main_header">
            <div class="menu_button_back" style="background-image: url('catalog/view/theme/enchilada/images/small_arrow.png');
             background-repeat:  no-repeat; background-position:  center; background-size:  contain; width: 100px; height: 20px;
              position: absolute; top:0; bottom:0; margin:auto; left: 10px;"><a href="index.php?route=product/category" style="display: block; width: 100%; height: 100%;"></a></div>
            <div class="header_line"></div>
            <div class="header_logo"><a href="index.php?route=product/category"><img src="<?php echo $logo; ?>" alt=" "></a>
            </div>
        </header>
    <?php } else if ($success) { ?>
    <header class="main_header">
        <div class="header_line"></div>
        <div class="header_logo"><a href="index.php?route=common/home"><img src="<?php echo $logo; ?>" alt=" "></a>
        </div>
    </header>
    <?php } else { ?>
        <header class="main_header">
            <div class="menu_button modal_trigger" data-modal-id="modal_full_sidebar"></div>
            <div class="filter_button modal_trigger" data-modal-id="modal_filters"></div>
            <div class="header_line"></div>
            <div class="header_logo"><img src="<?php echo $logo; ?>" alt=" "></div>
        </header>
    <?php } ?>
