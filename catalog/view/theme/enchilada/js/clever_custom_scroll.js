$('.tab').on('click', function () {
    scrollInit()
})

function addScrollListeners() {
    var listeners = ['wheel', 'keydown', 'touchstart', 'touchmove', 'touchend'];
    for (var i = 0; i < listeners.length; i++) {
        window.addEventListener(listeners[i], function (e) {
            pageScroll(e);
        })
    }
};


addScrollListeners();

var direction;

function pageScroll(e) {
    direction = ScrollDirection.defineScrollDirection(e);
    console.log(direction);
    containerMove();
    runnerMove();
}


function defineContainer() {
    return document.querySelector(container_selector)
}

function defineThumb() {
    return defineContainer().parentElement.querySelector(runner_selector)
}




/* Scroll Direction */

var ScrollDirection = {

    getKeyCode: function (e) {
        if (e.keyCode == 40) {
            return 'down'
        } else if (e.keyCode == 38) {
            return 'up'
        }
    },

    getTouchCoord: function (e) {
        return e.touches[0].clientY
    },

    getSwipeDirection: function (e) {
        if (e.type == 'touchstart') {
            this.firstCoord = this.getTouchCoord(e);
        } else if (e.type == 'touchmove') {
            this.lastCoord = this.getTouchCoord(e);
        } else if (e.type == 'touchend') {
            if (this.lastCoord - this.firstCoord > 10) {
                return 'up';
            } else if (this.lastCoord - this.firstCoord < -10) {
                return 'down';
            }
        }
    },

    getWheelDirection: function (e) {
        if (e.deltaY > 0) {
            return 'down'
        } else if (e.deltaY < 0) {
            return 'up'
        }
    },

    defineScrollDirection: function (e) {
        if (e.type == "keydown") {
            return this.getKeyCode(e);
        } else if (e.type == "touchstart" || e.type == "touchmove" || e.type == "touchend") {
            return this.getSwipeDirection(e);
        } else if (e.type == "wheel") {
            return this.getWheelDirection(e);
        }
    },

}




function runnerMove() {
    step_size = define_container_step_size();
    runner_marker = runner_marker;
    thumb = defineThumb();
    runner_step_size = define_runner_step_size();


    if (direction == 'down') { //-
        if (runner_marker) {
            runner_step += runner_step_size;
            thumb.style.top = runner_step + "%";
        } else {
            runner_step = (100 - parseFloat(thumb.style.height));
            thumb.style.top = runner_step + "%";
        }
    } else if (direction == 'up') { //+
        if (runner_marker) {
            runner_step -= runner_step_size;
            thumb.style.top = runner_step + "%";
        } else {
            runner_step = 0;
            thumb.style.top = runner_step + "%";
        }
    }
};


function containerMove() {
    step_size = container_step_size;
    container = defineContainer();
    wrapper_height = define_wrapper_height(container);
    container_height = define_container_height(container);
    
    if (direction == 'down') {
        if (container_height - wrapper_height + step > step_size) { //-  
            runner_marker = true;
            step -= step_size;
            container.style.transform = "translateY(" + step + "px)";
        } else {
            runner_marker = false;
            container.style.transform = "translateY(-" + (container_height - wrapper_height) + "px)";
        }
    } else if (direction == 'up') {
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



function scrollInit() {  
    if (tab_index == "tab_1") {
        define_scroll_elems('.tab_1_content');
        setRunnerSize();
    } else if (tab_index == "tab_2") {
        define_scroll_elems('.tab_2_content');
        setRunnerSize();
    } else if (tab_index == "tab_3") {
        define_scroll_elems('.tab_3_content');
        setRunnerSize();
    }
}
scrollInit()




var container_step_size = 300,
    /* Amount of scrolling pictures */
    runner_step = 0,
    runner_marker = true,
    step = 0,
    direction;


var wrapper_selector, container_selector, runner_selector;

function define_scroll_elems(tab) {
    var selector = tab;
    wrapper_selector = selector;
    container_selector = selector + ' ' + '.scroll_container';
    runner_selector = selector + ' ' + '.scroll_runner';

}


/* Define Scroll */


function define_wrapper_height(elem) {
    return elem.parentElement.offsetHeight;
};

function define_container_height(elem) {
    return elem.offsetHeight;
};

function define_container_step_size() {
    return (100 * container_step_size / define_container_height(defineContainer()))
};

function define_runner_step_size() {
    return define_container_step_size()
};

function setRunnerSize() {   
    container = defineContainer();
    defineThumb().style.height = 100 / define_container_height(container) * define_wrapper_height(container) + "%";
};