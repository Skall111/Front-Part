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
$idMonument = $_GET['q'];
if(isset($_POST['Review'])){
    $rating = $_POST['Rating'];
    $comment = $_POST['Comment'];
    $idUser = $_SESSION['User'];
    $query = $db->query("INSERT INTO Comments (Comments, Rating) VALUES ('$comment' , '$rating') ");
    $lastId = $db->lastInsertId();
    $querybis = $db->query("INSERT INTO Afficher (Id_Monument, Id_User, Id_Comments) VALUES ('$idMonument' ,'$idUser','$lastId' )");
}


$listeMonument= $db->query("SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  WHERE M.Id = $idMonument")->fetch();

$count = 0;
$totalComment = 0;

    $comments = $db->query("SELECT * FROM Comments AS C 
                              LEFT JOIN Afficher  AS AF ON C.Id = AF.Id_Comments
                              LEFT JOIN User AS U ON AF.Id_User = U.Id
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
$Horaire = $db->query("SELECT * FROM Ouvrir LEFT JOIN Calendar ON Ouvrir.Id_Calendar = Calendar.Id WHERE Id_Monument = $idMonument")->fetchAll();
$Images = $db->query("SELECT * FROM Image LEFT JOIN Monument ON image.Id_Monument = Monument.Id WHERE Id_Monument = $idMonument")->fetchAll();
//echo '<pre>';
//print_r($listeMonument);
//echo '</pre>';
//echo '<pre>';
//print_r($comments);
//echo '</pre>';
//exit;
$api_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=".$listeMonument['Lat'].",".$listeMonument['Lon']."&key=%20AIzaSyCMAnHb4OL5n-AfqdzM8MaRDXNDQYZ43m0";
$api_content = file_get_contents($api_url);
$json = json_decode($api_content);

$adresse = $json->results[0]->formatted_address;
$message = new Session();
$Msg = null ;
$connect = null ;
if($message->hasFlashes('DL')) {
    $Msg = $message->getFlashes('DL');
}
    if($message->hasFlashes('User')) {
    $connect = $message->read('User');
}
$parametre =
    [
        'nom' => 'Benj',
        'prenom'=> 'Le Boss',
        'metier'=> 'Developpeur',
        'path'=> $path,
        'success'=>$success ,
        'errors'=>$errors,
        'Monument' => $listeMonument,
        'Comments' => $comments,
        'Adresse' => $adresse,
        'session'=>@$_SESSION['User'],
        'Horaire'=>$Horaire,
        'Images'=>$Images,
        'connect' => $connect,
        'Msg' => $Msg,
    ];


echo $twig->render("monumentDetail.html.twig", $parametre);
