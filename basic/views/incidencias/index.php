<?php

use app\models\Incidencias;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Incidencias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="incidencias-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Incidencias', ['create'], ['class' => 'btn btn-success']) ?>
    </p>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_incidencia',
            'tipo',
            'descripcion:ntext',
            'id_usuario',
            'id_restaurante',
            //'fecha_creacion',
            //'fecha_actualizacion',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Incidencias $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_incidencia' => $model->id_incidencia]);
                 }
            ],
        ],
    ]); ?>


</div>
