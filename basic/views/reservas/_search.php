<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ReservaSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="reserva-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_reserva') ?>

    <?= $form->field($model, 'datos_pago') ?>

    <?= $form->field($model, 'num_comensales') ?>

    <?= $form->field($model, 'fecha_reserva') ?>

    <?= $form->field($model, 'hora_reserva') ?>

    <?php  echo $form->field($model, 'id_usuario') ?>

    <?php  echo $form->field($model, 'id_restaurante') ?>

    <?php  echo $form->field($model, 'notas') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
