<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Favoritos $model */

$this->title = Yii::t('app', 'Actualizar Favoritos: {name}', [
    'name' => $model->id_usuario,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Favoritos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_usuario, 'url' => ['view', 'id_usuario' => $model->id_usuario, 'id_restaurante' => $model->id_restaurante]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Actualizar');
?>
<div class="favoritos-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
