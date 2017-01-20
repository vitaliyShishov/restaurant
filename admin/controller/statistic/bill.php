<?php

class ControllerStatisticBill extends Controller
{

    private $info = array(
        'check' => 0.00,
        'amount' => 0,
        'max' => 0,
        'min' => 0,
        'graphic' => false,
        'graphic_type' => '',
        'date' => '',
        'flag' => false
    );

    private $payment = array(
        'card' => array(),
        'cash' => array()
    );

    private $graphic = array();

    private $pgraphic = array();

    private $filters = array();

    private $product_choice = array();

    private $variant = 'average';

    private $date = array(
        'default' => null,
        'month' => null,
        'day' => null,
        'year' => null,
        'date_from' => null,
        'date_to' => null,
        'days_number' => 0
    );

    const SUM = 50;

    /**
     * Константа - главная категория напитков. При необходимости поменять!!
     */

    /**
     * TODO:
     * Вынести это в настройки магазина и забирать через конфиг
     */
    const DRINK = 60;

    public function index()
    {
        $this->load->language('statistic/statistic');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('statistic/bill', 'token=' . $this->session->data['token'], true)
        );

        $data['token'] = $this->session->data['token'];

        $this->load->model('catalog/category');

        $results = $this->model_catalog_category->getCategories();

        foreach ($results as $result) {
            $data['categories'][] = array(
                'category_id' => $result['category_id'],
                'name' => $result['name'],
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_orders_statistic'] = $this->language->get('text_orders_statistic');
        $data['text_day'] = $this->language->get('text_day');
        $data['text_month'] = $this->language->get('text_month');
        $data['text_period'] = $this->language->get('text_period');
        $data['text_data'] = $this->language->get('text_data');
        $data['text_sum'] = $this->language->get('text_sum');
        $data['text_average'] = $this->language->get('text_average');
        $data['text_calculate'] = $this->language->get('text_calculate');
        $data['text_warning'] = $this->language->get('text_warning');
        $data['text_from'] = $this->language->get('text_from');
        $data['text_to'] = $this->language->get('text_to');
        $data['months'] = $this->language->get('months');
        $data['text_all'] = $this->language->get('text_all');

        $data['tab_orders'] = $this->language->get('tab_orders');
        $data['tab_products'] = $this->language->get('tab_products');
        $data['tab_allergens'] = $this->language->get('tab_allergens');

        $data['bill_info'] = $this->bill();
        $data['product_info'] = $this->products();
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('statistic/bill', $data));
    }

    public function bill()
    {
        $this->load->language('statistic/statistic');
        $this->load->model('statistic/statistic');

        $data['text_data'] = $this->language->get('text_data');
        $data['text_date'] = $this->language->get('text_date');
        $data['text_sum'] = $this->language->get('text_sum');
        $data['text_general_information'] = $this->language->get('text_general_information');
        $data['text_max_order'] = $this->language->get('text_max_order');
        $data['text_min_order'] = $this->language->get('text_min_order');
        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_average_check'] = $this->language->get('text_average_check');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_order_amount'] = $this->language->get('text_order_amount');
        $data['text_filters_info'] = $this->language->get('text_filters_info');
        $data['text_products_choice'] = $this->language->get('text_products_choice');

        $data['text_graphical_display'] = $this->language->get('text_graphical_display');

