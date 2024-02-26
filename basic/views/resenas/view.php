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

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'titulo_resena',
            'cuerpo_resena',
            'puntuacion',
            'precio_x_persona',
            'fecha_resena',
            'id_restaurante',
        ],
    ]) ?>

    <h2>Respuestas</h2>

    <?php foreach ($model->respuestas as $respuesta): ?>
        <div class="respuesta" style="border: 1px solid #000; margin: 10px; padding: 10px;">
            <h3>Respuesta de <?= Html::encode($respuesta->usuario->nombre_usuario) ?></h3>
            <p><?= Html::encode($respuesta->texto_respuesta) ?></p>
        </div>
    <?php endforeach; ?>

</div>