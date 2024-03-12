<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ControlRestaurantes $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="control-restaurantes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_usuario')->textInput() ?>

    <?= $form->field($model, 'id_restaurante')->textInput() ?>

    <?= $form->field($model, 'notas')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
