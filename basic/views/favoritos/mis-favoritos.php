<?php

use yii\helpers\Html;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Mis Favoritos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="favoritos-mis-favoritos">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'layout' => "{items}\n{pager}",
            'columns' => [
                [
                    'attribute' => 'restaurante.nombre_restaurante',
                    'label' => 'Nombre del Restaurante',
                    'format' => 'raw', // Permitir HTML en el contenido
                    'value' => function ($model) {
                        return $this->render('_tarjeta', ['model' => $model]);
                    },
                ],
            ],
        ]); ?>
    </div>

    <div class="row">
        <div class="col-md-12">
            <?= Html::a('Volver atrás', ['/reservas/mostrar-reservas-usuario'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>
</div>
