<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Comentario $model */

$this->title = $model->id_comentario;
$this->params['breadcrumbs'][] = ['label' => 'Comentarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="comentario-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_comentario' => $model->id_comentario], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_comentario' => $model->id_comentario], [
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
            'id_comentario',
            'id_usuario',
            'comentario:ntext',
            'notas:ntext',
        ],
    ]) ?>

</div>
