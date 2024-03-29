<?php

use app\models\ControlRestaurantes;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ControlRestaurantesSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Control Restaurantes');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="control-restaurantes-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Control Restaurantes'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_usuario',
            'id_restaurante',
            'notas:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, ControlRestaurantes $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_usuario' => $model->id_usuario, 'id_restaurante' => $model->id_restaurante]);
                 }
            ],
        ],
    ]); ?>


</div>
