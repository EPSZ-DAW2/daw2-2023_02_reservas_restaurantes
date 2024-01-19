<?php
use yii\bootstrap5\BootstrapPluginAsset;
use yii\helpers\Html;
$this->registerCssFile("@web/css/carruselRestaurante.css"); //css
$this->registerJsFile("@web/scripts/carruselRestaurante.js", ['depends' => [BootstrapPluginAsset::class, \yii\web\JqueryAsset::class]]); //js (jQuery)
?>

<div id="carouselExampleControls" class="carousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <?php 
        foreach($models as $model){ ?>
            <div class='carousel-item'>
            <div class="card" <?php isset($ficha) ? 'style="height: 150px; width:150px;"' : '' ?>>
              <div class="img-wrapper">
                <img src="<?=Html::encode($model->getFotoPerfilUrl()) ?>" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><?= Html::encode($model->nombre_restaurante) ?></h5>
                <p class="card-text">
<?= Html::encode($model->getPuntuacionPromedio()) ?> cucharas<br>
<?= Html::encode($model->getNumResenas()) ?><br>
<?= Html::encode($model->precio_medio_comensal) ?>&euro;<br>
<?= Html::encode($model->ciudad_restaurante) ?><br>
<?= Html::encode($model->barrio_restaurante) ?><br>
Precio por comensal: <?= Html::encode($model->precio_medio_comensal) ?>&euro;<br>
Tipo: 
              </p>
                <a href="#" class="btn btn-primary">Ver Restaurante</a>
              </div>
            </div>
            
            </div>
        <?php } ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Siguiente</span>
    </button>
  </div>