<?php
if(isset($_POST))
{
    $host = "localhost";
    $db = "Monument";
    $userbdd= "root";
    $passbdd = "";
    $bdd = new PDO("mysql:host=$host;dbname=$db;", $userbdd, $passbdd);

    $json =  file_get_contents("https://maps.googleapis.com/maps/api/place/details/json?placeid=".$_POST['place_id']."&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk");
    $result = json_decode($json);
    // echo '<pre>';
    // print_r($result);
    // echo '</pre>';
    // var_dump($result->result->address_components);
    $type = $_POST['type'];
    $city = $_POST['city'];
    $name = $result->result->name;
    $lat = $result->result->geometry->location->lat;
    $lon = $result->result->geometry->location->lng ;
    $cp = $result->result->address_components[7]->long_name ;
    //EXAMPLEEEE
    //https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJLU7jZClu5kcR4PcOOO6p3I0&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk
    $req = $bdd->prepare("
    INSERT INTO Monument(Name , Lat, Lon , Id_City) VALUES ('$name' , '$lat' , '$lon' , '$city')
                      ");
    $req->execute();
    $lastIdMonument = $bdd->lastInsertId();

    $req1 = $bdd->prepare("
    INSERT INTO Avoir(Id_Monument , Id_Type) VALUES ('$lastIdMonument' , '$type')  
                      ");
    $req1->execute();
    $day=1 ;
    foreach ($result->result->opening_hours->periods as $opening ) {
        // echo "Jour(Close) : ".$opening->close->day;echo'<br>';
        // echo "Heure(Close) : ".$opening->close->time;echo'<br>';
        // echo "Jour(Open) : ".$opening->open->day;echo'<br>';
        // echo "Heure(Open) : ".$opening->open->time;echo'<br>';
        $ouvert  = $opening->open->time ;
        $ferme = $opening->close->time ;
        $req2 = $bdd->prepare("
    INSERT INTO Ouvrir(Id_Monument , Id_Calendar , Matin_Debut , Matin_Fin , Midi_Debut , Midi_Fin) VALUES ('$lastIdMonument' , '$day'  , '$ouvert' , '','' ,'$ferme')  
                      ");
        $req2->execute();
        $day++;
    }
    foreach ($result->result->reviews as $reviews ) {
        echo "Note : ".$reviews->rating;echo'<br>';
        echo "Commentaire : ".$reviews->text;echo'<br>';
        $rating = $reviews->rating;
        $comments = $reviews->text;
        $req3 = $bdd->prepare("
    INSERT INTO Comments(Comments , Rating) VALUES ('$comments' , '$rating')  
                      ");
        $req3->execute();
        $lastIdComments = $bdd->lastInsertId();
        $req4 = $bdd->prepare("
    INSERT INTO Afficher(Id_Monument , Id_User, Id_Comments) VALUES ('$lastIdMonument' , '1' , '$lastIdComments')  
                      ");
        $req4->execute();
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
<h3>Enregistrement par adresse : </h3>
<div id="locationField">
    <input id="autocomplete" size="50" placeholder="Enter your address"
           type="text"></input>
    <button onclick="getdetail();">Valider</button>
</div>
<h3>Enregistrement par Place Id : </h3>
<form method="POST">
    <label>Place Id : </label>
    <input type="text" name="place_id">
    <label>Type du Monument : </label>
    <select name="type">
        <?php
        $typel = $bdd->query("SELECT * FROM Type") ;
        $typer = $typel->execute();
        while ($type = $typel->fetch()) {
            ?>
            <option value="<?= $type['Id'] ; ?>"><?= $type['Name'] ;?></option>
            <?php
        }
        ?>
    </select>
    <label>Ville : </label>
    <select name="city">
        <?php
        $cityl = $bdd->prepare("SELECT * FROM City") ;
        $cityr = $cityl->execute();
        while ($cities = $cityl->fetch()) {
            ?>
            <option value="<?= $cities['Id'] ; ?>"><?= $cities['Name'] ;?></option>
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
            {types: ['geocode' ]});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }
    function getdetail(){
        var place = autocomplete.getPlace();
        console.log (place.opening_hours);
        var url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid='+place.place_id+'&key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk';
        console.log (url);

    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCHntX1dfipLoTZzz-hz-waNxTewkUjIk&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>
</html>