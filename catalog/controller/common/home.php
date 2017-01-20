<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

//		$data['column_left'] = $this->load->controller('common/column_left');
//		$data['column_right'] = $this->load->controller('common/column_right');
//		$data['content_top'] = $this->load->controller('common/content_top');
//		$data['content_bottom'] = $this->load->controller('common/content_bottom');
//		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
//        $data['search'] = $this->load->controller('common/search');

		$this->response->setOutput($this->load->view('common/home', $data));
	}

	public function saveAndRedirect() {
	    $json = array();

	    if (isset($this->request->post['language_id'])) {
	        $this->session->data['language'] = $this->request->post['language_id'];
        }

        if (isset($this->request->post['table_id'])) {
	        $this->session->data['table_id'] = $this->request->post['table_id'];
        }

        $json['href'] = $this->url->link('product/category');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
