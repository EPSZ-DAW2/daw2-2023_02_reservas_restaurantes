<?php

use yii\helpers\Html;

/** @var app\models\Favoritos $model */

?>
<div class="col-md-4 mb-4">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><?= Html::encode($model->restaurante->nombre_restaurante) ?></h5>
            <!-- Otros campos de la tarjeta según tus necesidades -->
            <?= Html::a('Eliminar', ['eliminar-favorito', 'id_restaurante' => $model->id_restaurante], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => '¿Estás seguro de que quieres eliminar?',
                ],
            ]) ?>
        </div>
    </div>
</div>
