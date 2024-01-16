<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\RespuestasFaq $model */

$this->title = 'Update Respuestas Faq: ' . $model->id_pregunta;
$this->params['breadcrumbs'][] = ['label' => 'Respuestas Faqs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_pregunta, 'url' => ['view', 'id_pregunta' => $model->id_pregunta]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="respuestas-faq-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
