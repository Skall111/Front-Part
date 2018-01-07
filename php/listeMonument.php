<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';


$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));

$db = App::getDatabase();

$listeMonument= $db->query("SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  ")->fetchAll();
$count = 0;
$totalComment = 0;
foreach ($listeMonument as $monument ){

    $idMonument = $monument['Id_monument'] ;
$comments = $db->query("SELECT * FROM Comments AS C 
                              LEFT JOIN Afficher  AS AF ON C.Id = AF.Id_Comments
                              WHERE AF.Id_Monument = $idMonument")->fetchAll();
$totalComment = 0 ;
$count = 0 ;
foreach ($comments as $comment){
    $count += $comment['Rating'] ;
    $totalComment++ ;
}
    $comments[] = ['totalLine' => $totalComment ,
                   'totalRating' => $count
                   ];
    $listeMonuments[] = array_merge($monument , $comments );

}

//echo '<pre>';
//print_r($listeMonuments);
//echo '</pre>';
////exit;



//Creation du json pour la Maps
$Prep_json = [

];
$json = json_encode($Prep_json);
$parametre =
[
'nom' => 'Benj',
'prenom'=> 'Le Boss',
'metier'=> 'Developpeur',
'path'=> $path,
'Monument' => $listeMonuments,
'Comments' => $comments,
'session'=>$_SESSION['User'],
'Get' => $_GET,



];


echo $twig->render("listeMonument.html.twig", $parametre);
?>