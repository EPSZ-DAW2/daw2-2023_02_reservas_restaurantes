<?php
use yii\bootstrap5\Carousel;
use \app\widgets\FichaRestaurante;

$bloques = array_chunk($ids, $fichasPorBloque);

$items = [];
//Se crean items cada uno con cuatro fichas
foreach ($bloques as $bloque)
{
    $contenido = '<div class="d-flex justify-content-center p-1">';
    foreach ($bloque as $id) 
    {
        $contenido .= FichaRestaurante::widget(['id' => $id]);
    }
    $contenido .= '</div>';
    $items[] = ['content' => $contenido];
}
echo "<div style='display: flex; justify-content: center; align-items: center; height: 30vh; width: 100%; margin: 15px;'>";
echo "<div style='width: 80%; height: 100%;'>";
echo "<h2 class='text-center'>".$nombreCategoria."</h2>";
echo Carousel::widget([
    'items' => $items,
    'options' => ['class' => 'carousel carousel-fade', 'style' => 'transition: none; width: 100%; height: 100%;'],
]);
echo "</div>";
echo "</div>";
?>