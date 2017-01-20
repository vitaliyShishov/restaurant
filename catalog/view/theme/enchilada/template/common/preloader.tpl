<div class="landscape_warning">
    <div><?php echo $text_turn_screen; ?></div>
</div>
<div class="preloader">
    <div class="preloader_header">
        <div class="preloader_header_bg"></div>
        <div class="preloader_line"></div>
        <div class="preloader_logo"><img src="<?php echo $logo; ?>" alt=" "></div>
    </div>
    <div class="preloader_bg">

        <div class="select_table_title"><?php echo $text_welcome;?>
        </div>
        <div class="select_table_number">
            <label for="table_id"><?php echo $text_table;?>
                <br>
                <input type="text" id="table_id" value="<?php echo $table_id; ?>">
            </label>
            <span class="table-error" style="display: none; font-size: 16px; color: #ff0000;"><?php echo $text_error_table; ?></span>
        </div>
        <div class="select_language">
            <span><?php echo $text_language;?></span>
            <br>
            <div class="lang_wrapper">
                <?php foreach ($languages as $language){ ?>
                    <?php if ($language['code'] == $current_language['code']) { ?>
                        <div class="lang">
                            <span><?php echo $language['name']; ?></span>
                            <img src="<?php echo HTTP_SERVER . 'image/catalog/' . $language['code'] . '.jpg'; ?>" alt=" ">
                            <input type="hidden" value="<?php echo $language['code']; ?>" id="language_id">
                        </div>
                    <?php } ?>
                <?php } ?>
                <div class="down_arrow"></div>
            </div>
        </div>
        <div class="empty"></div>
        <a href="javascript:void(0);" id="continue_button">
            <div class="select_table_next">
                <div class="next_animation"></div>
                <div class="next"><?php echo $text_next;?>
                    <div class="right_arrow"></div>
                </div>

            </div>
        </a>

    </div>
    <div class="pop_langs">
        <div class="internal_lang_wrapper">
            <?php foreach ($languages as $language){ ?>
            <div class="lang">
                <span><?php echo $language['name']; ?></span>
                <img src="<?php echo HTTP_SERVER . 'image/catalog/' . $language['code'] . '.jpg'; ?>" alt=" ">
                <input type="hidden" value="<?php echo $language['code']; ?>">
            </div>
            <?php } ?>
        </div>
    </div>
</div>