<?php

use app\models\Categoria;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\CategoriaSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Categorías';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoria-index">

  <h1><?= Html::encode($this->title) ?></h1>

  <p>
    <?= Html::a('Crear nueva categoría', ['create'], ['class' => 'btn btn-success']) ?>
  </p>

  <?php // echo $this->render('_search', ['model' => $searchModel]); 
  ?>

  <?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel' => $searchModel,
    'columns' => [
      //['class' => 'yii\grid\SerialColumn'],

      'id_categoria',
      'nombre_categoria',
      [
        'attribute' => 'nombre_categoria_padre',
        'value' => 'padre.nombre_categoria',
        'filter' => Html::activeTextInput($searchModel, 'nombre_categoria_padre', ['class' => 'form-control']),
      ],
      'id_categoria_padre',
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