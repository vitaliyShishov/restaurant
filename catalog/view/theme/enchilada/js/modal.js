;
(function () {
    $(document).ready(function () {

      /*  var CustomScrollSettings = {
            wrapper_selector: '.scroll_container_wrapper',
            container_selector: '.scroll_container',
            container_step_size: 300,

            runner_step: 0,
            runner_marker: true,
            runner_selector: '.scroll_runner',
            step: 0,
        };


        function addScrollListeners() {
            var listeners = ['wheel', 'keydown', 'touchstart', 'touchmove', 'touchend'];
            for (var i = 0; i < listeners.length; i++) {
                window.addEventListener(listeners[i], function (e) {
                    pageScroll(e);
                })
            }
        };


        function pageScroll(e) {
            CustomScrollSettings.direction = ScrollDirection.defineScrollDirection(e);
            ElementsMoving.containerMove();
            ElementsMoving.runnerMove();
        }


        var ElementsDefinition = {

            container: function () {
                return document.querySelector(CustomScrollSettings.container_selector)
            },

            thumb: function () {
                return this.container().parentElement.querySelector(CustomScrollSettings.runner_selector)
            },

        }

        var ElementsSizes = {

            wrapper_height: function (elem) {
                return elem.parentElement.offsetHeight;
            },

            container_height: function (elem) {
                return elem.offsetHeight;
            },

            container_step_size: function () {
                return (100 * CustomScrollSettings.container_step_size / this.container_height(ElementsDefinition.container()))
            },

            runner_step_size: function () {
                return this.container_step_size()
            },

            setRunnerSize: function () {
                container = ElementsDefinition.container();
                ElementsDefinition.thumb().style.height = 100 / this.container_height(container) * this.wrapper_height(container) + "%";
            },

        }


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


        var ElementsMoving = {


            runnerMove: function () {

                var direction = CustomScrollSettings.direction,
                    step_size = ElementsSizes.container_step_size(),
                    runner_marker = CustomScrollSettings.runner_marker,
                    thumb = ElementsDefinition.thumb(),
                    runner_step_size = ElementsSizes.runner_step_size();


                if (direction == 'down') { //-
                    if (runner_marker) {
                        CustomScrollSettings.runner_step += runner_step_size;
                        thumb.style.top = CustomScrollSettings.runner_step + "%";
                    } else {
                        CustomScrollSettings.runner_step = (100 - parseFloat(thumb.style.height));
                        thumb.style.top = CustomScrollSettings.runner_step + "%";
                    }
                } else if (direction == 'up') { //+
                    if (runner_marker) {
                        CustomScrollSettings.runner_step -= runner_step_size;
                        thumb.style.top = CustomScrollSettings.runner_step + "%";
                    } else {
                        CustomScrollSettings.runner_step = 0;
                        thumb.style.top = CustomScrollSettings.runner_step + "%";
                    }
                }
            },


            containerMove: function () {
                var direction = CustomScrollSettings.direction,
                    step_size = CustomScrollSettings.container_step_size,
                    container = ElementsDefinition.container(),
                    wrapper_height = ElementsSizes.wrapper_height(container),
                    container_height = ElementsSizes.container_height(container);

                if (direction == 'down') {
                    if (container_height - wrapper_height + CustomScrollSettings.step > step_size) { //-
                        CustomScrollSettings.runner_marker = true;
                        CustomScrollSettings.step -= step_size;
                        container.style.transform = "translateY(" + CustomScrollSettings.step + "px)";
                    } else {
                        CustomScrollSettings.runner_marker = false;
                        container.style.transform = "translateY(-" + (container_height - wrapper_height) + "px)";
                    }
                } else if (direction == 'up') {
                    if (CustomScrollSettings.step + step_size < 0) {
                        CustomScrollSettings.runner_marker = true;
                        CustomScrollSettings.step += step_size;
                        container.style.transform = "translateY(" + CustomScrollSettings.step + "px)";
                    } else {
                        CustomScrollSettings.runner_marker = false;
                        CustomScrollSettings.step = 0;
                        container.style.transform = "translateY(" + CustomScrollSettings.step + "px)";
                    }
                }
            },

        }





        addScrollListeners();*/

        var window_offset;

        function modalOpen(e) {
            e.preventDefault(); //if trigger is link
            var modal_id = e.target.getAttribute('data-modal-id');
            if (document.getElementById(modal_id)) {

                document.getElementById(modal_id).removeAttribute('hidden');
                var body_width = document.body.offsetWidth;
                window_offset = window.pageYOffset;
                document.body.style.marginRight = window.innerWidth - body_width + "px";
                document.body.style.width = body_width + "px";
                document.body.style.top = "-" + window_offset + "px";
                document.body.classList.add('hidden');
                document.getElementById(modal_id).classList.add('visible');
                console.log(document.getElementById(modal_id).classList)

              //  ElementsSizes.setRunnerSize();

            }

        }

        var modal_window;

        function modalClose(e) {
            var elem = e.target;
            while (!elem.classList.contains('modal')) {
                elem = elem.parentElement;
            }
            modal_window = document.getElementById(elem.id);
            modal_window.classList.remove('visible');
            modal_window.addEventListener('transitionend', modalAfterTransition)
        }

        function modalAfterTransition() {
            if (!modal_window.classList.contains('visible')) {
                modal_window.setAttribute('hidden', '');
                document.body.style.marginRight = 0;
                document.body.style.width = "initial";
                document.body.classList.remove('hidden');
                window.scrollTo(0, window_offset);
            }
        }

        function showItem(e) {
            // Достаем айдишник продукта
            var prod_id = $(this).data('modal-id');
            $.ajax({
                url: 'index.php?route=common/footer/modalWindow',
                type: 'post',
                dataType: 'json',
                data: {
                    product_id: prod_id
                },
                success: function (response) {
                    $('.scroll_container_wrapper').remove();
                    marker = true;
                    $('body').append(response.result);
                    modalOpen(e);
                    setModalCloseButtons();
                }
            });
        }

        function setModalCloseButtons() {
            for (var i = 0; i < document.querySelectorAll('.modal_close').length; i++) {
                document.querySelectorAll('.modal_close')[i].addEventListener('click', modalClose);
            }
            for (var i = 0; i < document.querySelectorAll('.modal_single_product_order').length; i++) {
                document.querySelectorAll('.modal_single_product_order')[i].addEventListener('click', modalClose);
            }
        }

        function setModalButton() {
            for (var i = 0; i < document.getElementsByClassName('cat_info').length; i++) {
                document.getElementsByClassName('cat_info')[i].addEventListener('click', showItem);
            }
            for (var i = 0; i < document.getElementsByClassName('modal_trigger').length; i++) {
                document.getElementsByClassName('modal_trigger')[i].addEventListener('click', modalOpen);
            }
            for (var i = 0; i < document.querySelectorAll('.modal_close').length; i++) {
                document.querySelectorAll('.modal_close')[i].addEventListener('click', modalClose);
            }
        }

        setModalButton()

    });
})();

