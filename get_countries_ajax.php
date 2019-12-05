<?php

include $_SERVER['DOCUMENT_ROOT'].'/db.php';
include $_SERVER['DOCUMENT_ROOT'].'/api.php'; 

if($countries = getAllCountries($db))
	echo json_encode($countries, JSON_UNESCAPED_UNICODE);
else {
	header('HTTP/1.1 500 Internal Server Error');
	header('Content-Type: application/json; charset=UTF-8');
	die(json_encode(array('message' => 'ERROR', 'code' => 1337)));
}
