<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\logs $model */

$this->title = $model->id_log;
$this->params['breadcrumbs'][] = ['label' => 'Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="logs-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_log' => $model->id_log], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_log' => $model->id_log], [
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
            'id_log',
            'tipo_log',
            'texto_log',
            'fecha_hora',
            'notas:ntext',
        ],
    ]) ?>

</div>
