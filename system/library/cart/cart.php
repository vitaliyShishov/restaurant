<?php
namespace Cart;
class Cart {
	private $data = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

        if (!isset($this->session->data['cart']) || !is_array($this->session->data['cart'])) {
            $this->session->data['cart'] = array();
        }
	}

	public function getProducts() {
		$product_data = array();

		foreach ($this->session->data['cart'] as $key => $quantity) {

		    $product_id = $key;

			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");

			if ($product_query->num_rows && isset($quantity)) {

				$price = $product_query->row['price'];

				// Product Specials
				$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

				if ($product_special_query->num_rows) {
					$price = $product_special_query->row['price'];
				}

				// Reward Points
				$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($product_reward_query->num_rows) {
					$reward = $product_reward_query->row['points'];
				} else {
					$reward = 0;
				}

				$product_data[] = array(
					'product_id'      => $product_query->row['product_id'],
					'name'            => $product_query->row['name'],
					'model'           => $product_query->row['model'],
					'image'           => $product_query->row['image'],
					'quantity'        => $quantity,
					'minimum'         => $product_query->row['minimum'],
					'price'           => $price,
					'total'           => $price * $quantity,
					'reward'          => $reward * $quantity,
					'points'          => ($product_query->row['points'] ? $product_query->row['points'] * $quantity : 0),
					'tax_class_id'    => $product_query->row['tax_class_id'],
					'weight'          => $product_query->row['weight'] * $quantity,
					'weight_class_id' => $product_query->row['weight_class_id'],
				);
			} else {
				$this->remove($this->session->data['cart'][$key]);
			}
		}

		return $product_data;
	}

    /**
     * Метод добавления товара в корзину
     *
     * @param $product_id
     * @param int $qty
     */
    public function add($product_id, $qty = 1)
    {
        $this->data = array();

        $key = (int) $product_id;

        if ((int) $qty && ((int) $qty > 0)) {
            if (!isset($this->session->data['cart'][$key])) {
                $this->session->data['cart'][$key] = (int) $qty;
            } else {
                $this->session->data['cart'][$key] += (int) $qty;
            }
        }
    }

    /**
     * Метод обновления кол-ва позиции в корзине
     *
     * @param $key
     * @param $qty
     */
    public function update($key, $qty)
    {
        $this->data = array();

        if (isset($this->session->data['cart'][$key])) {
            $this->session->data['cart'][$key] += (int) $qty;
            if ($this->session->data['cart'][$key] == 0) {
                $this->remove($key);
            }
        }
    }

    /**
     * Метод очистки содержимого корзины
     */
    public function clear()
    {
        $this->data = array();

        $this->session->data['cart'] = array();

    }

    /**
     * Метод удаления товара из корзины
     * @param $key
     */
    public function remove($key)
    {
        $this->data = array();

        unset($this->session->data['cart'][$key]);
    }

    public function getSubTotal() {
        $total = 0;

        foreach ($this->getProducts() as $product) {
            $total += $product['total'];
        }

        return $total;
    }

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

    public function hasShipping() {
        foreach ($this->getProducts() as $product) {
            if (isset($product['shipping'])) {
                return true;
            }
        }

        return false;
    }

	public function countProducts() {
		$product_total = 0;

        $products = $this->getProducts();

        foreach ($products as $product) {
            $product_total += $product['quantity'];
        }

        return $product_total;
    }

    /**
     * Метод проверки корзины на пустоту
     *
     * @return int
     */
    public function hasProducts()
    {
        return count($this->session->data['cart']);
    }
}
