<?php

use app\models\Resena;
use yii\helpers\Html;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Mis Reseñas');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-mis-resenas">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'titulo_resena',
                'label' => 'Título',
            ],
            [
                'attribute' => 'cuerpo_resena',
                'label' => 'Reseña',
            ],
            [
                'attribute' => 'puntuacion',
                'label' => 'Puntuación',
                'value' => function ($model) {
                     // Convierte el valor numérico de puntuación a cucharas
                    $cucharas = str_repeat('🥄', $model->puntuacion);
                    return $cucharas;
                },
            ],
            [
                'attribute' => 'precio_x_persona',
                'label' => 'Precio por persona',
            ],
            [
                'attribute' => 'fecha_resena',
                'label' => 'Fecha',
                'format' => ['datetime', 'php:d-m-Y H:i:s'],
            ],
            // Otras columnas según tus necesidades
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
	    <div class="row">
        <div class="col-md-12">
            <?= Html::a('Volver atrás', ['/reservas/mostrar-reservas-usuario'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>

</div>
