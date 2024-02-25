<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ResenaSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="resena-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_resena') ?>

    <?= $form->field($model, 'titulo_resena') ?>

    <?= $form->field($model, 'cuerpo_resena') ?>

    <?= $form->field($model, 'puntuacion') ?>

    <?= $form->field($model, 'precio_x_persona') ?>

    <?php // echo $form->field($model, 'incidencia_resena') ?>

    <?php // echo $form->field($model, 'fecha_resena') ?>

    <?php // echo $form->field($model, 'id_usuario') ?>

    <?php // echo $form->field($model, 'id_restaurante') ?>

    <?php // echo $form->field($model, 'notas') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Buscar'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Restablecer'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
