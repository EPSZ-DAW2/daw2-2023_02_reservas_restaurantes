<?php
use yii\bootstrap5\BootstrapPluginAsset;
use yii\helpers\Html;
use yii\bootstrap5\BootstrapAsset;
$this->registerCssFile("@web/css/carruselRestaurante.css", [
  'depends' => [BootstrapAsset::class],
]);//css
$this->registerJsFile("@web/scripts/carruselRestaurante.js", ['depends' => [BootstrapPluginAsset::class, \yii\web\JqueryAsset::class]]); //js (jQuery)
?>

<h2 class="nombre-carrusel carruselRestaurante"><?=$nombreCategoria?></h2>
<div id="carouselExampleControls<?=$idCategoria?>" class="carousel carruselRestaurante">
    <div class="carousel-inner carruselRestaurante">
        <?php 
        $activo=1;
        foreach($models as $model){ ?>
            <?php
            if($activo==1){
              echo "<div class='carousel-item active carruselRestaurante'>";
              $activo=0;
            }else{
            ?>
              <div class='carousel-item carruselRestaurante'>
            <?php
            }
            ?>
            <div class="card carruselRestaurante">
              <div class="img-wrapper carruselRestaurante">
                <img src="<?=Html::encode($model->getFotoPerfilUrl()) ?>" alt="<?= Html::encode($model->nombre_restaurante) ?>" class="carruselRestaurante">
              </div>
              <div class="card-body d-flex flex-column carruselRestaurante">
                <h5 class="card-title carruselRestaurante"><?= Html::encode($model->nombre_restaurante) ?></h5>
                <div class="mb-auto carruselRestaurante">
                  <p class="card-text carruselRestaurante">
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
                <a href="#" class="btn btn-primary mt-auto carruselRestaurante" id="boton-ver-restaurante">Ver Restaurante</a>
              </div>
            </div>
            
            </div>
        <?php } ?>
    </div>
    <button class="carousel-control-prev carruselRestaurante" type="button" data-bs-target="#carouselExampleControls<?=$idCategoria?>" data-bs-slide="prev">
      <span class="carousel-control-prev-icon carruselRestaurante" aria-hidden="true"></span>
      <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next carruselRestaurante" type="button" data-bs-target="#carouselExampleControls<?=$idCategoria?>" data-bs-slide="next">
      <span class="carousel-control-next-icon carruselRestaurante" aria-hidden="true"></span>
      <span class="visually-hidden">Siguiente</span>
    </button>
  </div>