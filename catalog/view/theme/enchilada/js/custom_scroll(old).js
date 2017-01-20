;
(function () {

    var step_size = 300; /* Amount of scrolling pictures */

    /* Define scroll container */

    var container;

    function defineScrollContainer(e) {
        if (document.querySelector('.scroll_container')) {
            container = e.target;
            while (!container.classList.contains('scroll_container')) {
                if (container.tagName == 'BODY') {
                    break
                }
                container = container.parentElement;
            }
            if (container.tagName == 'BODY') {
                container = false
            }
        }
    }

    /* Define container height */

    function defineContainerHeight(elem) {
        return elem.offsetHeight;
    }

    /* Define wrapper height */

    function defineWrapperHeight(elem) {
        return elem.parentElement.offsetHeight;
    }




    var containers = document.querySelectorAll('.scroll_container');

    for (var i = 0; i < containers.length; i++) {

        // Set size of scroll runner 

        var runner = containers[i].parentElement.querySelector('.scroll_runner');

        function setRunnerHeight() {
            runner.style.height = 100 / defineContainerHeight(containers[i]) * defineWrapperHeight(containers[i]) + "%";
        }

        setRunnerHeight()
    }



    /* Set runner sizes on all containers 
          
          var containers = document.querySelectorAll('.scroll_container');

        for (var i = 0; i < containers.length; i++) {

            // Set size of scroll runner 

            var runner = containers[i].parentElement.querySelector('.scroll_runner');

            function setRunnerHeight() {
                runner.style.height = 100 / defineContainerHeight(containers[i]) * defineWrapperHeight(containers[i]) + "%";
            }

            setRunnerHeight()
        }*/




    /* Manage container */

    var step = 0;

    function containerMove(step_size) {
        if (direction == 'to_top') { //-
            if (defineContainerHeight(container) - defineWrapperHeight(container) + step > step_size) { //-  
                runner_marker = true;
                step -= step_size;
                container.style.transform = "translateY(" + step + "px)";
            } else {
                runner_marker = false;
                container.style.transform = "translateY(-" + (defineContainerHeight(container) - defineWrapperHeight(container)) + "px)";
            }
        } else if (direction == 'to_bottom') { //+
            if (step + step_size < 0) {
                runner_marker = true;
                step += step_size;
                container.style.transform = "translateY(" + step + "px)";
            } else {
                runner_marker = false;
                step = 0;
                container.style.transform = "translateY(" + step + "px)";
            }
        }
    }


    /* Manage scroll runner */

    var runner_step = 0,
        runner_marker = true;

    function runnerMove(step_size) {

        var runner = container.parentElement.querySelector('.scroll_runner'),
            runner_step_size = 100 / defineContainerHeight(container) * step_size;

        if (direction == 'to_top') { //-
            if (runner_marker) {
                runner_step += runner_step_size;
                runner.style.top = runner_step + "%";
            } else {
                runner_step = (100 - parseFloat(runner.style.height));
                runner.style.top = runner_step + "%";
            }
        } else if (direction == 'to_bottom') { //+
            if (runner_marker) {
                runner_step -= runner_step_size;
                runner.style.top = runner_step + "%";
            } else {
                runner_step = 0;
                runner.style.top = runner_step + "%";
            }
        }
    }


    /* Catch touch */

    function containerTouch() {

        document.addEventListener('touchstart', takeCoords);
        document.addEventListener('touchmove', takeCoords);
        document.addEventListener('touchend', takeCoords);

    }



    var x1, x2;

    function takeCoords(e) {

        if ($('.scroll_container').height()) {
            defineScrollContainer(e);
            if (container) {

                if (e.type == "touchstart") {
                    x1 = e.touches[0].clientY;
                } else if (e.type == "touchmove") {
                    x2 = e.touches[0].clientY;
                } else if (e.type == "touchend") {
                    calcTouchDifference(e);
                }
            }
        }
    }

    var direction;

    function calcTouchDifference(e) {

        direction = null;
        var difference = x1 - x2;

        if (x1 > x2 && difference > 10 && x2 !== 0) {
            direction = 'to_top';
            x1 = 0;
            x2 = 0;
        } else if (x2 > x1 && difference < -10) {
            direction = 'to_bottom';
            x1 = 0;
            x2 = 0;
        }


        if (direction !== null) {
            containerMove(step_size);
            runnerMove(step_size);
        }
    }

    containerTouch()

})();