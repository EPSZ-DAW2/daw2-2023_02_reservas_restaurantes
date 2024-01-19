<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var app\models\RegistroForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

// $_GET --> por si venimos del inicio
if(isset($_POST['registrogp-button']) || isset($_GET['registrogp']) )
{
    Yii::$app->session->set('registrogp', 1); //si queremos registrar un propietario o gestor
    if(Yii::$app->session->has('registroc')) Yii::$app->session->remove('registroc');
    $this->title = 'Registro Gestor/Propietario';
} 
if(isset($_POST['registroc-button']))
{
    Yii::$app->session->set('registroc', 1); //si queremos registrar un cliente
    if(Yii::$app->session->has('registrogp')) Yii::$app->session->remove('registrogp');
} 

$this->title = 'Registro';
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

                    <?php if (Yii::$app->session->has('registrogp')) { ?>
                    <?= $form->field($model, 'esGestorPropietario')->label('Rol')->dropDownList([0 => 'Gestor', 1 => 'Propietario']) ?>
                    <?php } ?>
                    <div class="form-group">
                        <div>
                            <?= Html::submitButton('Registro', ['class' => 'btn btn-primary form-control', 'name' => 'registro-button']) ?>
                        </div>
                    <?php ActiveForm::end(); ?>
                    </div>
                    <?php $form = ActiveForm::begin(['id' => 'registrogp-form',]); ?>
                    <div class="form-group mt-1">
                        <div class="d-flex">
                            <?= Html::a('Ya eres cliente? Inicia sesión', ['/site/login'], ['class' => 'btn btn-secondary col-lg-5']) ?>
                            <?php if(Yii::$app->session->has('registroc')) { ?>
                                <?= Html::submitButton('Diriges un restaurante? Regístrate', ['class' => 'btn btn-secondary col-lg-5 ms-auto', 'name' => 'registrogp-button', 'value' => 1]) ?>   
                            <?php } else { ?>            
                                <?= Html::submitButton('Regístrate como Cliente', ['class' => 'btn btn-secondary col-lg-5 ms-auto', 'name' => 'registroc-button', 'value' => 1]) ?>   
                            <?php } ?>
                        </div>
                    </div>
                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
