<?php

class ModelStatisticStatistic extends Model
{
    public function getOrders($data = array())
    {
        $sql = "SELECT *, DATE_FORMAT(date_added, '%Y-%m-%d') AS date_added 
                FROM " . DB_PREFIX . "orderenchi ";

        if(isset($data['date'])) {
            $sql .= "WHERE date_added LIKE '" . $data['date'] . "%'";
        } else if(isset($data['date_from']) && isset($data['date_to'])) {
            $sql .= " WHERE ";

            if ($data['date_from'] && $data['date_to']) {
                $sql .= "date_added BETWEEN 
                STR_TO_DATE('" . $data['date_from'] . " 00:00:00', '%Y-%m-%d %H:%i:%s') AND 
                STR_TO_DATE('" . $data['date_to'] . " 23:59:59', '%Y-%m-%d %H:%i:%s') ";
            } else if ($data['date_from'] && !$data['date_to']) {
                $sql .= "date_added >= 
                STR_TO_DATE('" . $data['date_from'] . " 00:00:00', '%Y-%m-%d %H:%i:%s') ";
            } else if (!$data['date_from'] && $data['date_to']) {
                $sql .= "date_added <= 
                STR_TO_DATE('" . $data['date_to'] . " 23:59:59', '%Y-%m-%d %H:%i:%s') ";
            }
        }

        if(isset($data['flag']) && isset($data['value'])) {
            $sql .= " AND ";

            switch ($data['flag']) {
                case 'more' :
                    $sql .= "`total` >= '" . (float)$data['value'] . "'";
                    break;
                case 'less' :
                    $sql .= "`total` <= '" . (float)$data['value'] . "'";
                    break;
                case 'more_less' :
                    $array = explode('-', $data['value']);
                    $second_part = isset($array[1]) ? $array[1] : $array[0] + 1;
                    $sql .= "`total` BETWEEN '" . (float)$array[0] . "' AND '" . (float)$second_part . "'";
            }
        }

        $sql .= " ORDER BY date_added ASC";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getFirstOrderDate($date_to = null) {
        $sql = "SELECT DATE_FORMAT(date_added, '%Y-%m-%d') AS date_added 
                FROM " . DB_PREFIX . "orderenchi ";

        if($date_to) {
            $sql .= "WHERE date_added <= STR_TO_DATE('" . $date_to . " 23:59:59', '%Y-%m-%d %H:%i:%s')";
        }

        $sql .= " ORDER BY date_added ASC";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProducts($data, $category_id) {
        $sql = "SELECT op.*, 
                cd.name AS category_name,
                p.image,
                DATE_FORMAT(o.date_added, '%Y-%m-%d') AS date_added 
                FROM " . DB_PREFIX . "order_product op 
                INNER JOIN " . DB_PREFIX . "orderenchi o ON(op.order_id = o.order_id) 
                INNER JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) 
                INNER JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = op.product_id) 
                INNER JOIN " . DB_PREFIX . "category_description cd ON (p2c.category_id = cd.category_id) ";

        if(isset($data['date'])) {
            $sql .= "WHERE o.date_added LIKE '" . $data['date'] . "%'";
        } else if(isset($data['date_from']) && isset($data['date_to'])) {
            $sql .= " WHERE ";

            if ($data['date_from'] && $data['date_to']) {
                $sql .= "o.date_added BETWEEN 
                STR_TO_DATE('" . $data['date_from'] . " 00:00:00', '%Y-%m-%d %H:%i:%s') AND 
                STR_TO_DATE('" . $data['date_to'] . " 23:59:59', '%Y-%m-%d %H:%i:%s') ";
            } else if ($data['date_from'] && !$data['date_to']) {
                $sql .= "o.date_added >= 
                STR_TO_DATE('" . $data['date_from'] . " 00:00:00', '%Y-%m-%d %H:%i:%s') ";
            } else if (!$data['date_from'] && $data['date_to']) {
                $sql .= "o.date_added <= 
                STR_TO_DATE('" . $data['date_to'] . " 23:59:59', '%Y-%m-%d %H:%i:%s') ";
            }
        }

        if($category_id && $category_id != '00') {
            $sql .= " AND p2c.category_id = '" . (int)$category_id . "' ";
        }

        $sql .= " AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $sql .= " ORDER BY date_added ASC";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getFilters($order_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "filters_to_order 
            WHERE order_id = '" . (int)$order_id . "'");

        return $query->row;
    }

    public function getOrderCategories($order_id) {
        $query = $this->db->query("SELECT c.parent_id FROM " . DB_PREFIX . "orderenchi o 
        INNER JOIN " . DB_PREFIX . "order_product op ON(op.order_id = o.order_id)
        INNER JOIN " . DB_PREFIX . "product_to_category p2c ON(op.product_id = p2c.product_id)
        INNER JOIN `" . DB_PREFIX . "category` c ON(c.category_id = p2c.category_id)
        WHERE o.order_id = '" . (int)$order_id . "'");

        return $query->rows;
    }

    public function getAllergenList() {
        $result = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen_group a
            INNER JOIN " . DB_PREFIX . "allergen_group_description ad ON(a.allergen_group_id = ad.allergen_group_id)
            WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            ORDER BY ad.name");
        foreach ($query->rows as $row) {
            $result[] = array (
                'name' => $row['name'],
                'id' => $row['allergen_group_id'],
                'description' => $row['description']
            );
        }
        return $result;
    }
}