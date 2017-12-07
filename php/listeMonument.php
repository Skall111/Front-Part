<?php 
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';

$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));
$parametre = 
[
'nom' => 'Benj',
'prenom'=> 'Le Boss',
'metier'=> 'Developpeur',
'path' => $path
];

echo $twig->render("listeMonument.html.twig", $parametre);
?>