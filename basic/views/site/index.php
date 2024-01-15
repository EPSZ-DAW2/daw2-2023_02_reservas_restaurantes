<?php

/** @var yii\web\View $this */
use \app\widgets\CarruselRestaurante;
use \app\widgets\BarraBusqueda;

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

    </div>
</div>
