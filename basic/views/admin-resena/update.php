<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\resena $model */

$this->title = Yii::t('app', 'Actualizar Reseña: {name}', [
    'name' => $model->id_resena,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Reseñas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_resena, 'url' => ['view', 'id_resena' => $model->id_resena]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Actualizar');
?>
<div class="resena-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
