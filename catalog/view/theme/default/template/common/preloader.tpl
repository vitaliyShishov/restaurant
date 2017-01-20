<div class="preloader">
    <div class="preloader_header">
        <img src="catalog/view/theme/default/images/header_image.jpg" alt=" ">
        <div class="preloader_line"></div>
        <div class="preloader_logo"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?> "></div>
    </div>
    <div class="preloader_bg">
        <div class="preloader_wait">
            <div class="preloader_circle">
                <img src="catalog/view/theme/default/images/preloader.png" alt=" ">
            </div>
            <div class="preloader_text"><?php echo $text_wait; ?>
            </div>
        </div>
        <div class="select_table">
            <div class="select_table_title"><?php echo $text_welcome; ?>
            </div>
            <div class="select_table_number">
                <label for=""><?php echo $text_table; ?>
                    <br>
                    <input type="text">
                </label>
            </div>
            <div class="select_language">
                <span><?php echo $text_language; ?></span>
                <br>
                <div class="lang_wrapper">
                    <div class="lang">
                        <span><?php echo $current_language['name']; ?></span>
                        <img src="catalog/language/<?php echo $current_language['code']; ?>/<?php echo $current_language['code']; ?>.png" alt=" ">
                    </div>
                    <div class="down_arrow"></div>
                </div>
            </div>

            <div class="select_table_next"><div class="next_animation"></div>
                <div class="next">
                    <a href="<?php echo $redirect_link; ?>"><?php echo $text_next; ?></a>
                    <div class="right_arrow"></div>
                </div>

            </div>
        </div>
    </div>
    <div class="pop_langs">
        <div class="internal_lang_wrapper">
            <div class="lang">
                <?php echo $language; ?>
            </div>
        </div>

    </div>
</div>