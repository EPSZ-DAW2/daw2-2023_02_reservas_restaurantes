<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var app\models\RegistroForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Registro Gestor/Propietario';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class= "container">
    <div class="site-login">
        <div class="row">
            <div class="d-flex justify-content-center">
                <div class="col-lg-6">

                    <h1><?= Html::encode($this->title) ?></h1>

                    <p>Rellene sus datos de registro:</p>

                    <?php $form = ActiveForm::begin([
                        'id' => 'registro-form',
                        'fieldConfig' => [
                            'template' => "{label}\n{input}\n{error}",
                            'labelOptions' => ['class' => 'col-lg-1 col-form-label mr-lg-3'],
                            'inputOptions' => ['class' => 'col-lg-3 form-control'],
                            'errorOptions' => ['class' => 'col-lg-7 invalid-feedback'],
                        ],
                    ]); ?>


                    <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

                    <?= $form->field($model, 'email')->textInput() ?>

                    <?= $form->field($model, 'password')->passwordInput() ?>

                    <?= $form->field($model, 'esPropietario')->label('Rol')->dropDownList([ 0 => 'Gestor', 1 => 'Propietario']) ?>

                    <div class="form-group">
                        <div>
                            <?= Html::submitButton('Registro', ['class' => 'btn btn-primary form-control', 'name' => 'registro-button']) ?>
                        </div>
                        <div class="d-flex mt-1">
                            <?= Html::a('Ya eres cliente? Inicia sesión', ['/site/login'], ['class' => 'btn btn-secondary col-lg-5']) ?>
                            <?= Html::a('Regístrate como cliente.', ['/site/registro'], ['class' => 'btn btn-secondary col-lg-5 ms-auto']) ?>
                        </div>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
