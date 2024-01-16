<?php

use yii\helpers\Html;
?>

<div class="d-flex align-items-center justify-content-center position-relative border border-3 rounded-3 overflow-hidden" style="width: 200px; height: 200px; background-image: url('<?= Html::encode($model->getUrlFotoPerfil()) ?>'); background-size: cover;">
  <div class="position-absolute top-0 end-0 bottom-0 start-0" style="background-color: rgba(0, 0, 0, 0.5);"></div>
  <div class="position-relative p-2 text-white">
    <h2 class="mb-1"><?= Html::encode($model->nombre_restaurante) ?></h2>
    <p class="small mb-0"><?= Html::encode($model->getPuntuacionPromedio()) ?> cucharas, (<?= Html::encode($model->getNumResenas()) ?>) valoraciones</p>
    <p class="small mb-0"><?= Html::encode($model->ciudad_restaurante) ?>, <?= Html::encode($model->barrio_restaurante) ?></p>
    <p class="small">Precio por comensal: <?= Html::encode($model->precio_medio_comensal) ?>&euro;</p>
  </div>
</div>
