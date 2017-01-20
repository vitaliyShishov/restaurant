<?php

/**
 * Создание тестовых заказов, для тестирования статистики
 *
 * Class orderMaker
 */
class orderMaker
{

    private $dates = array();
    private $orders = array();

    /**
     * Конструктор
     */
    public function __construct()
    {
        require_once(DIR_SYSTEM . 'startup.php');

        $this->registry = new Registry();
        $this->load = new Loader($this->registry);

        $this->db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        $this->config = new Config();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting");

        foreach ($query->rows as $setting) {
            $this->config->set($setting['key'], $setting['value']);
        }

        $this->registry->set('db', $this->db);
        $this->registry->set('config', $this->config);

        for ($t = 1; $t <= 40; $t++) {
            $_default = new DateTime('2016-11-15 15:34:23');
            $_interval = 'P' . $t . 'D';
            $_date = $_default->add(new DateInterval($_interval));
            $this->dates[] = $_date->format('Y-m-d H:i:s');
        }

        $this->createOrders();
    }

    /**
     * Запуск скрипта
     */
    public function createOrders()
    {

        $products = $this->db->query("SELECT pd.name, p.price, p.product_id FROM " . DB_PREFIX . "product p 
                INNER JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
                WHERE pd.language_id = 1")->rows;

        for ($i = 0; $i <= 150; $i++) {
            $order_products = array();

            shuffle($products);

            $_products = array_rand($products, rand(2, 5));

            $order_total = 0;

            foreach ($_products as $product) {
                $quantity = rand(1, 4);

                $total = (float)$products[$product]['price'] * $quantity;

                $order_products[] = array(
                    'product_id' => $products[$product]['product_id'],
                    'name' => $products[$product]['name'],
                    'model' => '',
                    'quantity' => $quantity,
                    'price' => (float)$products[$product]['price'],
                    'total' => $total,
                    'comment' => '',
                    'tax' => '',
                    'reward' => ''
                );

                $order_total += $total;
            }

            $this->orders[] = array(
                'table_id' => rand(1, 30),
                'method' => rand(1, 2),
                'order_status_id' => rand(1, 5),
                'total' => $order_total,
                'products' => $order_products
            );
        }

        $this->save();
    }

    public function save()
    {
        $allergens = $this->getAllergenList();

        foreach ($this->orders as $key => $data) {

            shuffle($this->dates);

            $order_date = array_rand($this->dates, 1);

            $this->db->query("INSERT INTO `" . DB_PREFIX . "orderenchi` SET 
             table_id = '" . (int)$data['table_id'] . "',
             payment_method = '" . (int)$data['method'] . "',
             order_status_id = '" . (int)$data['order_status_id'] . "',
             total = '" . (float)$data['total'] . "', 
             date_added = '" . $this->dates[$order_date] . "', date_modified = '" . $this->dates[$order_date] . "'");

            $order_id = $this->db->getLastId();

            foreach ($data['products'] as $product) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET
				  order_id = '" . (int)$order_id . "', 
				  product_id = '" . (int)$product['product_id'] . "',
				  `name` = '" . $this->db->escape($product['name']) . "', 
				  `model` = '" . $this->db->escape($product['model']) . "', 
				  quantity = '" . (int)$product['quantity'] . "', 
				  price = '" . (float)$product['price'] . "', 
				  total = '" . (float)$product['total'] . "',
				  comment = '" . $this->db->escape($product['comment']) . "',
				  tax = '" . (float)$product['tax'] . "',
				  reward = '" . (int)$product['reward'] . "'");

            }

            if ($key % 3) {

                shuffle($allergens);

                $_allergens = array_rand($allergens, rand(2, 7));

                $_allergens_to_save = array();

                foreach ($_allergens as $item) {
                    $_allergens_to_save[$allergens[$item]['id']] = rand(0, 10);
                }

                $generate_filters = array(
                    'price' => rand(0, 14),
                    'kcal' => rand(0, 26),
                    'ingredients' => rand(0, 23),
                    'allergens' => rand(0, 16),
                    'allergenObject' => $_allergens_to_save

                );
            } else {
                $generate_filters = array(
                    'price' => 0,
                    'kcal' => 0,
                    'ingredients' => 0,
                    'allergens' => 0,
                    'allergenObject' => array()

                );
            }

            $filters = serialize($generate_filters);

            $this->db->query("INSERT INTO " . DB_PREFIX . "filters_to_order SET 
		            order_id = '" . (int)$order_id . "',
		            filters_info = '" . $this->db->escape($filters) . "'");
        }

        var_dump('That\'s it!');
    }

    public function getAllergenList()
    {
        $result = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen_group a
            INNER JOIN " . DB_PREFIX . "allergen_group_description ad ON(a.allergen_group_id = ad.allergen_group_id)
            WHERE ad.language_id = '1' 
            ORDER BY ad.name");

        foreach ($query->rows as $row) {
            $result[] = array(
                'name' => $row['name'],
                'id' => $row['allergen_group_id'],
                'description' => $row['description']
            );
        }

        return $result;
    }
}
