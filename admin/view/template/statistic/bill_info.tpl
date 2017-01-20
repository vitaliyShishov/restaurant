<div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_data; ?></h3>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        <?php if ($info['flag']) { ?>
        <div class="col-sm-6 non-padding">
            <h3>
                <?php echo $text_general_information; ?>
            </h3>
            <div class="col-sm-12 non-padding">
                <div class="col-sm-5">
                    <p><?php echo $text_date; ?></p>
                </div>
                <div class="col-sm-7">
                    <span class="label label-default"><?php echo $info['date']; ?></span>
                </div>
            </div>
            <div class="col-sm-12 non-padding">
                <div class="col-sm-5">
                    <p href="#"><?php echo $text_average_check; ?></p>
                </div>
                <div class="col-sm-7">
                    <span class="label label-primary"><?php echo $info['check']; ?></span>
                </div>
            </div>
            <div class="col-sm-12 non-padding">
                <div class="col-sm-5">
                    <p href="#"><?php echo $text_order_amount; ?></p>
                </div>
                <div class="col-sm-7">
                    <span class="label label-info"><?php echo $info['amount']; ?></span>
                </div>
            </div>
            <div class="col-sm-12 non-padding">
                <div class="col-sm-5">
                    <p href="#"><?php echo $text_max_order; ?></p>
                </div>
                <div class="col-sm-7">
                    <span class="label label-success"><?php echo $info['max']; ?></span>
                </div>
            </div>
            <div class="col-sm-12 non-padding">
                <div class="col-sm-5">
                    <p href="#"><?php echo $text_min_order; ?></p>
                </div>
                <div class="col-sm-7">
                    <span class="label label-warning"><?php echo $info['min']; ?></span>
                </div>
            </div>
        </div>
        <?php if (!empty($payment['card']) && !empty($payment['cash'])) { ?>
            <div class="col-sm-6 non-padding">
                <h3>
                    <?php echo $text_payment_method; ?>
                </h3>

                <div class="col-sm-12 non-padding">
                    <div id="pie1" style="height: 200px;width: 300px; "></div>
                </div>
            </div>
        <?php } ?>
        <?php if (!empty($filters)) { ?>
        <div class="col-sm-6 non-padding">
            <h3>
                <?php echo $text_filters_info; ?>
            </h3>

            <div class="col-sm-12 non-padding">
                <div id="pie2" style="height: 200px;width: 300px; "></div>
            </div>
        </div>
        <?php } ?>
        <?php if (!empty($product_choice)) { ?>
        <div class="col-sm-6 non-padding">
            <h3>
                <?php echo $text_products_choice; ?>
            </h3>

            <div class="col-sm-12 non-padding">
                <div id="pie3" style="height: 200px;width: 300px; "></div>
            </div>
        </div>
        <?php } ?>
        <?php if ($info['graphic']) { ?>
            <div class="col-sm-12">
                <div id="chartdiv" style="height:400px;width: 600px; "></div>
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
    $(document).ready(function() {
        <?php if ($info['graphic'] && $info['graphic_type'] == 'average') { ?>
    var line = [];
        <?php foreach ($graphic as $item) { ?>
            line.push(<?php echo json_encode($item); ?>)
        <?php } ?>

    var plot1 = $.jqplot('chartdiv', [line], {
        title:'<?php echo $text_graphical_display; ?>',
        axes:{
            xaxis:{
                renderer:$.jqplot.DateAxisRenderer,
                tickOptions:{
                    formatString:'%b&nbsp;%#d'
                },
                label: '<?php echo $text_date; ?>'
            },
            yaxis:{
                tickOptions:{
                    formatString:'%.2f €'
                },
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                label: '<?php echo $text_sum; ?>'
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
<?php } ?>
        <?php if ($info['graphic'] && $info['graphic_type'] == 'sum') { ?>
            var line = [];
        <?php foreach ($graphic as $item) { ?>
                line.push(<?php echo json_encode($item); ?>)
            <?php } ?>
    var plot1 = $.jqplot('chartdiv', [line], {
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
                label:'<?php echo $text_order_amount; ?>'
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
        <?php } ?>
        <?php if (!empty($payment['card']) && !empty($payment['cash'])) { ?>
        var plot1 = $.jqplot('pie1', [[<?php echo json_encode($payment['card']); ?>,<?php echo json_encode($payment['cash']); ?>]], {
            gridPadding: {top:0, bottom:12, left:0, right:0},
            seriesDefaults:{
                renderer:$.jqplot.PieRenderer,
                trendline:{ show:false },
                rendererOptions: { padding: 10, showDataLabels: true }
            },
            legend:{
                show:true
            }
        });
            <?php } ?>

        <?php if (!empty($filters)) { ?>
            var plot2 = $.jqplot('pie2', [[<?php echo json_encode($filters['price']); ?>,<?php echo json_encode($filters['kcal']); ?>, <?php echo json_encode($filters['ingredients']); ?>, <?php echo json_encode($filters['allergens']); ?>]], {
                gridPadding: {top:0, bottom:12, left:0, right:0},
                seriesDefaults:{
                    renderer:$.jqplot.PieRenderer,
                            trendline:{ show:false },
                    rendererOptions: { padding: 10, showDataLabels: true }
                },
                legend:{
                    show:true
                }
            });
        <?php } ?>
        <?php if (!empty($product_choice)) { ?>
            var plot3 = $.jqplot('pie3', [[<?php echo json_encode($product_choice['food']); ?>,<?php echo json_encode($product_choice['drink']); ?>, <?php echo json_encode($product_choice['food_drink']); ?>]], {
                gridPadding: {top:0, bottom:12, left:0, right:0},
                seriesDefaults:{
                    renderer:$.jqplot.PieRenderer,
                            trendline:{ show:false },
                    rendererOptions: { padding: 10, showDataLabels: true }
                },
                legend:{
                    show:true
                }
            });

    temp = {
        seriesStyles: {
            seriesColors: ['lightgreen', 'orange'],
            highlightColors: ['red', 'lightpink']
        },
        legend: {
            fontSize: '8pt'
        },
        title: {
            fontSize: '18pt'
        },
        grid: {
            backgroundColor: 'rgb(211, 233, 195)'
        }
    };

            temp1 = {
                seriesStyles: {
                    seriesColors: ['silver', 'orange', 'yellow', 'hotpink'],
                    highlightColors: ['lightpink', 'lightsalmon', 'lightyellow', 'lightgreen', 'lightblue', 'mediumslateblue']
                },
                legend: {
                    fontSize: '8pt'
                },
                title: {
                    fontSize: '18pt'
                },
                grid: {
                    backgroundColor: 'rgb(211, 233, 195)'
                }
            };

            temp2 = {
                seriesStyles: {
                    seriesColors: ['salmon', 'cyan', 'chocolate'],
                    highlightColors: ['lightpink', 'lightblue', 'lightgreen']
                },
                legend: {
                    fontSize: '8pt'
                },
                title: {
                    fontSize: '18pt'
                },
                grid: {
                    backgroundColor: 'rgb(211, 233, 195)'
                }
            };

    plot1.themeEngine.newTheme('uma', temp);
    plot2.themeEngine.newTheme('uma', temp1);
    plot3.themeEngine.newTheme('uma', temp2);
            plot1.activateTheme('uma');
            plot2.activateTheme('uma');
            plot3.activateTheme('uma');
        <?php } ?>
    });
</script>