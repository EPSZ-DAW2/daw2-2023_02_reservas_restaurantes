<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\UsuariosMantenimiento $model */

$this->title = 'Create Usuarios Mantenimiento';
$this->params['breadcrumbs'][] = ['label' => 'Usuarios Mantenimientos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuarios-mantenimiento-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>