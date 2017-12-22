<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';

$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
    //  "cache" => "/path/to/compilation_cache",
));
$db = App::getDatabase();
$valid  = 0 ;
$error = [];
$success = [];

$db = App::getDatabase();

$listeMonument= $db->query("SELECT * FROM Monument ")->fetchAll();

$parametre =
    [
        'nom' => 'Benj',
        'prenom'=> 'Le Boss',
        'metier'=> 'Developpeur',
        'path'=> $path,
        'Monument' => $listeMonument,
        'session'=>$_SESSION['User']



    ];


echo $twig->render("monumentDetail.html.twig", $parametre);
