<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Incidencias $model */

$this->title = $model->id_incidencia;
$this->params['breadcrumbs'][] = ['label' => 'Incidencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="incidencias-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_incidencia' => $model->id_incidencia], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_incidencia' => $model->id_incidencia], [
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
            'id_incidencia',
            'tipo',
            'descripcion:ntext',
            'id_usuario',
            'id_restaurante',
            'fecha_creacion',
            'fecha_actualizacion',
        ],
    ]) ?>

</div>
