<!-- Archivo: views/eventos/crear.php -->
<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>

<h1>Crear Nuevo Evento</h1>

<?php $form = ActiveForm::begin(); ?>

<?= $form->field($evento, 'titulo_evento')->textInput(['maxlength' => true]) ?>

<?= $form->field($evento, 'descripcion_evento')->textInput(['maxlength' => true]) ?>

<?= $form->field($evento, 'fecha_evento')->textInput(['type' => 'date']) ?>

<!-- Agrega campos adicionales según tu estructura de base de datos -->

<div class="form-group">
    <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
</div>

<?php ActiveForm::end(); ?>
