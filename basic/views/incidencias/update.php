<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Incidencias $model */

$this->title = 'Update Incidencias: ' . $model->id_incidencia;
$this->params['breadcrumbs'][] = ['label' => 'Incidencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_incidencia, 'url' => ['view', 'id_incidencia' => $model->id_incidencia]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="incidencias-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
