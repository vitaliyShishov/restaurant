<?php
class ControllerErrorPermission extends Controller {
    public function index() {
        $this->load->language('error/permission');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_permission'] = $this->language->get('text_permission');


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('error/permission', $data));
    }
}
