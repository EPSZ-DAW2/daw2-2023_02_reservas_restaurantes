<?php

use app\models\CategoriaRestaurante;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Categoria $model */
/** @var app\models\CategoriaRestaurante $categoriaRestauranteModel */

use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Restaurante;
use yii\helpers\Url;

$this->title = 'Editar Categoría: ' . $model->id_categoria;
$this->params['breadcrumbs'][] = ['label' => 'Categorías', 'url' => ['index']];
$this->params['breadcrumbs'][] = [
    'label' => $model->id_categoria, 'url' => ['view', 'id_categoria' => $model->id_categoria]
];
$this->params['breadcrumbs'][] = 'Editar';
?>
<div class="categoria-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

    <div>
        <hr>
        <h2>Agregar restaurante a <?= $model->nombre_categoria ?></h2>
        <?php
        $form = ActiveForm::begin([
            'action' => ['agregar-restaurante'],
        ]);

        $categoriaRestauranteModel = new CategoriaRestaurante();
        $categoriaRestauranteModel->id_categoria = $model->id_categoria;
        ?>

        <?= $form->field($categoriaRestauranteModel, 'id_categoria')->hiddenInput()->label(false); //id de categoria actual pa guardar la relacion
        ?>

        <div class="row">
            <div class="col-md-6">
                <?= $form->field($categoriaRestauranteModel, 'id_restaurante', ['enableClientValidation' => false])->dropDownList(
                    ArrayHelper::map(
                        Restaurante::find()
                            ->where(
                                ['not in', 
                                'id_restaurante', 
                                CategoriaRestaurante::find()->
                                select('id_restaurante')->
                                where(['id_categoria' => $model->id_categoria])]
                                )->all(),
                        'id_restaurante',
                        'nombre_restaurante'
                    ),
                    ['prompt' => '- Seleccionar Restaurante a agregar -']
                ) ?>
            </div>
            <div class="col-md-6 d-flex align-items-end">
                <?= Html::submitButton('Agregar', ['class' => 'btn btn-success']) ?>
            </div>
        </div>

        <?php ActiveForm::end(); ?>
    </div>

</div>