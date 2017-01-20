<?php
class ControllerCommonHeader extends Controller {
	public function index() {

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['lang'] = $this->language->get('code');
		$data['text_select_table'] = $this->language->get('text_select_table');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
        $data['text_welcome'] =  $this->language->get('text_welcome');
        $data['text_table'] =  $this->language->get('text_table');
        $data['text_error_table'] =  $this->language->get('text_error_table');
        $data['text_language'] =  $this->language->get('text_language');
        $data['text_next'] =  $this->language->get('text_next');

        $data['text_turn_screen'] = $this->language->get('text_turn_screen');

        $data['languages'] = array();

        $results = $this->model_localisation_language->getLanguages();
        foreach ($results as $result) {
            if ($result['status']) {
                $data['languages'][] = array(
                    'name' => $result['name'],
                    'code' => $result['code']
                );
            }
        }

        if (isset($this->session->data['table_id'])) {
            $data['table_id'] = $this->session->data['table_id'];
        } else {
            $data['table_id'] = null;
        }

        $this->load->model('localisation/language');

        $data['current_language'] = $this->model_localisation_language->getLanguageByCode();
        $data['redirect_link'] = $this->url->link('common/home/saveAndRedirect');

        if (!isset($this->request->get['route']) || $this->request->get['route'] == '' ||
            $this->request->get['route'] == 'common/home') {
           $data['preloader'] = $this->getPreloader($data);
        } elseif ($this->request->get['route'] == 'product/category' && empty($this->session->data['table_id'])){
            $data['preloader'] = $this->getPreloader($data);
        } else {
            $data['preloader'] = false;
        }

        if (!isset($this->request->get['route']) || $this->request->get['route'] == '' ||
            $this->request->get['route'] == 'information/information') {
            $data['proposals'] = true;
        } else {
            $data['proposals'] = false;
        }

        if (!isset($this->request->get['route']) || $this->request->get['route'] == '' ||
            $this->request->get['route'] == 'checkout/success') {
            $data['success'] = true;
        } else {
            $data['success'] = false;
        }

		return $this->load->view('common/header', $data);
	}

	public function getPreloader($data) {

        return $this->load->view('common/preloader', $data);
    }
}
