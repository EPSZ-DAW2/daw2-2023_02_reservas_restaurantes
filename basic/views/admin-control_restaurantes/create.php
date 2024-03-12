<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ControlRestaurantes $model */

$this->title = Yii::t('app', 'Crear Control Restaurantes');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Control Restaurantes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="control-restaurantes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
