<?php 
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';


$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));

$db = App::getDatabase();

$listeMonument= $db->query("SELECT * FROM Monument ")->fetchAll();

$parametre = 
[
'nom' => 'Benj',
'prenom'=> 'Le Boss',
'metier'=> 'Developpeur',
'path'=> $path,
'Monument' => $listeMonument,
];


echo $twig->render("listeMonument.html.twig", $parametre);
?>