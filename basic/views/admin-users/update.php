<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\UsuariosMantenimiento $model */

$this->title = 'Update Usuarios Mantenimiento: ' . $model->id_usuario;
$this->params['breadcrumbs'][] = ['label' => 'Usuarios Mantenimientos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_usuario, 'url' => ['view', 'id_usuario' => $model->id_usuario]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="usuarios-mantenimiento-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
