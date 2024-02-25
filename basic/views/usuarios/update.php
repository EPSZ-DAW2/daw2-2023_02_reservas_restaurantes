<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\UsuariosMantenimiento $model */

$this->title = 'Editar Usuarios: ' . $model->nombre_usuario;
$this->params['breadcrumbs'][] = ['label' => 'Usuarios Mantenimientos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_usuario, 'url' => ['view', 'id_usuario' => $model->id_usuario]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="usuarios-mantenimiento-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form_update', [
        'model' => $model,
    ]) ?>
    
</div>  
