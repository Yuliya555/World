<?php

function getAllCountries($db) {
	$sql = "SELECT countries.name, capital_name, area, regions.name as region_name FROM countries
			INNER JOIN regions ON countries.region_id = regions.id";
	$result = array();

	$stmt = $db->prepare($sql);

	$stmt->execute();

	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$result[] = $row;
	}

	return $result;
}

function getAllRegions($db) {
	$sql = "SELECT * FROM regions";
	$result = array();

	$stmt = $db->prepare($sql);

	$stmt->execute();

	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$result[$row['id']] = $row;
	}

	return $result;
}

function getRegion($db, $regionId) {
	$sql = "SELECT name FROM regions WHERE id=:region_id";

	$stmt = $db->prepare($sql);
	$stmt->bindValue(':region_id', $regionId, PDO::PARAM_INT);

	$stmt->execute();

	$result = $stmt->fetchColumn();

	return $result;
}

function addCountry($db, $countryName, $capitalName, $countryArea, $regionId) {
	$sql = "INSERT INTO countries(name, capital_name, area, region_id)
			VALUES(:country_name, :capital_name, :country_area, :region_id)
	";

	$stmt = $db->prepare($sql);
	$stmt->bindValue(':country_name', $countryName, PDO::PARAM_STR);
	$stmt->bindValue(':capital_name', $capitalName, PDO::PARAM_STR);
	$stmt->bindValue(':country_area', $countryArea, PDO::PARAM_STR);
	$stmt->bindValue(':region_id', $regionId, PDO::PARAM_INT);

	return $stmt->execute();
}