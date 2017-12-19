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
if (isset($_POST['type'])){
    if($_POST['type'] == 1) {
        $name = $db->quote($_POST['firstname']);
        $surname = $db->quote($_POST['lastname']);
        $mail = $db->quote($_POST['youremail']);
        $pass = md5($_POST['password']);
        var_dump($name) ;
        var_dump($surname);
        var_dump($mail);
        var_dump($pass);
        $db->query("INSERT INTO User(Name , Surname , Password , Mail) VALUES ($name , $surname , $pass , $mail )" , '1');
        $valid = 1;
    }
}
$listeCity= $db->query("SELECT * FROM City ")->fetchAll();
$listeType = $db->query("SELECT * FROM Type ")->fetchAll();

$parametre = 
[
'City' => $listeCity,
'Type'=> $listeType,
'path' => $path ,
'valid' => $valid ,
];
echo $twig->render("index.html.twig", $parametre);
?>