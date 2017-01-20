<div class="col-sm-12 non-padding">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_data; ?></h3>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <?php if (!empty($allergens)) { ?>
            <h3>
                <?php echo $text_allergens_info; ?>
            </h3>

            <div id="pie5" style="height: 800px; width: 650px; "></div>
            <?php } else { ?>
            <div class="col-sm-12">
                <p class="text-center"><?php echo $text_no_results; ?></p>
            </div>
            <?php } ?>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {

        <?php if (!empty($allergens)) { ?>
            plot3 = jQuery.jqplot('pie5',
                    [[
                      <?php foreach ($allergens as $item) { ?>
                            <?php echo json_encode($item); ?>,
                        <?php } ?>
                    ]],
                    {
                        seriesDefaults: {
                            renderer: jQuery.jqplot.PieRenderer,
                            shadow: false,
                            rendererOptions: {
                                sliceMargin: 4,
                                showDataLabels: true
                            }
                        },
                        legend: { show:true, location: 'e' },
                        highlighter: {
                            show: true,
                                    useAxesFormatters: false,
                                    tooltipFormatString: '%s'
                        }
                    }
            );

<?php } ?>
    });
</script>
<style>
    table.jqplot-table-legend,
    table.jqplot-cursor-legend {
        font-size: 1.0em;
    }
</style>