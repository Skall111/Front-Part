<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';

$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));
$db = App::getDatabase();
include '../config/FormModal.php';
$valid  = 0 ;
$error = [];
$success = [];

$listeCity= $db->query("SELECT * FROM City ")->fetchAll();
$listeType = $db->query("SELECT * FROM Type ")->fetchAll();

$parametre = 
[
'City' => $listeCity,
'Type'=> $listeType,
'path' => $path ,
'valid' => $valid ,
'error' => $error ,
'success' => $success,
'session'=>$_SESSION['User']
];
echo $twig->render("index.html.twig", $parametre);
?>