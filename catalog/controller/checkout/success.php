<?php

class ControllerCheckoutSuccess extends Controller
{
    public function index()
    {
        $this->cart->clear();

        $this->load->language('checkout/success');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_gratitude'] = $this->language->get('text_gratitude');

//		if ($this->customer->isLogged()) {
//			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
//		} else {
//			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
//		}

        $data['text_table_id'] = $this->language->get('text_table_id');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_share_header'] = $this->language->get('text_share_header');
        $data['text_share_text'] = $this->language->get('text_share_text');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['text_turn_screen'] = $this->language->get('text_turn_screen');
        $data['text_wait'] = $this->language->get('text_wait');

        $data['continue'] = $this->url->link('common/home');
        $data['order_id'] = $this->session->data['order_id'];
        $data['table_id'] = isset($this->session->data['table_id']) ? $this->session->data['table_id'] : 1;

        $data['header'] = $this->load->controller('common/header');

        if (isset($this->session->data['order_id'])) {
            $this->response->setOutput($this->load->view('common/success', $data));
        } else {
            $this->response->redirect($this->url->link('common/home'));
        }
    }
}