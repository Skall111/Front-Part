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
$idMonument = $_GET['q'];
$listeMonument= $db->query("SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  WHERE M.Id = $idMonument")->fetch();

$count = 0;
$totalComment = 0;

    $comments = $db->query("SELECT * FROM Comments AS C 
                              LEFT JOIN Afficher  AS AF ON C.Id = AF.Id_Comments
                              WHERE AF.Id_Monument = $idMonument")->fetchAll();
    $totalComment = 0 ;
    $count = 0 ;
    foreach ($comments as $comment){
        $count += $comment['Rating'] ;
        $totalComment++ ;
    }
    $listeMonument[] = ['totalLine' => $totalComment ,
        'totalRating' => $count
    ];
//    $listeMonuments[] = array_merge($listeMonument , $comments);


//echo '<pre>';
//print_r($listeMonument);
//echo '</pre>';
//echo '<pre>';
//print_r($comments);
//echo '</pre>';
//exit;

$parametre =
    [
        'nom' => 'Benj',
        'prenom'=> 'Le Boss',
        'metier'=> 'Developpeur',
        'path'=> $path,
        'Monument' => $listeMonument,
        'Comments' => $comments,
        'session'=>$_SESSION['User']



    ];


echo $twig->render("monumentDetail.html.twig", $parametre);
