<?php

use app\models\logs;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\logsSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="logs-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Nuevo Log', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_log',
            'tipo_log',
            'texto_log',
            'fecha_hora',
            'notas:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, logs $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_log' => $model->id_log]);
                 }
            ],
        ],
    ]); ?>
	
	<?= Html::a('Exportar Registros', ['export'], ['class' => 'btn btn-success']) ?>
	<?= Html::a('Eliminar Antiguos', ['delete-old-logs'], ['class' => 'btn btn-danger']) ?>
	<?= Html::a('Mostrar Logs Sistema', ['mostrar-logs'], ['class' => 'btn btn-info']) ?>






</div>
