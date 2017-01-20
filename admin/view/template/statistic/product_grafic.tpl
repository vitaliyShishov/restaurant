
    <div id="div_<?php echo $post['product_id']; ?>" style="height:400px;width: 600px; "></div>
<script>
            var line = [];
        <?php foreach ($post['item'] as $single_item) { ?>
                line.push(<?php echo json_encode($single_item); ?>)
            <?php } ?>
            var plot1 = $.jqplot('<?php echo "div_" . $post['product_id']; ?>', [line], {
                title:'<?php echo $text_graphical_display; ?>',
                axes:{
                    xaxis:{
                        renderer:$.jqplot.DateAxisRenderer,
                        tickOptions:{
                            formatString:'%b&nbsp;%#d'
                        },
                        label:'<?php echo $text_date; ?>'
                    },
                    yaxis:{
                        tickOptions:{
                            formatString:'%.0f'
                        },
                        labelRenderer : $.jqplot.CanvasAxisLabelRenderer,
                        label:'<?php echo $text_quantity; ?>'
                    }
                },
                highlighter: {
                    show: true,
                    sizeAdjust: 7.5
                },
                cursor: {
                    show: false
                }
            });
</script>