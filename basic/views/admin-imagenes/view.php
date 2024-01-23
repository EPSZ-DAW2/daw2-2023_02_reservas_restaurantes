<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Imagen $model */

$this->title = $model->id_imagen;
$this->params['breadcrumbs'][] = ['label' => 'Imágenes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="imagen-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Editar', ['update', 'id_imagen' => $model->id_imagen], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id_imagen' => $model->id_imagen], [
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
            'id_imagen',
            'descripcion',
            'notas:ntext',
            [
                'attribute' => 'ruta_imagen',
                'format' => 'raw',
                'value' => function ($model) {
                    return $model->getUrlImagen();
                },
            ],
        ],
    ]) ?>

    <p>
        <?= Html::a('Ver imagen', $model->getUrlImagen(), ['class' => 'btn btn-primary', 'target' => '_blank']) ?>
    </p>

</div>

