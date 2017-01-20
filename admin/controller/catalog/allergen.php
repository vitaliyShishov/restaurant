<?php
class ControllerCatalogAllergen extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/allergen');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/allergen');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/allergen');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/allergen');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_allergen->addAllergen($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/allergen');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/allergen');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_allergen->editAllergen($this->request->get['allergen_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/allergen');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/allergen');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $allergen_id) {
				$this->model_catalog_allergen->deleteAllergen($allergen_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'ad.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/allergen/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/allergen/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['allergens'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$allergen_total = $this->model_catalog_allergen->getTotalAllergens();

		$results = $this->model_catalog_allergen->getAllergens($filter_data);

		foreach ($results as $result) {
			$data['allergens'][] = array(
				'allergen_id'    => $result['allergen_id'],
				'name'            => $result['name'],
				'allergen_group' => $result['allergen_group'],
				'sort_order'      => $result['sort_order'],
				'edit'            => $this->url->link('catalog/allergen/edit', 'token=' . $this->session->data['token'] . '&allergen_id=' . $result['allergen_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_allergen_group'] = $this->language->get('column_allergen_group');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . '&sort=ad.name' . $url, true);
		$data['sort_allergen_group'] = $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . '&sort=allergen_group' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . '&sort=a.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $allergen_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($allergen_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($allergen_total - $this->config->get('config_limit_admin'))) ? $allergen_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $allergen_total, ceil($allergen_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/allergen_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['allergen_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_allergen_group'] = $this->language->get('entry_allergen_group');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['allergen_group'])) {
			$data['error_allergen_group'] = $this->error['allergen_group'];
		} else {
			$data['error_allergen_group'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['allergen_id'])) {
			$data['action'] = $this->url->link('catalog/allergen/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/allergen/edit', 'token=' . $this->session->data['token'] . '&allergen_id=' . $this->request->get['allergen_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/allergen', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['allergen_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$allergen_info = $this->model_catalog_allergen->getAllergen($this->request->get['allergen_id']);
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['allergen_description'])) {
			$data['allergen_description'] = $this->request->post['allergen_description'];
		} elseif (isset($this->request->get['allergen_id'])) {
			$data['allergen_description'] = $this->model_catalog_allergen->getAllergenDescriptions($this->request->get['allergen_id']);
		} else {
			$data['allergen_description'] = array();
		}

		if (isset($this->request->post['allergen_group_id'])) {
			$data['allergen_group_id'] = $this->request->post['allergen_group_id'];
		} elseif (!empty($allergen_info)) {
			$data['allergen_group_id'] = $allergen_info['allergen_group_id'];
		} else {
			$data['allergen_group_id'] = '';
		}

		$this->load->model('catalog/allergen_group');

		$data['allergen_groups'] = $this->model_catalog_allergen_group->getAllergenGroups();

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($allergen_info)) {
			$data['sort_order'] = $allergen_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/allergen_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/allergen')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['allergen_group_id']) {
			$this->error['allergen_group'] = $this->language->get('error_allergen_group');
		}

		foreach ($this->request->post['allergen_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}

		return !$this->error;
	}

//	protected function validateDelete() {
//		if (!$this->user->hasPermission('modify', 'catalog/allergen')) {
//			$this->error['warning'] = $this->language->get('error_permission');
//		}
//
//		$this->load->model('catalog/product');
//
//		foreach ($this->request->post['selected'] as $allergen_id) {
//			$product_total = $this->model_catalog_product->getTotalProductsByAllergenId($allergen_id);
//
//			if ($product_total) {
//				$this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
//			}
//		}
//
//		return !$this->error;
//	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/allergen');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_allergen->getAllergens($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'allergen_id'    => $result['allergen_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'allergen_group' => $result['allergen_group']
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
