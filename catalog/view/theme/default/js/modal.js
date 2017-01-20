;
(function () {
    var window_offset;
    function modalOpen(e) {
        e.preventDefault(); //if trigger is link
        var modal_id = e.target.getAttribute('data-modal-id');
        document.getElementById(modal_id).removeAttribute('hidden');
        var body_width = document.body.offsetWidth;
        window_offset = window.pageYOffset;
        document.body.style.marginRight = window.innerWidth - body_width + "px";
        document.body.style.width = body_width + "px";
        document.body.style.top = "-" + window_offset + "px";
        document.body.classList.add('hidden');
        document.getElementById(modal_id).classList.add('visible');

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
    function setModalButton() {
        for (var i = 0; i < document.getElementsByClassName('modal_trigger').length; i++) {
            document.getElementsByClassName('modal_trigger')[i].addEventListener('click', modalOpen);
        }
        for (var i = 0; i < document.querySelectorAll('.modal_close').length; i++) {
            document.querySelectorAll('.modal_close')[i].addEventListener('click', modalClose);
        }
    }
    setModalButton()

})();

