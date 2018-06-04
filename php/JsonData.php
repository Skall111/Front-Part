<?php
/**
 * Created by IntelliJ IDEA.
 * User: Ben
 * Date: 06/01/2018
 * Time: 21:28
 */
ini_set('display_errors', 1);
error_reporting(E_ALL);
include '../config/variables.inc.php';
require 'autoload.php';
$db = App::getDatabase();

$condition = " " ;
if(isset($_GET)){
    $condition .= " WHERE 1 ";
    if(isset($_GET['name'])){
        $condition .= " AND M.Name LIKE '%".$_GET['name']."%'";
    }
    if(isset($_GET['city']) && $_GET['city'] != 0 && trim($_GET['city']) != ""){
        $condition .= " AND M.Id_City = ".$_GET['city'];;
    }
    if(isset($_GET['type']) && $_GET['type'] != 0 && trim($_GET['type']) != ""){
        $condition .= " AND A.Id_Type = ".$_GET['type'];;
    }
}

$listeMonument = $db->query("SELECT * , M.Id AS ID_MON  , M.Name AS NAME_MON , I.Url AS URL_IMG 
                                    FROM Monument AS M
                                    LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                    LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                    LEFT JOIN Image AS I  ON M.Id = I.Id_Monument
                                    " . $condition)->fetchAll();
$Json_Prepare = [];
foreach ($listeMonument as $item) {
    $Json_Prepare[] = [
        'id' => $item['ID_MON'],
        'is_logged_in' => $item['ID_MON'],
        'title' => $item['NAME_MON'],
        'address' => '',
        'price' => false,
        'thumbnail' => $path."img/Monuments/".$item['ID_MON']."/".$item['URL_IMG'],
        'verified' => true,
        'latitude' => $item['Lat'],
        'longitude' =>	$item['Lon']
    ];
}

$Json = json_encode($Json_Prepare);
echo $Json;
