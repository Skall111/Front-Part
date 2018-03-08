<?php
require '../php/autoload.php';
$db = App::getDatabase();
$paginationLast = $_POST['pagination'] - 1 ;
$pagination = $_POST['pagination'] ;
$path = $_POST['path'];
$listeMonument= $db->query("SELECT *  , M.Id AS Id_monument , M.Name AS Name_Monument FROM Monument AS M 
                                  LEFT JOIN Avoir AS A ON M.Id = A.Id_Monument 
                                  LEFT JOIN Type AS T ON A.Id_Type = T.Id
                                  ORDER BY M.Id
                                  LIMIT $pagination ,10 ")->fetchAll();
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
if($listeMonument && count($listeMonuments) > 0) {
    foreach ($listeMonuments as $item) {
        echo '<div class="col-md-4 col-sm-6 col-xs-12" onclick="document.location.href=\'' . $path . 'php/monumentDetail.php?q=' . $item['Id_monument'] . '\'">
				<div class="thingsBox thinsSpace">
					<div class="thingsImage">
						<img src="' . $path . 'img/Monuments/' . $item['Id_monument'] . '/' . str_replace(" ", "_", $item['Name_Monument']) . '_1.jpg" alt="Image things">
						<div class="thingsMask">
							<ul class="list-inline rating">
                                {% set Rating = Monument|last.totalRating / Monument|last.totalLine %}
                                {% if Rating|round == 1 %}
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                {% elseif Rating|round == 2 %}
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                {% elseif Rating|round == 3 %}
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                {% elseif Rating|round == 4 %}
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                {% else %}
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                {% endif %}



							</ul>
							<a href="' . $path . 'php/monumentDetail.php?q=' . $item['Id_monument'] . '"><h2>' . $item['Name_Monument'] . '<i class="fa fa-check-circle" aria-hidden="true"></i></h2></a>

						</div>
					</div>
					<div class="thingsCaption ">
						<ul class="list-inline captionItem">
							<li><i class="fa fa-heart-o" aria-hidden="true"></i>' . $item[sizeof($item) - 1]['totalLine'] . '</li>
							<li><a href="#">' . $item['Type_Name'] . '</a></li>
						</ul>
					</div>
				</div>
			</div>';
    }
}else{
    echo '';
}
echo '<div class="col-xs-12 toFade">
				<div class="btnArea btnAreaBorder text-center">
					<a class="btn btn-primary Explore">Explore More</a>
				</div>
			</div>'
?>