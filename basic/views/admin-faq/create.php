<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\RespuestasFaq $model */

$this->title = 'Create Respuestas Faq';
$this->params['breadcrumbs'][] = ['label' => 'Respuestas Faqs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="respuestas-faq-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
