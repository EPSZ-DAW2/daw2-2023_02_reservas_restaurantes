<?php

use app\models\Imagen;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ImagenSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Imágenes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="imagen-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Imagen', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id_imagen',
            'descripcion',
            'notas:ntext',
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, Imagen $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_imagen' => $model->id_imagen]);
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
