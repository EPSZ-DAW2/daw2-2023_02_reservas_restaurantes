<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\UsuariosMantenimiento $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="usuarios-mantenimiento-form">

   <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre_usuario')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rol')->dropDownList([
        'administrador' => 'administrador',
        'gestor' => 'gestor',
		'moderador' => 'moderador',
		'propietario' => 'propietario',
		'cliente' => 'cliente',
       
    ], ['prompt' => 'Seleccionar Rol']) ?>

    <?= $form->field($model, 'bloqueado')->dropDownList([
        '0' => 'No',
        '1' => 'Sí',
    ], ['prompt' => 'Seleccionar Estado de Bloqueo']) ?>

    <?= $form->field($model, 'notas')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>


