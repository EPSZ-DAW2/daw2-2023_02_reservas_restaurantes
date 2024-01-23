<?php

use app\models\RespuestasFaq;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\RespuestasFaqSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Preguntas Frecuentes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="respuestas-faq-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Agregar FAQ', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id_pregunta',
            'pregunta',
            'respuesta',
            'notas:ntext',
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, RespuestasFaq $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_pregunta' => $model->id_pregunta]);
                 }
            ],
        ],
        'pager' => [
            'options' => ['class' => 'pagination justify-content-center'],
            'prevPageLabel' => '<',
            'nextPageLabel' => '>',
            'prevPageCssClass' => 'page-item',
            'nextPageCssClass' => 'page-item',
            'linkOptions' => ['class' => 'page-link'],
            'disabledListItemSubTagOptions' => ['tag' => 'a', 'class' => 'page-link'],
        ],
    ]); ?>

</div>
