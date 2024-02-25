<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\resena $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="resena-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'titulo_resena')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cuerpo_resena')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'puntuacion')->textInput() ?>

    <?= $form->field($model, 'precio_x_persona')->textInput() ?>

    <?= $form->field($model, 'incidencia_resena')->textInput() ?>

    <?= $form->field($model, 'fecha_resena')->textInput() ?>

    <?= $form->field($model, 'id_usuario')->textInput() ?>

    <?= $form->field($model, 'id_restaurante')->textInput() ?>

    <?= $form->field($model, 'notas')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Guardar'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
