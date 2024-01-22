<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Configuracion $model */

$this->title = Yii::t('app', 'Actualizar Configuración: {name}', [
    'name' => $model->nombre_variable,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Configuracions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->nombre_variable, 'url' => ['view', 'nombre_variable' => $model->nombre_variable]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="configuracion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
