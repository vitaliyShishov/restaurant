<?php
class ModelCatalogAllergen extends Model {
	public function addAllergen($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "allergen SET allergen_group_id = '" . (int)$data['allergen_group_id'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$allergen_id = $this->db->getLastId();

		foreach ($data['allergen_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "allergen_description SET 
			allergen_id = '" . (int)$allergen_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "',
			description = '" . $this->db->escape($value['description']) . "'");
		}

		return $allergen_id;
	}

	public function editAllergen($allergen_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "allergen SET allergen_group_id = '" . (int)$data['allergen_group_id'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE allergen_id = '" . (int)$allergen_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen_description WHERE allergen_id = '" . (int)$allergen_id . "'");

		foreach ($data['allergen_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "allergen_description SET 
			allergen_id = '" . (int)$allergen_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "',
			description = '" . $this->db->escape($value['description']) . "'");
		}
	}

	public function deleteAllergen($allergen_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen WHERE allergen_id = '" . (int)$allergen_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen_description WHERE allergen_id = '" . (int)$allergen_id . "'");
	}

	public function getAllergen($allergen_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen a 
		LEFT JOIN " . DB_PREFIX . "allergen_description ad ON (a.allergen_id = ad.allergen_id) WHERE a.allergen_id = '" . (int)$allergen_id . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getAllergens($data = array()) {
		$sql = "SELECT *, (SELECT agd.name FROM " . DB_PREFIX . "allergen_group_description agd WHERE agd.allergen_group_id = a.allergen_group_id AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS allergen_group FROM " . DB_PREFIX . "allergen a LEFT JOIN " . DB_PREFIX . "allergen_description ad ON (a.allergen_id = ad.allergen_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND ad.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_allergen_group_id'])) {
			$sql .= " AND a.allergen_group_id = '" . $this->db->escape($data['filter_allergen_group_id']) . "'";
		}

		$sort_data = array(
			'ad.name',
			'allergen_group',
			'a.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY allergen_group, ad.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getAllergenDescriptions($allergen_id) {
		$allergen_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen_description WHERE allergen_id = '" . (int)$allergen_id . "'");

		foreach ($query->rows as $result) {
			$allergen_data[$result['language_id']] = array(
			    'name' => $result['name'],
                'description' => $result['description']);
		}

		return $allergen_data;
	}

	public function getTotalAllergens() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "allergen");

		return $query->row['total'];
	}

	public function getTotalAllergensByAllergenGroupId($allergen_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "allergen WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");

		return $query->row['total'];
	}
}
