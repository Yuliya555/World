<?php

// Подключение к базе данных
$user = "root";
$pass = "";

try {
	$db = new PDO("mysql:dbname=world;host=localhost;charset=utf8", $user, $pass);
} catch (Exception $e) {
	echo $e->getMessage();
	die();
}
