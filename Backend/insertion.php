<?php
function getimg($url)
{
    $headers[] = 'Accept: image/gif, image/x-bitmap, image/jpeg, image/pjpeg';
    $headers[] = 'Connection: Keep-Alive';
    $headers[] = 'Content-type: application/x-www-form-urlencoded;charset=UTF-8';
    $user_agent = 'php';
    $process = curl_init($url);
    curl_setopt($process, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($process, CURLOPT_HEADER, 0);
    curl_setopt($process, CURLOPT_USERAGENT, $user_agent); //check here
    curl_setopt($process, CURLOPT_TIMEOUT, 30);
    curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($process, CURLOPT_FOLLOWLOCATION, 1);
    $return = curl_exec($process);
    curl_close($process);
    return $return;
}

    $host = "localhost";
    $db = "Monument";
    $userbdd = "dbpmh";
    $passbdd = "dbPmhOfione2018*";
    $bdd = new PDO("mysql:host=$host;dbname=$db;", $userbdd, $passbdd);
if (isset($_POST) && !empty($_POST)) {
    echo "https://maps.googleapis.com/maps/api/place/details/json?placeid=" . $_POST['place_id'] . "&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk";
    $json = file_get_contents("https://maps.googleapis.com/maps/api/place/details/json?placeid=" . $_POST['place_id'] . "&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk");
    $result = json_decode($json);
    // echo '<pre>';
    // print_r($result);
    // echo '</pre>';
    // var_dump($result->result->address_components);
    $type = $_POST['type'];
    echo '<br>';echo '<br>';
    echo $city = $_POST['city'];echo '<br>';
    echo $name = $result->result->name;echo '<br>';
    echo $lat = $result->result->geometry->location->lat;echo '<br>';
    echo $lon = $result->result->geometry->location->lng;echo '<br>';
    $name_value = addslashes($name);
    echo "INSERT INTO Monument(Name , Lat, Lon , Id_City) VALUES ('$name_value' , '$lat' , '$lon' ,'$city')";echo '<br>';
    $req = $bdd->prepare("INSERT INTO Monument(Name , Lat, Lon , Id_City) VALUES ('$name_value' , '$lat' , '$lon' ,'$city')");
    $req->execute();
    $lastIdMonument = $bdd->lastInsertId();
    if(!file_exists('../img/Monuments/' . $lastIdMonument))
    mkdir('../img/Monuments/' . $lastIdMonument);

    $req1 = $bdd->prepare("INSERT INTO Avoir(Id_Monument , Id_Type) VALUES ('$lastIdMonument' , '$type')");
    $req1->execute();
    $day = 1;
    var_dump($result->result->opening_hours->periods);
    if (isset($result->result->opening_hours->periods) || !empty($result->result->opening_hours->periods)) {
        foreach ($result->result->opening_hours->periods as $opening) {
            $ouvert = $opening->open->time;
            echo $ouvert;
            echo '<br>';
            $ferme = $opening->close->time;
            echo $ferme;
            '<br>';
            $req2 = $bdd->prepare("INSERT INTO Ouvrir(Id_Monument , Id_Calendar , Matin_Debut , Matin_Fin , Midi_Debut , Midi_Fin) VALUES ('$lastIdMonument' , '$day'  , '$ouvert' , '','' ,'$ferme')");
            $req2->execute();
            $day++;
        }
    } else {
        for ($i = 0; $i < 7; $i++) {
            $ouvert = "0000";
            $ferme = "0000";
            $day = $i;
            $req2 = $bdd->prepare("INSERT INTO Ouvrir(Id_Monument , Id_Calendar , Matin_Debut , Matin_Fin , Midi_Debut , Midi_Fin) VALUES ('$lastIdMonument' , '$day'  , '$ouvert' , '','' ,'$ferme')");
            $req2->execute();
        }
    }
    foreach ($result->result->reviews as $reviews) {
        echo "Note : " . $reviews->rating;
        echo '<br>';
        echo "Commentaire : " . $reviews->text;
        echo '<br>';
        $rating = $reviews->rating;
        $comments = $reviews->text;
        $comment_value = addslashes($comments);
        $req3 = $bdd->prepare("INSERT INTO Comments(Comments , Rating) VALUES ('$comment_value' , '$rating')");
        $req3->execute();
        $lastIdComments = $bdd->lastInsertId();
        $req4 = $bdd->prepare("INSERT INTO Afficher(Id_Monument , Id_User, Id_Comments) VALUES ('$lastIdMonument' , '1' , '$lastIdComments') ");
        $req4->execute();
    }
    echo $lastIdMonument;
    $name_image_url = str_replace(" " ,  "+" , $name);
    $url = "https://api.unsplash.com/search/photos/?client_id=89ac27946ca5c08343d7a728dc32c5db699c1e29494dc94f7aead3d32504832d&query=" . $name_image_url;
    $test = json_decode(file_get_contents($url));
    $i = 0;
    echo '<br>';
    echo $url ;
    echo '<br>';

    foreach ($test->results as $item) {
        if ($i < 5) {
        $image = $item->urls->regular;


            echo "<br>";
            echo $lastIdMonument;
            $i++;
            $image = getimg($image);
            echo "Cecio est le name de base ".$name;
            $image_name = str_replace([" " , "'" , "  "], ["+","+","+"], $name);
            echo "Ceci ezt le name final".$image_name ;
            file_put_contents('../img/Monuments/' . $lastIdMonument . "/" . $image_name . "+" . $i . ".jpg", $image);
            $final_name = $image_name . "+" . $i . ".jpg";
            $req5 = $bdd->prepare("INSERT INTO Image(Url , Id_Monument) VALUES ('$final_name', '$lastIdMonument') ");
            $req5->execute();
        } else {
            break;
        }
    }
    // echo "Code Postal :".$result->result->address_components[7]->long_name;echo'<br>';
    // echo "Latitude : ".$result->result->geometry->location->lat ;echo'<br>';
    // echo "Longitude : ".$result->result->geometry->location->lng ; echo'<br>';
    // echo "Nom : ".$result->result->name ; echo'<br>';
    // foreach ($result->result->opening_hours->periods as $opening ) {
    //  echo "Jour(Close) : ".$opening->close->day;echo'<br>';
    //  echo "Heure(Close) : ".$opening->close->time;echo'<br>';
    //  echo "Jour(Open) : ".$opening->open->day;echo'<br>';
    //  echo "Heure(Open) : ".$opening->open->time;echo'<br>';
    // }
    //   foreach ($result->result->reviews as $reviews ) {
    //  echo "Note : ".$reviews->rating;echo'<br>';
    //  echo "Commentaire : ".$reviews->text;echo'<br>';
    // }

}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Place Autocomplete Address Form</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
</head>

<body>

<h3>Enregistrement par Place Id : </h3>
<form method="POST">
    <label>Place Id : </label>
    <input type="text" name="place_id">
    <label>Type du Monument : </label>
    <select name="type">
        <?php
        $typel = $bdd->query("SELECT * FROM Type");
        $typer = $typel->execute();
        while ($type = $typel->fetch()) {
            ?>
            <option value="<?= $type['Id']; ?>"><?= $type['Name']; ?></option>
            <?php
        }
        ?>
    </select>
    <label>Ville : </label>
    <select name="city">
        <?php
        $cityl = $bdd->prepare("SELECT * FROM City");
        $cityr = $cityl->execute();
        while ($cities = $cityl->fetch()) {
            ?>
            <option value="<?= $cities['Id']; ?>"><?= $cities['Name']; ?></option>
            <?php
        }
        ?>
    </select>
    <button type="submit">Visualiser</button>
</form>


<script>
    function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }

    function getdetail() {
        var place = autocomplete.getPlace();
        console.log(place.opening_hours);
        var url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + place.place_id + '&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk';
        console.log(url);

    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>
</html>