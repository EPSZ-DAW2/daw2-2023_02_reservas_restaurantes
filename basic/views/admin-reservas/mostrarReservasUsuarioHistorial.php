<?php

use app\models\Reserva;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var Reserva[] $reservas */

$this->title = Yii::t('app', 'Mis Reservas');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reserva-mostrar-usuario">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php
    echo Html::a('Historial de Reservas', ['mostrar-reservas-usuario-historial'], ['class' => 'btn btn-primary']);
    ?>

    <?= GridView::widget([
    'dataProvider' => new \yii\data\ArrayDataProvider(['allModels' => $reservas]),
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
        [
            'attribute' => 'datos_pago',
            'label' => 'Información de pago Cliente', 
        ],
        [
            'attribute' => 'num_comensales',
            'label' => 'Número de comensales', 
        ],
        [
            'attribute' => 'fecha_reserva',
            'label' => 'Fecha', 
        ],
        [
            'attribute' => 'hora_reserva',
            'label' => 'Hora', 
        ],
        [
            'attribute' => 'id_restaurante',
            'value' => function ($model) {
                return $model->restaurante->nombre_restaurante;
            },
            'label' => 'Nombre del Restaurante', 
        ],
        [
            'attribute' => 'notas',
            'label' => 'Notas', 
        ],
        // Eliminar este bloque para quitar los botones de acciones
        // [
        //     'class' => ActionColumn::className(),
        //     'urlCreator' => function ($action, Reserva $model, $key, $index, $column) {
        //         return Url::toRoute([$action, 'id_reserva' => $model->id_reserva]);
        //     },
        //     'header' => 'Acciones', 
        // ],
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
            <?= Html::a('Volver atrás', ['/admin-reservas/mostrar-reservas-usuario'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>


</div>
