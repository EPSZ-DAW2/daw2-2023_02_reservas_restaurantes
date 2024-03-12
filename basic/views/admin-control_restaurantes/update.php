<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ControlRestaurantes $model */

$this->title = Yii::t('app', 'Update Control Restaurantes: {name}', [
    'name' => $model->id_usuario,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Control Restaurantes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_usuario, 'url' => ['view', 'id_usuario' => $model->id_usuario, 'id_restaurante' => $model->id_restaurante]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Actualizar');
?>
<div class="control-restaurantes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
