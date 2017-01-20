<?php
class ControllerCommonFooter extends Controller {
	public function index($products) {

        $this->load->language('common/footer');
        $this->load->language('common/cart');

        $data['scripts'] = $this->document->getScripts('footer');

		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
        $data['text_cart'] = $this->language->get('text_cart');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_buy'] = $this->language->get('text_buy');
        $data['text_weight'] = $this->language->get('text_weight');
        $data['text_weight_class1'] = $this->language->get('text_weight_class1');
        $data['text_weight_class2'] = $this->language->get('text_weight_class2');
        $data['account_name'] = $this->language->get('account_name');
        $data['account_points'] = $this->language->get('account_points');
        $data['account_timer'] = $this->language->get('account_timer');
        $data['information_points'] = $this->language->get('information_points');
        $data['information_points_text'] = $this->language->get('information_points_text');
        $data['information_get_points'] = $this->language->get('information_get_points');
        $data['information_get_points_text'] = $this->language->get('information_get_points_text');
        $data['information_offers'] = $this->language->get('information_offers');
        $data['information_about_us'] = $this->language->get('information_about_us');
        $data['filter_text'] = $this->language->get('filter_text');
        $data['filter_price'] = $this->language->get('filter_price');
        $data['filter_to'] = $this->language->get('filter_to');
        $data['filter_calories'] = $this->language->get('filter_calories');
        $data['filter_ingredients'] = $this->language->get('filter_ingredients');
        $data['filter_allergens'] = $this->language->get('filter_allergens');
        $data['filter_results'] = $this->language->get('filter_results');
        $data['filter_category'] = $this->language->get('filter_category');
        $data['confirm_text'] = $this->language->get('confirm_text');
        $data['confirm_warning'] = $this->language->get('confirm_warning');
        $data['confirm_summ'] = $this->language->get('confirm_summ');
        $data['confirm_confirm'] = $this->language->get('confirm_confirm');
        $data['confirm_edit'] = $this->language->get('confirm_edit');

        // $data['cart'] = $this->load->controller('common/cart');

        $this->load->model('catalog/product');

        $data['products'] = $products;

        $data['allergen_list'] = $this->model_catalog_product->getAllergenList();

        $ingredients = $this->model_catalog_product->getIngredientList();

        $data['ingredients'] = htmlspecialchars(json_encode($ingredients));
        $data['allergens'] = htmlspecialchars(json_encode($data['allergen_list']));
        $data['total_cart'] = $this->currency->format($this->cart->getTotal(), $this->config->get('config_currency'));
		$data['cart'] = $this->load->controller('checkout/cart');
        return $this->load->view('common/footer', $data);
	}

    public function modalWindow()
    {

        $this->load->language('common/footer');

        $data['text_price'] = $this->language->get('text_price');
        $data['text_buy'] = $this->language->get('text_buy');
        $data['text_weight'] = $this->language->get('text_weight');
        $data['text_weight_class1'] = $this->language->get('text_weight_class1'); //вес в граммах/килограммах
        $data['text_weight_class2'] = $this->language->get('text_weight_class2');

        $this->load->model('catalog/product');
        $data['allergen_list'] = $this->model_catalog_product->getAllergenList();


        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = null;
        }

        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $product = $this->model_catalog_product->getProduct($product_id);

        //echo "<pre>"; var_dump($product); die;

        $data['ingredients'] = $this->model_catalog_product->getIngredients($product_id);

        $data['product'] = array(
            'id' => $product['product_id'],
            'image' => $this->HTTP_SERVER . 'image/' . $product['image'],
            'name' => $product['name'],
            'weight' => (int)$product['weight'],
            'price' => $product['price'],
            'weight_class_id' => $product['weight_class_id']
        );

        $json['result'] = $this->load->view('common/modal_window', $data);

        echo json_encode($json);
    }
}
