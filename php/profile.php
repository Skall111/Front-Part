<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';


$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
    //  "cache" => "/path/to/compilation_cache",
));
$db = App::getDatabase();




$parametre =
    [
        'nom' => 'Benj',
        'prenom'=> 'Le Boss',
        'metier'=> 'Developpeur',
        'path'=> $path,
    ];

echo $twig->render("profile.html.twig", $parametre);
?>