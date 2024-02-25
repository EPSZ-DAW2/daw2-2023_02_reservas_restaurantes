<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\resena $model */

$this->title = $model->id_resena;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Reseñas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="resena-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Actualizar'), ['update', 'id_resena' => $model->id_resena], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Borrar'), ['delete', 'id_resena' => $model->id_resena], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_resena',
            'titulo_resena',
            'cuerpo_resena',
            'puntuacion',
            'precio_x_persona',
            'incidencia_resena',
            'fecha_resena',
            'id_usuario',
            'id_restaurante',
            'notas:ntext',
        ],
    ]) ?>

</div>
