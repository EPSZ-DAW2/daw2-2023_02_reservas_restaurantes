<?php

use app\models\Comentario;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ComentarioSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Comentarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="comentario-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Comentario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_comentario',
            'id_usuario',
            'comentario:ntext',
            'notas:ntext',
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, Comentario $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_comentario' => $model->id_comentario]);
                 }
            ],
        ],
    ]); ?>


</div>
