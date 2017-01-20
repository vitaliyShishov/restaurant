<?php
class ModelCatalogAllergenGroup extends Model {
	public function addAllergenGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "allergen_group SET sort_order = '" . (int)$data['sort_order'] . "'");

		$allergen_group_id = $this->db->getLastId();

		foreach ($data['allergen_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "allergen_group_description SET 
			allergen_group_id = '" . (int)$allergen_group_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "',
			description = '" . $this->db->escape($value['description']) . "'");
		}

		return $allergen_group_id;
	}

	public function editAllergenGroup($allergen_group_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "allergen_group SET sort_order = '" . (int)$data['sort_order'] . "' WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen_group_description WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");

		foreach ($data['allergen_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "allergen_group_description SET 
			allergen_group_id = '" . (int)$allergen_group_id . "', 
			language_id = '" . (int)$language_id . "', 
			name = '" . $this->db->escape($value['name']) . "', 
			description = '" . $this->db->escape($value['description']) . "'");
		}
	}

	public function deleteAllergenGroup($allergen_group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen_group WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "allergen_group_description WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");
	}

	public function getAllergenGroup($allergen_group_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen_group WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");

		return $query->row;
	}

	public function getAllergenGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "allergen_group ag LEFT JOIN " . DB_PREFIX . "allergen_group_description agd ON (ag.allergen_group_id = agd.allergen_group_id) WHERE agd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'agd.name',
			'ag.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY agd.name";
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

	public function getAllergenGroupDescriptions($allergen_group_id) {
		$allergen_group_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "allergen_group_description WHERE allergen_group_id = '" . (int)$allergen_group_id . "'");

		foreach ($query->rows as $result) {
			$allergen_group_data[$result['language_id']] = array(
			    'name' => $result['name'],
                'description' => $result['description']);
		}

		return $allergen_group_data;
	}

	public function getTotalAllergenGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "allergen_group");

		return $query->row['total'];
	}
}