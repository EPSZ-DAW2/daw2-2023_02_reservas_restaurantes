<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\logs $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="logs-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tipo_log')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'texto_log')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fecha_hora')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'notas')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
