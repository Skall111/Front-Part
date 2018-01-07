<?php
$content_dir = '../img/Monuments/'.$_POST['id']."/"; // dossier où sera déplacé le fichier
//var_dump($_POST['number']);exit;
$tmp_file = $_FILES['fichier']['tmp_name'];
if( !is_uploaded_file($tmp_file) )
{
$reponse = "Le fichier est introuvable";
}

// on vérifie maintenant l'extension
$type_file = $_FILES['fichier']['type'];

// if( !strstr($type_file, 'jpg') && !strstr($type_file, 'jpeg') && !strstr($type_file, 'bmp') && !strstr($type_file, 'gif') && !strstr($type_file, 'pdf') )
if ( !strstr($type_file, 'jpg') )
{
$reponse = "Le fichier n'est pas une image";
}
if ($_FILES['fichier']['size'] > 10000000){
$reponse = "Fichier trop volumineux";
}
// on copie le fichier dans le dossier de destination
$name_file = $_FILES['fichier']['name'];
$number = $_POST['number']+1;
$new_name = str_replace(" ","_" , $_POST['name_mon'])."_".$number.".jpg";

if( !move_uploaded_file($tmp_file, $content_dir  .  $new_name) )
{
$reponse = "Impossible de copier le fichier dans $content_dir";
}else {
    $reponse = "Le fichier a bien été uploadé";
}
//echo $reponse;

require '../php/autoload.php';
$message = new Session();
$message->setFlash('DL' , $reponse);
$id = $_POST['id'];
$db = App::getDatabase();
$register = $db->query("INSERT INTO Image(Url , Id_Monument) VALUES ('$new_name' , '$id')");
header("Location: /php/MonumentDetail.php?q=".$id);
exit;

?>