<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ComentarioSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="comentario-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_comentario') ?>

    <?= $form->field($model, 'id_usuario') ?>

    <?= $form->field($model, 'comentario') ?>

    <?= $form->field($model, 'notas') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
