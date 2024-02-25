<?php

use app\models\resena;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Reseñas');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resena-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Crear Reseña'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_resena',
            'titulo_resena',
            'cuerpo_resena',
            'puntuacion',
            'precio_x_persona',
            //'incidencia_resena',
            //'fecha_resena',
            //'id_usuario',
            //'id_restaurante',
            //'notas:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, resena $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_resena' => $model->id_resena]);
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
