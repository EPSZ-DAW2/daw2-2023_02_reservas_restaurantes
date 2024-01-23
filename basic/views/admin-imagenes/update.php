<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Imagen $model */

$this->title = 'Editar Imagen: ' . $model->id_imagen;
$this->params['breadcrumbs'][] = ['label' => 'Imágenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_imagen, 'url' => ['view', 'id_imagen' => $model->id_imagen]];
$this->params['breadcrumbs'][] = 'Editar';
?>
<div class="imagen-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
