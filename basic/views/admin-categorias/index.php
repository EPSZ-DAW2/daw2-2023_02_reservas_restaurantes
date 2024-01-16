<?php

use app\models\Categoria;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\CategoriaSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Categorias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoria-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Categoria', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_categoria',
            'nombre_categoria',
            'id_categoria_padre',
            [
                'attribute' => 'nombre_categoria_padre',
                'value' => 'padre.nombre_categoria',
                'filter' => Html::activeTextInput($searchModel, 'nombre_categoria_padre', ['class' => 'form-control']),
            ],
            [
                'attribute' => 'num_restaurantes',
                'value' => function ($model) {
                    return $model->numRestaurantes;
                },
                'filter' => Html::activeTextInput($searchModel, 'num_restaurantes', ['class' => 'form-control']),
            ],
            'notas:ntext',
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, Categoria $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_categoria' => $model->id_categoria]);
                 }
            ],
        ],
    ]); ?>


</div>
