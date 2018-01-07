<?php
/**
 * Created by IntelliJ IDEA.
 * User: Ben
 * Date: 06/01/2018
 * Time: 21:28
 */
include '../config/variables.inc.php';
require 'autoload.php';
$db = App::getDatabase();

$listeMonument = $db->query("SELECT * , Monument.Id AS ID_MON FROM Monument LEFT JOIN Image ON Monument.Id = Image.Id_Monument")->fetchAll();
$Json_Prepare = [];
foreach ($listeMonument as $item) {
    $Json_Prepare[] = [
        'id' => $item['ID_MON'],
        'is_logged_in' => $item['ID_MON'],
        'title' => $item['Name'],
        'address' => '',
        'price' => false,
        'thumbnail' => $path."img/Monuments/".$item['ID_MON']."/".$item['Url'],
        'verified' => true,
        'latitude' => $item['Lat'],
        'longitude' =>	$item['Lon']
    ];
}

$Json = json_encode($Json_Prepare);
echo $Json;
