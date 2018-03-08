<?php
require_once '../vendor/autoload.php';
include '../config/variables.inc.php';
require 'autoload.php';


$loader = new Twig_Loader_Filesystem("../views/");
$twig = new Twig_Environment($loader, array(
   //  "cache" => "/path/to/compilation_cache",
    ));
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
$db = App::getDatabase();
include '../config/FormModal.php';

$listeMonument= $db->query("SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument , T.Name AS Type_Name FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  " . $condition . "
                                  ORDER BY M.Id 
                                  LIMIT 10 ")->fetchAll();
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
//include 'JsonData.php';
$parametre =
[
'nom' => 'Benj',
'prenom'=> 'Le Boss',
'metier'=> 'Developpeur',
'path'=> $path,
'success'=>$success ,
'errors'=>$errors,
'Monument' => @$listeMonuments,
'Comments' => @$comments,
'session'=>@$_SESSION['User'],
'Get' => $_GET,



];


echo $twig->render("listeMonument.html.twig", $parametre);
?>