<?php

include $_SERVER['DOCUMENT_ROOT'].'/db.php';
include $_SERVER['DOCUMENT_ROOT'].'/api.php'; 

if(isset($_POST['country_name']) && $_POST['country_name'] != '') {
	$countryName = htmlspecialchars($_POST['country_name']);
	$capitalName = htmlspecialchars($_POST['capital_name']);
	$countryArea = htmlspecialchars($_POST['country_area']);
	$regionId = $_POST['region_name'];

	addCountry($db, $countryName, $capitalName, $countryArea, $regionId);
}
