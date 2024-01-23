<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\logsSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="logs-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_log') ?>

    <?= $form->field($model, 'tipo_log') ?>

    <?= $form->field($model, 'texto_log') ?>

    <?= $form->field($model, 'fecha_hora') ?>

    <?= $form->field($model, 'notas') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
