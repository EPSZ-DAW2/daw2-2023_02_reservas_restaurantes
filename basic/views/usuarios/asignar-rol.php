<?php

use yii\grid\GridView;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\UsuariosMantenimiento[] $usuarios */

$this->title = 'Asignar Roles';
$this->params['breadcrumbs'][] = $this->title;
?>

<h1><?= Html::encode($this->title) ?></h1>

<?php $form = \yii\widgets\ActiveForm::begin(); ?>

<?= GridView::widget([
    'dataProvider' => new \yii\data\ArrayDataProvider([
        'allModels' => $usuarios,
        'pagination' => false, // Desactivar paginación si es necesario
    ]),
    'columns' => [
        'id_usuario',
        'nombre_usuario',
        [
            'attribute' => 'rol',
            'label' => 'Rol Actual',
        ],
        [
            'label' => 'Nuevo Rol',
            'format' => 'raw',
            'value' => function ($model) {
                return Html::textInput('nuevo_rol[' . $model->id_usuario . ']', $model->rol);
            },
        ],
        // Otras columnas que desees mostrar
    ],
]); ?>

<div class="form-group">
    <?= Html::submitButton('Guardar Cambios', ['class' => 'btn btn-primary']) ?>
</div>

<?php \yii\widgets\ActiveForm::end(); ?>
