<?php

use app\models\Reserva;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var Reserva[] $reservas */

// Obtén la información del usuario actual
$user = Yii::$app->user->identity;

$this->title = Yii::t('app', 'Mi Perfil');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reserva-mostrar-usuario">

    <div class="jumbotron text-center bg-primary text-white">
        <h1 class="display-4"><?= Html::encode($this->title) ?></h1>
        <p class="lead">¡Bienvenido, <?= Html::encode($user->nombre_usuario) ?>!</p>
        <p class="lead">Correo electrónico: <?= Html::encode($user->email) ?></p>

        <?php
        echo Html::a('Historial de Reservas', ['mostrar-reservas-usuario-historial'], ['class' => 'btn btn-info btn-lg']);
        echo "   ";
        echo Html::a('Mis Reseñas', ['usuarios/mis-resenas'], ['class' => 'btn btn-success btn-lg']);
        echo "   ";
        echo Html::a('Mis Favoritos', ['favoritos/mis-favoritos'], ['class' => 'btn btn-warning btn-lg']);
        ?>
    </div>

    <h3 class="text-center text-primary">Reservas activas</h3>

    <?= GridView::widget([
        'dataProvider' => new \yii\data\ArrayDataProvider(['allModels' => $reservas]),
        'tableOptions' => ['class' => 'table table-striped table-bordered'],
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
