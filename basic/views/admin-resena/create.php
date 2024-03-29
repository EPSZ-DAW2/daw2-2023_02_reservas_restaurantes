<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\resena $model */

$this->title = Yii::t('app', 'Crear Resena');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Reseñas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resena-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
