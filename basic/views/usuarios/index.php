<?php

use app\models\UsuariosMantenimiento;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\BuscarUsuario $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Usuarios Mantenimientos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuarios-mantenimiento-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear nuevo usuario', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Listar Roles', ['listar-roles'], ['class' => 'btn btn-info']) ?>
        
    </p>

    <?php // Resto del código ... ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_usuario',
            'nombre_usuario',
            'email:email',
            'password',
            'id_foto_usuario',
			'rol',
			'bloqueado',
            //'notas:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, UsuariosMantenimiento $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_usuario' => $model->id_usuario]);
                }
            ],
        ],
    ]); ?>



</div>
