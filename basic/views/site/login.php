<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var app\models\LoginForm $model */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class= "container">
    <div class="site-login">
        <div class="row">
            <div class="d-flex justify-content-center">
                <div class="col-lg-5">

                    <h1><?= Html::encode($this->title) ?></h1>

                    <p>Introduzca sus datos de login:</p>

                    <?php $form = ActiveForm::begin([
                        'id' => 'login-form',
                        'fieldConfig' => [
                            'template' => "{label}\n{input}\n{error}",
                            'labelOptions' => ['class' => 'col-lg-1 col-form-label mr-lg-3'],
                            'inputOptions' => ['class' => 'col-lg-3 form-control'],
                            'errorOptions' => ['class' => 'col-lg-7 invalid-feedback'],
                        ],
                    ]); ?>

                    <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

                    <?= $form->field($model, 'password')->passwordInput() ?>

                    <div class="form-group">
                        <div>
                            <?= Html::submitButton('Login', ['class' => 'btn btn-primary form-control', 'name' => 'login-button']) ?>
                        </div>
                    </div>
                    
                    <?php
                    // $warningMessage = Yii::$app->session->getFlash('warning');
                    // if ($warningMessage !== null) {
                    //     echo '<div class="alert alert-warning">' . $warningMessage . '</div>';
                    // }

                    // $errorMessage = Yii::$app->session->getFlash('error');
                    // if ($errorMessage !== null) {
                    //     echo '<div class="alert alert-danger">' . $errorMessage . '</div>';
                    // }
                    ?>
                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