        if (!empty($this->request->post)) {
            $this->variant = $this->request->post['sum']['variant'];

            $this->createDates($this->request->post);
            $this->calculateAverage($this->request->post);
            $this->calculateSum($this->request->post);

            $data['info'] = $this->info;
            $data['payment'] = $this->payment;
            $data['filters'] = $this->filters;
            $data['product_choice'] = $this->product_choice;
            $data['graphic'] = $this->graphic;

            $json['html'] = $this->load->view('statistic/bill_info', $data);
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $this->createDates();

            $this->date['day'] = $this->date['default']->format('Y-m-d');

            $this->calculateAverage();

            $data['info'] = $this->info;
            $data['payment'] = $this->payment;
            $data['filters'] = $this->filters;
            $data['product_choice'] = $this->product_choice;
            $data['graphic'] = $this->graphic;

            return $this->load->view('statistic/bill_info', $data);
        }
    }

    public function products()
    {
        $this->load->language('statistic/statistic');
        $this->load->model('statistic/statistic');

        $data['text_products'] = $this->language->get('tab_products');
        $data['text_title'] = $this->language->get('text_title');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_total_sales'] = $this->language->get('text_total_sales');
        $data['text_quantity_products'] = $this->language->get('text_quantity_products');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_show_graphic'] = $this->language->get('text_show_graphic');
        $data['text_hide_graphic'] = $this->language->get('text_hide_graphic');
        $data['text_show_all'] = $this->language->get('text_show_all');
        $data['text_date'] = $this->language->get('text_date');
        $data['text_order_amount'] = $this->language->get('text_order_amount');
        $data['text_graphical_display'] = $this->language->get('text_graphical_display');

        if (!empty($this->request->post)) {
            $this->createDates($this->request->post);

            $data['products'] = $this->calculateProducts($this->request->post);
            $data['info'] = $this->info;
            $data['graphic'] = $this->pgraphic;

            $json['html'] = $this->load->view('statistic/product_info', $data);
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $this->createDates();
            $data['info'] = $this->info;
            $data['products'] = $this->calculateProducts();
            $data['graphic'] = $this->pgraphic;
            return $this->load->view('statistic/product_info', $data);
        }
    }

    public function allergens()
    {
        $this->load->language('statistic/statistic');
        $this->load->model('statistic/statistic');

        $data['text_allergens_info'] = $this->language->get('text_allergens_info');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_data'] = $this->language->get('text_data');

        if (!empty($this->request->post)) {
            $this->createDates($this->request->post);

            $data['allergens'] = $this->calculateAllergens($this->request->post);
            $json['html'] = $this->load->view('statistic/allergens_info', $data);

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $this->createDates();
            $data['allergens'] = $this->calculateAllergens();
            return $this->load->view('statistic/allergens_info', $data);
        }
    }

    private function calculateAverage($post = array())
    {
        if ($this->variant !== 'average') {
            return false;
        }

        $filters = $this->createFilters($post);

        $orders = $this->model_statistic_statistic->getOrders($filters);

        if (empty($orders)) {
            return false;
        }

        $this->info['flag'] = true;

        $max = 0;
        $min = 10000;
        $total = 0;
        $average = 0;
        $cash = 0;
        $card = 0;

        foreach ($orders as $order) {
            $max = $order['total'] > $max ? $order['total'] : $max;
            $min = $order['total'] < $min ? $order['total'] : $min;
            $total += $order['total'];

            if ($order['payment_method'] == 1) {
                $cash++;
            } else {
                $card++;
            }
        }

        if ($this->date['month']) {
            $average = $total / $this->date['days_number'];
        } else {
            $average = $total / count($orders);
        }

        $this->payment['card'] = array('Card', (int)$card);
        $this->payment['cash'] = array('Cash', (int)$cash);
        $this->info['amount'] = count($orders);
        $this->info['min'] = $this->currency->format($min, $this->config->get('config_currency'));
        $this->info['max'] = $this->currency->format($max, $this->config->get('config_currency'));
        $this->info['check'] = $this->currency->format($average, $this->config->get('config_currency'));
        $this->graphicForAverage($orders);
        $this->diagramForProductChoice($orders);
        $this->calculateFilters($orders);
    }

    private function graphicForAverage($orders)
    {
        if ($this->date['day']) {
            return false;
        }

        $this->info['graphic'] = true;
        $this->info['graphic_type'] = 'average';

        $info_array = array();

        foreach ($orders as $order) {
            if (!isset($info_array[$order['date_added']])) {
                $info_array[$order['date_added']]['total'] = $order['total'];
                $info_array[$order['date_added']]['count'] = 1;
            } else {
                $info_array[$order['date_added']]['total'] += $order['total'];
                $info_array[$order['date_added']]['count']++;
            }
        }

        $data = $this->createDaysArray();

        foreach ($data as $key => $value) {
            if (array_key_exists($value, $info_array)) {
                $average = $info_array[$value]['total'] / $info_array[$value]['count'];
            } else {
                $average = 0;
            }

            $data[$key] = array($data[$key], $average);
        }

        $this->graphic = $data;
    }

    private function diagramForProductChoice($orders)
    {

        $final_food = 0;
        $final_drink = 0;
        $final_fd = 0;

        foreach ($orders as $order) {
            $categories = $this->model_statistic_statistic->getOrderCategories($order['order_id']);

            $food = 0;
            $drink = 0;

            foreach ($categories as $category) {

                if ($category['parent_id'] == self::DRINK) {
                    $drink++;
                } else {
                    $food++;
                }
            }

            if ($food > 0 && $drink > 0) {
                $final_fd++;
            } else if ($food > 0) {
                $final_food++;
            } else if ($drink > 0) {
                $final_drink++;
            }
        }

        $this->product_choice['food'] = array('Food', $final_food);
        $this->product_choice['drink'] = array('Drink', $final_drink);
        $this->product_choice['food_drink'] = array('Food & Drink', $final_fd);
    }

    private function calculateSum($post)
    {
        if ($this->variant !== 'sum') {
            return false;
        }

        $filters = $this->createFilters($post, true);

        $orders = $this->model_statistic_statistic->getOrders($filters);

        if (empty($orders)) {
            return false;
        }

        $this->info['flag'] = true;

        $max = 0;
        $min = 10000;
        $cash = 0;
        $card = 0;

        foreach ($orders as $order) {
            $max = $order['total'] > $max ? $order['total'] : $max;
            $min = $order['total'] < $min ? $order['total'] : $min;

            if ($order['payment_method'] == 1) {
                $cash++;
            } else {
                $card++;
            }
        }

        switch ($post['sum']['flag']) {
            case 'more' :
                $check = '> ' . $this->currency->format($post['sum']['value'], $this->config->get('config_currency'));;
                break;
            case 'less' :
                $check = '< ' . $this->currency->format($post['sum']['value'], $this->config->get('config_currency'));;
                break;
            case 'more_less' :
                $array = explode('-', $post['sum']['value']);
                $check = $this->currency->format($array[0], $this->config->get('config_currency')) . ' - ' . $this->currency->format($array[1], $this->config->get('config_currency'));
                break;
            default:
                $check = 0;
                break;
        }

        $this->payment['card'] = array('Card', (int)$card);
        $this->payment['cash'] = array('Cash', (int)$cash);
        $this->info['check'] = $check;
        $this->info['amount'] = count($orders);
        $this->info['min'] = $this->currency->format($min, $this->config->get('config_currency'));
        $this->info['max'] = $this->currency->format($max, $this->config->get('config_currency'));
        $this->graphicForSum($orders);
        $this->calculateFilters($orders);
    }

    private function graphicForSum($orders)
    {
        if ($this->date['day']) {
            return false;
        }

        $this->info['graphic'] = true;
        $this->info['graphic_type'] = 'sum';

        $info_array = array();

        foreach ($orders as $order) {
            if (!isset($info_array[$order['date_added']])) {
                $info_array[$order['date_added']]['count'] = 1;
            } else {
                $info_array[$order['date_added']]['count']++;
            }
        }

        $data = $this->createDaysArray();

        foreach ($data as $key => $value) {
            if (array_key_exists($value, $info_array)) {
                $counter = $info_array[$value]['count'];
            } else {
                $counter = 0;
            }

            $data[$key] = array($data[$key], $counter);
        }

        $this->graphic = $data;
    }

    private function calculateFilters($orders)
    {

        $price = 0;
        $kcal = 0;
        $ingredients = 0;
        $allergens = 0;

        foreach ($orders as $order) {
            $_filters = $this->model_statistic_statistic->getFilters($order['order_id']);

            if (!empty($_filters['filters_info'])) {
                $filters = unserialize($_filters['filters_info']);
            } else {
                $filters = null;
            }

            if ($filters) {
                foreach ($filters as $key => $value) {
                    switch ($key) {
                        case 'price' :
                            $price += $value;
                            break;
                        case 'kcal' :
                            $kcal += $value;
                            break;
                        case 'ingredients' :
                            $ingredients += $value;
                            break;
                        case 'allergens' :
                            $allergens += $value;
                    }
                }
            }
        }

        $this->filters['price'] = array('Price', $price);
        $this->filters['kcal'] = array('Kcal', $kcal);
        $this->filters['ingredients'] = array('Ingredients', $ingredients);
        $this->filters['allergens'] = array('Allergens', $allergens);
    }

    private function createFilters($post, $flag = false)
    {
        $filters = array();

        if (!empty($post)) {
            switch ($post['period']['variant']) {
                case 'day' :
                    $this->info['date'] = $this->date['day'];
                    $filters['date'] = $this->date['day'];
                    break;
                case 'month':
                    $filters['date'] = $this->date['year'] . '-' . $this->date['month'];
                    $this->info['date'] = $this->language->get('months')[$this->date['month']];
                    break;
                case 'period' :
                    $this->info['date'] = $this->date['date_from'] . ' - ' . $this->date['date_to'];
                    $filters['date_from'] = $this->date['date_from'];
                    $filters['date_to'] = $this->date['date_to'];
                    break;
                default:
                    $this->info['date'] = $this->date['default']->format('Y-m-d');
                    $filters['date'] = $this->date['default']->format('Y-m-d');
                    break;
            }
        } else {
            $this->info['date'] = $this->date['default']->format('Y-m-d');
            $filters['date'] = $this->date['default']->format('Y-m-d');
        }

        if ($flag) {
            $filters['value'] = $post['sum']['value'] ? $post['sum']['value'] : self::SUM;
            $filters['flag'] = $post['sum']['flag'];
        }

        return $filters;
    }

    private function createDaysArray()
    {
        if ($this->date['month']) {
            $_day = $this->date['year'] . '-' . $this->date['month'] . '-01 00:00:00';
        } else if ($this->date['date_from']) {
            $_day = $this->date['date_from'] . ' 00:00:00';
        }

        $dates = array();

        for ($t = 1; $t <= $this->date['days_number']; $t++) {
            $_default = new DateTime($_day);

            if ($t == 1) {
                $dates[] = $_default->format('Y-m-d');
            }

            $_interval = 'P' . $t . 'D';
            $_date = $_default->add(new DateInterval($_interval));
            $dates[] = $_date->format('Y-m-d');
        }

        return $dates;
    }

    private function calculateProducts($post = array())
    {
        $this->load->model('tool/image');

        $filters = $this->createFilters($post);

        $category_id = isset($post['category']) ? $post['category'] : null;

        $products = $this->model_statistic_statistic->getProducts($filters, $category_id);

        if (empty($products)) {
            return array();
        }

        $final_products = array();

        $q_array = array();

        foreach ($products as $product) {
            if (!array_key_exists($product['product_id'], $final_products)) {
                $final_products[$product['product_id']] = $product;
                $final_products[$product['product_id']]['price'] = $this->currency->format($product['price'], $this->config->get('config_currency'));
                $q_array[$product['product_id']][$product['date_added']] = $product['quantity'];
            } else {
                $final_products[$product['product_id']]['total'] += $product['total'];
                $final_products[$product['product_id']]['quantity'] += $product['quantity'];

                if (array_key_exists($product['date_added'], $q_array[$product['product_id']])) {
                    $q_array[$product['product_id']][$product['date_added']] += $product['quantity'];
                } else {
                    $q_array[$product['product_id']][$product['date_added']] = $product['quantity'];
                }
            }
        }

        foreach ($final_products as $key => $product) {
            $final_products[$key]['total'] = $this->currency->format($product['total'], $this->config->get('config_currency'));

            if (is_file(DIR_IMAGE . $final_products[$key]['image'])) {
                $final_products[$key]['image'] = $this->model_tool_image->resize($final_products[$key]['image'], 140, 140);
            } else {
                $final_products[$key]['image'] = $this->model_tool_image->resize('no_image.png', 140, 140);
            }
        }

        $_temp = array();

        /**
         * Чтобы отсортировать по total, вместо quantity вписать total
         */
        foreach ($final_products as $key => $arr) {
            $_temp[$key] = $arr['quantity'];
        }

        array_multisort($_temp, SORT_NUMERIC, SORT_DESC, $final_products);

        $this->graphicForProducts($q_array);

        return $final_products;
    }

    private function calculateAllergens($post = array())
    {
        $final_array = array();
        $_final_array = array();

        $filters = $this->createFilters($post);

        $orders = $this->model_statistic_statistic->getOrders($filters);
        $allergens = $this->model_statistic_statistic->getAllergenList();

        if (empty($orders)) {
            return array();
        }

        foreach ($orders as $order) {
            $_filters = $this->model_statistic_statistic->getFilters($order['order_id']);

            if (!empty($_filters['filters_info'])) {
                $filters = unserialize($_filters['filters_info']);
            } else {
                $filters = null;
            }

            if ($filters && !empty($filters['allergenObject'])) {
                foreach ($filters['allergenObject'] as $key => $value) {
                    if (array_key_exists($key, $_final_array)) {
                        $_final_array[$key] += $value;
                    } else {
                        $_final_array[$key] = $value;
                    }
                }
            }

        }

        if(empty($_final_array)) {
            return $final_array;
        }

        foreach ($allergens as $item) {
            if (array_key_exists($item['id'], $_final_array)) {
                $counter = (int)$_final_array[$item['id']];
            } else {
                $counter = 0;
            }

            $final_array[] = array($item['name'], $counter);
        }

        return $final_array;
    }

    private function graphicForProducts($data)
    {
        if ($this->date['day']) {
            return false;
        }
        $this->info['graphic'] = true;

        $_data = $this->createDaysArray();

        $_final_data = array();

        foreach ($_data as $key => $value) {
            foreach ($data as $id => $item) {

                if (array_key_exists($value, $item)) {
                    $quantity = $item[$value];
                } else {
                    $quantity = 0;
                }

                $_final_data[$id][$value] = array($_data[$key], $quantity);
            }
        }

        $this->pgraphic = $_final_data;
    }

    private function createDates($post = array())
    {
        $this->date['default'] = new DateTime();
        $this->date['year'] = $this->date['default']->format('Y');

        if (!empty($post)) {
            switch ($post['period']['variant']) {
                case 'day' :
                    $this->date['day'] = $this->request->post['period']['day'] ? $this->request->post['period']['day'] : $this->date['default']->format('Y-m-d');;
                    break;
                case 'month' :
                    $this->date['month'] = $this->request->post['period']['month'];
                    $this->date['days_number'] = cal_days_in_month(CAL_GREGORIAN, $this->date['month'], $this->date['year']);
                    break;
                case 'period' :
                    $this->date['date_from'] = $this->request->post['period']['day_from'];
                    $this->date['date_to'] = $this->request->post['period']['day_to'];

                    if ($this->date['date_from'] && $this->date['date_to']) {
                        $_day1 = new DateTime($this->date['date_from']);
                        $_day2 = new DateTime($this->date['date_to']);
                    } else if ($this->date['date_from'] && !$this->date['date_to']) {
                        $_day1 = new DateTime($this->date['date_from']);
                        $_day2 = $this->date['default'];
                        $this->date['date_from'] = $this->date['default']->format('Y-m-d');
                    } else if (!$this->date['date_from'] && $this->date['date_to']) {
                        $_orders = $this->model_statistic_statistic->getFirstOrderDate($this->date['date_to']);
                        $_first = reset($_orders);
                        $this->date['date_from'] = $_first['date_added'];
                        $_day1 = new DateTime($_first['date_added']);
                        $_day2 = new DateTime($this->date['date_to']);
                    } else {
                        $_orders = $this->model_statistic_statistic->getFirstOrderDate();
                        $_first = reset($_orders);
                        $_last = end($_orders);
                        $this->date['date_from'] = $_first['date_added'];
                        $this->date['date_to'] = $_last['date_added'];
                        $_day1 = new DateTime($_first['date_added']);
                        $_day2 = new DateTime($_last['date_added']);
                    }
                    $interval = $_day1->diff($_day2);
                    $this->date['days_number'] = $interval->days;
                    break;
            }
        }

    }

    public function showGraphic()
    {
        $this->load->language('statistic/statistic');

        $data['text_date'] = $this->language->get('text_date');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_graphical_display'] = $this->language->get('text_graphical_display');


        if (isset($this->request->post)) {
            $data['post'] = $this->request->post;
            $json['html'] = $this->load->view('statistic/product_grafic', $data);
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }
    }
}