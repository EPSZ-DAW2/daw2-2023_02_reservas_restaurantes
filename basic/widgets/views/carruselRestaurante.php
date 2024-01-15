<?php
use yii\bootstrap5\Carousel;
use \app\widgets\FichaRestaurante;


$bloques = array_chunk($ids, $fichasPorBloque);

$items = [];
//Se crean items cada uno con cuatro fichas
foreach ($bloques as $bloque)
{
    $contenido = '<div class="d-flex p-1">';
    foreach ($bloque as $id) 
    {
        $contenido .= FichaRestaurante::widget(['id' => $id]);
    }
    $contenido .= '</div>';
    $items[] = ['content' => $contenido];
}
echo "<div class='d-flex justify-content-center align-items-center' style='height: 30vh;'>";
echo "<div>";
echo "<h2 class='text-center'>".$nombreCategoria."</h2>";
echo Carousel::widget([
    'items' => $items
]);
echo "</div>";
echo "</div>";

?>