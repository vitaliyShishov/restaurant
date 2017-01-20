<?php

class ControllerCheckoutCart extends Controller
{
    public function index()
    {
        $this->load->language('common/cart');

        $this->load->model('tool/image');

        $data['text_just_cart']       = $this->language->get('text_just_cart');
        $data['text_pay_total']       = $this->language->get('text_pay_total');
        $data['text_quantity']        = $this->language->get('text_quantity');
        $data['text_comment']         = $this->language->get('text_comment');
        $data['button_hide']          = $this->language->get('button_hide');
        $data['button_pay_cash']      = $this->language->get('button_pay_cash');
        $data['button_pay_terminal']  = $this->language->get('button_pay_terminal');
        $data['button_checkout']      = $this->language->get('button_checkout');

        if (isset($this->request->post['comment'])) {
            $this->session->data['comment'] = $this->request->post['comment'];
        } // не работает...

        $data['products'] = array();

        $cart_products = array();

        $products = $this->cart->getProducts();

        foreach ($products as $product) {

            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], 93, 93);
            } else {
                $image = '';
            }


            $unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));

            $price = $this->currency->format($unit_price, $this->session->data['currency']);
            $total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);

            $cart_products[] = array(
                'id' => $product['product_id'],
                'name' => $product['name'],
                'image' => $image,
                'quantity' => $product['quantity'],
                'price' => $price,
                'total' => $total,
                'comment' => ''
            );
        }

        $data['cart_products'] = htmlspecialchars(json_encode($this->session->data['cart']));
        $data['products'] = htmlspecialchars(json_encode($cart_products));
        $data['total_cart'] = htmlspecialchars(json_encode($this->currency->format($this->cart->getTotal(), $this->config->get('config_currency'))));

        return $this->load->view('checkout/cart', $data);
    }

    public function add()
    {
        $this->load->language('checkout/cart');

        $json = array();

        if (isset($this->request->post['product_id'])) {
            $product_id = (int)$this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        if (isset($this->request->post['quantity'])) {
            $quantity = (int)$this->request->post['quantity'];
        } else {
            $quantity = 1;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {
            $this->cart->add($this->request->post['product_id'], $quantity);
            $json['total_cart'] = $this->currency->format($this->cart->getTotal(), $this->config->get('config_currency'));
            $json['success'] = true;
        } else {
            $json = false;
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function edit()
    {
        $json = array();

        $key = $this->request->post['product_id'];

        $this->cart->update($this->request->post['product_id'], $this->request->post['quantity']);

        $json['total_cart'] = $this->currency->format($this->cart->getTotal(), $this->config->get('config_currency'));

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function delete() {
        $json = array();

        $this->cart->remove($this->request->post['product_id']);

        $json['total_cart'] = $this->currency->format($this->cart->getTotal(), $this->config->get('config_currency'));

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function getProducts() {
        $this->load->model('tool/image');

        $json = array();

        $cart_products = array();

        $products = $this->cart->getProducts();

        foreach ($products as $product) {

            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], 93, 93);
            } else {
                $image = '';
            }


            $unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));

            $price = $this->currency->format($unit_price, $this->session->data['currency']);
            $total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);

            $cart_products[] = array(
                'id' => $product['product_id'],
                'name' => $product['name'],
                'image' => $image,
                'quantity' => $product['quantity'],
                'price' => $price,
                'total' => $total
            );
        }

        $json['products'] = $cart_products;

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
