<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Categoria $model */

use yii\grid\GridView;
use app\models\CategoriaRestaurante;
use \yii\data\ActiveDataProvider;

use yii\helpers\Url;

$this->title = $model->id_categoria;
$this->params['breadcrumbs'][] = ['label' => 'Categorías', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="categoria-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Editar', ['update', 'id_categoria' => $model->id_categoria], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id_categoria' => $model->id_categoria], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_categoria',
            'id_categoria_padre',
            'nombre_categoria',
            [
                'attribute' => 'nombre_categoria_padre',
                'value' => function ($model) {
                    if($model->padre){
                        return $model->padre->nombre_categoria;
                    }else{
                        return null;
                    }
                },
            ],
            [
                'attribute' => 'num_restaurantes',
                'value' => function ($model) {
                            return $model->numRestaurantes;
                        },
            ],
            'notas:ntext',
        ],
    ]) ?>

    <div>
        <h2>Restaurantes de la categoría</h2>
        <?= GridView::widget([
            'dataProvider' => new \yii\data\ActiveDataProvider([
                'query' => CategoriaRestaurante::find()->where(['id_categoria' => $model->id_categoria]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]),
            'columns' => [
                [
                    'attribute' => 'id_restaurante',
                    'value' => function($model) {
                        return $model->restaurante->id_restaurante;
                    }
                ],
                [
                    'attribute' => 'nombre_restaurante',
                    'value' => function($model) {
                        return $model->restaurante->nombre_restaurante;
                    }
                ],
                [
                    'header' => 'Action',
                    'content' => function($model) {
                        return Html::a('Eliminar', [
                                'eliminar-restaurante', 'id_restaurante' => $model->id_restaurante, 'id_categoria' => $model->id_categoria
                            ], 
                            [
                                'class' => 'btn btn-danger',
                                'data' => [
                                    'confirm' => 'Estás seguro de que quieres eliminar este restaurante de la categoría?',
                                    'method' => 'post',
                                ],
                            ]
                        );
                    }
                ],
            ],
        ]); ?>
    </div>

</div>
