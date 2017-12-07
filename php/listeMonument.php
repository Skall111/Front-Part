<?php 
require_once 'vendor/autoload.php'; 

$loader = new Twig_Loader_Filesystem("template/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));
$parametre = 
[
'nom' => 'Benj',
'prenom'=> 'Le Boss',
'metier'=> 'Developpeur'
];

echo $twig->render("listeMonument.html.twig", $parametre);
?>