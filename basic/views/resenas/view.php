<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Resena $model */

$this->title = $model->titulo_resena;
$this->params['breadcrumbs'][] = ['label' => 'Resenas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resena-view">

<div class="resena-details">
    <h2><?= Html::encode($model->titulo_resena) ?></h2>
    <p><?= Html::encode($model->cuerpo_resena) ?></p>
    <p>Puntuación: <?= Html::encode($model->puntuacion) ?></p>
    <p>Precio por persona: <?= Html::encode($model->precio_x_persona) ?></p>
    <p>Fecha de la reseña: <?= Html::encode($model->fecha_resena) ?></p>
    <p>Restaurante: <?= $model->restaurante ? Html::encode($model->restaurante->nombre_restaurante) : 'Desconocido  ' ?></p></div>

<h2>Respuestas</h2>

<?php
function displayRespuestas($respuestas) {
    foreach ($respuestas as $respuesta) {
        echo '<div class="respuesta" style="border: 1px solid #000; margin: 10px; padding: 10px;">';
        echo '<h3>Respuesta de ' . ($respuesta->usuario ? Html::encode($respuesta->usuario->nombre_usuario) : 'anónimo') . '</h3>';
        echo '<p>' . Html::encode($respuesta->texto_respuesta) . '</p>';
        if (!empty($respuesta->respuestasHijas)) {
            displayRespuestas($respuesta->respuestasHijas);
        }
        echo '</div>';
    }
}

displayRespuestas($respuestas);
?>

</div>