<?php

use app\models\Imagen;
use yii\helpers\Html;
use yii\helpers\Url; // Import the Url class
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Imagen $model */

use yii\grid\GridView;

$this->title = 'Depurar Imágenes';
$this->params['breadcrumbs'][] = ['label' => 'Imágenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="imagen-depurar border p-3">

  <h1>Imágenes sueltas</h1>
  <p>Se muestran las imágenes que se encuentran en @web/multimedia pero no cuentan con una entrada en la tabla imagenes de la base de datos</p>
  <?= Html::a('Eliminar Todas', ['depurar'], [
            'class' => 'btn btn-danger mb-3',
            'data' => [
                'confirm' => 'Está seguro que desea eliminar todas las imágenes sueltas?',
                'method' => 'post',
            ],
        ]) ?>
  <?php
  echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
      ['class' => 'yii\grid\SerialColumn'],
      [
        'attribute' => 'Ubicación Imagen',
        'format' => 'raw',
        'value' => function ($model) {
          return Html::encode($model);
        },
      ],
      [
        'header' => 'Action',
        'content' => function ($model) {
          return Html::a(
            'Eliminar',
            [
              'eliminar', 'url' => $model
            ],
            [
              'class' => 'btn btn-danger',
              'data' => [
                'confirm' => 'Está seguro de que desea eliminar esta imagen?',
                'method' => 'post',
              ],
            ]
          );
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
  ]);
  ?>

</div>