<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\logs $model */

$this->title = 'Editar Logs: ' . $model->id_log;
$this->params['breadcrumbs'][] = ['label' => 'Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_log, 'url' => ['view', 'id_log' => $model->id_log]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="logs-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
