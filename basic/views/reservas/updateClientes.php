<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Reserva */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="reserva-update-clientes">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'num_comensales')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fecha_reserva')->textInput(['type' => 'date']) ?>

    <?= $form->field($model, 'hora_reserva')->textInput(['type' => 'time']) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Guardar'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>
	    <div class="row">
        <div class="col-md-12">
            <?= Html::a('Volver atrás', ['/reservas/mostrar-reservas-usuario'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>

</div>
