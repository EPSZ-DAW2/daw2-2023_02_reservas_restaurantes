<?php

/** @var yii\web\View $this */
use \app\widgets\CarruselRestaurante;
use \app\widgets\BarraBusqueda;
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = 'La Cuchara - Inicio';
?>
<div class="site-index">

    <div class="body-content">
        <!-- Barra de búsqueda -->
        <?= BarraBusqueda::widget() ?>

        <hr>
        <!-- Carruseles -->
        
        <?= CarruselRestaurante::widget([
            'nombreCategoria' => 'Categoria1',
        ]); ?>

        <?= CarruselRestaurante::widget([
            'nombreCategoria' => 'Categoria2',
        ]); ?>

        <hr>
        <!-- Registra tu restaurante -->

        <div style="background-image: url('<?= Yii::getAlias('@web') ?>/multimedia/eresPropietario.jpg'); background-size: cover; height: 250px;">
            <div class="text-center" style="background-color: rgba(0, 0, 0, 0.5); padding: 20px; height: 100%;">
                <h1 class="text-white">¿Quieres registrar tu restaurante?</h1>
                <?= Html::a('Registrate como propietario', [Url::to('registrar-propietario')], ['class' => 'btn btn-primary']) ?>
            </div>
        </div>

    </div>
</div>
