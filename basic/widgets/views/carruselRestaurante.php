<?php
use yii\bootstrap5\BootstrapPluginAsset;
use yii\helpers\Html;
use yii\bootstrap5\BootstrapAsset;
$this->registerCssFile("@web/css/carruselRestaurante.css", [
  'depends' => [BootstrapAsset::class],
]);//css
$this->registerJsFile("@web/scripts/carruselRestaurante.js", ['depends' => [BootstrapPluginAsset::class, \yii\web\JqueryAsset::class]]); //js (jQuery)
?>

<h2 class="nombre-carrusel"><?=$nombreCategoria?></h2>
<div id="carouselExampleControls<?=$idCategoria?>" class="carousel carruselRestaurante carrusel-restaurante" >
    <div class="carousel-inner carrusel-restaurante">
        <?php 
        $activo=1;
        foreach($models as $model){ ?>
            <?php
            if($activo==1){
              echo "<div class='carousel-item active carrusel-restaurante'>";
              $activo=0;
            }else{
            ?>
              <div class='carousel-item carrusel-restaurante'>
            <?php
            }
            ?>
            <div class="card carrusel-restaurante">
              <div class="img-wrapper carrusel-restaurante">
                <img src="<?=Html::encode($model->getFotoPerfilUrl()) ?>" alt="<?= Html::encode($model->nombre_restaurante) ?>">
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
        <?php } ?>
    </div>
    <button class="carousel-control-prev carrusel-restaurante" type="button" data-bs-target="#carouselExampleControls<?=$idCategoria?>" data-bs-slide="prev">
      <span class="carousel-control-prev-icon carrusel-restaurante" aria-hidden="true"></span>
      <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next carrusel-restaurante" type="button" data-bs-target="#carouselExampleControls<?=$idCategoria?>" data-bs-slide="next">
      <span class="carousel-control-next-icon carrusel-restaurante" aria-hidden="true"></span>
      <span class="visually-hidden">Siguiente</span>
    </button>
  </div>