<?php

class ControllerCheckoutOperator extends Controller
{
    public function index()
    {

        $this->load->language('checkout/operator');

        $data['heading_title'] = $this->language->get('heading_title');

//		if ($this->customer->isLogged()) {
//			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
//		} else {
//			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
//		}

        //подготовка языковых переменных
        $data['tab_active'] = $this->language->get('tab_active');
        $data['tab_archive'] = $this->language->get('tab_archive');
        $data['tab_statistics'] = $this->language->get('tab_statistics');

        $data['text_table'] = $this->language->get('text_table');
        $data['text_pay_cash'] = $this->language->get('text_pay_cash');
        $data['text_pay_card'] = $this->language->get('text_pay_card');
        $data['text_close'] = $this->language->get('text_close');
        $data['text_active_orders'] = $this->language->get('text_active_orders');
        $data['text_wait_time'] = $this->language->get('text_wait_time');
        $data['text_appendix'] = $this->language->get('text_appendix');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_orders'] = $this->language->get('text_orders');
        $data['text_table'] = $this->language->get('text_table');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_opened'] = $this->language->get('text_opened');
        $data['text_closed'] = $this->language->get('text_closed');
        $data['text_contents'] = $this->language->get('text_contents');
        $data['text_pieces'] = $this->language->get('text_pieces');
        $data['text_comment'] = $this->language->get('text_comment');
        $data['text_beginning'] = $this->language->get('text_beginning');
        $data['text_closing'] = $this->language->get('text_closing');


        //Формируем данные для отправки на верстку

        $this->load->model('user/user');
        $this->load->model('tool/image');

        $user_info = $this->model_user_user->getUser($this->user->getId()); //получаем данные об операторе

        if ($user_info) {
            $data['firstname'] = $user_info['firstname'];
            $data['lastname'] = $user_info['lastname'];

            $data['user_group'] = $user_info['user_group'];

            if (is_file(DIR_IMAGE . $user_info['image'])) {
                $data['image'] = $this->model_tool_image->resize($user_info['image'], 145, 145);
            } else {
                $data['image'] = '';
            }
        } else {
            $data['firstname'] = '';
            $data['lastname'] = '';
            $data['user_group'] = '';
            $data['image'] = '';
        }

        $this->load->model('checkout/order');


        $orders = array();

        $temp_orders = $this->model_checkout_order->getOrders();

        foreach ($temp_orders as $order) {

            $order_products = $this->model_checkout_order->getOrderProducts($order['order_id']);

            $orders[] = array(
                'order_id' => $order['order_id'],
                'table_id' => $order['table_id'],
                'payment_method' => $order['payment_method'],
                'products' => $order_products,
                'total' => number_format($order['total'], 2, '.', ''),
                'date_added' => $order['date_added'],
                'date_modified' => $order['date_modified']
            );
        }

        $archive_orders = array();

        $temp_archive_orders = $this->model_checkout_order->getArchiveOrders();


        foreach ($temp_archive_orders as $archive_order) {

            $archive_order_products = $this->model_checkout_order->getOrderProducts($archive_order['order_id']);

            $archive_orders[] = array(
                'order_id' => $archive_order['order_id'],
                'table_id' => $archive_order['table_id'],
                'payment_method' => $archive_order['payment_method'],
                'products' => $archive_order_products,
                'total' => number_format($archive_order['total'], 2, '.', ''),
                'date_added' => $archive_order['date_added'],
                'date_modified' => $archive_order['date_modified']
            );
        }


        $table_orders = array();
        $table_ids = array();

        $temp_table_ids = $this->model_checkout_order->getTableIds();

        foreach ($temp_table_ids as $temp_table_id) {
            $table_ids[] = $temp_table_id['table_id'];
        }

        foreach ($table_ids as $table_id) {
            $temp_table_orders = $this->model_checkout_order->getTableOrders($table_id);

            $total = 0;
            foreach ($temp_table_orders as $temp_table_order) {
                $total += $temp_table_order['total'];
            }
            if ($total > 0) {
                $table_orders[] = array(
                    'table_id' => $table_id,
                    'total_orders' => count($temp_table_orders),
                    'total_sum' => number_format($total, 2, ',', '')
                );
            }
        }

        //echo "<pre>"; var_dump($table_orders); die;

        $data['orders'] = $orders;
        $data['archive_orders'] = $archive_orders;
        $data['table_orders'] = $table_orders;

        $data['check_changes'] = $this->model_checkout_order->checkChanges();

//		$data['column_left'] = $this->load->controller('common/column_left');
//		$data['column_right'] = $this->load->controller('common/column_right');
//		$data['content_top'] = $this->load->controller('common/content_top');
//		$data['content_bottom'] = $this->load->controller('common/content_bottom');
//		$data['footer'] = $this->load->controller('common/footer');
//      $data['header'] = $this->load->controller('common/header');


//        if (!isset($this->session->data['operator_login']) || !isset($this->session->data['operator_password'])) {
//            $this->load->controller('checkout/operator_login');
//        } else {
            $this->response->setOutput($this->load->view('checkout/operator', $data));
 //       }
    }

    public function updateOnlineOrders()
    {

        $this->load->language('checkout/operator');

        $data['heading_title'] = $this->language->get('heading_title');

//		if ($this->customer->isLogged()) {
//			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
//		} else {
//			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
//		}

        //подготовка языковых переменных

        $data['text_table'] = $this->language->get('text_table');
        $data['text_pay_cash'] = $this->language->get('text_pay_cash');
        $data['text_pay_card'] = $this->language->get('text_pay_card');
        $data['text_close'] = $this->language->get('text_close');
        $data['text_active_orders'] = $this->language->get('text_active_orders');
        $data['text_wait_time'] = $this->language->get('text_wait_time');
        $data['text_appendix'] = $this->language->get('text_appendix');

        $data['text_comment'] = $this->language->get('text_comment');


        $this->load->model('checkout/order');

        //Находим состояние счетчика из бд

        $json['current'] = $this->model_checkout_order->checkChanges();

        //изначально переменная для обновления данных - ложная, чтоб с каждым аяксом у нас
        // не загружалось одно и то же

        $json['update'] = false;

        //Проверяем, приходит ли с запросом ПОСТ и текущий для пользователя счетчик
        //и проверяем, отлиается ли current счетчик от того, что в бд

        if(isset($this->request->post) && !empty($this->request->post['counter']) &&
            (int)$this->request->post['counter']!=$json['current']){

            //the counters are different so get new message list

            $orders = $this->model_checkout_order->getOrders();
            $data['last_order'] = array_shift($orders);
            $data['total'] = number_format($data['last_order']['total'], 2, ',' , '');
            $data['products'] = $this->model_checkout_order->getOrderProducts($data['last_order']['order_id']);


            // Тут все хорошо - тут приходит и заказ и его продукты

            $json['update'] = true;

            $json['order'] = $this->load->view('checkout/operator_orders', $data);

        }

        echo json_encode($json);

    }

    public function updateOrder()
    {
        $json = array();

        if (isset($this->request->post['order_id'])) {
            $order_id = $this->request->post['order_id'];
        } else {
            $order_id = null;
        }

        $this->load->model('checkout/order');

        $json['success'] = $this->model_checkout_order->moveOrderToArchive($order_id);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}