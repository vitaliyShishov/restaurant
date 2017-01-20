<?php

class ControllerProductCategory extends Controller
{
    public function index()
    {
        $this->load->language('product/category');

        $data['text_turn_screen'] = $this->language->get('text_turn_screen');

        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $data['tree'] = array();
        $tree = array();

        $top_categories = $this->model_catalog_category->getCategories();

        $products_for_footer = array();

        foreach ($top_categories as $parent) {
            $second_level = $this->model_catalog_category->getCategories($parent['category_id']);

            $child_array = array();

            foreach ($second_level as $child) {
                $temp_products = $this->model_catalog_product->getProducts(array(), $child['category_id']);

            //echo "<pre>"; var_dump($temp_products); die;
                $products = array();
                foreach ($temp_products as $key => $product) {

                    $cart_products = isset($this->session->data['cart']) ? $this->session->data['cart'] : array();

                    $quantity = array_key_exists($product['product_id'], $cart_products) ? $cart_products[$product['product_id']] : 0;

                    if ($product['image'] && file_exists(DIR_IMAGE . $product['image'])) {
                        $image = $product['image'];
                    } else {
                        $image = 'no_image.png';
                    }

                    $price = $this->currency->format($product['price'], $this->config->get('config_currency'));

                    $ingredients = $this->model_catalog_product->getIngredients($product['product_id']);

                    $allergens = array();

                    foreach ($ingredients as $i_item) {
                        if (empty($i_item['allergen'])) {
                            continue;
                        }

                        foreach ($i_item['allergen'] as $a_item) {
                            if (!in_array($a_item['id'], $allergens)) {
                                $allergens[] = $a_item['id'];
                            }
                        }
                    }

                    $products[] = array(
                        'id' => $product['product_id'],
                        'name' => $product['name'],
                        'price' => $price,
                        'filter_price' => (int)$product['price'],
                        'ingredients' => $ingredients,
                        'allergens' => $allergens,
                        'quantity' => $quantity,
                        'flag' => true,
                        'image' => $this->model_tool_image->resize($image, 300, 300),
                        'energy' => $product['energy_value'],
                        'is_vegan' => $product['is_vegan']
                    );

                    $products_for_footer[] = array(
                        'id' => $product['product_id'],
                        'name' => $product['name'],
                        'image' => $this->model_tool_image->resize($image, 700, 500),
                        'price' => $price,
                        'ingredients' => $this->model_catalog_product->getIngredients($product['product_id']),
                        'weight' => $this->weight->format($product['weight'], $this->config->get('config_weight_class_id'))
                    );
                }

                if ($child['image'] && file_exists(DIR_IMAGE . $child['image'])) {
                    $child_image = $child['image'];
                } else {
                    $child_image = 'category_icon_1.png';
                }

                $child_array[] = array(
                    'name' => $child['name'],
                    'products' => $products,
                    'image' => $this->model_tool_image->resize($child_image, 60, 60)
                );
            }
            $tree[] = array(
                'name' => $parent['name'],
                'image' => HTTP_SERVER . 'image/' . $parent['image'],
                'children' => $child_array
            );

        }

        $url['add_cart'] = $this->url->link('checkout/cart/add');
        $url['edit_cart'] = $this->url->link('checkout/cart/edit');
        $url['get_cart'] = $this->url->link('checkout/cart/getProducts');
        $url['delete_cart'] = $this->url->link('checkout/cart/delete');
        $url['add_order'] = $this->url->link('checkout/checkout/addOrder');

        $data['tree'] = htmlspecialchars(json_encode($tree));
        $data['url'] = htmlspecialchars(json_encode($url));

        $data['search'] = $this->load->controller('common/search');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['footer'] = $this->load->controller('common/footer', $products_for_footer);
        $data['header'] = $this->load->controller('common/header');

        $data['button_cart'] = $this->language->get('button_cart');

        $this->response->setOutput($this->load->view('product/category', $data));

    }
}
