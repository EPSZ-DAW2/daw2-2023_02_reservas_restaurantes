<?php

use yii\helpers\Html;
?>

<div class="col">
  <div class="card carrusel-restaurante h-100">
    <div class="img-wrapper carrusel-restaurante" style="background: url('<?=Html::encode($model->getFotoPerfilUrl()) ?>') center center / cover no-repeat; height: 0; padding-bottom: 50%;">
    </div>
    <div class="card-body d-flex flex-column carrusel-restaurante">
      <h5 class="card-title carrusel-restaurante"><?= Html::encode($model->nombre_restaurante) ?></h5>
      <div class="mb-auto carrusel-restaurante">
        <p class="card-text carrusel-restaurante">
          <?= Html::encode($model->getPuntuacionPromedio()) ?> cucharas<br>
          <?= Html::encode($model->getNumResenas())?> Valoraciones<br>
          <?= Html::encode($model->ciudad_restaurante) ?><br>
          <?php if ($model->barrio_restaurante != NULL) { ?>
            <?= Html::encode($model->barrio_restaurante) ?><br>
          <?php } ?>
          Precio por comensal: <?= Html::encode($model->precio_medio_comensal) ?>&euro;<br>
          Tipo: 
        </p>
      </div>
      <a href="#" class="btn btn-primary mt-auto carrusel-restaurante">Ver Restaurante</a>
    </div>
  </div> 
</div>