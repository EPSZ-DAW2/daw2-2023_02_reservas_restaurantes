<?php

use app\models\UsuariosMantenimiento;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\BuscarUsuario $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

if(isset($_GET['cli']))
    $this->title = 'Mantenimiento Clientes';
else
    $this->title = 'Mantenimiento Usuarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuarios-mantenimiento-index">

    <?php if(isset($_GET['cli'])) { ?>
        <h1><?= Html::encode($this->title) ?></h1>

        <p>
            <?= Html::a('Crear nuevo cliente', ['create'], ['class' => 'btn btn-success']) ?>
        </p>

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
            'rowOptions' => function ($model, $key, $index, $grid) {
                if ($model->rol !== 'cliente') {
                    return ['style' => 'display:none'];
                }
            },
        ]); ?>

    <?php } else { ?>
        <h1><?= Html::encode($this->title) ?></h1>

        <p>
            <?= Html::a('Crear nuevo usuario', ['create'], ['class' => 'btn btn-success']) ?>
            <?= Html::a('Listar Roles', ['listar-roles'], ['class' => 'btn btn-info']) ?>
        </p>

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

    <?php } ?>



</div>
