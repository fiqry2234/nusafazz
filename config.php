<?php

const HOSTNAME = 'localhost';
const USERNAME = 'root';
const PASSWORD = '';
const DATABASE = 'okee8193_okpedia';

$conn = mysqli_connect(HOSTNAME, USERNAME, PASSWORD, DATABASE);

date_default_timezone_set('Asia/Jakarta');
error_reporting(0);
$maintenance = 0; // Maintenance? 1 = ya 0 = tidak
if($maintenance == 1) {
    die("site Maintance");
}
// database
$config['db'] = array(
	'host' => 'localhost',
	'name' => 'okee8193_okpedia',
	'username' => 'okee8193_okpedia',
	'password' => 'okee8193_okpedia'
);

// mysqli_real_escape_string($conn = mysqli_connect($config['db']['host'], $config['db']['username'], $config['db']['password'], $config['db']['name']), 'jhjh');
if(!$conn) {
	die("Koneksi Gagal : ".mysqli_connect_error());
	}
// $config['web'] = array(
	// 'url' => 'https://okepedia.my.id/' // contoh: http://domain.com/
	// 'url' => 'http://localhost/ppob' // contoh: http://domain.com/
// );
// date & time
$date = date("Y-m-d");
$time = date("H:i:s");
require("lib/function.php");
require("lib/setting.php");
?>  