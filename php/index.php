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
$listeCity= $db->query("SELECT * FROM City ")->fetchAll();
$listeType = $db->query("SELECT * FROM Type ")->fetchAll();
$reqBestMonument = "SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument , T.Name AS Type_Name 
                                  FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  LEFT JOIN Afficher AS AF ON AF.Id_Monument = M.Id
                                  LEFT JOIN Comments AS C ON C.Id = AF.Id_Comments
                                  LEFT JOIN Image AS I ON I.Id_Monument = M.Id
                                  GROUP BY M.Id
                                  LIMIT 3" ;
$BestMonument = $db->query($reqBestMonument)->fetchAll();
if(!$BestMonument[0]['Id']){
    $BestMonument = null ;
}
$parametre =
[
'City' => $listeCity,
'Type'=> $listeType,
'path' => $path ,
'valid' => $valid ,
'error' => $error ,
'errors'=>$errors,
'BestMonument' => $BestMonument ,
'success' => $success,
'session'=>@$_SESSION['User']
];
echo $twig->render("index.html.twig", $parametre);
?>