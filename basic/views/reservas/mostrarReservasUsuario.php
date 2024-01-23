<?php

use app\models\Reserva;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var Reserva[] $reservas */

$this->title = Yii::t('app', 'Mi Perfil');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reserva-mostrar-usuario">

    <h1><?= Html::encode($this->title) ?></h1>

<?php
    echo Html::a('Historial de Reservas', ['mostrar-reservas-usuario-historial'], ['class' => 'btn btn-primary btn-lg mr-2']);
	echo "   ";
    echo Html::a('Mis Reseñas', ['usuarios/mis-resenas'], ['class' => 'btn btn-success btn-lg']);
	echo "   ";
	echo Html::a('Mis Favoritos', ['favoritos/mis-favoritos'], ['class' => 'btn btn-warning btn-lg']);


?>

<br><br>
 <h3>Reservas activas</h3>

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
        [
            'class' => ActionColumn::className(),
            'urlCreator' => function ($action, Reserva $model, $key, $index, $column) {
                return Url::toRoute([$action, 'id_reserva' => $model->id_reserva]);
            },
            'header' => 'Acciones', 
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
